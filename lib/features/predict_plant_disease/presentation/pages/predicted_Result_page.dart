import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_disease/core/widgets/loading_widget.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/plant_photo_page.dart';
import '../../../auth/presentation/bloc/auth_bloc/authentication_bloc.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../bloc/disease_bloc/disease_bloc.dart';
import '../bloc/disease_info_bloc/disease_info_bloc.dart';
import '../widgets/message_display_widget.dart';
import 'chatPot_page.dart';
import 'localization_page.dart';

class PredictedResultPage extends StatefulWidget {
  PlantModel plantModel;
  PredictedResultPage({super.key, required this.plantModel});

  @override
  State<PredictedResultPage> createState() => _PredictedResultPageState();
}

class _PredictedResultPageState extends State<PredictedResultPage> {
  bool liked = false; // New state for like button
  bool disliked = false;
  List<String> filteredPlantNames = [];
  List<String> filteredPlantIcons = [];
  List<String> plantNames = [];

  @override
  void initState() {
    super.initState();
    initializePlantNames();
  }

  @override
  void didUpdateWidget(covariant PredictedResultPage oldWidget) {
    // TODO: implement didUpdateWidget
    setState(() {});
  }

  void initializePlantNames() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(tr("result")),
              leading: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocalizationPage()),
                  );
                  if (result == true) {
                    initializePlantNames();
                  }
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                    );
                  },
                  icon: const Icon(Icons.chat),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlantPhotoPage()));
                    },
                    icon: Icon(Icons.home)),
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
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Image.file(
                                    widget.plantModel.image,
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
                                      '${tr("type")}: ${state.disease.className}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${tr("certainty")}: ${(state.disease.confidence * 100).toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    if (state.disease.className != 'Healthy')
                                      Text(
                                        '${tr("threat_level")}: ${state.disease.confidence * 100 > 90 ? 'high' : state.disease.confidence * 100 < 80 && state.disease.confidence * 100 > 60 ? 'medium' : 'low'}',
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
                                print('object');
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
                                          tr('ABOUT'),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Text(
                                              '${diseaseOverview.join('.\n')}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ExpansionTile(
                                        title: Text(
                                          tr('CAUSES'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        children: <Widget>[
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
                                          tr('PREVENTION'),
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
                                          tr('RECOVERY'),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        children: <Widget>[
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
                        if (state.disease.className == 'Healthy')
                          Lottie.asset(
                            'assets/animations/Animation - healthy.json',
                            width: 250,
                            height: 250,
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
                    tr("rate"),
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        liked = !liked;
                        if (liked) disliked = false; // Deselect dislike
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            liked ? tr("feedback") : tr("apology"),
                            style: TextStyle(
                                fontSize: 20,
                                color: liked ? Colors.green : Colors.grey),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      color: liked ? Colors.blue : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        disliked = !disliked;
                        if (disliked) liked = false; // Deselect like
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            disliked ? tr("apology") : tr("feedback"),
                            style: TextStyle(
                                fontSize: 20,
                                color: disliked ? Colors.red : Colors.grey),
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.thumb_down,
                      color: disliked ? Colors.blue : Colors.black,
                    ),
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