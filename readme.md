#Sinatra Code Refactoring

Model, private, and helper methods are all great way to organize code in a complex application. They accomplish the same goal of refactoring code and making it more readable, but all are useful in different scenarios.

##Model Methods

Model methods are a fantastic way to organize additional business logic and functionality into an application. If a method is *related to a specific model*, extend its class with instance and class methods.

```ruby
class Artist < ActiveRecord::Base
  def sing
    #...
  end
end
```

##Private Methods

Private methods are a good choice to use in a controller if *only that controller needs access* to them and the behavior is independent to any of the models in the application. 

```ruby
class Tunr < Sinatra::Base

  # RESTful Artist Controller Actions
  # index
  get '/artists' do
    @artists = Artist.all
    erb(:"artists/index")
  end

  #...

  private
  def artist_params
    #filter params for artist attributes only...
  end
end
```

##Helper Methods

Helper methods are an easy way to organize your code into chunks that can be *reused across your controllers, but are also independent to models*. An example of a helper method may be for converting metric to imperial units, filtering data, making API requests, etc.

In this project find a simple example of how to setup a helper method.

* In the directory `helpers` note the file `animals_helper.rb` it is a simple [module](http://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html) that contains a `fox` method and a `cat` method that each return what their animal says.
* To make the modules & methods in the helper file accessible to other parts of the application, require the helper file in the `config.ru`. Next add `include AnimalHelper` inside a `class` that wants access to .
* Notice `app.rb`, it includes the module `AnimalHelper` and as a result the `fox` method works!