class AuthRequestModel {
  String email, password, firstName, lastName, phoneNumber, confPass, dob;

  AuthRequestModel({
    required this.email,
    required this.password,
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber = "",
    this.dob = "",
    this.confPass = "",
  });
}
