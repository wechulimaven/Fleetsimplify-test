// ignore_for_file: constant_identifier_names

class Constants {
  static const firstRun = 'firstRun';
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const expiresIn = 'expiresIn';
  static const sessionName = 'sessionName';
  static const sessionProfilePictureUrl = 'sessionProfilePictureUrl';
  static const deviceId = 'deviceId';
  static const userDetails = 'userDetails';
  static const interests = 'interests';
  static const emailConfirmed = 'emailConfirmed';

  static const String kEmailNullError = 'Please Enter your email';
  static const String kInvalidEmailError = 'Please Enter Valid Email';
  static const String kPassNullError = 'Please Enter your password';
  static const String kShortPassError = 'Password is too short';
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = 'Please Enter your name';
  static const String kPhoneNumberNullError =
      'Please enter your mobile number.';
  static const String kPhoneNumberNotValidError =
      'Please enter a valid mobile number.';
  static const String kAddressNullError = 'Please Enter your address';

  // app flavors
  static String staging = 'staging';
  static String production = 'production';
}

class PaymentOptionConstants {
  static const String PAYNOW = 'Paynow';
  static const String PAYLATER = 'Paylater';
  static const String SPLITPAY = 'Splitpay';
}

class PaymentModesConstants {
  static const String MPESA = 'Mpesa';
  static const String CARD = 'Card';
  static const String CASH = 'Cash';
}

class OrderTypesConstants {
  static const String DINNIN = 'Dinnin';
  static const String TAKEAWAY = 'Takeaway';
}

class OrderStatusConstants {
  static const String ORDERED = 'Ordered';
  static const String ONGOING = 'Ongoing';
  static const String COMPLETED = 'Completed';
  static const String SERVED = 'Served';
  static const String CANCELLED = 'Cancelled';
}
