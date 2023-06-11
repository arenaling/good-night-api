# API Endpoint for Reservations

This project implements an API endpoints using Ruby on Rails to handle user registration, list of all user, follow user, list of followed user, clock in sleep, clock in wake, and list of all followed user with duration sorted descending. This project is using SQLite so there is no need to extra preparation for database.
For notes in here, in wake API I add one logic to add random hours from current time to simulate sleep duration.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/arenaling/reservations_api.git
   ```

2. Navigate to the project directory:

   ```bash
   cd reservation-api
   ```

3. Install the required dependencies:

   ```bash
   bundle install
   ```

4. Set up the database:

   ```bash
   rails db:setup
   rails db:migrate
   ```

5. Start the Rails server:

   ```bash
   rails server
   ```

   The API endpoint will be accessible at `http://localhost:3000`.

## URL

For registration new user API :
```
POST http://localhost:3000/users
```
with JSON parameter for example :
```
{ "username": "joni", "fullname": "Joni Farizal" }
```

For list of all user API :
```
GET http://localhost:3000/users
```

For follow user API :
```
POST http://localhost:3000/users/follow
```
with JSON parameter for example :
```
{ "username": "bagas", "follower": "joni" }
```
* follower parameter is user who is following, and username is target user which is followed

For clock in sleep API :
```
POST http://localhost:3000/activities/sleep
```
with JSON parameter for example :
```
{ "username": "joni" }
```

For clock in wake API :
```
POST http://localhost:3000/activities/wake
```
with JSON parameter for example :
```
{ "username": "joni" }
```

For list of all followed user with sleep duration sorted descending API :
```
POST http://localhost:3000/users/list_followed
```
with JSON parameter for example :
```
{ "username": "joni" }
```
* username is user who is following other users

## Testing

The project includes unit tests using the RSpec testing framework. To run the tests, execute the following command:

```bash
rspec
```

The test suite includes tests for different payload scenarios, including 2 valid payloads and invalid payloads. It verifies the creation and updating of reservations and performs validations to ensure the correct behavior of the API endpoint.

## Thank you!
