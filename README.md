# ggHUB
Site: [https://gghub.herokuapp.com/](https://gghub.herokuapp.com/)

[![Build Status](https://travis-ci.com/QvistJ/ggHUB.svg?branch=master)](https://travis-ci.com/QvistJ/ggHUB)
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

## Travis CI
I'm using Travis CI because it is a nice and easy way for me to test the application. Right now it is very simple, it only runs `rails test` and `rake rubocop`.
You can find all the CI results [here](https://travis-ci.com/QvistJ/ggHUB/branches)

## Contribute to ggHUB
All you have to do is fork it, create a feature branch from the development branch and then create a pull request :)
