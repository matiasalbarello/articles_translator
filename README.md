# README

## Instructions to use

1. Clone the project and install dependencies with `bundle install`
2. Setup the Environment variables, renaming the sample file: `mv .sample-env .env`
3. This software uses AWS Translate, which needs proper credentials. Please complete the required variables in the .env file created in the previous step.
4. Create database and run the migrations with: `bundle exec rake db:create` and `bundle exec rake db:migrate`
5. Start the program with `rails s` and navigate to `localhost:3000` in your browser.
6. Press `ctrl + c` when you want to stop the program.

## Other considerations

* This project was developed using Ruby version 2.6.3 and Rails 6.
* To run the tests use `bundle exec rspec` (you might need to follow the previous instructions before)
* As part of the requirements, this software translates the Questions/Answer that are stored in Articles. That process might take some time depending on the connection and text length. Therefore, that process is run in the background as a Job. To keep the solution simple, I preferred to keep the default Queue Adapter (AsyncJob). Further configurations may be needed if other adapter is preferred.
* I decided to import Bootstrap framework to easily make the app look better. I didn't give it enough time to configure it and properly select the necessary modules. There's a lot to do regarding that and some javascript helpers to improve the user experience but I considered that it would be out of scope for this task.
