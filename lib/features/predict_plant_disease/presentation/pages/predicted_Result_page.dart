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
        title: const Text(
          'The Predicted Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.file(
                          plantModel.image,
                          width: 400,
                          height: 400,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 30,),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              'Plant Type: ',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.disease.plantName,
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),

                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              'type of disease: ',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              state.disease.className,
                              style: TextStyle(fontSize: 25,color: Colors.red,),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Text(
                              'confidence: ',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${(state.disease.confidence * 100).toStringAsFixed(1)}%', // Format confidence value as percentage
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(height: 15,),
                        if (state.disease.className != 'Healthy')
                          TextButton(
                            onPressed: () async {
                              context
                                  .read<DiseaseInfoBloc>()
                                  .add(GetDiseaseInfo(disease: state.disease));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiseaseDataPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () async {
                                  context
                                      .read<DiseaseInfoBloc>()
                                      .add(GetDiseaseInfo(disease: state.disease));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DiseaseDataPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'See more about the disease',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}