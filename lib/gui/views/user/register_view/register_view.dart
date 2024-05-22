import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/login/login_bloc.dart';
import 'package:syspotec_app/gui/app_styles.dart';
import 'package:syspotec_app/gui/views/user/register_view/form_register.dart';
import 'package:syspotec_app/gui/widgets/curved_widget.dart';
import 'package:syspotec_app/gui/widgets/loader_app.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    CurvedWidget(
                      curvedDistance: 80.0,
                      curvedHeight: 80.0,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 100.0, left: 50.0),
                        height: 300.0,
                        color: primaryColor,
                        child: Text(
                          "Registrarse",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 30.0, color: whiteColor),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 300.0,
                        right: 28.0,
                        left: 28.0,
                      ),
                      child: const FormRegister(),
                    ),
                    state.isLoaderLogin ? const LoaderApp() : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
