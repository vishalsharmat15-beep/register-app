<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fashion Signup App | Admin</title>
  <style>
    body { font-family: Georgia, serif; background: #f4f1ed; color: #171717; margin: 0; padding: 8vw; }
    main { max-width: 460px; margin: auto; background: #fff; padding: 40px; }
    h1 { font-weight: 400; letter-spacing: 3px; }
    p { color: #666; }
    input, button { width: 100%; padding: 14px 0; margin-top: 18px; box-sizing: border-box; }
    input { border: 0; border-bottom: 1px solid #aaa; }
    button { border: 1px solid #171717; background: #171717; color: #fff; letter-spacing: 2px; text-transform: uppercase; cursor: pointer; }
  </style>
</head>
<body>
  <main>
    <p>XIVO / PRIVATE AREA</p>
    <h1>Registered Users</h1>
    <p>Admin access only. Passwords are never displayed.</p>
    <form action="admin/users" method="post">
      <label for="token">Admin token</label>
      <input id="token" name="token" type="password" required autocomplete="off">
      <button type="submit">View users</button>
    </form>
  </main>
</body>
</html>
