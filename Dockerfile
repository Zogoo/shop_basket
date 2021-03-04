# build stage
FROM ruby:2.7.0-alpine3.11 AS builder

ENV LANG=C.UTF-8
ENV TZ=Asia/Ulaanbaatar

RUN apk add --update --no-cache \
  linux-headers \
  build-base \
  libxml2-dev \
  libxslt-dev \
  git \
  tar \
  tzdata \
  postgresql-dev \
  postgresql-client \
  nodejs \
  && wget https://yarnpkg.com/latest.tar.gz \
  && mkdir -p /opt/yarn \
  && tar -xf latest.tar.gz -C /opt/yarn --strip 1

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
WORKDIR /app

ENV SECRET_KEY_BASE="allow_me_install_bundle"
ENV BUNDLE_WITHOUT="development test"
ENV PATH="$PATH:/opt/yarn/bin"
ENV BUNDLE_JOBS=4
ENV RAILS_ENV=production 
ENV NODE_ENV=production 

RUN gem update --system 3.2.6
RUN gem install --force bundler -v '2.2.11'
RUN bundle install
RUN rm -rf /usr/local/bundle/cache/*.gem \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY . /app
RUN rm -rf ./node_modules ./.git ./.docker ./coverage
RUN yarn install
RUN bundle exec rake assets:precompile
RUN chmod -R 755 /app/public

# Main build
FROM ruby:2.7.0-alpine3.11

ENV LANG=C.UTF-8
ENV TZ=Asia/Ulaanbaatar

RUN apk add --update --no-cache \
  nodejs \
  postgresql-client

ENV RAILS_ENV production
ENV NODE_ENV production
ENV RAILS_SERVE_STATIC_FILES true

RUN gem update --system 3.2.6
# Native C libaries for OS
COPY --from=builder /usr/lib /usr/lib
# Timezone data is required at runtime
COPY --from=builder /usr/share/zoneinfo/ /usr/share/zoneinfo/
COPY --from=builder /usr/share/zoneinfo/Asia/Ulaanbaatar /etc/localtime
# Bundled gems
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
# Web application
COPY --from=builder --chown=1000:1000 /app /app

WORKDIR /app

USER 1000

CMD [ "rails", "start" ]