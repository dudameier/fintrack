import 'package:flutter/material.dart';

void main() {
  // Inicializa o aplicativo Flutter
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define as rotas nomeadas para a navegação
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgot-password';
  static const String homeRoute = '/home'; // Para a tela principal
  static const String newTransactionRoute = '/new-transaction'; // Para a tela de nova transação

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Controle de Gastos',
      // Define o tema principal com a cor de fundo vibrante
      theme: ThemeData(
        // Cor de fundo ciano/turquesa vibrante, usada como padrão.
        scaffoldBackgroundColor: const Color.fromRGBO(0, 206, 209, 1),
        // Desativa a sombra padrão para um visual mais clean
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
        useMaterial3: false, 
      ),
      // Define as rotas do aplicativo
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        forgotPasswordRoute: (context) => const ForgotPasswordPage(),
        homeRoute: (context) => const HomePage(), 
        newTransactionRoute: (context) => const NewTransactionPage(), // TELA DE NOVA TRANSAÇÃO ATIVA
      },
    );
  }
}

// FUNÇÃO UTILITÁRIA DE ESTILOS (Campo de texto)
InputDecoration _inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black54),
    filled: true,
    fillColor: Colors.white, // Fundo branco do campo
    // Borda arredondada e sem linha visível
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide.none,
    ),
    // Borda preta levemente mais grossa quando focado
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  );
}

// ----------------------------------------------------
// TELA LOGIN
// ----------------------------------------------------
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
              // 1. Nome do App
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


              // Título "Login"
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25),

              // 2. Campo - E-mail
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // 3. Campo Senha
              TextFormField(
                obscureText: true,
                decoration: _inputDecoration('Senha'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              // 4. Botão de entrar (Principal)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // NAVEGAÇÃO PARA A TELA PRINCIPAL
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

              // 5. Botão de cadastro
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

              // 6. Botão de esquecimento de senha
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

// ----------------------------------------------------
// TELA CADASTRO
// ----------------------------------------------------
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

              // 2. Campo - E-mail
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // 3. Campo Senha
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

              // 4. Botão de cadastrar
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

              // 5. Descrição perguntando se já tem cadastro, que leva à aba de login
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

// ----------------------------------------------------
// TELA ESQUECEU SENHA
// ----------------------------------------------------
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      appBar: AppBar(
        // Inclui a flecha para voltar (4. flecha para voltar)
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
              
              // 5. Descrição orientando para inserir email
              const Text(
                'Para redefinir sua senha, digite o e-mail cadastrado abaixo. Enviaremos um link de recuperação.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),

              // 1. Campo Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('E-mail'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

              // 2. Botão de recuperar senha
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

              // 3. Escrita de logar se lembrou da senha
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


// ----------------------------------------------------
// TELA PRINCIPAL
// ----------------------------------------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Lista de transações de exemplo
  final List<Map<String, dynamic>> transactions = const [
    {'description': 'Salário Mensal', 'value': 4500.00, 'date': '20/10/2025', 'isExpense': false},
    {'description': 'Conta de Luz', 'value': 150.50, 'date': '21/10/2025', 'isExpense': true},
    {'description': 'Supermercado', 'value': 320.99, 'date': '21/10/2025', 'isExpense': true},
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
                // Redireciona para a tela de Login e remove todas as rotas anteriores
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
    // CORRIGIDO: Usando a cor consistente das telas de autenticação
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),

      body: Column(
        children: [
          // ==========================
          // 🔹 CABEÇALHO SUPERIOR (Usando a cor principal)
          // ==========================
          Container(
            width: double.infinity,
            color: const Color.fromRGBO(0, 206, 209, 1), 
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0), 

                // 🔹 Linha superior com título e ícone
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'FinTrack',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showLogoutDialog(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: Colors.black),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),

          // ==========================
          // 🔹 CONTEÚDO INFERIOR (Usando a cor principal)
          // ==========================
          Expanded(
            child: Container(
              // CORRIGIDO: Usando a cor principal para consistência
              color: const Color.fromRGBO(0, 206, 209, 1), 
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // 🔹 Total do saldo atual
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
                                color: Colors.black54,
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

                  const SizedBox(height: 20),

                  // 🔹 Título de transações
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Text(
                      'Transações Recentes:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // 🔹 Lista de transações
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap e physics removidos para funcionar corretamente dentro do Expanded
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
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
                            subtitle: Text('Data: ${transaction['date']}'),
                            trailing: Text(
                              'R\$ ${isExpense ? '-' : ''}${transaction['value'].toStringAsFixed(2).replaceAll('.', ',')}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isExpense ? Colors.red : Colors.green,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 🔹 Botão flutuante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyApp.newTransactionRoute); 
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Color(0xFF00CED1)),
      ),
    );
  }
}


// ----------------------------------------------------
// TELA NOVA TRANSAÇÃO (Implementação conforme o fluxo)
// ----------------------------------------------------
class NewTransactionPage extends StatefulWidget {
  const NewTransactionPage({super.key});

  @override
  State<NewTransactionPage> createState() => _NewTransactionPageState();
}

// Enum para representar o tipo de transação
enum TransactionType { entrada, saida }

class _NewTransactionPageState extends State<NewTransactionPage> {
  // Estado para controlar o tipo de transação selecionado (4. e 5.)
  TransactionType _selectedType = TransactionType.saida; 

  @override
  Widget build(BuildContext context) {
    // CORRIGIDO: Esta tela já usava a cor correta, mas mantive o ajuste explícito para garantir
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 206, 209, 1),
      appBar: AppBar(
        // 7. Flecha canto superior esquerdo para voltar a tela principal
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Nova Transação', // 1. Título
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
              // 2. Campo Descrição
              const SizedBox(height: 20),
              TextFormField(
                decoration: _inputDecoration('Descrição da Transação'),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

              // 3. Campo Valor
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

              // 4. Campo Tipo Entrada / 5. Campo Tipo Saída (Usando botões segmentados)
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

              // 6. Botão Salvar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Simula a adição da transação e volta para a Home
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
