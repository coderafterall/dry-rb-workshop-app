FROM ruby:2.4
MAINTAINER Juan Gallego IV <juan.gallego.iv@gmail.com>

RUN apt-get update && apt-get -y install postgresql-client

ENV APP_DIR /usr/src/app
RUN mkdir $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install -j4

ADD . ./
ENTRYPOINT ["bundle", "exec"]
CMD ["irb"]
