class UserCredential {
  static int? userId;
  static String? emailOrPhone;
  static String? password;
  static String? address;
  static String? token;
  static DateTime? expiryDate;
  static int? status;

  static void reset() {
    userId = null;
    emailOrPhone = null;
    password = null;
    token = null;
    expiryDate = null;
    status = null;
  }
}
