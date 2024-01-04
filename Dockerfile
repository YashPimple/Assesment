FROM ruby:2.7

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler

RUN bundle install

COPY . .

RUN bundle exec rake

EXPOSE 4567

ENV RAILS_ENV production

CMD ["bundle", "exec", "rerun", "app.rb"]
