FROM ruby:3.2.2-alpine

RUN apk update

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY . .

CMD /bin/sh