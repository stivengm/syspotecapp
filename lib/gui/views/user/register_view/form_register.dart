import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/login/login_bloc.dart';
import 'package:syspotec_app/core/blocs/register/register_bloc.dart';
import 'package:syspotec_app/gui/app_styles.dart';
import 'package:syspotec_app/gui/widgets/primary_button.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {

  bool _passwordVisible = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController identificationNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: nameController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == "") {
                return 'Ingrese el nombre';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Nombre',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: lastNameController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == "") {
                return 'Ingrese el apellido';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Apellido',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: identificationNumberController,
            keyboardType: TextInputType.number,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == "") {
                return 'Ingrese el número de identificación';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Número de identificación',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == "") {
                return 'Ingrese el celular';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Celular',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) => email != null && !EmailValidator.validate(email) ? 'Ingrese un email válido' : null,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: addressController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == "") {
                return 'Ingrese la dirección';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Dirección',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              )
            ),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            obscureText: _passwordVisible,
            controller: passwordController,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (pass) => pass != null && pass.length < 6 ? 'Ingrese mínimo 6 caracteres' : null,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              labelStyle: const TextStyle(
                color: primaryColor
              ),
              filled: true,
              fillColor: whiteColor,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: whiteColor
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            ),
          ),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Siguiente',
            onPressed: register
          ),
          const SizedBox( height: 30.0),
          RichText(
            text: TextSpan(
              text: 'Ya tienes cuenta?',
              style: const TextStyle(
                color: blackColor
              ),
              children: [
                TextSpan(
                  text: ' Inicia sesión',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  recognizer: _registro()
                )
              ]
            )
          )
        ],
      )
    );
  }

  register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValidForm = formKey.currentState!.validate();
    if (!isValidForm) return;

    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    registerBloc.add(const HandleLoader(true));

    final resp = await registerBloc.register(
      
      nameController.text.trim(),
      lastNameController.text.trim(),
      identificationNumberController.text.trim(),
      '', // Address
      phoneNumberController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim()
    );

    if (resp.code == "TRX001") {
      registerBloc.add(const HandleLoader(false));
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(resp.message))
      );
      Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(resp.message))
      );
    }
  }

  TapGestureRecognizer _registro() {
    return TapGestureRecognizer()..onTap = () {
      Navigator.pop(context);
    };
  }
}