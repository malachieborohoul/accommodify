import 'package:Accommodify/core/utils/typedef.dart';
import 'package:Accommodify/features/home/data/models/accommodation_model.dart';



abstract interface class AccommodationRepository {
ResultFuture<List<AccommodationModel>> getAccommodations();
}
