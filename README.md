# Sinatra

### Learning Objectives
* Create a Sinatra application
* How to define a route
* Use `shotgun` to do automatic code reloading
* How to return some HTML
```
require 'sinatra'
get '/cat' do
  "<div style='border: 3px dashed red'>
     <img src='http://bit.ly/1eze8aE'>
   </div>"
end
```
* Use Views to separate routing and presentation concerns
> In our case, app.rb will be for routing (or controlling) concerns, and we will use another file for our presentation (or view) concerns.

```
.
|__ Gemfile
|__ Gemfile.lock
|__ app.rb
|__ views
    |__ index.erb
```

In our app.rb file we'll just put this instead:
```
require 'sinatra'

get '/cat' do
  erb(:index)
end
```
* Sinatra:`erb` - stands for **embeded ruby** `<%= %>`
```
<h1>My name is <%= ["Amigo", "Misty", "Almond"].sample %></h1>
<div style='border: 3px dashed red'>
  <img src='http://bit.ly/1eze8aE'>
</div>
```
* Refactor view logic to controller logic to keep views clean
* Use params to allow interactivity

```
server.rb

  post ‘/form’ do
    @username = params[:username]
    puts params
    erb :form
  end
```
```
form.erb
  <form name="input" action=“/form” method=“post”>
  username: <input type=“text” name=“username”>
  password: <input type=“password” name=“password”>

  <input type=“submit” value=“Submit”>
  </form>
  ```
* Sinatra: `POST`ed `params`
Let's ask our form to submit its data as a POST request:
```
<form action="/named-cat" method="post">
  <input type="text" name="name">
  <input type="submit" value="Submit">
</form>
```
Let's change our /named-cat route to handle POST requests instead of GET ones:
```
# in app.rb
# first, let's write a form-displaying route
get '/cat-form' do
  erb :cat_form
end

post '/named-cat' do
  p params
  @name = params[:name]
  erb :index
end
```

### Extra Exercise:
#### To-Do List
* Write a to-do list - a simple 2 page sinatra application.
* On the 1st page, have a form with an input and a submit button. This form should post a request to the second page which should display the list.
* There should be a list class that the server writes to - this could be an array. The second page should display the contents of this array.
* The code should of course be fully tested with Cucumber and/or RSpec.
