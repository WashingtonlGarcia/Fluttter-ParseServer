import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../controllers/register_user_controller.dart';

import '../../data/enums/user_type.dart';

import '../../utils/validate_email_adresss.dart';

import '../widgets/custom_flat_button_widget.dart';
import '../widgets/dropdown_button_form_field_widget.dart';
import '../widgets/input_widget.dart';

class CadastroUserView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodeUserType = FocusNode();
  final FocusNode _focusNodeInstitution = FocusNode();

  final RegisterUserController _registerUserController = RegisterUserController();

  void onError(String message) {
    _keyScaffold.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  void submitForm(BuildContext context) {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      _registerUserController.loading = true;
      _registerUserController.handleRegisterUser().then((value) {
        _registerUserController.loading = false;
        Navigator.of(context).pop();
      }).catchError((value) {
        onError(value);
        _registerUserController.loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool value = await showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16,bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Aviso',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Você deseja salvar os dados do formulário.'),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(textColor: Theme.of(context).accentColor, onPressed: () => Navigator.of(context).pop(true), child: Text('Nao')),
                      FlatButton(
                          textColor: Theme.of(context).accentColor,
                          onPressed: () {
                            submitForm(context);
                            Navigator.of(context).pop(false);
                          },
                          child: Text('Sim')),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
        if (value) Navigator.of(context).pop();
        return Future.value(value);
      },
      child: Scaffold(
        key: _keyScaffold,
        body: _body(context: context),
        bottomNavigationBar: Observer(
          builder: (context) => CustomFlatButtonWidget(
            title: 'Cadastrar',
            isLoading: _registerUserController.loading,
            onTap: () => submitForm(context),
          ),
        ),
        appBar: AppBar(
          title: const Text('Cadastrar novo usuario'),
        ),
      ),
    );
  }

  Widget _body({BuildContext context}) {
    return Observer(
      builder: (context) => Form(
        key: _keyForm,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            InputWidget(
              hintText: 'Nome',
              prefixIcon: Icons.person,
              focusNode: _focusNodeName,
              keyboardType: TextInputType.name,
              onFieldSubmitted: (_) {
                if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(_focusNodeEmail);
              },
              onSaved: (value) => _registerUserController.name = value,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.trim().isEmpty) return 'Nome não foi preenchido.';
                return null;
              },
              isLoading: _registerUserController.loading,
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
                FocusScope.of(context).requestFocus(_focusNodeUserType);
              },
              onSaved: (value) => _registerUserController.email = value,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.trim().isEmpty) return 'E-mail não foi preenchido.';
                if (!isEmailValid(value)) return ' E-mail inválido.';
                return null;
              },
              isLoading: _registerUserController.loading,
            ),
            const SizedBox(
              height: 8,
            ),
            DropdownButtonFormFieldWidget<UserType>(
              hintText: 'Tipo do usuario',
              focusNode: _focusNodeUserType,
              onSaved: (value) => _registerUserController.userType = value,
              validator: (value) {
                if (value == null) return 'Tipo de usuario não foi preenchido.';
                return null;
              },
              prefixIcon: Icons.school,
              items: UserType.values
                  .map((UserType user) => DropdownMenuItem<UserType>(
                        child: Text(user.formatInString),
                        value: user,
                      ))
                  .toList(),
              onChanged: (value) {
                _registerUserController.userType = value;
                if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
                FocusScope.of(context).requestFocus(_focusNodeInstitution);
              },
              value: _registerUserController.userType,
              isLoading: _registerUserController.loading,
            ),
            const SizedBox(
              height: 8,
            ),
            InputWidget(
              hintText: 'Instituição de ensino',
              prefixIcon: Icons.location_searching,
              focusNode: _focusNodeInstitution,
              keyboardType: TextInputType.streetAddress,
              onFieldSubmitted: (_) => submitForm(context),
              onSaved: (value) => _registerUserController.institution = value,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value.trim().isEmpty) return 'Instituição não foi preenchido.';
                return null;
              },
              isLoading: _registerUserController.loading,
            ),
          ],
        ),
      ),
    );
  }
}
