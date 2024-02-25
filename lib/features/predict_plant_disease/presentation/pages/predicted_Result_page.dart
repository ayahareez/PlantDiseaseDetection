import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:plant_disease/core/widgets/loading_widget.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/plant_disease_data_page.dart';

import '../bloc/disease_bloc/disease_bloc.dart';
import '../bloc/disease_info_bloc/disease_info_bloc.dart';
import '../widgets/message_display_widget.dart';

class PredictedResultPage extends StatelessWidget {
  PlantModel plantModel;
  PredictedResultPage({super.key, required this.plantModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Predicted Result'),
      ),
      body: BlocBuilder<DiseaseBloc, DiseaseState>(
        builder: (context, state) {
          if (state is LoadingDiseaseState) {
            return const LoadingWidget();
          }
          if (state is ErrorDiseaseState) {
            return MessageDisplayWidget(
              message: state.message,
            );
          }
          if (state is LoadedDiseaseState) {
            if (state.disease.className == 'Healthy') {
              print('true');
            }
            print(state.disease.className);
            return Column(
              children: [
                Image.file(plantModel.image),
                Text(
                  state.disease.plantName,
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  state.disease.className,
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  state.disease.confidence.toString(),
                  style: TextStyle(fontSize: 35),
                ),
                if (state.disease.className != 'Healthy')
                  TextButton(
                      onPressed: () async {
                        context
                            .read<DiseaseInfoBloc>()
                            .add(GetDiseaseInfo(disease: state.disease));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DiseaseDataPage()));
                      },
                      child: Center(
                        child: Text(
                          'See more about the disease',
                          style: TextStyle(
                            color: Color(0xff2d232e),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      )),
              ],
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}