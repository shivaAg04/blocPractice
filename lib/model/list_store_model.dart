class ListStoreModel {
  int? id;
  String? name;
  String? location;
  Contact? contact;

  ListStoreModel({this.id, this.name, this.location, this.contact});

  ListStoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
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
