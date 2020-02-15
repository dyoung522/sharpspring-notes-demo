# Notes for SharpSpring Code Challenge

## Primary features implemented

- Responsive UI
- Users can login and/or register an account
- Notes can be Added, Updated, or Destroyed
- Notes can be searched by title and/or body text
- When adding or updating notes, we display a character counter with a warning when the user approches the field's character limit
- 100% testing code coverage

Had this been a production app, instead of re-inventing the wheel in different areas, I would most likely have
opted to use some additional "best-practice" gems, such as `Devise` for authentication, and potentially a proven UI
framework such as `Bootstrap` or `Material-UI`.

However, in the spirit of the exercise, I've built this app entirely from scratch, with no additional gems providing
runtime functionality.

The only gems I've added were for testing and linting:

- RSpec - testing suite (This is my preferred Rails testing framework, however, I'm proficient with Minitest as well)
  - FactoryBot - Fixtures replacement
  - Shoulda-matchers - additional RSpec expectations
  - Capybara - headless Request testing
- Guard - test runner
- Rubocop - Ruby linter
- SimpleCov - Code coverage reporting

## Things that could be improved

- No forgotten password functionality
- No password reset functionality

Again, if this were a "production" app, these features would absolutely be required, but for sake of this exercise I
opted not to include them. While doing so would be straight-foward, I unfortunately did not have access to a free SMTP
gateway in which to send emails. It is my hope that the other extras I included were enough to showcase my abilities in
this regard.

Cheers,
-- Donovan
