import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/auth/auth_bloc.dart';
import 'package:lottoblog/data/bloc/auth/auth_event.dart';
import 'package:lottoblog/data/bloc/auth/auth_state.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';
import 'package:lottoblog/show_snackbar.dart';

import '../../../service/firebase_auth_service.dart';

class EmailLoginScreen extends StatelessWidget {
  EmailLoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  final auth = FirebaseAuthService();
  late final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    authRepository = AuthRepository(auth);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    child: Image.asset(
                      'assets/logo/lottoblog_300_300.jpeg',
                    ),
                    widthFactor: 0.7,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return '올바른 이메일 형식을 입력하세요';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: '이메일',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요';
                    }
                    if (value.length < 7) {
                      return '비밀번호는 최소 8자리 이상이어야 합니다.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.go('');
                      },
                      child: Text(
                        '이메일 찾기',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/login/email_login/email_resetpassword');
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        context.read<AuthBloc>().add(SignInWithEmail(email!, password!));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Color(0xff1d2228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('로그인',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                BlocListener<AuthBloc, AuthState>(
                    listener: (context,state){
                      if(state is AuthAuthenticatedState){
                        context.go('/personal');
                      }
                      if (state is AuthErrorState){
                        showSnackBar(context, state.message);
                      }
                    },
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        "계정이 없으신가요?",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                      ),
                      onPressed: () {
                        context.go('/login/email_login/email_register');
                      },
                      child: Text(
                        '회원가입 하기',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
