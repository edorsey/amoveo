-module(testnet_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->

    %% TODO: move to config
    application:start(inets),
    inets:start(),

    io:fwrite("starting node\n"),

    testnet_sup:start_link().


stop(_State) ->
    io:fwrite("stopping node\n"),
    api:off().
