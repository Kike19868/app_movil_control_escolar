class Info {
  final int id;
  final String name;
  final String image;
 

  const Info({
    required this.id,
    required this.name,
    required this.image,
 
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json['id'],
        name: json['name'],
        image: json['img'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': name,
        'image': image,
      };
  Info copy() => Info(
        id: id,
        name: name,
        image: image,
      );
}