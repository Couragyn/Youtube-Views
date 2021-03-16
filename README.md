# Youtube-Views

Youtube-Views shows the top YouTube video information pulled from a JSON file. https://youtube-view-count.herokuapp.com/

![Screenshot](app/assets/images/screenshot.png?raw=true "Screenshot")

## Setup Instructions

1. Clone repo
2. Install `rbenv`
   - Install `ruby-2.7.2`
3. Install `postgres`
   - Make sure your root username has psql createdb permission `ALTER USER user CREATEDB;`
4. Set up ruby environment:
   - `bundle update --bundler`
   - `bundle install`
5. Start rails:
   - `rails s`