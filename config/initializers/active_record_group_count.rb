# When you are using subquery or joins/group_by than all.count does not work
# so we need to wrap sql in returns_count_sum
# all.returns_count_sum.count # => 123
# https://stackoverflow.com/a/21031792/287166
# https://github.com/mrbrdo/active_record_group_count/blob/master/lib/active_record_group_count/scope.rb
module ActiveRecordGroupCount
  module Scope
    extend ActiveSupport::Concern

    module ExtensionMethods
      def count(*_args)
        scope = except(:select).select('1')
        scope_sql = if scope.klass.connection.respond_to?(:unprepared_statement)
                      scope.klass.connection.unprepared_statement { scope.to_sql }
                    else
                      scope.to_sql
                    end
        query = "SELECT count(*) AS count_all FROM (#{scope_sql}) x"
        first_result = ActiveRecord::Base.connection.execute(query).first
        if first_result.is_a? Array
          first_result.first
        else
          first_result['count_all']
        end
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
