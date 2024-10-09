import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

    Future<void> signInWithEmail(String email, String password) async {
        try {
              final response = await supabase.auth.signInWithPassword(email: email, password: password);
                    if (response.user != null) {
                            print('Login bem-sucedido!');
                                  } else {
                                          print('Erro ao fazer login: ${response.error?.message}');
                                                }
                                                    } catch (e) {
                                                          print('Erro: $e');
                                                              }
                                                                }
                                                                }