class CountryModel {
  final String flag;
  final String region;
  final String subRegion;
  final String phoneID;
  CountryModel({
    required this.phoneID,
    required this.flag,
    required this.region,
    required this.subRegion,
  });

  @override
  String toString() {
    return '{flag: $flag, region: $region, subRegion: $subRegion, phoneID: $phoneID}';
  }
}
