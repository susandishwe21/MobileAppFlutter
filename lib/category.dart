class Category {
  List<Specificates> specificates;

  Category({this.specificates});

  Category.fromJson(Map<String, dynamic> json) {
    if (json['specificates'] != null) {
      specificates = new List<Specificates>();
      json['specificates'].forEach((v) {
        specificates.add(new Specificates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specificates != null) {
      data['specificates'] = this.specificates.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specificates {
  String cname;
  String bname;
  String id;
  String categoryId;
  String cpu;
  String memory;
  String mainCamera;
  String selfieCamera;
  String battery;
  String features;
  String display;
  String capacity;
  String price;
  String image;
  String os;
  String date;
  String review;
  String youtube;
  String cpuRank;
  String gpuRank;
  String memoryRank;
  String uxRank;
  String total;
  String createdAt;
  String updatedAt;

  Specificates(
      {this.cname,
      this.bname,
      this.id,
      this.categoryId,
      this.cpu,
      this.memory,
      this.mainCamera,
      this.selfieCamera,
      this.battery,
      this.features,
      this.display,
      this.capacity,
      this.price,
      this.image,
      this.os,
      this.date,
      this.review,
      this.youtube,
      this.cpuRank,
      this.gpuRank,
      this.memoryRank,
      this.uxRank,
      this.total,
      this.createdAt,
      this.updatedAt});

  Specificates.fromJson(Map<String, dynamic> json) {
    cname = json['cname'];
    bname = json['bname'];
    id = json['id'];
    categoryId = json['category_id'];
    cpu = json['cpu'];
    memory = json['memory'];
    mainCamera = json['main_camera'];
    selfieCamera = json['selfie_camera'];
    battery = json['battery'];
    features = json['features'];
    display = json['display'];
    capacity = json['capacity'];
    price = json['price'];
    image = json['image'];
    os = json['os'];
    date = json['date'];
    review = json['review'];
    youtube = json['youtube'];
    cpuRank = json['cpu_rank'];
    gpuRank = json['gpu_rank'];
    memoryRank = json['memory_rank'];
    uxRank = json['ux_rank'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cname'] = this.cname;
    data['bname'] = this.bname;
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['cpu'] = this.cpu;
    data['memory'] = this.memory;
    data['main_camera'] = this.mainCamera;
    data['selfie_camera'] = this.selfieCamera;
    data['battery'] = this.battery;
    data['features'] = this.features;
    data['display'] = this.display;
    data['capacity'] = this.capacity;
    data['price'] = this.price;
    data['image'] = this.image;
    data['os'] = this.os;
    data['date'] = this.date;
    data['review'] = this.review;
    data['youtube'] = this.youtube;
    data['cpu_rank'] = this.cpuRank;
    data['gpu_rank'] = this.gpuRank;
    data['memory_rank'] = this.memoryRank;
    data['ux_rank'] = this.uxRank;
    data['total'] = this.total;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
