import 'package:flutter/material.dart';
import 'package:flutteruitest/provider/auth_model.dart';
import 'package:provider/provider.dart';

class LoginRootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthModel authModel = Provider.of<AuthModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text('root')),
        body: authModel.authState == AuthState.AuthOk ? _LoginMainPage() : _LoginPage()
    );
  }
}

class _LoginMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:
    RaisedButton(child: Text('로그아웃'), onPressed: () {
      Provider.of<AuthModel>(context, listen: false).setAuthState(AuthState.UnAuth);
    }),);
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: RaisedButton(child: Text('로그인'), onPressed: () {
        Provider.of<AuthModel>(context, listen: false).setAuthState(AuthState.AuthOk);
      },),
    );
  }
}