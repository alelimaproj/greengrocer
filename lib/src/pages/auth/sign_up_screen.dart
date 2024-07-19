import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greengrocher/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocher/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpf_formatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phone_formatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    // captura o tamanho da tela
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,

      // usa o tamanho da tela do dispositivo
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,

          //stack sobrepoe tela
          child: Stack(
            children: [
              Column(
                children: [
                  // cabeçalho
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  // formulário
                  Container(
                    // espaçamento interno
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),

                    // formulaŕio
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.email,
                          label: 'E-mail',
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Password',
                          isSecret: true,
                        ),
                        CustomTextField(
                          icon: Icons.person,
                          label: 'Name',
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Phone',
                          inputFormatters: [phone_formatter],
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatters: [cpf_formatter],
                        ),

                        // botão
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            onPressed: null,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
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
