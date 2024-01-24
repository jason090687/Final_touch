class BoardingHouse {
  final String imageUrl;
  final String discount;
  final String rating;
  final String name;
  final String location;
  final String price;

  BoardingHouse({
    required this.imageUrl,
    required this.discount,
    required this.rating,
    required this.name,
    required this.location,
    required this.price,
  });
}

class Amenity {
  final String imgPath;
  final String aminity;
  final String internet;

  Amenity({
    required this.imgPath,
    required this.aminity,
    required this.internet,
  });
}
