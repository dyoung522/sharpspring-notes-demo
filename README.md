# Notes Code Challenge for Sharpspring

Had this been a production app, instead of re-inventing the wheel in different areas, I would most likely have
opted to use some additional "best-practice" gems, such as `Devise` for authentication, and maybe a proven UI
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
