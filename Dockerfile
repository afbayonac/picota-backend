FROM elixir:1.13.3
RUN mkdir /app
COPY . /app
WORKDIR /app
ENV MIX_ENV=prod
RUN mix local.hex --force
RUN mix local.rebar --force
RUN rm -Rf _build
RUN mix deps.get --force
RUN mix release
EXPOSE 4040
CMD ["/app/_build/prod/rel/picota/bin/picota", "start"]