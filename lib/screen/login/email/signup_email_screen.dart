import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/login/login_event.dart';
import 'package:lottoblog/screen/login/login_screen.dart';

import '../../../data/bloc/login/login_bloc.dart';
import '../../../data/bloc/login/login_state.dart';
import '../../../show_snackbar.dart';

class SignUpEmailScreen extends StatelessWidget {
  SignUpEmailScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '회원가입을 위해\n정보를 입력해주세요',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w800, height: 1.5),
                    ),
                    // 이름 입력
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: '이름',
                        labelStyle: Theme.of(context).textTheme.headlineLarge,
                        border: UnderlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      style: Theme.of(context).textTheme.displaySmall,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이름을 입력하세요';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value;
                      },
                    ),
                    // 이메일 입력
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '이메일',
                        labelStyle: Theme.of(context).textTheme.headlineLarge,
                        border: UnderlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      style: Theme.of(context).textTheme.displaySmall,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '이메일을 입력하세요';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return '유효한 이메일을 입력하세요';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ), // 이메일
                    // 비밀번호 입력
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: '비밀번호',
                        labelStyle: Theme.of(context).textTheme.headlineLarge,
                        helperText: '* 영문,숫자,특수문자 8자 이상 입력해주세요.',
                        helperStyle: Theme.of(context).textTheme.titleMedium,
                        border: UnderlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      style: Theme.of(context).textTheme.displaySmall,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 입력하세요.';
                        }
                        if (value.length < 7) {
                          return '비밀번호는 8자리 이상이어야 합니다';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                    // 비밀번호 확인
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: '비밀번호 확인',
                        labelStyle: Theme.of(context).textTheme.headlineLarge,
                        // hintText: '비밀번호를 한번 더 입력해주세요.',
                        border: UnderlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      style: Theme.of(context).textTheme.displaySmall,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '비밀번호를 다시 한번 입력하세요.';
                        } else if (value != _passwordController.text) {
                          return '비밀번호가 일치하지 않습니다.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<LoginBloc>().add(
                                  SignUpEmail(
                                    name: name!,
                                    email: email!,
                                    password: password!,
                                  ),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color(0xFF1d2228),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '가입하기',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginAuthenticated) {
                          showSnackBar(context, '회원가입이 완료되었습니다.');
                          context.go('/login');
                        } else if (state is LoginFailure) {
                          showSnackBar(context, state.message);
                        }
                      },
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
