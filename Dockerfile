# Pass in nodejs version
ARG NODE_VERSION=20.10.0

# Pass in ruby version
ARG RUBY_VERSION=3.2.2

# Pull in the nodejs image
FROM node:${NODE_VERSION}-alpine3.19 AS node

# Pull in the ruby image
FROM ruby:${RUBY_VERSION}-alpine3.19

# As this is a multistage Docker image build
# we will pull in the contents from the previous node image build stage
# to our current ruby build image stage
# so that the ruby image build stage has the correct nodejs version
COPY --from=node /usr/local/bin /usr/local/bin

# Set the app directory
WORKDIR /app

# Install application dependencies
RUN apk add --update --no-cache \
  build-base \
  ca-certificates \
  curl \
  git \
  libpq-dev \
  npm \
  tzdata

RUN npm install -g yarn@1.22.19 --force

RUN yarn install --check-files

COPY . .

COPY Gemfile Gemfile.lock ./

# Build application
RUN gem install bundler && bundle install --jobs 4 --retry 5 && bundle clean --force

# Recompile sqlite3 gem, fixes an issue with Alpine 3.19 where
# sqlite3_native.so cannot be loaded due to missing symbols
RUN gem uninstall sqlite3
RUN gem install sqlite3 --platform=ruby

RUN NODE_OPTIONS=--openssl-legacy-provider rake assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
