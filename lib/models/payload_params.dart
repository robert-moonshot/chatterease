class CreateAccountParams {
  String? firstName;
  String? lastName;
  String? emailAddress;
  DateTime? birthdate;
  String? password;
  bool? agreedToTerms;
  String? uid;

  CreateAccountParams(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.birthdate,
      this.uid,
      this.agreedToTerms,
      this.password});
}
