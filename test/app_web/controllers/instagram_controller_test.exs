defmodule AppWeb.InstagramControllerTest do
  use AppWeb.ConnCase

  test "GET /api/instagram/user_feed", %{conn: conn} do
    conn = post(conn, ~p"/api/instagram/user_feed", username: "crocs")

    assert %{"success" => true} = json_response(conn, 200)
  end
end
