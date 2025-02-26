import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/show_snackbar.dart';

import '../../../data/bloc/login/login_bloc.dart';
import '../../../data/bloc/login/login_event.dart';
import '../../../data/bloc/login/login_state.dart';

class EmailLoginScreen extends StatelessWidget {
  EmailLoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      child: Image.asset(
                        'assets/logo/lottoblog_300_300.jpeg',
                      ),
                      widthFactor: 0.7,
                    ),
                  ),

                  // 이메일 입력
                  TextFormField(
                    controller: _emailController,
                    //initialValue: 'pandapad10@naver.com',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력하세요.';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return '올바른 이메일 형식을 입력하세요';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: '이메일',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // 비밀번호 입력
                  TextFormField(
                    controller: _passwordController,
                    //initialValue: '11111111',
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력하세요';
                      } else if (value.length < 7) {
                        return '비밀번호는 최소 8자리 이상이어야 합니다.';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text('|'),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/login/email_login/email_resetpassword');
                        },
                        child: Text(
                          '비밀번호 찾기',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _emailController.text = 'pandapad10@naver.com';
                        _passwordController.text = '11111111';
                        if (_formKey.currentState?.validate() ?? false) {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          context.read<LoginBloc>().add(
                                LoginWithEmail(
                                  email,
                                  password,
                                ),
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Color(0xff1d2228),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        '로그인',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginAuthenticated) {
                        context.go('/personal');
                      } else if (state is LoginFailure) {
                        showSnackBar(context, state.message);
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginUnAuthenticated) {
                          return Center(
                            child: Text('로그인에 실패했습니다.'),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          "계정이 없으신가요?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero),
                        ),
                        onPressed: () {
                          context.go('/login/email_login/signup_email');
                        },
                        child: Text(
                          '회원가입 하기',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
