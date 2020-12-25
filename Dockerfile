FROM ruby:2.7

RUN mkdir /myapp
WORKDIR /myapp
ENV TZ=Asia/Tokyo

RUN apt-get update -qq && apt-get install -y build-essential nodejs default-mysql-client

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler
RUN bundle install -j 4
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 9000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
