<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XIVO∅ - Premium Fashion Brand</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header Navigation -->
    <header>
        <div class="header-container">
            <div class="brand-logo">
                XIVO∅
                <span class="brand-tagline">Luxury Fashion</span>
            </div>
            <nav class="nav-links">
                <a href="#" data-page="home">Home</a>
                <a href="#" data-page="shop">Shop</a>
                <a href="#" data-page="about">About</a>
                <a href="#" data-page="register">Register</a>
                <a href="#" data-page="signin">Sign In</a>
            </nav>
        </div>
    </header>

    <!-- Main Content Area -->
    <main>
        <!-- ====== HOME PAGE ====== -->
        <div id="home" class="page active">
            <div class="hero">
                <div class="hero-content">
                    <h1>XIVO∅</h1>
                    <p>Discover Luxury, Define Style</p>
                    <button class="hero-button" onclick="showPage('shop'); return false;">Explore Collection</button>
                </div>
            </div>
        </div>

        <!-- ====== SHOP PAGE ====== -->
        <div id="shop" class="page">
            <section class="shop-section">
                <div class="container">
                    <div class="shop-header">
                        <h1>Our Collections</h1>
                        <p>Handcrafted luxury pieces for the discerning individual</p>
                    </div>

                    <div class="products-grid">
                        <!-- Product 1 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Silk+Dress" alt="Silk Evening Dress">
                            </div>
                            <div class="product-name">Silk Evening Dress</div>
                            <div class="product-price">₹45,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>

                        <!-- Product 2 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Leather+Jacket" alt="Premium Leather Jacket">
                            </div>
                            <div class="product-name">Premium Leather Jacket</div>
                            <div class="product-price">₹65,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>

                        <!-- Product 3 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Luxury+Handbag" alt="Luxury Handbag">
                            </div>
                            <div class="product-name">Luxury Handbag</div>
                            <div class="product-price">₹38,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>

                        <!-- Product 4 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Designer+Heels" alt="Designer Heels">
                            </div>
                            <div class="product-name">Designer Heels</div>
                            <div class="product-price">₹22,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>

                        <!-- Product 5 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Luxury+Watch" alt="Luxury Watch">
                            </div>
                            <div class="product-name">Luxury Watch</div>
                            <div class="product-price">₹95,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>

                        <!-- Product 6 -->
                        <div class="product-card">
                            <div class="product-image">
                                <img src="https://via.placeholder.com/280x350/f5f5f5/999?text=Cashmere+Scarf" alt="Cashmere Scarf">
                            </div>
                            <div class="product-name">Cashmere Scarf</div>
                            <div class="product-price">₹18,000</div>
                            <button class="product-btn" onclick="alert('Add to cart functionality coming soon')">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- ====== ABOUT PAGE ====== -->
        <div id="about" class="page">
            <section class="about-section">
                <div class="about-header">
                    <h1>About XIVO∅</h1>
                </div>
                <div class="about-content">
                    <p>
                        XIVO∅ represents the epitome of luxury fashion, where timeless elegance meets contemporary design. 
                        Our brand is built on the foundation of quality, craftsmanship, and an unwavering commitment to excellence.
                    </p>
                    <p>
                        Each piece in our collection is meticulously curated and crafted by master artisans who bring decades 
                        of experience to their work. We believe that luxury is not merely about price, but about the story, 
                        heritage, and passion that goes into creating something truly exceptional.
                    </p>
                    <p>
                        From the finest materials sourced globally to the intricate details of production, every element is 
                        carefully considered. Our vision is to empower individuals to express their unique style while maintaining 
                        the highest standards of quality and sophistication.
                    </p>
                    <p>
                        Join us on a journey where luxury transcends materialism, and becomes a lifestyle—a celebration of 
                        individuality, taste, and the art of living beautifully.
                    </p>
                </div>
            </section>
        </div>

        <!-- ====== REGISTER PAGE ====== -->
        <div id="register" class="page">
            <div class="registration-wrapper">
                <form class="registration-form" action="action_page.php" id="registrationForm">
                    <!-- Brand Section -->
                    <div class="brand-section">
                        <div class="subtitle">Join Our Community</div>
                        <h1>Create Account</h1>
                        <div class="divider"></div>
                        <p class="tagline">Access exclusive collections and early releases</p>
                    </div>

                    <!-- Form Fields -->
                    <div class="form-group">
                        <label for="Name">Full Name</label>
                        <input type="text" id="Name" name="Name" placeholder="Enter your full name" required>
                    </div>

                    <div class="form-group">
                        <label for="mobile">Mobile Number</label>
                        <input type="text" id="mobile" name="mobile" placeholder="Enter mobile number" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="Enter email address" required>
                    </div>

                    <div class="form-group">
                        <label for="psw">Password</label>
                        <input type="password" id="psw" name="psw" placeholder="Enter password" required>
                    </div>

                    <div class="form-group">
                        <label for="psw-repeat">Confirm Password</label>
                        <input type="password" id="psw-repeat" name="psw-repeat" placeholder="Repeat password" required>
                    </div>

                    <div class="form-divider"></div>

                    <p class="terms-text">
                        By creating an account, you agree to our <a href="#" onclick="return false;">Terms & Privacy Policy</a>
                    </p>

                    <button type="submit" class="register-btn">Create Account</button>

                    <!-- Sign In Section -->
                    <div class="signin-section">
                        <p class="signin-text">
                            Already have an account? <a href="#" data-page="signin" onclick="showPage('signin'); return false;">Sign in</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>

        <!-- ====== SIGN IN PAGE ====== -->
        <div id="signin" class="page">
            <div class="registration-wrapper">
                <form class="registration-form" action="action_page.php" id="signinForm">
                    <!-- Brand Section -->
                    <div class="brand-section">
                        <div class="subtitle">Welcome Back</div>
                        <h1>Sign In</h1>
                        <div class="divider"></div>
                        <p class="tagline">Access your XIVO∅ account</p>
                    </div>

                    <!-- Form Fields -->
                    <div class="form-group">
                        <label for="signin-email">Email Address</label>
                        <input type="email" id="signin-email" name="email" placeholder="Enter email address" required>
                    </div>

                    <div class="form-group">
                        <label for="signin-psw">Password</label>
                        <input type="password" id="signin-psw" name="password" placeholder="Enter password" required>
                    </div>

                    <div class="form-divider"></div>

                    <button type="submit" class="signin-btn">Sign In</button>

                    <!-- Register Section -->
                    <div class="signin-section">
                        <p class="signin-text">
                            Don't have an account? <a href="#" onclick="showPage('register'); return false;">Create one now</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-links">
                <a href="#" onclick="showPage('home'); return false;">Home</a>
                <a href="#" onclick="showPage('shop'); return false;">Shop</a>
                <a href="#" onclick="showPage('about'); return false;">About</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Contact</a>
            </div>
            <p>&copy; 2024 XIVO∅ - Luxury Fashion. All rights reserved.</p>
            <p>Crafted with excellence | Made for the discerning</p>
        </div>
    </footer>

    <script src="js/navigation.js"></script>
    <script>
        // Form submission handling
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add your backend integration here
            alert('Registration submitted! (Backend integration coming soon)');
            // this.submit(); // Uncomment to actually submit to action_page.php
        });

        document.getElementById('signinForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Add your backend integration here
            alert('Sign in submitted! (Backend integration coming soon)');
            // this.submit(); // Uncomment to actually submit to action_page.php
        });
    </script>
</body>
</html>
