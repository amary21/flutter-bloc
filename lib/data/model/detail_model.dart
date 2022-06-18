class DetailModel {
  int? runtime;
  List<Genres>? genres;
  LastEpisodeToAir? lastEpisodeToAir;
  String? error;

  DetailModel({this.runtime, this.genres, this.lastEpisodeToAir});

  DetailModel.withError(String errorMessage) {
    error = errorMessage;
  }

  DetailModel.fromJson(Map<String, dynamic> json) {
    runtime = json['runtime'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['runtime'] = runtime;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (lastEpisodeToAir != null) {
      data['last_episode_to_air'] = lastEpisodeToAir!.toJson();
    }
    return data;
  }
}

class Genres {
  String? name;

  Genres({this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class LastEpisodeToAir {
  int? runtime;

  LastEpisodeToAir({this.runtime});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    runtime = json['runtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['runtime'] = runtime;
    return data;
  }
}
