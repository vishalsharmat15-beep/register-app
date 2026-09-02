<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XIV∅ - SEVENTEEN° SATELLITES™</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Garamond', 'Georgia', serif;
            background-color: #ffffff;
            color: #1a1a1a;
            line-height: 1.6;
            letter-spacing: 0.5px;
        }

        /* Header Navigation */
        header {
            background-color: #ffffff;
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand-logo {
            font-size: 28px;
            font-weight: 300;
            letter-spacing: 8px;
            text-decoration: none;
            color: #000;
            transition: opacity 0.3s ease;
        }

        .brand-logo:hover {
            opacity: 0.7;
        }

        .brand-tagline {
            font-size: 10px;
            letter-spacing: 3px;
            text-transform: uppercase;
            font-weight: 300;
            display: block;
            margin-top: 2px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #1a1a1a;
            font-size: 12px;
            letter-spacing: 2px;
            text-transform: uppercase;
            transition: opacity 0.3s ease;
        }

        .nav-links a:hover {
            opacity: 0.6;
        }

        /* Main Container */
        main {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
            background-color: #ffffff;
        }

        .registration-wrapper {
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        .brand-section {
            margin-bottom: 50px;
        }

        .brand-section h1 {
            font-size: 42px;
            font-weight: 300;
            letter-spacing: 6px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .brand-section .subtitle {
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #888;
            font-weight: 300;
            margin-bottom: 5px;
        }

        .divider {
            width: 50px;
            height: 1px;
            background-color: #1a1a1a;
            margin: 25px auto;
        }

        .tagline {
            font-size: 13px;
            letter-spacing: 1px;
            color: #666;
            font-style: italic;
            margin-bottom: 40px;
        }

        /* Form Styling */
        .registration-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 25px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label {
            font-size: 11px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #1a1a1a;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px 0;
            border: none;
            border-bottom: 1px solid #d0d0d0;
            background-color: transparent;
            font-family: 'Garamond', 'Georgia', serif;
            font-size: 14px;
            letter-spacing: 0.3px;
            color: #1a1a1a;
            transition: all 0.3s ease;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder,
        input[type="email"]::placeholder {
            color: #b0b0b0;
            letter-spacing: 0.3px;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-bottom: 1px solid #1a1a1a;
            background-color: #fafafa;
        }

        .form-divider {
            width: 100%;
            height: 1px;
            background-color: #e0e0e0;
            margin: 30px 0;
        }

        /* Terms Text */
        .terms-text {
            font-size: 11px;
            line-height: 1.6;
            margin-bottom: 30px;
            color: #666;
            letter-spacing: 0.3px;
        }

        .terms-text a {
            color: #1a1a1a;
            text-decoration: none;
            border-bottom: 1px solid #1a1a1a;
            transition: opacity 0.3s ease;
        }

        .terms-text a:hover {
            opacity: 0.7;
        }

        /* Button Styling */
        .register-btn {
            width: 100%;
            padding: 14px;
            background-color: #1a1a1a;
            color: #ffffff;
            border: 1px solid #1a1a1a;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.4s ease;
            font-family: 'Garamond', 'Georgia', serif;
            font-weight: 500;
        }

        .register-btn:hover {
            background-color: #ffffff;
            color: #1a1a1a;
        }

        .register-btn:active {
            transform: translateY(1px);
        }

        /* Sign In Section */
        .signin-section {
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #e0e0e0;
        }

        .signin-text {
            font-size: 12px;
            color: #666;
            letter-spacing: 0.3px;
        }

        .signin-text a {
            color: #1a1a1a;
            text-decoration: none;
            border-bottom: 1px solid #1a1a1a;
            transition: opacity 0.3s ease;
        }

        .signin-text a:hover {
            opacity: 0.7;
        }

        /* Success Message */
        .success-message {
            display: none;
            text-align: center;
            padding: 40px 20px;
        }

        .success-message h2 {
            font-size: 32px;
            font-weight: 300;
            letter-spacing: 4px;
            margin-bottom: 15px;
            text-transform: uppercase;
        }

        .success-message p {
            font-size: 13px;
            color: #666;
            letter-spacing: 0.5px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-links {
                gap: 15px;
            }

            .brand-section h1 {
                font-size: 32px;
                letter-spacing: 4px;
            }

            .brand-logo {
                font-size: 22px;
                letter-spacing: 5px;
            }

            label {
                font-size: 10px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                font-size: 13px;
            }
        }

        @media (max-width: 480px) {
            .header-container {
                flex-direction: column;
                gap: 15px;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
                font-size: 10px;
            }

            .brand-section h1 {
                font-size: 28px;
                letter-spacing: 3px;
            }

            .registration-wrapper {
                max-width: 100%;
            }

            .form-group {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Navigation -->
    <header>
        <div class="header-container">
            <div>
                <div class="brand-logo">
                    XIV∅
                    <span class="brand-tagline">SEVENTEEN° SATELLITES™</span>
                </div>
            </div>
            <nav class="nav-links">
                <a href="#">Collections</a>
                <a href="#">About</a>
                <a href="#">Support</a>
            </nav>
        </div>
    </header>

    <!-- Main Registration Section -->
    <main>
        <div class="registration-wrapper">
            <form class="registration-form" action="action_page.php" id="registrationForm">
                <!-- Brand Section -->
                <div class="brand-section">
                    <div class="subtitle">Join Our Community</div>
                    <h1>Welcome</h1>
                    <div class="divider"></div>
                    <p class="tagline">Create your account to access exclusive collections</p>
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
                    <input type="text" id="email" name="email" placeholder="Enter email address" required>
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
                    By creating an account, you agree to our <a href="#">Terms & Privacy Policy</a>
                </p>

                <button type="submit" class="register-btn">Create Account</button>

                <!-- Sign In Section -->
                <div class="signin-section">
                    <p class="signin-text">
                        Already have an account? <a href="#">Sign in</a>
                    </p>
                </div>
            </form>

            <!-- Success Message (Hidden by default) -->
            <div class="success-message" id="successMessage">
                <h2>Thank You</h2>
                <p>Your account has been created successfully.<br>
                Welcome to XIV∅ - SEVENTEEN° SATELLITES™</p>
            </div>
        </div>
    </main>

    <script>
        // Form submission handling (keep your existing functionality)
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            // Perform validation or custom logic here
            // Uncomment the line below if you want to show success message instead of form submission
            // e.preventDefault();
            // document.getElementById('registrationForm').style.display = 'none';
            // document.getElementById('successMessage').style.display = 'block';
        });
    </script>
</body>
</html>
