// import 'dart:io';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class Base64PdfViewer extends StatefulWidget {
//   final double? width;
//   final double? height;
//   final String base64Pdf;
  
//   const Base64PdfViewer(
//     {super.key, this.width, this.height, required this.base64Pdf}
//   );


//   @override
//   _Base64PdfViewerState createState() => _Base64PdfViewerState();
// }

// class _Base64PdfViewerState extends State<Base64PdfViewer> {
//   String? filePath;

//   @override
//   void initState() {
//     super.initState();
//     _preparePdf();
//   }

//   Future<void> _preparePdf() async {
//     final Uint8List bytes = base64.decode(widget.base64Pdf);
//     final String dir = (await getTemporaryDirectory()).path;
//     final String path = '$dir/temp.pdf';

//     final File file = File(path);
//     await file.writeAsBytes(bytes);
//     if (mounted) {
//       setState(() {
//         filePath = path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: filePath == null
//           ? const Center(child: CircularProgressIndicator())
//           : PDFView(
//               filePath: filePath,
//             ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';




class Base64PdfView extends StatefulWidget {
  final String base64Pdf;
  const Base64PdfView({super.key, required this.base64Pdf});

  @override
  State<Base64PdfView> createState() => _Base64PdfViewState();
}

class _Base64PdfViewState extends State<Base64PdfView> {
  final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int currentPage = 0;
  int totalPages = 0;
  bool isReady = false;
  String errorMessage = '';
  String filePath = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilePath();
  }

  getFilePath() async {
    setState(() {
      isReady = false;
    });

    final data = base64Decode(widget.base64Pdf);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.pdf');
    await file.writeAsBytes(data);
    setState(() {
      filePath = file.path;
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: filePath,
            fitEachPage: true,
            fitPolicy: FitPolicy.BOTH,
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$error';
              });
            },
            // onViewCreated: (PDFViewController vc) {
            //   setState(() {
            //     pdfViewController = vc;
            //   });
            //   _loadPdf();
            // },
            onViewCreated: (PDFViewController pdfViewController) async {

              

              setState(() {
                _controller.complete(pdfViewController);
                // _loadPdf();
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                ),
        ],
      ),
    );
  }
  // _loadPdf() async {
  //   try {
  //     setState(() {
  //       isReady = false;
  //     });
  //     final data = base64Decode(widget.base64Pdf);
  //     final directory = await getApplicationDocumentsDirectory();
  //     final file = File('${directory.path}/my_file.pdf');
  //     await file.writeAsBytes(data);
  //     setState(() {
  //       isReady = true;
  //     });
  //     // await _controller.loadFile(file.path);
  //     // await pdfViewController.
  //     await _controller.complete(file.path as FutureOr<PDFViewController>?);
  //   } catch (e) {
  //     setState(() {
  //       errorMessage = e.toString();
  //     });
  //   }
  // }
}