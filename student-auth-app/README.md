# Student Auth App

A complete Angular student authentication application with login and signup pages.

## Features

- **Login Page**: Email and password authentication with validation
- **Signup Page**: Complete registration form with validation and password strength indicator
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Form Validation**: Real-time validation with error messages
- **Password Strength Checker**: Visual feedback on password strength during signup
- **Modern UI**: Clean and professional design with smooth animations

## Project Structure

```
student-auth-app/
├── src/
│   ├── app/
│   │   ├── components/
│   │   │   ├── login/
│   │   │   │   ├── login.component.ts
│   │   │   │   ├── login.component.html
│   │   │   │   └── login.component.css
│   │   │   └── signup/
│   │   │       ├── signup.component.ts
│   │   │       ├── signup.component.html
│   │   │       └── signup.component.css
│   │   ├── models/
│   │   │   └── student.model.ts
│   │   ├── services/
│   │   │   └── auth.service.ts
│   │   ├── app.component.ts
│   │   ├── app.component.html
│   │   ├── app.component.css
│   │   └── app.routes.ts
│   ├── assets/
│   ├── index.html
│   ├── main.ts
│   └── styles.css
├── angular.json
├── tsconfig.json
├── package.json
└── README.md
```

## Installation

1. Install dependencies:
```bash
npm install
```

2. Start the development server:
```bash
npm start
```

3. Navigate to `http://localhost:4200/` in your browser

## Usage

- **Login**: Use the login page to authenticate with email and password
- **Sign Up**: Create a new account with the signup form
- Form validation is performed in real-time
- Password strength is displayed during signup

## Technologies Used

- Angular 17
- TypeScript
- Reactive Forms
- Angular Router
- CSS3

## Components

### Login Component
- Email validation
- Password input with visibility toggle
- Form validation and error messages
- Loading state during submission

### Signup Component
- Multi-field registration form (First Name, Last Name, Email, Phone)
- Password strength indicator
- Password confirmation validation
- Terms and conditions checkbox
- Real-time form validation

## Services

### AuthService
Handles authentication logic including:
- Login
- Signup
- Logout
- Authentication status checking

## Future Enhancements

- Backend API integration
- JWT token management
- Password recovery functionality
- Email verification
- Two-factor authentication
- Social login integration

## License

MIT
