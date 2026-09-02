<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Fashion Signup App | XIVO</title>
	<link rel="stylesheet" href="css/style.css">
	<style>
		.image-hero { position: relative; min-height: 78vh; overflow: hidden; color: #fff; background: #222; }
		.image-hero img { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: center; }
		.image-hero::after { content: ""; position: absolute; inset: 0; background: linear-gradient(90deg, rgba(0,0,0,.42), rgba(0,0,0,.04)); }
		.image-hero .hero-content { position: relative; z-index: 1; margin: 0 auto; padding: 18vh 24px 40px; max-width: 1200px; text-align: left; }
		.image-hero h1 { font-size: clamp(42px, 7vw, 92px); letter-spacing: 12px; }
		.image-hero p { color: #fff; max-width: 360px; }
		.editorial { display: grid; grid-template-columns: 1fr 1fr; min-height: 560px; }
		.editorial img { width: 100%; height: 100%; min-height: 560px; object-fit: cover; }
		.editorial-copy { display: flex; flex-direction: column; justify-content: center; padding: 70px 10%; background: #f1eee9; }
		.editorial-copy h2 { font-size: clamp(32px, 4vw, 58px); font-weight: 300; letter-spacing: 5px; margin-bottom: 20px; }
		.editorial-copy p { color: #555; max-width: 360px; margin-bottom: 30px; }
		.text-link { color: #111; text-transform: uppercase; letter-spacing: 2px; font-size: 11px; text-decoration: none; border-bottom: 1px solid #111; width: fit-content; }
		.shop-section { background: #fff; }
		.product-image { background: #eeeae6; }
		.product-image img { object-fit: cover; }
		.register-band { padding: 90px 20px; background: #171717; color: #fff; }
		.register-band .registration-wrapper { margin: 0 auto; }
		.register-band label { color: #fff; }
		.register-band input { color: #fff; border-bottom-color: #777; }
		.register-band input:focus { background: #222; border-bottom-color: #fff; }
		.register-band .brand-section .subtitle, .register-band .tagline, .register-band .terms-text, .register-band .signin-text { color: #bbb; }
		.register-band .divider, .register-band .form-divider { background-color: #555; }
		.register-band .signin-section { border-top-color: #555; background-color: transparent; display: flex; justify-content: center; text-align: center; }
		.register-band .terms-text a, .register-band .signin-text a { color: #fff; border-color: #fff; }
		@media (max-width: 700px) { .editorial { grid-template-columns: 1fr; } .editorial img { min-height: 420px; } .editorial-copy { min-height: 380px; } }
	</style>
</head>
<body>
	<header>
		<div class="header-container">
			<a class="brand-logo" href="#home">XIVO<span class="brand-tagline">SEVENTEEN° SATELLITES™</span></a>
			<nav class="nav-links">
				<a href="#collection">Collection</a>
				<a href="#story">Story</a>
				<a href="#register">Register</a>
			</nav>
		</div>
	</header>

	<main>
		<section class="hero image-hero" id="home">
			<img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/banners/xivo-hero.jpg" alt="XIVO jewellery editorial campaign">
			<div class="hero-content">
				<h1>XIVO</h1>
				<p>Quiet form. Strong presence. A new language for modern luxury.</p>
				<a class="hero-button" href="#collection">View the collection</a>
			</div>
		</section>

		<section class="editorial" id="story">
			<img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/banners/xivo-jewellery-editorial.jpg" alt="XIVO jewellery editorial portrait">
			<div class="editorial-copy">
				<h2>SEVENTEEN°<br>SATELLITES™</h2>
				<p>Objects for the in-between hours: considered silhouettes, tactile materials, and a point of view that does not ask for permission.</p>
				<a class="text-link" href="#collection">Discover the edit</a>
			</div>
		</section>

		<section class="shop-section" id="collection">
			<div class="container">
				<div class="shop-header">
					<h1>The Collection</h1>
					<p>Essential forms for every orbit.</p>
				</div>
				<div class="products-grid">
					<article class="product-card"><div class="product-image"><img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/products/xivo-white-tee.png" alt="XIVO white tee"></div><div class="product-name">Essential White Tee</div><div class="product-price">₹4,500</div><button class="product-btn" type="button">View piece</button></article>
					<article class="product-card"><div class="product-image"><img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/products/xivo-white-tank.png" alt="XIVO white tank top"></div><div class="product-name">Studio Tank</div><div class="product-price">₹5,200</div><button class="product-btn" type="button">View piece</button></article>
					<article class="product-card"><div class="product-image"><img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/products/xivo-denim-look.png" alt="XIVO denim look"></div><div class="product-name">Wide Leg Denim</div><div class="product-price">₹9,800</div><button class="product-btn" type="button">View piece</button></article>
					<article class="product-card"><div class="product-image"><img src="https://xivo-fashion-assets-vishalsharmat15.s3.us-east-1.amazonaws.com/products/xivo-black-look.png" alt="XIVO black look"></div><div class="product-name">After Dark Trouser</div><div class="product-price">₹12,500</div><button class="product-btn" type="button">View piece</button></article>
				</div>
			</div>
		</section>

		<section class="register-band" id="register">
			<div class="registration-wrapper">
				<form class="registration-form" action="api/register" method="post">
					<div class="brand-section"><div class="subtitle">Private access</div><h1>Join XIVO</h1><div class="divider"></div><p class="tagline">Register for collection releases and studio notes.</p></div>
					<div class="form-group"><label for="Name">Full Name</label><input type="text" id="Name" name="Name" placeholder="Enter your full name" required></div>
					<div class="form-group"><label for="mobile">Mobile Number</label><input type="text" id="mobile" name="mobile" placeholder="Enter mobile number" required></div>
					<div class="form-group"><label for="email">Email Address</label><input type="email" id="email" name="email" placeholder="Enter email address" required></div>
					<div class="form-group"><label for="psw">Password</label><input type="password" id="psw" name="psw" placeholder="Enter password" required></div>
					<div class="form-group"><label for="psw-repeat">Confirm Password</label><input type="password" id="psw-repeat" name="psw-repeat" placeholder="Repeat password" required></div>
					<div class="form-divider"></div>
					<p class="terms-text">By creating an account, you agree to our <a href="#">Terms &amp; Privacy Policy</a>.</p>
					<button type="submit" class="register-btn">Register</button>
					<div class="signin-section"><p class="signin-text">Already have an account? <a href="#">Sign in</a>.</p></div>
				</form>
			</div>
		</section>
	</main>

	<footer><div class="footer-content"><div class="footer-links"><a href="#home">Home</a><a href="#collection">Collection</a><a href="#story">Story</a><a href="#register">Register</a></div><p>© XIVO - SEVENTEEN° SATELLITES™</p></div></footer>
</body>
</html>
