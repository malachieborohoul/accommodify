import 'package:accommodation/core/usecase/usecase.dart';
import 'package:accommodation/core/utils/typedef.dart';
import 'package:accommodation/features/home/domain/entities/accommodation.dart';
import 'package:accommodation/features/home/domain/repositories/accommodation_repository.dart';
import 'package:flutter/material.dart';

class AccommodGetAccommodations implements UsecaseWithoutParams<List<Accommodation>> {
  final AccommodationRepository accommodationRepository;

  AccommodGetAccommodations(this.accommodationRepository);
  @override
  ResultFuture<List<Accommodation>> call() async {
      debugPrint("💡From AccomGetAccommodations ");

        return await accommodationRepository.getAccommodations();

  }
}
