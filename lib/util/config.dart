class Config {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiKey = 'ce3747f9814de0e3fc3292c9ef36fcdb';

  static String imageUrl(String path){
    return "https://image.tmdb.org/t/p/w342$path";
  }
}