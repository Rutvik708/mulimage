import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  final ImagePicker _picker =ImagePicker();

  String imagepath = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: imagepath.isEmpty
              ? Icon(Icons.supervised_user_circle)
                : Image.file(File(imagepath)),
          ),
        OutlinedButton(onPressed: () {
          showDialog(builder:(context) {

            return SimpleDialog(

              title: Text("Select Picture"),
              children: [
                ListTile(

                  leading: Icon(Icons.camera_alt),
                  title: Text("camera"),
                  onTap: () async {
                    Navigator.pop(context);
                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    if(photo !=null)
                      {
                        imagepath =photo.path;
                        setState(() {

                        });
                      }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Gallery"),
                  onTap: () async {
                    Navigator.pop(context);
                    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                    if(photo !=null)
                    {
                      imagepath =photo.path;
                      setState(() {

                      });
                    }
                  },
                )
              ],
            );
          },context: context );
        }, child: Text("Choose file"))
        ],
      ),
    );
  }
}
