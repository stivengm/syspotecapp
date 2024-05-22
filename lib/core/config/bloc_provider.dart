import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/index.dart';
import 'package:syspotec_app/core/utils/image_picker_utils.dart';

final List<BlocProvider> providerBloc = [

  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<RegisterBloc>(create: (_) => RegisterBloc()),
  BlocProvider<CameraBloc>(create: (_) => CameraBloc(ImagePickerUtils())),
  BlocProvider<HomeBloc>(create: (_) => HomeBloc()),

];