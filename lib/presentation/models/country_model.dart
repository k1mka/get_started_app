class CountryModel {
  final String flag;
  final String region;
  final String phoneID; // TODO: RENAMED
  final String phoneSuffix;

  CountryModel({
    required this.phoneID,
    required this.phoneSuffix,
    required this.flag,
    required this.region,
  });

  String get phoneCode => '$phoneID$phoneSuffix';

  @override
  String toString() {
    return 'CountryModel{flag: $flag, region: $region, phoneID: $phoneID, phoneSuffix: $phoneSuffix}';
  }
}
