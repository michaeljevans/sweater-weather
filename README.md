# Sweater Weather API

The Sweater Weather API makes planning road trips a breeze! Users can request the forecast for a location, request images related to a location, and create road trips.

## Setup
* Clone this repo
* `$ bundle install`
* `$ rake db:{create,migrate}`
* `$ bundle exec figaro install` will create a git-ignored `config/application.yml` where you will need to place your API keys for the environment

**Please sign up for the following APIs to get necessary credentials**

* [MapQuest](https://developer.mapquest.com/documentation/)
* [OpenWeather](https://openweathermap.org/api)
* [Unsplash][https://unsplash.com/developers]

---
## Use
* `$ rails s`
* Send requests to `localhost:3000`

---
### Without an API key, visitors can:
* request the forecast for a location
* request an image related to a location
* register for an account to receive an API key

### With an API key, users can:
* log in
* create road trips

---
## Endpoints
### Forecast
**GET** `/api/v1/forecast`

`location` **required**

Example input: `location=denver,co`

**Notes:**

* temperatures are given in Kelvin
* times are given in Unix, UTC format
* `humidity` is given as a percentage
* `visibility` is given in meters
* `rain_acc` and `snow_acc` are given in millimeters

Example JSON response:

```Ruby
{
  "data": {
    "type": "forecast",
    "id": nil,
    "attributes": {
      "location": {
        "city": "Denver",
        "state": "CO",
        "country": "US",
        "latitude": 39.738453,
        "longitude": -104.984853
      },
      "weather": {
        "current": {
          "low": 289.65,
          "high": 301.75,
          "temp": 289.65,
          "sunset": 1600650010,
          "sunrise": 1600605971,
          "uv_index": 6.87,
          "humidity": 37,
          "date_time": 1600667336,
          "feels_like": 286.47,
          "visibility": 10000,
          "description": "scattered clouds"
        },
        "hourly": [
          {
            "temp": 289.65,
            "date_time": 1600664400
          },
          {
            "temp": 292.64,
            "date_time": 1600668000
          },
          {
            .....
          }
        ],
        "daily": [
          {
            "low": 289.65,
            "high": 301.75,
            "rain_acc": nil,
            "snow_acc": nil,
            "date_time": 1600624800,
            "description": "scattered clouds"
          },
          {
            "low": 291.96,
            "high": 303.08,
            "rain_acc": nil,
            "snow_acc": nil,
            "date_time": 1600711200,
            "description": "clear sky"
          },
          {
            .....
          }
        ]
      }
    }
  }
}
```
---
### Background Image
**GET** `/api/v1/backgrounds`

`location` **required**

Example input: `location=denver,co`

Example JSON response:
```Ruby
{
  "data": {
    "type": "image",
    "id": nil,
    "attributes": {
      "location": "denver,co",
      "image_url": "https://images.unsplash.com/photo-1579105472133-d6ed04e1bfc9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE2Nzk0NX0",
      "credit": {
        "source": "unsplash.com",
        "artist": "gabrieluizramos",
        "logo": "https://unsplash-assets.imgix.net/marketing/press-logotype-stacked.svg?auto=format&fit=crop&q=60"
      }
    }
  }
}
```
---
### User Registration
**POST** `/api/v1/users`

`email` **required**

`password` **required**

`password_confirmation` **required**

Example JSON response:
```Ruby
{
  "data": {
    "type": "users",
    "id": 38,
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "9_2zNHTCRnITWgRZMieyrw"
    }
  }
}
```
---
### User Login
**POST** `/api/v1/sessions`

`email` **required**

`password` **required**

Example JSON response:
```Ruby
{
  "data": {
    "type": "users",
    "id": 39,
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "1NvH5MX9qws8y0NkwZAyCQ"
    }
  }
}
```
---
### Road Trip Creation
**POST** `/api/v1/road_trip`

`origin` **required**

Example input: `origin=denver,co`

`destination` **required**

Example input: `destination=vegas,nv`

`api_key` **required**

**Notes:**

* `travel_time` is given in minutes
* `temp` is given in Kelvin

Example JSON response:
```Ruby
{
  "data": {
    "type": "road trip",
    "id": 5,
    "attributes": {
      "origin": "denver, co",
      "destination": "las vegas, nv",
      "travel_time": 631,
      "arrival_forecast": {
        "temp": 295.6,
        "description": "clear sky"
      }
    }
  }
}
```
