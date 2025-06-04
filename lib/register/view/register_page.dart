import 'package:app_agtech_test/register/helper/db_helper.dart';
import 'package:app_agtech_test/register/helper/validators.dart';
import 'package:app_agtech_test/register/model/user_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordControoler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AppValidators appValidators = AppValidators();

  DbHelper db = DbHelper();
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  validator: appValidators.emailValidator,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: passwordControoler,
                  obscureText: visiblePassword,
                  validator: appValidators.passwordValidator,
                  decoration: InputDecoration(
                    label: const Text("Senha"),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visiblePassword = !visiblePassword;
                        });
                      },
                      icon: Icon(visiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          db.inset(
                            UserModel(
                                email: emailController.text,
                                password: passwordControoler.text),
                          );
                        }
                      },
                      child: const Text("Registrar"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await db.getUsers();
                        debugPrint(result.toString());
                      },
                      child: const Text("Ler"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          db.inset(
                            UserModel(
                                email: emailController.text,
                                password: passwordControoler.text),
                          );
                        }
                      },
                      child: const Text("Atualizar"),
                    ),
                  ],
                ),
                // SizedBox(
                //   child: ListView.builder(itemBuilder: itemBuilder),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
