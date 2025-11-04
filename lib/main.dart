import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //rotas
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot-password';
  static const String homeRoute = '/home';
  static const String newTransactionRoute = '/new-transaction';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fintrack',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(0, 206, 209, 1),
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
        useMaterial3: false, 
      ),
      //fim das rotas
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        homeRoute: (context) => const HomePage(), 
        newTransactionRoute: (context) => const NewTransactionPage(),
      },
    );
  }
}

InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black54),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  );
}

// TELA LOGIN
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              const SizedBox(height: 135),
              Center(
                child: Text(
                  'FinTrack',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 65),

              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),

              //email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              //senha
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration('Senha'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              //entrar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context, 
                      MyApp.homeRoute, 
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //cadastro
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyApp.registerRoute); 
                  },
                  child: const Text(
                    'Criar uma nova conta (Cadastre-se)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              //esqueceu sua senha
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyApp.forgotPasswordRoute);
                  },
                  child: const Text(
                    'Esqueceu sua senha?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TELA CADASTRO
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black), 
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 150), 
              const Text(
                'Cadastre-se',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              //email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              //senha
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration('Senha'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              TextFormField(
                obscureText: true,
                decoration: _inputDecoration('Confirmar Senha'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              //cadastrar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                    ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Simulando Cadastro Concluído!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //já tem cadastro
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: const Text(
                    'Já tem uma conta? Voltar para o Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TELA ESQUECEU SENHA
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      appBar: AppBar(
        //flecha pra voltar
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 150),
              const Text(
                'Recuperar Senha',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Para redefinir sua senha, digite o e-mail cadastrado abaixo. Enviaremos um link de recuperação.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),

              //email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              //recuperar senha
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Link de recuperação enviado (simulação).')),
                    );
                    Navigator.pop(context); 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Recuperar Senha',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //logar
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: const Text(
                    'Lembrou da senha? Fazer Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TELA PRINCIPAL
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //transações
  final List<Map<String, dynamic>> transactions = const [
    {'description': 'Salário Mensal', 'value': 4500.00, 'date': '21/10/2025', 'isExpense': false},
    {'description': 'Conta de Luz', 'value': 150.50, 'date': '20/10/2025', 'isExpense': true},
    {'description': 'Supermercado', 'value': 320.99, 'date': '20/10/2025', 'isExpense': true},
    {'description': 'Venda de Item', 'value': 250.00, 'date': '19/10/2025', 'isExpense': false},
  ];

  double get currentBalance {
    return transactions.fold(0.0, (sum, item) => sum + (item['isExpense'] ? -item['value'] : item['value']));
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Sair da Conta'),
          content: const Text('Tem certeza que deseja sair?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar', style: TextStyle(color: Colors.black54)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MyApp.loginRoute,
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text('Sair', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> groupedTransactions = {};
    for (var transaction in transactions) {
      final date = transaction['date'] as String;
      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }
      groupedTransactions[date]!.add(transaction);
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),

      body: Column(
        children: [
          //cabeçalho superior
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'FinTrack',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showLogoutDialog(context),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          //conteúdo inferior
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //total do saldo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Saldo Atual:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          Text(
                            'R\$ ${currentBalance.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: currentBalance >= 0 ? Colors.green[700] : Colors.red[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //lista de transações
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 16.0),
                    children: groupedTransactions.entries.map((entry) {
                      final date = entry.key;
                      final transactionsForDate = entry.value;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 6.0, top: 10.0),
                            child: Text(
                              'Data: $date',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          ...transactionsForDate.map((transaction) {
                            final isExpense = transaction['isExpense'] as bool;

                            return Card(
                              margin: const EdgeInsets.only(bottom: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              child: ListTile(
                                leading: Icon(
                                  isExpense ? Icons.arrow_downward : Icons.arrow_upward,
                                  color: isExpense ? Colors.red : Colors.green,
                                ),
                                title: Text(transaction['description'].toString()),
                                trailing: Text(
                                  'R\$ ${isExpense ? '-' : ''}${transaction['value'].toStringAsFixed(2).replaceAll('.', ',')}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isExpense ? Colors.red : Colors.green,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      //botão '+'
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyApp.newTransactionRoute);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Color.fromRGBO(0, 206, 209, 1)),
      ),
    );
  }
}

// TELA NOVA TRANSAÇÃO
class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

enum TransactionType { entrada, saida }

class _NewTransactionPageState extends State<NewTransactionPage> {
  TransactionType _selectedType = TransactionType.saida; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      appBar: AppBar(
        //flecha pra voltar
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Nova Transação',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //descrição
              const SizedBox(height: 20),
              TextFormField(
                decoration: _inputDecoration('Descrição da Transação'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              //valor
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: _inputDecoration('Valor (R\$)'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              const Text(
                'Tipo de Transação:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),

              //botão entrada/saída
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedType = TransactionType.entrada;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _selectedType == TransactionType.entrada ? Colors.green.shade100 : Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(
                          'Entrada',
                          style: TextStyle(
                            color: _selectedType == TransactionType.entrada ? Colors.green.shade800 : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _selectedType = TransactionType.saida;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: _selectedType == TransactionType.saida ? Colors.red.shade100 : Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(
                          'Saída',
                          style: TextStyle(
                            color: _selectedType == TransactionType.saida ? Colors.red.shade800 : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              //salvar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                    ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Simulando Transação Salva!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Salvar Transação',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}