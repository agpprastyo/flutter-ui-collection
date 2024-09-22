final List<ShippingAddress> shippingAddresses = [
  ShippingAddress(
    fullName: 'Karyn Pescott',
    address: '32 Eagle Crest Crossing',
    zipCode: 'null',
    country: 'Gambia',
    city: 'Karantaba',
    district: 'Apt 1165',
    isSelected: true,
  ),
  ShippingAddress(
    fullName: 'Dane Eakens',
    address: '03 Truax Lane',
    zipCode: 'null',
    country: 'Indonesia',
    city: 'Numeto',
    district: 'PO Box 52395',
    isSelected: false,
  ),
  ShippingAddress(
    fullName: 'Chaddy Rustidge',
    address: '65063 Lindbergh Avenue',
    zipCode: 'null',
    country: 'Azerbaijan',
    city: 'Ağdaş',
    district: 'PO Box 42159',
    isSelected: false,
  ),
];

class ShippingAddress {
  final String fullName;
  final String address;
  final String zipCode;
  final String country;
  final String city;
  final String district;
  bool isSelected;

  ShippingAddress({
    required this.fullName,
    required this.address,
    required this.zipCode,
    required this.country,
    required this.city,
    required this.district,
    this.isSelected = false,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      fullName: json['full_name'],
      address: json['address'],
      zipCode: json['zip_code'],
      country: json['country'],
      city: json['city'],
      district: json['district'],
      isSelected: json['is_selected'],
    );
  }
}
