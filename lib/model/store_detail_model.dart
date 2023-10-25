class DetailStoreModel {
  int? id;
  String? name;
  String? location;
  Contact? contact;
  List<GroceryItems>? groceryItems;

  DetailStoreModel(
      {this.id, this.name, this.location, this.contact, this.groceryItems});

  DetailStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['groceryItems'] != null) {
      groceryItems = <GroceryItems>[];
      json['groceryItems'].forEach((v) {
        groceryItems!.add(new GroceryItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.groceryItems != null) {
      data['groceryItems'] = this.groceryItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact {
  String? phone;
  String? email;

  Contact({this.phone, this.email});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}

class GroceryItems {
  String? name;
  double? price;
  int? discountPercentage;
  String? image;

  GroceryItems({this.name, this.price, this.discountPercentage, this.image});

  GroceryItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['image'] = this.image;
    return data;
  }
}
