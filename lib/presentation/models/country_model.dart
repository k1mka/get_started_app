class CountryModel {
  final String flag;
  final String region;
  final String phonePreffix; // TODO: RENAMED
  final String phoneSuffix;

  CountryModel({
    required this.phonePreffix,
    required this.phoneSuffix,
    required this.flag,
    required this.region,
  });

  String get phoneCode => '$phonePreffix$phoneSuffix';
  String get flagAndCode => '$flag $phoneCode';

  @override
  String toString() {
    return 'CountryModel{flag: $flag, region: $region, phoneID: $phonePreffix, phoneSuffix: $phoneSuffix}';
  }
}
