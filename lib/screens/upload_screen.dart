import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  /// => 이미지피커 라이브러리 사용
  String? imagePath;

  Future<String?> selectImage() async {
    final picker = ImagePicker();
    XFile? pickImage = await picker.pickImage(source: ImageSource.gallery,);
    if (pickImage == null) return null;
    return pickImage.path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      ///1. width,height,padding
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      padding: const EdgeInsets.only(
        top: 100.0,
      ),

      ///2.
      child: SafeArea(
        bottom: false,
        child: Scaffold(

          ///2-1. AppBar
          appBar: AppBar(

            ///2-1-1. title
            title: const Text("사진 업로드"),
            centerTitle: true,

            ///2-1-2. 취소 IconButton
            leading: IconButton(
              icon: const Text("취소"),
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            ///2-1-3. 저장 IconButton
            actions: <Widget>[
              IconButton(
                icon: const Text("저장"),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),

          ///2-2. body
          body: Container(

            ///2-2-1. color
            color: Colors.white,

            ///2-2-2. Center > SingleChildScrollView > GestureDetector
            child: Center(
              child: SingleChildScrollView(
                child: GestureDetector(

                  ///2-2-2-1. 비동기 이미지피커
                  onTap: () {
                    selectImage().then((String? path){
                        if (path == null) return;
                        setState(() {
                          imagePath = path;
                        });
                      },
                    );
                  },

                  ///2-2-2-2.
                  behavior: HitTestBehavior.translucent,

                  ///2-2-2-3.
                  child: Column(
                    children: [
                      Container(

                        /// width,height,BoxDecoration
                        width: 300.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            width: 0.5,
                            color: const Color(0xFFAAAAAA),
                          ),
                        ),

                        child: imagePath != null ?
                        Image.file(File(imagePath!), width: 200.0,
                            height: 200.0)
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.upload,
                              size: 50.0,
                            ),
                            Text("고양이 사진 업로드"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
