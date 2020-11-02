import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../controllers/sign_up_controller.dart';

import '../../utils/validate_email_adresss.dart';

import '../widgets/button_widget.dart';
import '../widgets/custom_flat_button_widget.dart';
import '../widgets/input_widget.dart';

class SignUpView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  final SignUpController _signUpController = SignUpController();

  void onError(String message) {
    _keyScaffold.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  void onSuccess(String message) {
    _keyScaffold.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  void submitForm(BuildContext context) {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      _signUpController.loading = true;
      _signUpController.handleSignUp().then((value) {
        _signUpController.loading = false;
        onSuccess(value);
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
      }).catchError((value) {
        onError(value);
        _signUpController.loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomFlatButtonWidget(
          title: 'Já tenho um cadastro',
          onTap: () => Navigator.of(context).pop(),
        ),
        key: _keyScaffold,
        body: _body(context: context),
      ),
    );
  }

  Widget _body({BuildContext context}) {
    final Size size = MediaQuery.of(context).size;
    return Observer(
      builder: (context) => Form(
        key: _keyForm,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Hero(
              tag: 'assets/images/logo.png',
              child: Container(
                height: size.height * 0.30,
                padding: const EdgeInsets.all(16),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InputWidget(
              hintText: 'Nome',
              prefixIcon: Icons.person,
              focusNode: _focusNodeName,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (_) {
                if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(_focusNodeEmail);
              },
              onSaved: (value) => _signUpController.userName = value,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.trim().isEmpty) return 'Nome não foi preenchida.';
                return null;
              },
              isLoading: _signUpController.loading,
            ),
            const SizedBox(
              height: 8,
            ),
            InputWidget(
              hintText: 'E-mail',
              prefixIcon: Icons.mail,
              focusNode: _focusNodeEmail,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (_) {
                if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(_focusNodePassword);
              },
              onSaved: (value) => _signUpController.emailAddress = value,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.trim().isEmpty) return 'E-mail não foi preenchido.';
                if (!isEmailValid(value)) return ' E-mail inválido.';
                return null;
              },
              isLoading: _signUpController.loading,
            ),
            const SizedBox(
              height: 8,
            ),
            InputWidget(
              hintText: 'Senha',
              prefixIcon: Icons.https,
              focusNode: _focusNodePassword,
              keyboardType: TextInputType.visiblePassword,
              onFieldSubmitted: (_) => submitForm(context),
              onSaved: (value) => _signUpController.password = value,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value.trim().isEmpty) return 'Senha não foi preenchida.';
                if (value.length < 6) return 'Senha deve conter no minimo 6 caracteres.';
                if (value.length > 14) return 'Senha deve conter no maximo 14 caracteres.';
                return null;
              },
              isLoading: _signUpController.loading,
              obscureText: _signUpController.isObscurePassword,
              onTapObscureText: _signUpController.handleObscurePassword,
            ),
            const SizedBox(
              height: 8,
            ),
            ButtonWidget(
              title: 'Cadastrar',
              isLoading: _signUpController.loading,
              onTap: () => submitForm(context),
            )
          ],
        ),
      ),
    );
  }
}
