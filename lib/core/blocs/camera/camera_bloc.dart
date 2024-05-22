import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:syspotec_app/core/utils/image_picker_utils.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {

  final ImagePickerUtils imagePickerUtils;

  CameraBloc(this.imagePickerUtils) : super(const CameraState()) {
    on<CameraCapture>( cameraCapture );
  }

  void cameraCapture( CameraCapture event, Emitter<CameraState> states ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit( state.copyWith( file: file ) );
  }

  // void cameraCapture( CameraCapture event, Emitter<CameraState> state ) async {
  //   XFile? file = await imagePickerUtils.cameraCapture();
  // }
  
}
