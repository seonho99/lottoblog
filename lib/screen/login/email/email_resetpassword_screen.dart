import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc/email_reset_password/email_reset_password_bloc.dart';
import '../../../data/bloc/email_reset_password/email_reset_password_event.dart';
import '../../../data/bloc/email_reset_password/email_reset_password_state.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../show_snackbar.dart';


class EmailResetpasswordScreen extends StatelessWidget {
  EmailResetpasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
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
        child: BlocProvider(
          create: (_) => EmailResetPasswordBloc(context.read<AuthRepository>()),
          child: BlocListener<EmailResetPasswordBloc, EmailResetPasswordState>(
            listener: (context, state) {
              if (state is EmailResetPasswordSuccess) {
                showSnackBar(context, state.message);
                Navigator.pop(context);
              } else if (state is EmailResetPasswordError) {
                showSnackBar(context, state.message);
              }
            },
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      '비밀번호 재설정을 위해\n이메일을 입력해주세요.',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w800, height: 1.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<EmailResetPasswordBloc>().add(ResetPasswordEmail(email!));
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
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '- 이메일을 통해 비밀번호 재설정 링크를 확인하세요.',
                    style: Theme.of(context).textTheme.titleMedium,
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
