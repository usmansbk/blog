# Blog

![Microverse](https://img.shields.io/badge/Microverse-blueviolet)

> Classic blog website

![screenshot](./app_screenshot.png)

Blog website that shows a list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With

- Ruby on Rails
- PostgreSQL
- Bulma CSS

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### Install

```sh
bundle install
```

### Database

```sh
# Create user
sudo -u postgres createuser blog -s

# Create the database
rake db:create

## Apply migration
rails db:migrate

# Load the schema
rails db:schema:load
```

### Run

```sh
rails s
```

### API

```sh
## Generate your api secret
bundle exec rake secret

## Set key environment variable
export DEVISE_JWT_SECRET_KEY=your_api_secret
```

### Test

```sh
# Load mock data
rails db:seed

rspec
```

### Troubleshoot

### Rspec failing

```sh
RAILS_ENV=test rake db:reset
```

## Authors

👤 **Usman**

- GitHub: [@usmansbk](https://github.com/usmansbk)
- Twitter: [@usmansbk](https://twitter.com/usmansbk)
- LinkedIn: [Usman Suleiman Babakolo](https://linkedin.com/in/usmansbk)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## License

[MIT](./LICENSE)
