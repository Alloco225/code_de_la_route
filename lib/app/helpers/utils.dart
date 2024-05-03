// Function to validate email
bool validateEmail(String email) {
  // Regular expression for email validation
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

// Function to validate username
bool validateUsername(String username) {
  // Regular expression for username validation
  // You can customize this regex according to your requirements
  RegExp regex = RegExp(r'^[a-zA-Z0-9_]+$');
  return regex.hasMatch(username);
}

// Function to validate password
bool validatePassword(String password) {
  // Password length must be at least 6 characters
  return password.length >= 6;
}

// Example usage:
void main() {
  // Validation for registration
  String email = "example@email.com";
  String username = "user123";
  String password = "password123";

  if (validateEmail(email) &&
      validateUsername(username) &&
      validatePassword(password)) {
    print("Registration successful!");
  } else {
    print("Invalid input for registration.");
  }

  // Validation for login
  String loginEmail = "example@email.com";
  String loginPassword = "password123";

  if (validateEmail(loginEmail) && validatePassword(loginPassword)) {
    print("Login successful!");
  } else {
    print("Invalid input for login.");
  }
}
