import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  //fazendo componentização, para colocar cada um textFild
  final String label;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChange;

  const CustomTextField({
    Key? key,
    required this.label,
    this.icon,
    this.hint,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ajuda na validaçoões e tem mais coisas que o textField
    return TextFormField(
      // reatividade
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // como sao todos TextFormField entao componetizei e por isso que so chama a funcao
      // validação simples
      validator: validator,
      onChanged: onChange,
      obscureText: obscureText,

      onSaved: onSaved,
      // configurar o desenho(interfaces) do textField bordas,tamanho,cor
      decoration: InputDecoration(
        labelText: label,
        // concatenizar com a variavel label $label
        hintText: hint,
        border: const OutlineInputBorder(),
        prefixIcon: icon == null ? null : Icon(icon),

        // nao consegue clicar no formulario da fazer regra de negocio
        //enabled: false,
      ),
    );
  }
}
