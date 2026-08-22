import 'package:flutter/material.dart';

import '../domain/booking.dart';

class BookingProvider extends ChangeNotifier {
  final Booking _booking = Booking(
    destination: 'Paris',
    travellers: 1,
    price: 200,
  );

  String get destination => _booking.destination;

  int get travellers => _booking.travellers;

  double get price => _booking.price;

  void updateTravellers(int value) {
    _booking.travellers = value;
    _booking.price = value * 200;
    notifyListeners();
  }
}
