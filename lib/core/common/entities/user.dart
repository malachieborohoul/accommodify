class User {
  final String id;
  final String name;
  final String email;
  
  final String avatar;
  final DateTime updatedAt;

  User( {
    required this.id,
    required this.name,
    required this.email,
 
    required this.avatar,
    required this.updatedAt,
  });
}
