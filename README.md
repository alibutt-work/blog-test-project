# Rails Blog Application

This is a simple blog application built with Ruby on Rails 7.x and Ruby 3.x.

## Setup

1. Clone the repository:
```
git clone https://github.com/yourusername/rails-blog.git cd rails-blog
```

2. Install dependencies:
```
bundle install
```

3. Set up the database:
```
rails db:create db:migrate
```

4. Start the Rails server:
```
rails server
```

5. Visit `http://localhost:3000` in your browser.

## Running Tests

To run the RSpec tests:
```
bundle exec rspec
```

## Generating Swagger Documentation

To generate Swagger documentation:

Then visit `http://localhost:3000/api-docs` to view the API documentation.

## Code Linting

This project uses Rubocop for code linting and style checking.

To run Rubocop:
```
bundle exec rubocop
```
To automatically fix issues that Rubocop can correct:
```
bundle exec rubocop -A
``` 
Note: We've included a `.rubocop.yml` configuration file to customize Rubocop rules for this project. You can find it in the root directory.


## Features

- User authentication (Devise)
- CRUD operations for blog posts
- Like functionality for posts
- Display of like count for each post

## Implementation Details

- PostgreSQL database
- Devise for user authentication
- Bootstrap for styling
- RSpec for testing
- Swagger for API documentation

## Testing Approach

- Model tests for Post and User
- Controller tests for PostsController and LikesController
- Integration tests for user flows

## Running the Application

1. Start the server:
2. Visit `http://localhost:3000` in your browser
3. Sign up for a new account
4. Create, read, update, and delete posts
5. Like posts and view like counts

## Additional Commands

- Run migrations: `rails db:migrate`
- Reset database: `rails db:reset`
- Generate Swagger docs: `rails rswag:specs:swaggerize`
- Run specific tests: `bundle exec rspec spec/models/post_spec.rb`

For more information, refer to the Rails documentation and the source code.