import 'package:equatable/equatable.dart';

class Disease extends Equatable {
  final String className, plantName;
  final int confidence;

  const Disease(
      {required this.className,
      required this.plantName,
      required this.confidence});
  @override
  List<Object?> get props => [className, plantName, confidence];
}