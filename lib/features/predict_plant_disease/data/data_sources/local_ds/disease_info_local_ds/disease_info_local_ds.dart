import 'package:easy_localization/easy_localization.dart';

import '../../../models/disease_information_model.dart';

List<DiseaseInformationModel> diseaseInfo = [
  DiseaseInformationModel(
      diseaseOverview: tr("potatoOverview"),
      diseaseCauses: tr("potatoCauses"),
      diseasePrevention: tr("potatoPrevention"),
      diseaseRecovery: tr("potatoRecovery"),
      diseaseName: 'Early Blight',
      plantCategory: 'potato'),
  DiseaseInformationModel(
      diseaseOverview: tr("potatoLateBlightOverview"),
      diseaseCauses: tr("potatoLateBlightCauses"),
      diseasePrevention: tr("potatoLateBlightPrevention"),
      diseaseRecovery: tr("potatoLateBlightRecovery"),
      diseaseName: 'Late Blight',
      plantCategory: 'potato'),
  DiseaseInformationModel(
    diseaseOverview: tr("peachBacterialSpotOverview"),
    diseaseCauses: tr("peachBacterialSpotCauses"),
    diseasePrevention: tr("peachBacterialSpotPrevention"),
    diseaseRecovery: tr("peachBacterialSpotRecovery"),
    diseaseName: 'Bacterial spot',
    plantCategory: 'peach',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("appleBlackRotOverview"),
    diseaseCauses: tr("appleBlackRotCauses"),
    diseasePrevention: tr("appleBlackRotPrevention"),
    diseaseRecovery: tr("appleBlackRotRecovery"),
    diseaseName: 'Black Rot',
    plantCategory: 'apple',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("appleScabOverview"),
    diseaseCauses: tr("appleScabCauses"),
    diseasePrevention: tr("appleScabPrevention"),
    diseaseRecovery: tr("appleScabRecovery"),
    diseaseName: 'Scab',
    plantCategory: 'apple',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("cornBlightOverview"),
    diseaseCauses: tr("cornBlightCauses"),
    diseasePrevention: tr("cornBlightPrevention"),
    diseaseRecovery: tr("cornBlightRecovery"),
    diseaseName: 'Blight',
    plantCategory: 'corn',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("cornGrayLeafSpotOverview"),
    diseaseCauses: tr("cornGrayLeafSpotCauses"),
    diseasePrevention: tr("cornGrayLeafSpotPrevention"),
    diseaseRecovery: tr("cornGrayLeafSpotRecovery"),
    diseaseName: 'Gray Leaf Spot',
    plantCategory: 'corn',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("cornCommonRustOverview"),
    diseaseCauses: tr("cornCommonRustCauses"),
    diseasePrevention: tr("cornCommonRustPrevention"),
    diseaseRecovery: tr("cornCommonRustRecovery"),
    diseaseName: 'Common Rust',
    plantCategory: 'corn',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("appleCedarRustOverview"),
    diseaseCauses: tr("appleCedarRustCauses"),
    diseasePrevention: tr("appleCedarRustPrevention"),
    diseaseRecovery: tr("appleCedarRustRecovery"),
    diseaseName: 'Cedar Rust',
    plantCategory: 'apple',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("pepperBacterialSpotOverview"),
    diseaseCauses: tr("pepperBacterialSpotCauses"),
    diseasePrevention: tr("pepperBacterialSpotPrevention"),
    diseaseRecovery: tr("pepperBacterialSpotRecovery"),
    diseaseName: 'Bacterial spot',
    plantCategory: 'pepper',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("cherryPowderyMildewOverview"),
    diseaseCauses: tr("cherryPowderyMildewCauses"),
    diseasePrevention: tr("cherryPowderyMildewPrevention"),
    diseaseRecovery: tr("cherryPowderyMildewRecovery"),
    diseaseName: 'Powdery mildew',
    plantCategory: 'cherry',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("grapeLeafBlightOverview"),
    diseaseCauses: tr("grapeLeafBlightCauses"),
    diseasePrevention: tr("grapeLeafBlightPrevention"),
    diseaseRecovery: tr("grapeLeafBlightRecovery"),
    diseaseName: 'Leaf_blight (Isariopsis Leaf Spot)',
    plantCategory: 'grape',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("grapeEscaOverview"),
    diseaseCauses: tr("grapeEscaCauses"),
    diseasePrevention: tr("grapeEscaPrevention"),
    diseaseRecovery: tr("grapeEscaRecovery"),
    diseaseName: 'Esca (Black Measles)',
    plantCategory: 'grape',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("grapeBlackRotOverview"),
    diseaseCauses: tr("grapeBlackRotCauses"),
    diseasePrevention: tr("grapeBlackRotPrevention"),
    diseaseRecovery: tr("grapeBlackRotRecovery"),
    diseaseName: 'Black Rot',
    plantCategory: 'grape',
  ),
  DiseaseInformationModel(
    diseaseOverview: tr("strawberryLeafScorchOverview"),
    diseaseCauses: tr("strawberryLeafScorchCauses"),
    diseasePrevention: tr("strawberryLeafScorchPrevention"),
    diseaseRecovery: tr("strawberryLeafScorchRecovery"),
    diseaseName: 'Leaf scorch',
    plantCategory: 'strawberry',
  ),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Lesions: Small, water-soaked lesions on leaves, turning brown with a halo.Lesion Coalescence: Lesions may merge, causing extensive leaf damage.',
      diseaseCauses:
          'Bacterium: Xanthomonas vesicatoria is the primary pathogen causing Bacterial Spot in tomatoes.Warm and Humid Weather: Bacterial Spot thrives in warm and humid conditions.Rain Splash: Bacterial Spot is often spread through splashing water, especially during rain.',
      diseasePrevention:
          'Resistant Varieties: Choose tomato varieties with resistance to Bacterial Spot.Sanitation Practices: Remove and destroy infected plant debris to reduce inoculum.Crop Rotation: Rotate tomato crops to minimize pathogen buildup in the soil.',
      diseaseRecovery:
          'Sanitation Practices:Remove Infected Debris: Clear and destroy infected plant material to reduce overwintering sources.Copper Fungicides: Apply copper-based sprays as a preventive measure early in the growing season.Drip Irrigation: Use drip irrigation to minimize water splashing and reduce disease spread.',
      diseaseName: 'Bacterial spot',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Target-Like Lesions: Dark concentric rings on leaves resembling a target.Yellowing: Lower leaves exhibit yellowing and wilting.Fruit Lesions: Dark spots may develop on green and ripe tomatoes.',
      diseaseCauses:
          'Fungi: Primarily Alternaria solani and Alternaria tomatophila are responsible for Early Blight.Warm and Humid Weather: Favors the rapid development and spread of the fungus.',
      diseasePrevention:
          'Resistant Varieties: Choose tomato varieties with resistance to Bacterial Spot.Sanitation Practices: Remove and destroy infected plant debris to reduce inoculum.Crop Rotation: Rotate tomato crops to minimize pathogen buildup in the soil.',
      diseaseRecovery:
          'Fungicide Applications:Preventive Sprays: Apply fungicides early in the growing season as a preventive measure.Crop Rotation:Diversify Planting Locations: Rotate tomatoes with non-host crops to break the disease cycle.',
      diseaseName: 'Early blight',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Water-Soaked Lesions: Dark, water-soaked lesions on leaves, stems, and fruits.White Fungal Growth: White mold may appear on the undersides of leaves, especially during humid conditions.',
      diseaseCauses:
          'Phytophthora infestans is the primary pathogen causing Late Blight.Cool and Wet: Thrives in cool, wet conditions, with rapid disease development during rainy periods.',
      diseasePrevention:
          'Crop Rotation:Break the disease cycle by planting tomatoes in different locations each season.Resistant Varieties: Plant tomatoes with genetic resistance to Late Blight.',
      diseaseRecovery:
          'Fungicide Applications:Apply fungicides early in the growing season and continue on a regular schedule.Adjusting Irrigation: Use drip irrigation to avoid wetting leaves or irrigate early in the day.',
      diseaseName: 'Late blight',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Yellow spots and mottling on upper leaf surfaces.Distinctive Spots: Dark, fuzzy patches on the lower leaf surface.',
      diseaseCauses:
          'Pathogen: Pseudocercospora fuligena is the fungus responsible for Leaf Mold.High Humidity: Thrives in conditions of high humidity.Moderate Temperatures: Optimal development occurs in moderate temperatures.',
      diseasePrevention:
          'Resistant Varieties:Plant tomato varieties with documented resistance to Leaf Mold.Soil Health Management:Provide balanced nutrition and ensure optimal soil .',
      diseaseRecovery:
          'Fungicide Applications:Apply fungicides preventively to manage Leaf Mold.Leaf Removal:Remove and destroy infected leaves promptly.Copper-Based Sprays:Utilize copper-based fungicides with anti-fungal properties.',
      diseaseName: 'Leaf Mold',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Symptoms:Circular Spots: Small, dark spots with a white or gray center on lower leaves.Yellowing: Yellow halos surrounding the spots as the infection progresses.Leaf Drop: Severe infections can lead to premature leaf drop.',
      diseaseCauses:
          'Pathogen: Septoria lycopersici is the fungus responsible for Septoria Leaf Spot.Environmental Conditions:Warm and Humid: Thrives in warm and humid conditions.Splash Dispersal: Spores spread through water splashing on infected plants.',
      diseasePrevention:
          'Resistant Varieties:Plant tomato varieties with resistance to Septoria Leaf Spot.Soil Health Management:Provide balanced nutrition and ensure optimal soil conditions.',
      diseaseRecovery:
          'Fungicide Applications:Begin fungicide application early in the growing season.Rotate between different classes of fungicides to prevent resistance.Leaf Removal:Regularly inspect plants and remove affected leaves to prevent further spread.',
      diseaseName: 'Septoria leaf spot',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: The two-spotted spider mite (Tetranychus urticae) is a microscopic arachnid that feeds on plant sap.Tiny Specks: Presence of tiny specks on leaves, often resembling small dots.Leaves may exhibit bronzing or yellowing due to sap-sucking.',
      diseaseCauses:
          'Pruning Practices: Excessive pruning that stresses the plant may create favorable conditions for mite development.Environmental Conditions:Hot and Dry Climate: Two-spotted spider mites thrive in warm and dry conditions.Mitigating Dust:Regularly spraying plants with water can help mitigate dust and deter spider mites.',
      diseasePrevention:
          'Environmental Modifications:Increase Humidity: Spider mites thrive in dry conditions, so increasing humidity can be unfavorable for them.Mulching: Applying organic mulch can help retain soil moisture and create a less favorable environment for mites.',
      diseaseRecovery:
          'Beneficial Insects:Introduce beneficial insects that feed on spider mites.Leaf Cleaning: Washing leaves can physically remove mites and disrupt their webbing.Natural Repellent:Neem oil has natural pesticidal properties and can be effective against spider mites.',
      diseaseName: 'Spider Mites (Two spotted spider mite)',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Symptoms:Target-Like Lesions: Circular lesions with concentric rings resembling a target.Yellowing and Browning: Lesions may turn yellow or brown, causing defoliation.Favorable Conditions: Thrives in warm and humid conditions.',
      diseaseCauses:
          'Pathogen: Corynespora cassiicola is the fungus responsible for Target Spot in tomatoes.Environmental Conditions:Warm and Humid: Target Spot is favored by warm temperatures and high humidity.',
      diseasePrevention:
          'Resistant Varieties:Choose cultivars known for their resistance to Corynespora cassiicola.Proper Spacing and Pruning:Enhance air circulation to reduce humidity around plants.',
      diseaseRecovery:
          'Fungicide Applications:Begin fungicide application early in the growing season.Rotate between different classes of fungicides to prevent resistance.Copper-Based Sprays:Apply copper sprays preventively, especially during periods conducive to Target Spot development.',
      diseaseName: 'Target Spot',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description:Symptoms:Leaf Curling: Leaves exhibit upward curling and may become stiff.Stunted Growth: Affected plants may exhibit stunted growth.Leaf Deformities: Leaf distortion and reduced fruit production.',
      diseaseCauses:
          'Pathogen: Yellow Leaf Curl Virus is primarily caused by whiteflies carrying begomoviruses, such as Tomato yellow leaf curl virus (TYLCV).High Humidity:Prolonged periods of high humidity create an ideal environment for Target Spot development.',
      diseasePrevention:
          'Resistant Varieties:Planting Choices: Choose tomato varieties with resistance to Target Spot.Avoid Overhead Irrigation:Drip Irrigation: Use drip irrigation or water at the base of plants to minimize water on foliage.',
      diseaseRecovery:
          'Fungicide Applications:Curative and Preventive: Apply fungicides with both curative and preventive properties, following recommended application schedules.Rotate Crops:Disease Break: Rotate tomatoes with non-host crops to break the disease cycle and reduce soilborne inoculum Remove Infected Debris:Sanitation: Remove and destroy infected plant debris to reduce the source of inoculum.',
      diseaseName: 'Yellow Leaf Curl Virus',
      plantCategory: 'tomato'),
  const DiseaseInformationModel(
      diseaseOverview:
          'Description: Symptoms:Mottled Leaves: Leaves exhibit a mosaic pattern with light and dark green areas.Stunted Growth: Infected plants may show stunted growth.Fruit Symptoms: Fruits may display mottling, discoloration, or distortion.',
      diseaseCauses:
          'Pathogen: Tomato Mosaic Virus (ToMV) belongs to the Tobamovirus genus and can affect tomatoes.Infected Plants: The primary source of Tomato Mosaic Virus is infected plants.Seeds: The virus can be transmitted through infected seeds, leading to the spread of the virus to new plantings.',
      diseasePrevention:
          'Genetic Resistance:Resistant Varieties: Plant tomato varieties with documented resistance to Tomato .Avoid Tobacco Planting:Plant Separation: Avoid planting tomatoes near tobacco plants to reduce the risk of cross-infection.Environmental Modifications:Improve Air Circulation: Enhance airflow around plants to reduce humidity and discourage virus spread.',
      diseaseRecovery:
          'Fungicide Application (for Secondary Infections):Curative Measures: In the case of secondary fungal infections due to weakened plants, consider appropriate fungicide application.Remove Infected Plants:Prompt Removal: Remove and destroy infected plants immediately to prevent further spread of the virus.Isolation and Quarantine:Isolate Infected Plants: Keep infected plants isolated from healthy ones to prevent virus transmission.',
      diseaseName: 'Mosaic Virus',
      plantCategory: 'tomato'),
];