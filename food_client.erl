-module(food_client).
-export([start/1, get_food_order/2, update_balance/2]).

%% Start the client with an initial balance
start(ServerPid) ->
    Balance = 50,
    get_food_order(ServerPid, Balance).

%% Function to request a food order from the server
get_food_order(ServerPid, Balance) ->
    ServerPid ! {order_food, self()},
    receive
        {food_item, Food, Cost} ->
            io:format("You have ordered: ~p, which costs: ~p~n", [Food, Cost]),
            NewBalance = update_balance(Balance, Cost),
            io:format("Your new balance is: ~p~n", [NewBalance]),
            %% If you still have money, continue ordering
            if
                NewBalance > 0 -> get_food_order(ServerPid, NewBalance);
                true -> io:format("You are out of money!~n")
            end
    end.

%% Function to update the balance based on the food cost
update_balance(Balance, Cost) ->
    Balance - Cost.
