FROM shanesveller/elixir-lang
RUN apt-get update && apt-get install -qy nodejs postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV MIX_ENV development

ENV APP pomodoro
RUN mkdir /$APP
WORKDIR /$APP

ADD mix.exs /$APP
ADD mix.lock /$APP

RUN ls -l
RUN yes | mix deps.get

ADD . /$APP

ENV PORT 8080
ENV MIX_ENV prod

RUN mix deps.compile

ENTRYPOINT /$APP/scripts/start-server.sh
