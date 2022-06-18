class ImageModel {
  List<Backdrops>? backdrops;
  String? error;

  ImageModel({this.backdrops});

  ImageModel.withError(String errorMessage) {
    error = errorMessage;
  }

  ImageModel.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <Backdrops>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(Backdrops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Backdrops {
  String? filePath;

  Backdrops({this.filePath});

  Backdrops.fromJson(Map<String, dynamic> json) {
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file_path'] = filePath;
    return data;
  }
}