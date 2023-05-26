# HotelFinder

## Installation

Run the following commands:

`docker build -t hotel_finder .` to build the docker image

`docker run -it hotel_finder` to run an interactive console for the docker image

Inside the docker image run the following commands:

`gem build hotel_finder.gemspec` to build the gem

`gem install hotel_finder-0.0.1.gem` to install the gem

## Usage

`chmod a+x bin/hotel_finder` to add execute permissions to the script

`ruby -Ilib ./bin/hotel_finder "YOUR HOTEL NAME OR PARAMS"` to run the script

