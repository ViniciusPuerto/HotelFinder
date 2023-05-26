# HotelFinder

Given a hotel name (for example: "B Hotel Brasilia") it returns the URL of this hotel from the following sources:

- Tripadvisor.com
- Booking.com
- Holidaycheck.de


## Installation

### Prerequisites

To a better compatibility with the environment, it is recommended to use a docker and just run the following commands.

- [Docker](https://docs.docker.com/install/)

### Steps

Run the following commands:

`docker build -t hotel_finder .` to build the docker image

`docker run -it hotel_finder` to run an interactive console for the docker image

Inside the docker image run the following commands:

`gem build hotel_finder.gemspec` to build the gem

`gem install hotel_finder-0.0.1.gem` to install the gem

## Usage

`chmod a+x bin/hotel_finder` to add execute permissions to the script

`ruby -Ilib ./bin/hotel_finder "YOUR HOTEL NAME OR PARAMS"` to run the script


e.g `ruby -Ilib ./bin/hotel_finder "B Hotel Brasilia"` will return the following:

```
https://www.tripadvisor.com/Hotel_Review-g303322-d13482932-Reviews-B_Hotel-Brasilia_Federal_District.html
https://www.booking.com/hotel/br/b-brasilia.html
https://www.holidaycheck.de/hi/b-hotel-brasilia/aa8692bb-0054-482f-9fda-44ac478953fb
```

## To run Specs

inside the image run the following command: `bundle exec rspec`