import 'package:flutter/material.dart';
import 'package:lottoblog/firebase/firebase_auth_service.dart';
import 'package:lottoblog/show_snackbar.dart';

class EmailresetpasswordScreen extends StatelessWidget {
  EmailresetpasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuthService();

  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '비밀번호 재설정을 위해\n이메일을 입력해주세요',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '이메일',
                  labelStyle: Theme.of(context).textTheme.headlineSmall,
                  hintText: '',
                  hintStyle: Theme.of(context).textTheme.titleMedium,
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
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      auth.resetPassword(email: email!).then((_) {
                        showSnackBar(context, '비밀번호 재설정 이메일이 전송되었습니다.');
                      }).catchError((error) {
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
                    '비밀번호 재설정 이메일 보내기',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('* 이메일을 통해 비밀번호 재설정 링크를 확인하세요.',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
