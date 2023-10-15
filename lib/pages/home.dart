import 'dart:io';
import 'package:firebase/controllers/logout.dart';
import 'package:firebase/controllers/upload.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var image;

  void tirarFoto(ImageSource source) async {
    try {
      var imgTirada = await ImagePicker().pickImage(source: source);
      setState(() {
        if (imgTirada != null) {
          image = File(imgTirada.path);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Logout.sair(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 4,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.deepPurple,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
              ),
              SizedBox(height: height * .02),
              ElevatedButton.icon(
                onPressed: () => tirarFoto(ImageSource.camera),
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Tirar foto'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: height * .01),
              ElevatedButton.icon(
                onPressed: () => tirarFoto(ImageSource.gallery),
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload de foto'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Upload.uploadImage(image),
        child: const Icon(Icons.save),
      ),
    );
  }
}
