FROM ruby:latest

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

RUN rails db:create
RUN rails db:migrate
RUN rails db:seed

CMD ["rails", "server", "-b", "0.0.0.0"]
