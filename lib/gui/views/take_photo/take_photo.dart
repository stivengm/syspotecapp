import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syspotec_app/core/blocs/camera/camera_bloc.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CameraBloc, CameraState>(
        builder: (context, state) {
          if ( state.file == null) {
            return InkWell(
              onTap: () {
                context.read<CameraBloc>().add( CameraCapture() );
              },
              child: const CircleAvatar(
                child: Icon(
                  Icons.camera
                ),
              ),
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }

          
        },
      )
    );
  }
}