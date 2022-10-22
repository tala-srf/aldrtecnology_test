class DataModel {
  String? da;
  List<Data>? data;

  DataModel({this.da, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    da = json['da'];
    if (json[' data'] != null) {
      data = <Data>[];
      json[' data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['da'] = this.da;
    if (this.data != null) {
      data[' data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? image;
  String? name;

  Data({this.image, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}