lazy_comments
=============

Simple commenting gem that gives you tag any AR model with `has_comments` and adding comments to it. 

### Requirements
- Rails 4 
- ActiveRecord
- Haml (currently, generated views use HAML only)

## Installation

    gem 'lazy_comments'
    rails g comments # Generates controllers, models, views and migrations

## Usage

    class Post < ActiveRecord::Base
      has_comments
    end

Add a comment to your model: 

    post = Post.new
    post.comments.build(message: "hello") 
  

Find Comments: 
    
    post = Post.find(13)
    Comment.for_subject(post)
    post.comments.where(user: current_user)
    
Comments belonging to a group: 
    
    # Essentially group is a string that can be anything
    Comment.in_group("hello_world")
    

Helpers 

Feature not committed yet, coming soon! 
  
