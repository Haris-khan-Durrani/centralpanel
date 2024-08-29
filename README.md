# Checklist Application

![Project](https://api.hariskhandurrani.com/2.jpg)

## Overview

The Checklist Application is a central management panel that connects multiple company free zones into a single unified dashboard. This application leverages Express.js for server-side logic, integrates MySQL for database management, and utilizes session handling for secure user authentication. The application also incorporates real-time features using Socket.IO and provides OTP-based email authentication.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Middleware](#middleware)
  - [Routes](#routes)
  - [Encryption and Decryption](#encryption-and-decryption)
  - [OTP Email Sending](#otp-email-sending)
  - [Database Schema](#database-schema)
  - [Socket.IO Integration](#socketio-integration)
- [Environment Variables](#environment-variables)
- [CORS Configuration](#cors-configuration)
- [Running the Application](#running-the-application)
- [License](#license)

## Features

- Centralized management for multiple free zones.
- User session management with MySQL session store.
- Secure OTP-based authentication via email.
- File uploads and dynamic content rendering.
- Integration with external services using Socket.IO and Axios.
- Domain-based configuration management.

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/checklist-app.git
    cd checklist-app
    ```

2. Install the required dependencies:
    ```sh
    npm install
    ```

3. Set up the MySQL database and configure the `.env` file with your database credentials:
    ```env
    DB_HOST=your_database_host
    DB_USER=your_database_user
    DB_PASSWORD=your_database_password
    DB_NAME=your_database_name
    PORT=1002
    ```

4. Run the application:
    ```sh
    npm start
    ```

## Usage

### Middleware

1. **Domain Check Middleware**: Fetches the configuration for the current domain and loads it into the session and request objects.
    ```javascript
    const domainCheck = async (req, res, next) => {
        // Middleware logic here
    };
    app.use(domainCheck);
    ```

2. **Session Management**: Sessions are stored using `express-mysql-session`.
    ```javascript
    const sessionStore = new MySQLStore({ expiration: 86400000 }, db);
    app.use(session({
        store: sessionStore,
        secret: 'your_secret_key',
        resave: true,
        saveUninitialized: true,
    }));
    ```

### Routes

- **Login**: Handles user login and OTP generation.
    ```javascript
    app.post('/login', async (req, res) => {
        // Login logic here
    });
    ```

- **Verify OTP**: Validates the OTP entered by the user.
    ```javascript
    app.post('/verifyOTP', (req, res) => {
        // OTP verification logic here
    });
    ```

- **Dashboard**: Main dashboard displaying the connected free zones and company files.
    ```javascript
    app.get('/dashboard/:ctaas', sessionCheck, async (req, res) => {
        // Dashboard logic here
    });
    ```

### Encryption and Decryption

- **Encrypt**: Encrypts sensitive data using AES-256-CBC.
    ```javascript
    function encrypt(text, secretKey) {
        const cipher = crypto.createCipher('aes-256-cbc', secretKey);
        let encrypted = cipher.update(text, 'utf8', 'hex');
        encrypted += cipher.final('hex');
        return encrypted;
    }
    ```

- **Decrypt**: Decrypts data encrypted with AES-256-CBC.
    ```javascript
    function decrypt(text, secretKey) {
        const decipher = crypto.createDecipher('aes-256-cbc', secretKey);
        let decrypted = decipher.update(text, 'hex', 'utf8');
        decrypted += decipher.final('utf8');
        return decrypted;
    }
    ```

### OTP Email Sending

- **OTP Generation**: Generates a 6-digit OTP.
    ```javascript
    function generateOTP() {
        let otp = '';
        for (let i = 0; i < 6; i++) {
            otp += Math.floor(Math.random() * 10);
        }
        return otp;
    }
    ```

- **Sending OTP via Email**: Sends the generated OTP to the user's email using `nodemailer`.
    ```javascript
    async function sendOTPEmail(email, otp, companyName, companyAddress) {
        const mailOptions = {
            from: `${companyName} <no-reply@yourdomain.com>`,
            to: email,
            subject: `${companyName} Login OTP`,
            html: `<p>Your OTP is ${otp}</p>`
        };
        await transporter.sendMail(mailOptions);
    }
    ```

### Database Schema

- **Domain Configuration Table**: Stores domain-specific configurations.
    ```sql
    CREATE TABLE domain_config (
        id INT AUTO_INCREMENT PRIMARY KEY,
        domain VARCHAR(255) UNIQUE,
        location_id INT,
        logo_url VARCHAR(255),
        background VARCHAR(255),
        -- Add other configuration fields
    );
    ```

- **Users Table**: Stores user credentials and roles.
    ```sql
    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255),
        email VARCHAR(255) UNIQUE,
        password VARCHAR(255),
        role ENUM('admin', 'Freezone', 'Central'),
        status ENUM('active', 'inactive')
    );
    ```

### Socket.IO Integration

- **Real-time Communication**: Socket.IO is used for real-time communication with the central server.
    ```javascript
    const socket = io.connect('https://run.crmsoftware.ae/');
    socket.on('connect', () => {
        console.log('Connected to CRM software');
    });
    ```

## Environment Variables

Set up the following environment variables in your `.env` file:

```env
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
PORT=1002
