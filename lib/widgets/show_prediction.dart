import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tomato_leaf_classifier/models/disease_tomato_leaf.dart';

class ShowPrediction extends StatelessWidget {
  final DiseaseTomatoLeaf? _diseaseTomatoLeaf;
  const ShowPrediction(this._diseaseTomatoLeaf, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_diseaseTomatoLeaf != null) {
      return Column(
        children: [
          Text(
              'Probabilidad: ${double.parse(_diseaseTomatoLeaf!.confidence.toStringAsFixed(2))}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          const Gap(12),
          Text('Predicción: ${_diseaseTomatoLeaf!.label}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ],
      );
    }
    return Container();
  }
}
