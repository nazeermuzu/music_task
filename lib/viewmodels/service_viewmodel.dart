import '../models/service.dart';

class ServiceViewModel {
  final Service service;

  ServiceViewModel(this.service);

  String get title => service.title;
  String get description => service.description;
  String get icons => service.icons;
  String get background => service.background;
  String get arrowBackground => service.arrowBackground;
}