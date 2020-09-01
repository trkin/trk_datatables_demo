# We need this so group query returns count instead of hash (which could be big)
# some_query_with_group.returns_count_sum.count # => 123
# https://stackoverflow.com/a/21031792/287166
# https://github.com/mrbrdo/active_record_group_count/blob/master/lib/active_record_group_count/scope.rb
module ActiveRecordGroupCount
  module Scope
    extend ActiveSupport::Concern

    module ExtensionMethods
      def count(*args)
        scope = except(:select).select("1")
        scope_sql = if scope.klass.connection.respond_to?(:unprepared_statement)
          scope.klass.connection.unprepared_statement { scope.to_sql }
        else
          scope.to_sql
        end
        query = "SELECT count(*) AS count_all FROM (#{scope_sql}) x"
        # ActiveRecord::Base.connection.execute(query).first.try(:[], "count_all").to_i
        first_result = ActiveRecord::Base.connection.execute(query).first
        first_result.first
      end
    end

    module ClassMethods
      def returns_count_sum
        all.extending(ExtensionMethods)
      end
    end
  end
end
# https://github.com/mrbrdo/active_record_group_count/blob/master/lib/active_record_group_count/railtie.rb
ActiveSupport.on_load :active_record do
  include ActiveRecordGroupCount::Scope
end
