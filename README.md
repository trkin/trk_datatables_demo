# Trk Datatables Demo

Example app for [https://github.com/trkin/trk_datatables]

You can preview on Heroku [https://trk-datatables.herokuapp.com/]

# Development

Run standard Rails commands

```
rails db:setup
rails s
```

For Heroku deployment, you need to add database. Postgres add-on is created
automatically. MySql can be added in Resources tab on Heroku (I choose ClearDB)
and you need to setup DATABASE_URL. You can find url with `heroku config` but
you need to replace `mysql://` with `mysql2://`.
```
heroku config
heroku config:set DATABASE_URL=mysql2://123:123@assd.com....
```
On Heroku you can seed from fixtures
```
# for mysql
heroku run rake db:seed
# for postgres
heroku run rake db:populate_sample_data DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```
