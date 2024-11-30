class Accommodation {
  final String id;
  final String title;
  final String image;
  final String date;
  final int price;
  final String address;
  final String description;
  
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  Accommodation(
      {
        required this.id,
        required this.title,
      required this.image,
      required this.date,
      required this.price,
      required this.address,
      required this.description,
     
      required this.latitude,
      required this.longitude,
      required this.imageUrls});

}