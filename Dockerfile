FROM rails:5.0.1
MAINTAINER "Dmitri Nesterenko <dmitri.nesterenko@gmail.com"

WORKDIR /webapp/current
COPY . /webapp/current
EXPOSE 3000
RUN bundle install
