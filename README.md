# Notes Code Challenge for Sharpspring

In the spirit of the exercise, I've built this app entirely from scratch, with no extra gems used outside testing/development purposes.
Had this been a production ready app, I _probably_ would have opted to use some additional "best-practice" gems,
such as `Devise` for authentication, and `SimpleForms` for better form structures.

Here are the additional Gems I've used:

- RSpec -- testing suite
  - FactoryBot - Fixtures replacement
  - Shoulda-matchers - additional RSpec expectations for rails
  - Capybara - headless Request testing
- Guard - test runner
- Rubocop - Ruby linter
- SimpleCov - Code coverage reporting
