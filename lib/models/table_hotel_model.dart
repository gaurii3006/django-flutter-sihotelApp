class SihotelModel {
  int? id;
  String? name;
  String? location;
  String? contact_email;
  String? contact_phone;
  String? description;
  int? rating;
  String? image;
  int? total_rooms;
  String? price;

  SihotelModel(this.id, this.name, this.contact_email, this.description, this.rating,
      this.image, this.contact_phone, this.total_rooms, this.price);
  SihotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    contact_email = json['contact_email'];
    contact_phone = json['contact_phone'];
    total_rooms = json['total_rooms'];
    price = json['price'];
    rating = json['rating'];
    image = json['image'];
  }

}