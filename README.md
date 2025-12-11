# Start mock server in LiveBook

Start the mock server

1. Open `playground/mock-server.livemd`. 
2. Evaluate all cells (press Cmd + Shift + Enter) to ensure it works.
3. In the sidebar, click App Settings → Launch Preview to start the mock API server.

Verify the mock server is running

1. Open playground/api-playground.livemd.
2. Evaluate all cells to confirm the mock server is working.

# Phoenix

To start your Phoenix server:

```
mix setup
mix phx.server
```

Example: trigger /user_feed endpoint with cURL

```
curl --location 'http://localhost:4000/api/instagram/user_feed' \
--header 'Content-Type: application/json' \
--data '{ "username": "crocs" }'
```
