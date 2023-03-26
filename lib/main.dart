import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:classifier_disease_tomato_leaf/models/disease_tomato_leaf.dart';
import 'package:classifier_disease_tomato_leaf/widgets/button.dart';
import 'package:classifier_disease_tomato_leaf/widgets/show_prediction.dart';

import 'classifier_disease_tomato_leaf.dart';

void main() => runApp(const HomeClassifierDiseaseLeaf());

class HomeClassifierDiseaseLeaf extends StatefulWidget {
  const HomeClassifierDiseaseLeaf({super.key});

  @override
  State<HomeClassifierDiseaseLeaf> createState() =>
      _HomeClassifierDiseaseLeafState();
}

class _HomeClassifierDiseaseLeafState extends State<HomeClassifierDiseaseLeaf> {
  File? _image;
  DiseaseTomatoLeaf? _diseaseTomatoLeaf;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Enfermedades hojas de tomate'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            const Gap(12),
            setImage(),
            const Gap(12),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Button(
                  'Cargar imagen de la galeria',
                  Icons.image_search_outlined,
                  () => loadImageAndSetPrediction(ImageSource.gallery),
                ),
                const SizedBox(height: 12),
                Button('Usar la cámara', Icons.camera_alt,
                    () => loadImageAndSetPrediction(ImageSource.camera)),
              ],
            ),
            const Gap(12),
            ShowPrediction(_diseaseTomatoLeaf),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<void> loadImageAndSetPrediction(ImageSource imageSource) {
    return getImage(imageSource).then((image) {
      ClassifierDiseaseTomatoLeaf()
          .getPrediction(image)
          .then((diseaseTomatoLeaf) {
        setState(() {
          _image = image;
          _diseaseTomatoLeaf = diseaseTomatoLeaf;
        });
      });
    });
  }

  Future<File> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    return File(image!.path);
  }

  Widget setImage() {
    if (_image != null) {
      return Image.file(_image!, width: 300, height: 300);
    }
    return Image.asset('assets/images/tomato-leaf.png',
        width: 300, height: 300);
  }
}
