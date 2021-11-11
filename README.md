[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
![Version][version-badge]

# Tea Time

Tea time is a Rails API with endpoints for users to subscribe a customer to a tea subscription, cancel a customer's tea subscription, and to see all of a customer's tea subscriptions (including active and cancelled).


## Table of Contents

- [Contributors](#contributors)
- [Project Configurations](#setup)
- [Exposed Endpoints](#endpoints)
- [Schema](#schema)

------

### <ins>Contributors</ins>


👤  **Brian Fletcher**
  
  <a href="https://www.linkedin.com/in/bfl3tch"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a>
  <a href="https://github.com/bfl3tch"><img src="https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=GitHub&logoColor=white"></a>

------


## <ins>Setup</ins>

This project requires Ruby 2.7.2 and Rails 5.2.6.

* Fork this repository
* Install gems and set up your database:
    * `bundle`
    * `rails db:{drop,create,migrate,seed}`
* Run the test suite with `bundle exec rspec -fd`
* Run your development server with `rails s`


### Project Configurations

* Ruby Version
    ```bash
    $ ruby -v
    ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
    ```

* [System Dependencies](https://github.com/tvaroglu/sweater_weather/blob/main/Gemfile)
    ```bash
    $ rails -v
    Rails 5.2.6
    ```

* Database Creation
    ```bash
    $ rails db:{drop,create,migrate,seed}
    Created database 'tea-time_development'
    Created database 'tea-time_test'
    ```

* How to Run the Test Suite
    ```bash
    $ bundle exec rspec -fd
    ```

* [Local Deployment](http://localhost:3000), for testing:
    ```bash
    $ rails s
    => Booting Puma
    => Rails 5.2.6 application starting in development
    => Run `rails server -h` for more startup options
    Puma starting in single mode...
    * Version 3.12.6 (ruby 2.7.2-p137), codename: Llamas in Pajamas
    * Min threads: 5, max threads: 5
    * Environment: development
    * Listening on tcp://localhost:3000
    Use Ctrl-C to stop
    ```


## Endpoints

The `base path` of each endpoint in <strong><u>development/testing</u></strong> is:

```
http://localhost:3000/api/v1
```

- For `GET` requests, you can send the endpoint requests through your internet browser, or utilize an API client (i.e. [Postman](https://www.postman.com/))
- For `POST` and `PATCH` requests, you will need to use an API client

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/bfl3tch/tea-time.svg?style=flat
[contributors-url]: https://github.com/bfl3tch/tea-time/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/bfl3tch/tea-time.svg?style=flat
[forks-url]: https://github.com/bfl3tch/tea-time/network/members
[stars-shield]: https://img.shields.io/github/stars/bfl3tch/tea-time.svg?style=flat
[stars-url]: https://github.com/bfl3tch/tea-time/stargazers
[issues-shield]: https://img.shields.io/github/issues/bfl3tch/tea-time.svg?style=flat
[issues-url]: https://github.com/bfl3tch/tea-time/issues
[version-badge]: https://img.shields.io/badge/API_version-V1-or.svg?&style=flat&logoColor=white

## Schema
<img src="https://user-images.githubusercontent.com/74567704/141040919-5d6967b7-6655-4470-93cd-eeff32e7938b.png">
