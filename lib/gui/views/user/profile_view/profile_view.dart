import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/camera/camera_bloc.dart';
import 'package:syspotec_app/core/blocs/login/login_bloc.dart';
import 'package:syspotec_app/gui/app_styles.dart';
import 'package:syspotec_app/gui/widgets/header_section_widget.dart';
import 'package:syspotec_app/gui/widgets/primary_button.dart';
import 'package:syspotec_app/gui/widgets/rich_text_widget.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEdit = false;
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
    isEdit = false;
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    nameController = TextEditingController(text: loginBloc.state.user?.userData?.name);
    lastNameController = TextEditingController(text: loginBloc.state.user?.userData?.lastName);
    emailController = TextEditingController(text: loginBloc.state.user?.userData?.email);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, stateLogin) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<CameraBloc, CameraState>(
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(100),
                                      // child: Image.file(File(state.file!.path.toString()), fit: BoxFit.cover,),
                                      child: state.file == null
                                          ? Image.asset('assets/no_image.png')
                                          : Image.file(
                                              File(state.file!.path.toString()),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: InkWell(
                                      onTap: () => context
                                          .read<CameraBloc>()
                                          .add(CameraCapture()),
                                      child: const CircleAvatar(
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            isEdit ? Form(
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
                                      if (value == ""){
                                        return "Escriba un nombre";
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
                                  const SizedBox( height: 14.0),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: lastNameController,
                                    keyboardType: TextInputType.text,
                                    autocorrect: false,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == ""){
                                        return "Escriba un apellido";
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
                                  const SizedBox( height: 14.0),
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
                                  const SizedBox(height: 14.0),
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
                                ]
                              )
                            ) :
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30.0),
                                HeaderSectionWidget(
                                  textHeader: "Información del usuario",
                                  widget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichTextWidget(title: 'Nombre', value: "${stateLogin.user?.userData?.name}",),
                                      RichTextWidget(title: 'Apellido', value: "${stateLogin.user?.userData?.lastName}",),
                                      RichTextWidget(title: 'Email', value: "${stateLogin.user?.userData?.email}",),
                                      RichTextWidget(title: 'Tipo de documento', value: "${stateLogin.user?.userData?.identificationType.name}",),
                                      RichTextWidget(title: 'Número de documento', value: "${stateLogin.user?.userData?.identificationNumber}",),
                                      RichTextWidget(title: 'Género', value: "${stateLogin.user?.userData?.gender.name}",),
                                    ],
                                  ),
                                ),
                                const SizedBox( height: 30.0),
                                HeaderSectionWidget(
                                  textHeader: "Información de la empresa",
                                  widget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichTextWidget(title: 'Nombre', value: "${stateLogin.user?.userData?.company.name}",),
                                      RichTextWidget(title: 'NIT', value: "${stateLogin.user?.userData?.company.nit}",),
                                      RichTextWidget(title: 'Teléfono', value: "${stateLogin.user?.userData?.company.phone}",),
                                      RichTextWidget(title: 'Dirección', value: "${stateLogin.user?.userData?.company.address}",),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                PrimaryButton(text: 'Editar', onPressed: () {
                  print("Hola mundo");
                  setState(() {
                    isEdit = true;
                  });
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
