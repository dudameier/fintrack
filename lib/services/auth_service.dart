import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 1. LOGIN (Entrar)
  Future<User?> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String message = 'Erro de Login desconhecido.';
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        message = 'E-mail ou senha inválidos.';
      } else if (e.code == 'invalid-email') {
        message = 'O formato do e-mail é inválido.';
      }
      throw message; 
    }
  }

  // 2. CADASTRO (Criar Conta)
  Future<User?> register({required String email, required String password}) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String message = 'Erro ao cadastrar.';
      if (e.code == 'weak-password') {
        message = 'A senha deve ter pelo menos 6 caracteres.';
      } else if (e.code == 'email-already-in-use') {
        message = 'Este e-mail já está cadastrado.';
      }
      throw message;
    }
  }

  // 3. RECUPERAÇÃO DE SENHA (Esqueceu a senha)
  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      String message = 'Erro ao enviar e-mail de recuperação. Verifique o e-mail digitado.';
      if (e.code == 'user-not-found') {
        message = 'Nenhum usuário encontrado para este e-mail.';
      }
      throw message;
    }
  }
  
  // 4. SAIR DA CONTA (Logout)
  Future<void> signOut() async {
    await _auth.signOut();
  }
}