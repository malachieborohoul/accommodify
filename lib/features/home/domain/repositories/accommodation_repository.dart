import 'package:accommodation/core/utils/typedef.dart';
import 'package:accommodation/features/home/data/models/accommodation_model.dart';



abstract interface class AccommodationRepository {
ResultFuture<List<AccommodationModel>> getAccommodations();
}
