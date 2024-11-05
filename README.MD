# 🍔 Distributed Food Ordering System in Erlang 🍟

Welcome to the Distributed Food Ordering System built in Erlang! 🚀 This project demonstrates a simple client-server architecture where a client can order food items from a server. Each order deducts from the client's balance until they run out of money. 🍲💸

## 📝 Project Overview

In this project:

A Server provides various food items 🍕🍔🥗 along with prices.
A Client can order food, and their balance updates based on the cost of the food ordered.
The client will stop ordering once they run out of balance. 😢
Modules
food_server: Manages the food items and processes orders.
food_client: Requests food from the server and updates its balance.
🚀 Quick Start
Follow these steps to get the client and server running in separate terminals.

1️⃣ Start the Server Node
Open a terminal and start the Erlang shell with a node name and cookie:

```bash
Copy code
erl -sname server_node -setcookie mycookie
Compile and run the server:

erlang
Copy code
c(food_server).
ServerPid = food_server:start().
Register the server PID for client access:

erlang
Copy code
register(food_server, ServerPid).
2️⃣ Start the Client Node
Open a second terminal and start a separate Erlang shell with a different node name but the same cookie:

bash
Copy code
erl -sname client_node -setcookie mycookie
Compile and start the client, connecting it to the server:

erlang
Copy code
c(food_client).
food_client:start({food_server, 'server_node@thegate'}).
Now, the client will start ordering food and will print out the remaining balance after each order until it runs out of money. 🤑
```

## 🔧 Code Structure

food_server.erl
Handles the food ordering logic:

Spawns a process to manage food items.
Sends back random food items and prices upon client request.
food_client.erl
Manages client balance:

Sends requests to the server for food.
Deducts balance based on food cost.
Stops when balance reaches zero.
💡 Example Output
When the client requests food, you might see output like:

```yaml
Copy code
You have ordered: 🍕, which costs: 10
Your new balance is: 40
You have ordered: 🍔, which costs: 15
Your new balance is: 25
...
You are out of money! 💸
🌐 Distributed Nodes
This project runs on distributed nodes, giving you a basic setup for client-server communication in Erlang across multiple terminals. Make sure both nodes use the same cookie to allow communication.
```

🛠️ Requirements
Erlang/OTP (tested on Erlang/OTP 26)
Two terminal windows or tabs
💻 Running in Distributed Mode
This example shows how to run a simple client-server setup across two nodes. You can adapt this approach to scale and handle more complex interactions as needed!
