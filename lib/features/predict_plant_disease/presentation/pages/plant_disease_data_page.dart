import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../bloc/disease_info_bloc/disease_info_bloc.dart';
import '../widgets/message_display_widget.dart';

class DiseaseDataPage extends StatelessWidget {
  const DiseaseDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DiseaseInfoBloc, DiseaseInfoState>(
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    state.diseaseInformation.plantCategory,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    state.diseaseInformation.diseaseName,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    state.diseaseInformation.diseaseOverview,
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    state.diseaseInformation.diseaseCauses,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    state.diseaseInformation.diseasePrevention,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    state.diseaseInformation.diseaseRecovery,
                    style: TextStyle(fontSize: 20),
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