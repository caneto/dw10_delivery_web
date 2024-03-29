import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import 'login_controller.dart';
import 'widgets/login_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Modular.get<LoginController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => controller.loginStatus,
      (status) {
        switch (status) {
          case LoginStateStatus.initial:
            break;
          case LoginStateStatus.loading:
            showLoader();
            break;
          case LoginStateStatus.success:
            hideLoader();
            Modular.to.navigate('/');
            break;
          case LoginStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenShortestSide = context.screenShortestSide;
    final screenWidth = context.screenWidth;
    return Scaffold(
      backgroundColor: context.colors.black,
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenShortestSide * .5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/lanche.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              width: screenShortestSide * .5,
              padding: EdgeInsets.only(top: context.percentHeight(.10)),
              child: Image.asset('assets/images/logo.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: context.percentWidth(screenWidth < 1300 ? .7 : .3),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FractionallySizedBox(
                          widthFactor: .3,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Login',
                            style: context.textStyles.textTitle,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextformfield(
                          title: 'E-mail',
                          controller: _emailEC,
                          onFieldSubmitted: (_) => _enterButton(),
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('E-mail invalido'),
                          ]),
                          hintText: 'Digite um E-mail valido',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextformfield(
                          title: 'Senha',
                          controller: _passwordEC,
                          onFieldSubmitted: (_) => _enterButton(),
                          obscureText: true,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatório'),
                            Validatorless.min(6, 'Deve conter 6 carecteres'),
                          ]),
                          hintText: 'Digite uma senha valida',                          
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _enterButton,
                            child: const Text('Entrar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _enterButton() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      FocusScope.of(context).unfocus();
      controller.login(_emailEC.text, _passwordEC.text);
    }
  }  
}
