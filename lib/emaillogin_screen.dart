import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/show_snackbar.dart';
import 'firebase_aut_service.dart';

class EmailloginScreen extends StatelessWidget {
  EmailloginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  final auth = FirebaseAuthService();

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: FractionallySizedBox(
                        child:
                            Image.asset('assets/logo/lottoblog_300_300.jpeg'),
                    widthFactor: 0.8,),),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return '이메일을 입력하세요.';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                      return '올바른 이메일 형식을 입력하세요';
                    }
                    return null;
                  },
                  onSaved: (value){
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: '이메일',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return '비밀번호를 입력하세요';
                    }
                    if (value.length < 6){
                      return '비밀번호는 최소 6자리 이상이어야 합니다.';
                    }
                    return null;
                  },
                  onSaved: (value){
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
                      onPressed: () {},
                      child: Text('아이디 찾기'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('비밀번호 찾기'),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState?.validate()?? false){
                        _formKey.currentState?.save();
                        auth.signInwithEmail(
                          email:email!,
                          password:password!,
                        ).then((_){
                          showSnackBar(context, '로그인이 되었습니다.');
                        }).catchError((error){
                          showSnackBar(context, error.toString());
                        });
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("계정이 없으신가요?"),
                    SizedBox(width: 15),
                    TextButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                      ),
                      onPressed: () {
                        context.go('/login_screen/emaillogin_screen/emailregister_screen');
                      },
                      child: Text('회원가입하기'),
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
