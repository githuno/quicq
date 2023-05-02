FROM ruby:3.1.2
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs vim sudo openssl postgresql postgresql-client \
    && apt-get clean
COPY quiz_app/ /app/quiz_app
WORKDIR /app/quiz_app
RUN gem update --system \
    && gem install bundler -v 2.3.14
RUN bundle _2.3.14_ config set --local without 'production' \
    && bundle _2.3.14_ install