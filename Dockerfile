# Dockerfile
FROM ruby:3.0.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client curl
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn=1.22.19-1
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler:2.5.11
RUN bundle install
COPY . /app
RUN bundle exec rails webpacker:install
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
