import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/core/widgets/loading_widget.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';

import '../bloc/disease_bloc.dart';
import '../widgets/message_display_widget.dart';

class PredictedResultPage extends StatelessWidget {
  PlantModel plantModel;
  PredictedResultPage({super.key, required this.plantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Predicted Result'),
      ),
      body: BlocBuilder<DiseaseBloc, DiseaseState>(
        builder: (context, state) {
          if (state is LoadingDiseaseState) {
            return LoadingWidget();
          }
          if (state is ErrorDiseaseState) {
            return MessageDisplayWidget(
              message: state.message,
            );
          }
          if (state is LoadedDiseaseState) {
            return Column(
              children: [
                Image.file(plantModel.image),
                Text(state.disease.plantName),
                Text(state.disease.className),
                Text(state.disease.confidence.toString()),
              ],
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}