import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_mood/feature/components/custom_button.dart';
import 'package:grow_mood/feature/components/custom_text_form_field.dart';
import 'package:grow_mood/feature/pages/base_navbar.dart';
import 'package:grow_mood/feature/pages/space_page.dart';
import 'package:grow_mood/feature/pages/register_page.dart';
import 'package:grow_mood/states/account_state.dart';
import 'package:grow_mood/theme/base_colors.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final account = Injector.getAsReactive<AccountState>();

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Login with your\nexisting account',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your email address',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obscureText: true,
          controller: passwordController,
        );
      }

      Widget submitButton() {
        return CustomButton(
          title: 'Login',
          onPressed: () async {
            try {
              await account.state.signIn(
                email: emailController.text,
                password: passwordController.text,
              );
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Login failed'),
                ));
              }
            }

            if (account.state.getUser != null && context.mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BasePage(body: const SpacePage())),
              );
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BasePage(body: const SpacePage())),
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: BaseColors.neutralContrast,
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Don\'t have an account? Register',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: BaseColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
