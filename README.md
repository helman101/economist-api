# Economist Scraper Back-End

This project is the back-end part of the economist scraper.

- [Front-end repository](https://github.com/helman101/wrestling-trainers-app)

## [Live Link](https://frosty-ptolemy-ca6fb6.netlify.app/)

## About

The goal of this project was make an scraper that scraps the data from the main page of the [economist](https://www.economist.com/), then this API save that scraped data in the database, creating an Article for each new in the page, and a Column for each column of new in the page.

### Data in the user table

- id
- name
- email
- password_digest

### Data in Column table

- id

### How to use it

Base URL: https://wrestling-api-helman101.herokuapp.com

#### End points

*/columns*

- **GET** - to recieve a list of columns along with a list of each column articles

*/users*

- **POST** - to create an user - with parameters:
  - name
  - email
  - password
  - password_confirmation

*/auth*

- **GET** - to check login parameters - with parameters:
  - email
  - password


## Getting Started

To set up a local copy of the project

- `git clone git@github.com:helman101/economist-api.git`
- `cd economist-api`
- `bundle install`

## Run locally

- Now you are ready to run a local server
- Go to your command line and put `npm start`
- Go to https://localhost:3000/
- Try it!!

### Run tests

- Go to your terminal
- Run ```rails spec``` to run all the tests.


### Technologies used

To create this project I used:

- Ruby on Rails
- bcrypt gem
- Heroku
- Postgresql
- rspec


## Author

👤 **Andres Ortegon**

- GitHub: [@helman101](https://github.com/helman101)
- Twitter: [@helman1011](https://twitter.com/Helman1011)
- LinkedIn: [Andres Ortegon](https://www.linkedin.com/in/helman101/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Acknowledgments

- [The Economist](https://www.economist.com/)