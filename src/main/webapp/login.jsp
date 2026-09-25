<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Online Books Ordering</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<main class="auth-page">
    <section class="auth-panel">
        <div class="brand-block">
            <span class="brand-mark">BO</span>
            <h1>Online Books Ordering</h1>
            <p>Sign in to browse books, manage your cart, and view orders.</p>
        </div>
        <form action="login" method="post" class="auth-form">
            <h2>Login</h2>
            <label for="email">Email</label>
            <input id="email" type="email" name="email" placeholder="you@example.com" required>
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Enter password" required>
            <button type="submit">Login</button>
            <p>
                Don't have an account?
                <a href="register.jsp">Register</a>
            </p>
        </form>
    </section>
</main>
</body>
</html>