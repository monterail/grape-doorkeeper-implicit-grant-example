Sample application to Codetunes' blogpost: [OAuth Implicit Grant with Angular, Grape and Doorkeeper]()

# Setup

```
bundle install
rake db:setup
rails s
```

You can log in with:

```
Username: jon.snow@winterfell.com
Password: password
```

If you want to run this application under different host than `localhost:3000`, you must change `config/application.yml` (and run `rake db:reset` if you've already done setup)

