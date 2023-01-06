# Step
```rails new test_genecho```
```cd test_genecho```


## Edit Gemfile
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
gem 'autoprefixer-rails'

```bundle install```

## Edit app/assets/stylesheets/application.css.sass
## Then, remove all the *= require_self and *= require_tree . statements from the sass file. Instead, use @import to import Sass files.

@import "bootstrap-sprockets";
@import "bootstrap";

## Edit app/assets/javascripts/application.js

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

## change file name
```mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss```




## Devise

gem 'devise', '3.5.6'


```rails generate devise:install```
rails generate devise:install


>     create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

       config.assets.initialize_on_precompile = false

     On config/application.rb forcing your application to not access the DB
     or load models when precompiling your assets.

  5. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

===============================================================================


```rails generate devise user```
invoke  active_record
create    db/migrate/20160323081014_devise_create_users.rb
create    app/models/user.rb
invoke    test_unit
create      test/models/user_test.rb
create      test/fixtures/users.yml
insert    app/models/user.rb
route  devise_for :users


```rake db:migrate```

```rails generate controller home index```

```rails g devise:views```
## edit home_controller.rb, application_controller.rb
```


```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
end
```

#### By adding this code, you will be able to de ne which actions should be authorized and which should not. :
> before_filter :authenticate_user!, :only => [:index, :new]


```ruby
class HomeController < ApplicationController
    before_filter :authenticate_user!, :only => [:index, :new]

    def index
    end

    def new
    end

    def edit
    end
end
```




## bootstrap


rails generate bootstrap:install
