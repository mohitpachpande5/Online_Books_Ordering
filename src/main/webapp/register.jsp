<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register | Online Books Ordering</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
<main class="auth-page">
    <section class="auth-panel">
        <div class="brand-block">
            <span class="brand-mark">BO</span>
            <h1>Create your account</h1>
            <p>Join the store to save carts and track book orders.</p>
        </div>
        <form action="register" method="post" class="auth-form">
            <h2>Register</h2>
            <label for="name">Name</label>
            <input id="name" type="text" name="name" placeholder="Your name" required>
            <label for="email">Email</label>
            <input id="email" type="email" name="email" placeholder="you@example.com" required>
            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Create password" required>
            <button type="submit">Register</button>
            <p>
                Already have an account?
                <a href="login.jsp">Login</a>
            </p>
        </form>
    </section>
</main>
</body>
</html>