# ggHUB
Site: [https://gghub.herokuapp.com/](https://gghub.herokuapp.com/)

[![Inline docs](http://inch-ci.org/github/itggot-jonathan-lindqvist/gghub.svg?branch=master)](http://inch-ci.org/github/itggot-jonathan-lindqvist/gghub)
Tournament site for your needs! :^)
Can be used for siege, rocket leauge and many more!
## Summary 
The primary goal with ggHUB for me is to learn, I have worked in Rails before but I want to become more comfortable using Rails. My second goal was to create something that actully could be used. And the last but not least was to create a project for my portfolio.

## Run it locally
1. Make sure you have Ruby installed, you can check with this command; `ruby -v`
2. Make sure you have the Ruby on Rails gem, otherwise run: `gem install rails`
3. You now need to navigate to the directory and run: `bundle install`
4. Now you can finally run: `rails s`
5. The site can now be accessed at localhost:3000

If you want to fake users on the site you can run: `rails db:migrate:reset` and then `rails db:seed`.

## Rubocop
### Why do I use Rubocop?
I have used rubocop before and I feel like it improves my code, it makes my code easier to read and it sometimes teaches me new stuff. And in my opinon it is also easily customizable with the [.rubocop.yml](.rubocop.yml)

### How to run it
Assuming you have followed the instructions in [Run it locally](##run-it-locally) you can just run: `rake rubocop`

## Contribute to ggHUB
All you have to do is fork it, create a feature branch from the development branch and then create a pull request :)
