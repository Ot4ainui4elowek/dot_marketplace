abstract class LoginFormErrors {
  static const requiredErrorMeassge = 'Это поле должно быть заполнено!';
  static String getMinLengthMessage(int length) =>
      'В строке должно быть $length символов!';
  static const phoneNumberErrorMessage =
      'Номер телефона должен состоять из цифр!';
}
