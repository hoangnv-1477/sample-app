FROM ruby:2.7.0

RUN apt-get update && apt-get install -y curl nano
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs yarn && apt-get purge -y --auto-remove
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
COPY . /myapp