-module(food_server).
-export([start/0, server/0]).

%make a function to start the server
start() ->
    spawn(fun() -> server() end).

% Set up the main server loop for orders
server() ->
    receive
        {order_food, From} ->
            {Food, Cost} = roll_food(),
            %% send the order of food back to the client
            From ! {food_item, Food, Cost},
            %% keeps the loop going
            server()
    end.

roll_food() ->
    %% random selection of food
    FoodList = [
        {"Burger", 5}, {"Pizza", 8}, {"Sushi", 12}, {"Salad", 4}, {"Tacos", 7}, {"Pasta", 10}
    ],
    Seed = {erlang:monotonic_time(), erlang:unique_integer([positive]), erlang:phash2(self())},
    _ = rand:seed(exsplus, Seed),
    Index = rand:uniform(length(FoodList)),
    lists:nth(Index, FoodList).
