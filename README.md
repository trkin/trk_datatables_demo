# Trk Datatables Demo

Example app for [https://github.com/trkin/trk_datatables]

You can preview on Heroku [https://trk-datatables.herokuapp.com/]

# Development

Run standard Rails commands

```
rails db:setup
rails s
```

For Heroku run

```
heroku run rake db:populate_sample_data DISABLE_DATABASE_ENVIRONMENT_CHECK=1
```
