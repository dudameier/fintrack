import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  // Acessa a subcoleção 'transactions' do usuário logado
  CollectionReference get transactionCollection {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw 'Usuário não autenticado.';
    }
    // users -> [UID do Usuário] -> transactions
    return _db.collection('users').doc(uid).collection('transactions');
  }

  // 1. READ: Obtém todas as transações em tempo real
  Stream<QuerySnapshot> getTransactionsStream() {
    return transactionCollection.orderBy('date', descending: true).snapshots();
  }

  // 2. CREATE: Adiciona nova transação ao Firestore
  Future<void> addTransaction({
    required String description,
    required double value,
    required bool isExpense, 
  }) async {
    await transactionCollection.add({
      'description': description,
      'value': value,
      'isExpense': isExpense,
      'date': Timestamp.now(), 
    });
  }
}