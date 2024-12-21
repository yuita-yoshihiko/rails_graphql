FROM ruby:3.1.2-alpine3.15

ENV LANG="ja_JP.UTF-8"
ENV app="/app"

WORKDIR $app

RUN apk update \
 && apk upgrade \
 && apk --update add \
      g++ \
      make \
      tzdata \
      postgresql-dev \
      openssh \
      git \
      bash \
      gcompat \
 && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
 && rm -rf /var/cache/apk/*
RUN gem update --system \
 && gem install bundler --no-document

EXPOSE 3000
