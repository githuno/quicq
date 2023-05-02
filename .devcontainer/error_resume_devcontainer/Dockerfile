FROM ruby:3.1.2
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev apt-utils nodejs vim sudo openssl postgresql postgresql-client \
    && apt-get clean
COPY quiz_app/ /app/quiz_app
WORKDIR /app/quiz_app
RUN gem update --system \
    && gem install bundler -v 2.3.14
RUN bundle _2.3.14_ config set --local without 'production' \
    && bundle _2.3.14_ install

# RUN service postgresql restart
# RUN sudo service postgresql start \
#     && sudo service postgresql status
# RUN echo "CREATE ROLE postgres LOGIN CREATEDB PASSWORD 'postgres';" | sudo -u postgres psql
RUN rails db:create \
    && rails db:migrate \
    && rails db:seed
RUN mkdir -p tmp/cache/assets
# RUN groupadd --gid 1000 vscode \
#   && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode
# USER vscode

# -------------------------------GPT4の修正↑----------------------

# FROM ruby:3.1.2
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim sudo openssl
# RUN apt-get clean
# # RUN mkdir /app

# COPY quiz_app /app
# # READMEに従う↓------------------------↓
# WORKDIR /app/quiz_app
# RUN sudo apt update
# RUN sudo apt install -y libmagickcore-dev libpq-dev postgresql
# RUN gem update --system
# RUN gem install bundler -v 2.3.14
# RUN bundle _2.3.14_ config set --local without 'production'
# RUN bundle _2.3.14_ install
# RUN sudo service postgresql restart
# # RUN sudo service postgresql status
# RUN sudo -u postgres -i
# RUN psql
# RUN \password
# RUN postgres
# RUN postgres
# RUN \q
# RUN exit
# RUN rails db:create
# RUN rails db:migrate
# RUN rails db:seed
# # READMEに従う↑------------------------↑
# RUN mkdir -p tmp/cache/assets

# # Add a non-root vscode user
# RUN groupadd --gid 1000 vscode \
#   && useradd --uid 1000 --gid vscode --shell /bin/bash --create-home vscode

# # Switch to the vscode user
# USER vscode
