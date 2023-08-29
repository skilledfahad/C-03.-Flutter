extension ValidationUtils on String {

  bool get isValidName{
    final nameRegExp = RegExp(r'^[A-Za-z]+(?: [A-Za-z._-]+)?$');
    return nameRegExp.hasMatch(this);
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return isNotNull == true && emailRegExp.hasMatch(this);
  }

  bool get isValidPassword{
    final passwordRegExp =
    RegExp(r'^(?=.*?[0-9]).{0,30}'); //(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[!@#><*~])
    return isNotNull == true && passwordRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this != null;
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r'^(\+?[0-9]{1,3}\s?)?0([0-9]{10})$');
    return phoneRegExp.hasMatch(this);
  }
}