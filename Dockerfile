FROM ruby:3.0.0-buster 
RUN apt-get update 

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app


COPY Gemfile* ./


RUN bundle install

RUN rails webpacker:install

COPY ./ ./


EXPOSE 3000
CMD [ "rails", "server", "-b", "0.0.0.0"]