part of 'camera_bloc.dart';

class CameraState extends Equatable {

  final XFile? file;
  // final List<CameraDescription>? camera;

  const CameraState({
    this.file,
    // this.camera
  });

  CameraState copyWith({
    // List<CameraDescription>? camera,
    XFile? file
  }) => CameraState(
    // camera: camera ?? this.camera,
    file: file ?? this.file
  );
  
  @override
  List<Object?> get props => [ file ];
}
