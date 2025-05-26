class Service {
  final String id;
  final String title;
  final String description;
  final String icons;
  final String background;
  final String arrowBackground;

  Service({
    required this.id,
    required this.title,
    required this.description,
    required this.icons,
    required this.background,
    required this.arrowBackground,
  });

  factory Service.fromMap(Map<String, dynamic> data, String id) {
    return Service(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      icons: data['icons'] ?? '',
      background: data['background'] ?? '',
      arrowBackground: data['arrowBackground'] ?? '',
    );
  }
}