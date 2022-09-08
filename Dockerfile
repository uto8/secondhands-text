FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# nllllll_appと書かれている部分はディレクトリ名に応じて変更します。
WORKDIR /secondhands-text
COPY Gemfile /secondhands-text/Gemfile
COPY Gemfile.lock /secondhands-text/Gemfile.lock
RUN bundle install
COPY . /secondhands-text

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
