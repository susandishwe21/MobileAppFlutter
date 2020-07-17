class BrandMobile {
  List<Brands> brands;

  BrandMobile({this.brands});

  BrandMobile.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = new List<Brands>();
      json['brands'].forEach((v) {
        brands.add(new Brands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  int id;
  String bname;
  String image;

  Brands({this.id, this.bname, this.image});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bname = json['bname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bname'] = this.bname;
    data['image'] = this.image;
    return data;
  }
}
