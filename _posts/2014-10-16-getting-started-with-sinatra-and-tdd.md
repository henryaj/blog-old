---
title: Getting started with Sinatra and test-driven development
date: 2014/10/16 10:08:14
layout: post
post_name: getting-started-with-sinatra-and-tdd
---
# Getting started with Sinatra and test-driven development

**Sinatra** is a DSL (_domain-specific language_, or a language written for a specific purpose) for building web applications. It can be confusing. If you're a beginner programmer fiddling around with Ruby, the single-user terminal apps you've been writing are suddenly up on the web for everyone to see, and they need to behave differently as a result. [code lang=ruby] require 'sinatra' get '/' do 'hello world!' end [/code] If you want to run this and get it working, save this into a file (say `server.rb`), go to that directory and run `ruby server.rb` (you'll need Ruby installed on your machine, naturally). This code, specifically the bit between `get` and `end` (called the _controller_) will intercept an HTTP GET request sent to '/', and reply with 'hello world!' in plain text. Simple. 

## Routes

In the above example, '/' is the _route_. You can define a bunch of other routes, too. For example: [code lang=ruby] get '/hi' do <h1>Hello Makers!</h1> end [/code] Now, accessing the website path `/hi` will yield the above message (which in this case will appear big and bold on the page, as we have wrapped it in `h1` tags.) 

## Testing with Cucumber

[Cucumber](http://cukes.info) is used for _acceptance testing_ – it acts as if it were a person using the application to make sure it works. You can use Cucumber with Sinatra by using the [cucumber-sinatra gem](https://github.com/bernd/cucumber-sinatra). Get started by running: [code lang=shell] $ cucumber-sinatra init --app SampleApp lib/sample_app.rb ... $ rackup [/code] Run your Cucumber tests from the command line with `$ cucumber`. Now, let's describe a feature using Cucumber: [code lang=shell] $ mkdir feature $ touch homepage.feature [/code] [code lang=text] Feature: The homepage In order to show off Cucumber I want to present Cucumber [/code] This will run, but doesn't have any actual tests (or _scenarios_). Let's add some in the same file. [code lang=text] Scenario: Being greeted Given I am a site visitor When I am on the homepage Then I should see "Hello hello!" [/code] This `Given`/`When`/`Then` notation is particular to Cucumber (or specifically Gherkin, the language Cucumber is written in). For each step, you write a step definition in Ruby. cucumber-sinatra has some built in step definitions, so you can write some steps without needing to define them (like `When I am on the homepage`). These built-in definitions live in `features/step_definitions/`, and there are support files in `support/` which do things like substituting 'homepage' for '/'. Cucumber also uses a language called [Capybara](https://github.com/jnicklas/capybara), which can interact with a webpage -- filling in forms, clicking links, looking for specific page content, and so on. **Consider deleting `features/step_definitions/web_steps.rb` to get some practice in writing your own step definitions**, which also makes the whole thing seem less like magic and gives you a better understanding of how Cucumber matches up your tests with Capybara methods behind the scenes. 

## Running the damn thing

Get your server up and running by typing [code lang=shell] $ rackup [/code] What this command _actually does_ is read through your `sample_app.rb` file, looks at the various routes you've set, and creates a _routing table_ from it. Then it starts an HTTP server on a particular port and makes it available for connections. 

## Config

Look at the following code from the [Sinatra documentation](http://www.sinatrarb.com/configuration.html): [code lang=ruby] set :views, Proc.new { File.join(root, "templates") } [/code] Why do it this way? Seems kinda convoluted. The reason this is so important is that it bases the path to your `views` directory on the site root. If you ran `rackup` from a different directory and you'd hard-coded the views path, then it would break – it wouldn't be able to find views relative to where you're running the server file from. Using `root` gives a salient point that your site is always run from. 

## Sessions

HTTP by nature is _stateless_ \- so it doesn't recognise repeat visitors, or even visitors across pages. A lot of basic things fail because of this – how could you log in to a site, for example, if it didn't remember you? This is where sessions come into play. The server creates a unique ID (or UID) for each visitor and stores it in a hash table. This value is served back up to users to identify them, either in a cookie or (more rarely) in the URI itself. A _cookie_ is returned as part of the header – it's just a string inside the header. A cookie sent by a particular site can only be read from the browser by that site. So how do you use sessions in Sinatra? `sample_app.rb`: [code lang=ruby] class SampleApp < Sinatra::Base enable :sessions get '/' do @number = session erb :index end get '/a/:number' do |number| session['number']= number redirect to '/' end end [/code] Bear in mind that sessions have a hard limit of 4KB! To store more than this, you would use a database -- but that's a topic for another time.
