import 'package:flutter/material.dart';
import 'package:formulario/components/custom_textfiel.dart';
import 'package:formulario/src/models/user_model.dart';
import 'package:string_validator/string_validator.dart' as validator;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();
  var user = UserModel();

  //validação do password e confirmPasswords
  var passwordCache = '';
  var passwordCacheConfirm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
      ),
      // agora meus texformFiel herdam de form
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomTextField(
                  label: 'Name',
                  hint: 'Type your name...',
                  icon: Icons.person,
                  onSaved: (text) => user = user.copyWith(
                    name: text,
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    if (text.length < 5) {
                      return 'Fiel name needs more 5 characters.(Has ${text.length})';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: 'Email',
                  hint: 'Type your email...',
                  icon: Icons.mail,
                  onSaved: (text) => user = user.copyWith(
                    email: text,
                  ),
                  validator: (text) {
                    // caso o nome for nulo ou vazio dispara a mensagem
                    if (text == null || text.isEmpty) {
                      return 'This filed can\'t be empty';
                    }
                    if (!validator.isEmail(text)) {
                      return 'Value must be email type';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: 'Password',
                  hint: 'Type your password...',
                  icon: Icons.lock,
                  onSaved: (text) => user = user.copyWith(
                    password: text,
                  ),
                  obscureText: true,
                  onChange: (text) => passwordCache = text,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This filed can\'t be empty';
                    }
                    if (passwordCacheConfirm != passwordCache) {
                      return 'Password don\'t match';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: 'Confirm password',
                  hint: 'Type your confirm password...',
                  icon: Icons.vpn_key_rounded,
                  onSaved: (text) => user = user.copyWith(
                    password: text,
                  ),
                  obscureText: true,
                  onChange: (text) => passwordCacheConfirm = text,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'This filed can\'t be empty';
                    }
                    if (passwordCacheConfirm != passwordCache) {
                      return 'Password don\'t match';
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                // atualizar meu context, e nao pega o context geral so nesse widget
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // para nao fica atualizando o context assim seria outra fomar de fazer a validaçao com uma key colocando um  Globalkey
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        print('''
                              Formulario
                         name:${user.name}
                         email:${user.email}
                         password:${user.password}                         
                         ''');
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      formkey.currentState?.reset();
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
