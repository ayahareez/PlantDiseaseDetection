import 'dart:io';

import 'package:equatable/equatable.dart';

class Plant extends Equatable {
  String plantName;
  int id;
  File image;
  Plant({required this.plantName, required this.id, required this.image});
  @override
  List<Object?> get props => [plantName, id, image];
}