import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/firebase/firebase_auth_service.dart';
import 'show_snackbar.dart';

class EmailregisterScreen extends StatelessWidget {
  EmailregisterScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  String? name;
  String? email;
  String? password;

  final auth = FirebaseAuthService();

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('회원가입을 위해\n정보를 입력해주세요',style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),),
                  SizedBox(height: 24),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: '이름',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이름을 입력하세요';
                      }
                      return null;
                    },
                    onSaved: (value) { //이름 저장
                      name = value;
                    },
                  ), // 이름
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '이메일',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
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
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      helperText: '* 영문,숫자,특수문자 8자 이상 입력해주세요.',
                      helperStyle: Theme.of(context).textTheme.titleMedium,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력하세요.';
                      }
                      if (value.length < 7) {
                        return '비밀번호는 8자리 이상이여야 합니다';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  ), // 비밀번호
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호 확인',
                      labelStyle:  Theme.of(context).textTheme.headlineSmall,
                      hintText: '비밀번호를 한번 더 입력해주세요.',
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value){
                      if (value == null || value.isEmpty){
                        return '비밀번호를 다시 한번 입력하세요.';
                      } else if (value != _passwordController.text){
                        return '비밀번호가 일치하지 않습니다.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          auth.singUpWithEmail(
                            email: email!,
                            password: password!,
                            name: name!,
                          )
                              .then((_) {
                           showSnackBar(context, '회원가입이 완료되었습니다.');
                            context.go('/person_screen');
                          }).catchError((error) {
                              showSnackBar(context, error.toString());
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Color(0xFF1d2228),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text('가입하기',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
