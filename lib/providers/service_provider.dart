import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceProvider with ChangeNotifier {
  List<Service> _services = [];
  bool _isLoading = false;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    print("_services provider ");

    _isLoading = true;
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance.collection('services').get();
      _services = snapshot.docs.map((doc) => Service.fromMap(doc.data(), doc.id)).toList();
      print("_services received ${_services.length}");
    } catch (e) {
      print('Error fetching services: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}