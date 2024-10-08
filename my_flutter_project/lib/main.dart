import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    // Inicializar o Supabase com sua URL e Chave API
      await Supabase.initialize(
          url: 'https://nvmwozrshsbyzfkfkofm.supabase.co',  // Substitua pela URL do seu projeto Supabase
              anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im52bXdvenJzaHNieXpma2Zrb2ZtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjgzOTcyNjYsImV4cCI6MjA0Mzk3MzI2Nn0.E476pOmGtfttPGHZxB4g_DCPyeKO2-qZrxN-TQewm4Y',  // Substitua pela chave Anon Key do seu projeto Supabase
                );

                  runApp(MyApp());
                  }

                  class MyApp extends StatelessWidget {
                    @override
                      Widget build(BuildContext context) {
                          return MaterialApp(
                                title: 'Supabase Flutter App',
                                      theme: ThemeData(
                                              primarySwatch: Colors.blue,
                                                    ),
                                                          home: AuthPage(),
                                                              );
                                                                }
                                                                }
class AuthPage extends StatefulWidget {
    @override
      _AuthPageState createState() => _AuthPageState();
      }

      class _AuthPageState extends State<AuthPage> {
        final _emailController = TextEditingController();
          final _passwordController = TextEditingController();

            Future<void> _signIn() async {
                try {
                      // Tentativa de login usando Supabase
                            final response = await Supabase.instance.client.auth.signIn(
                                    email: _emailController.text,
                                            password: _passwordController.text,
                                                  );

                                                        if (response.error != null) {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(content: Text(response.error!.message)),
                                                                                  );
                                                                                        } else {
                                                                                                // Se o login for bem-sucedido, redireciona para outra página
                                                                                                        Navigator.push(
                                                                                                                  context,
                                                                                                                            MaterialPageRoute(builder: (context) => HomePage()),
                                                                                                                                    );
                                                                                                                                          }
                                                                                                                                              } catch (e) {
                                                                                                                                                    print('Erro ao fazer login: $e');
                                                                                                                                                        }
                                                                                                                                                          }

                                                                                                                                                            @override
                                                                                                                                                              Widget build(BuildContext context) {
                                                                                                                                                                  return Scaffold(
                                                                                                                                                                        appBar: AppBar(
                                                                                                                                                                                title: Text('Login'),
                                                                                                                                                                                      ),
                                                                                                                                                                                            body: Padding(
                                                                                                                                                                                                    padding: const EdgeInsets.all(16.0),
                                                                                                                                                                                                            child: Column(
                                                                                                                                                                                                                      children: [
                                                                                                                                                                                                                                  TextField(
                                                                                                                                                                                                                                                controller: _emailController,
                                                                                                                                                                                                                                                              decoration: InputDecoration(labelText: 'Email'),
                                                                                                                                                                                                                                                                          ),
                                                                                                                                                                                                                                                                                      TextField(
                                                                                                                                                                                                                                                                                                    controller: _passwordController,
                                                                                                                                                                                                                                                                                                                  decoration: InputDecoration(labelText: 'Senha'),
                                                                                                                                                                                                                                                                                                                                obscureText: true,
                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                        SizedBox(height: 20),
                                                                                                                                                                                                                                                                                                                                                                    ElevatedButton(
                                                                                                                                                                                                                                                                                                                                                                                  onPressed: _signIn,
                                                                                                                                                                                                                                                                                                                                                                                                child: Text('Entrar'),
                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                                                                                      ],
                                                                                                                                                                                                                                                                                                                                                                                                                              ),
                                                                                                                                                                                                                                                                                                                                                                                                                                    ),
                                                                                                                                                                                                                                                                                                                                                                                                                                        );
                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                          }
                                                                                                                                                                                                                                                                                                                                                                                                                                          class HomePage extends StatelessWidget {
                                                                                                                                                                                                                                                                                                                                                                                                                                              @override
                                                                                                                                                                                                                                                                                                                                                                                                                                                Widget build(BuildContext context) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                    return Scaffold(
                                                                                                                                                                                                                                                                                                                                                                                                                                                          appBar: AppBar(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                  title: Text('Home'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              body: Center(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      child: Text('Bem-vindo!'),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  }
                                                                                                                                                                                                                                                                                                                                                                                                                                          }
}                     