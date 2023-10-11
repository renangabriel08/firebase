class Validator {
  static validarDados(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  static validarConfirmarSenha(String senha, String confirmarSenha) {
    if (confirmarSenha.isEmpty) {
      return 'Campo obrigatório';
    }
    if(senha != confirmarSenha) {
      return "As senhas precisam ser iguais";
    }
    return null;
  }
}