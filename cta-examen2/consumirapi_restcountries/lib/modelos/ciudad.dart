class CountryModel {
  final String name;
  final String code;
  final String capital;
  final String region;
  final int population;
  final String flag;

  CountryModel({
    required this.name,
    required this.code,
    required this.capital,
    required this.region,
    required this.population,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'] ?? 'N/A',
      code: json['cca3'] ?? 'N/A',
      capital: (json['capital'] != null && json['capital'].isNotEmpty)
          ? json['capital'][0]
          : 'N/A',
      region: json['region'] ?? 'N/A',
      population: json['population'] ?? 0,
      flag: json['flags']['png'] ?? '',
    );
  }
}
