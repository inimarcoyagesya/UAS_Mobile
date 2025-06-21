// lib/models/hotel.dart
class Hotel {
  final String id;
  final String name;
  final String location;
  final double pricePerNight;
  final List<String> imageUrls;
  final double rating;

  Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.pricePerNight,
    required this.imageUrls,
    required this.rating,
  });

  factory Hotel.fromMap(String id, Map<String, dynamic> data) {
    return Hotel(
      id: id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      pricePerNight: (data['price'] as num).toDouble(),
      imageUrls: List<String>.from(data['images'] ?? []),
      rating: (data['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'location': location,
    'price': pricePerNight,
    'images': imageUrls,
    'rating': rating,
  };
}
