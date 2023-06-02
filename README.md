# README
(Mostly) fully functional Facebook app! Create user accounts, make posts, like/comment, add friends, sign in with Facebook, receive confirmation email, etc

Live app available at: https://odinfb.fly.dev/

* Ruby version: 3.1.2

* Rails version: 7.0.3

* System dependencies: 'bulma-rails', devise', 'responders', 'gravtastic', 'omniauth-facebook', 'omniauth-rails_csrf_protection', "letter_opener", 'figaro'

Currently Implemented:

- Users can send and receive friend requests, create text posts, like and comment on posts
- Users receieve notifications for all above
- Users can use Gravatar for their avatar
- Sign in using Facebook credentials via OmniAuth
- Receive registration confirmation email via SendGrid
- Deployed via fly.io using PostgreSQL
- Styled with bulma

To Do:

- Allow posting of images and personal avatars via ActiveStorage
- Proper styling via HTML/CSS
- Allow use of Facebook avatar if using FB credentials
- Integration tests using Guard

Assignment:
https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project
