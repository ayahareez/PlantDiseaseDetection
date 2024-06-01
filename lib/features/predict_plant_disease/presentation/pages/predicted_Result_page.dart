import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_disease/core/widgets/loading_widget.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/chatPot.dart';
import '../bloc/disease_bloc/disease_bloc.dart';
import '../bloc/disease_info_bloc/disease_info_bloc.dart';
import '../widgets/message_display_widget.dart';

class PredictedResultPage extends StatelessWidget {
  PlantModel plantModel;
  PredictedResultPage({super.key, required this.plantModel});
  @override
  Widget build(BuildContext context) {
    print(plantModel.image);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('The Predicted Result'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                  icon: Icon(Icons.chat), // Using the chat icon
                ),
              ],
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
                  if (state.disease.className != 'Healthy') {
                    context
                        .read<DiseaseInfoBloc>()
                        .add(GetDiseaseInfo(disease: state.disease));
                  }
                  print(state.disease.className);
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          state.disease.className,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${state.disease.plantName} plant',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).primaryColor),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 16, start: 24, end: 24, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: Colors
                                          .black, // Set your desired border color
                                      width:
                                          2.0, // Set your desired border width
                                    ),
                                  ),
                                  child: Image.file(
                                    plantModel.image,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Type: ${state.disease.className}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Certainty: ${(state.disease.confidence * 100).toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    if (state.disease.className != 'Healthy')
                                      Text(
                                        'Threat Level: ${state.disease.confidence * 100 > 90 ? 'high' : state.disease.confidence * 100 < 80 && state.disease.confidence * 100 > 60 ? 'medium' : 'low'}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 24, end: 24, top: 8, bottom: 16),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        if (state.disease.className != 'Healthy')
                          BlocBuilder<DiseaseInfoBloc, DiseaseInfoState>(
                            builder: (context, state) {
                              if (state is LoadingDiseaseInfoState) {
                                return const LoadingWidget();
                              }
                              if (state is ErrorDiseaseInfoState) {
                                return MessageDisplayWidget(
                                  message: state.message,
                                );
                              }
                              if (state is LoadedDiseaseInfoState) {
                                print("${state.diseaseInformation}" +
                                    '0000000000000');
                                List<String> diseaseOverview = state
                                    .diseaseInformation.diseaseOverview
                                    .split('.');
                                print("${diseaseOverview} " +
                                    "0000000000000000000000");
                                List<String> diseaseCauses = state
                                    .diseaseInformation.diseaseCauses
                                    .split('.');
                                List<String> diseasePrevention = state
                                    .diseaseInformation.diseasePrevention
                                    .split('.');
                                List<String> diseaseRecovery = state
                                    .diseaseInformation.diseaseRecovery
                                    .split('.');
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ExpansionTile(
                                        title: Text(
                                          'ABOUT',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          // style: Theme.of(context)
                                          //     .textTheme
                                          //     .headline1,
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              //${diseaseOverview[0]}.\n${diseaseOverview[1]}.\n${diseaseOverview[2]}.\n${diseaseOverview[3]}
                                              '${diseaseOverview.join('.\n')}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text(
                                          'CAUSES',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        children: <Widget>[
                                          // الشرح أو المعلومات الإضافية
                                          ListTile(
                                            title: Text(
                                              '${diseaseCauses.join('.\n')}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text(
                                          'PREVENTION',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              '${diseasePrevention.join('.\n')}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text(
                                          'RECOVERY',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        children: <Widget>[
                                          // الشرح أو المعلومات الإضافية
                                          ListTile(
                                            title: Text(
                                              '${diseaseRecovery.join('.\n')}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const LoadingWidget();
                            },
                          ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text('Rate this model: '),
                        //     IconButton(
                        //         onPressed: () {}, icon: Icon(Icons.thumb_up)),
                        //     IconButton(
                        //         onPressed: () {}, icon: Icon(Icons.thumb_down))
                        //   ],
                        // ),
                        if (state.disease.className == 'Healthy')
                          Lottie.asset(
                            'assets/animations/Animation - 1709044285025.json',
                            // Replace with the actual path to your Lottie JSON file
                            width: 250,
                            height: 250,
                            // Other options...
                          ),
                      ],
                    ),
                  );
                }
                return const LoadingWidget();
              },
            ),
            bottomNavigationBar: BottomAppBar(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rate this model: ',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.thumb_down),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}