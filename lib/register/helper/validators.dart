class AppValidators {
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha obrigatoria';
    }
    if (value.length <= 6) {
      return 'Senha precisa ter 6 ou mais caracteres';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email obrigatório';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Entre com um email valido';
    }
    return null;
  }
}
