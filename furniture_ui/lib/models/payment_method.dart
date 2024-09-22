final List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    cardHolderName: 'Dinny Dog',
    cardNumber: '3544971344523179',
    cvv: 740,
    expirationDate: '25/07/2026',
    isSelected: true,
  ),
  PaymentMethod(
    cardHolderName: 'Nickola Baudet',
    cardNumber: '3579972761160683',
    cvv: 820,
    expirationDate: '20/05/2027',
    isSelected: false,
  ),
  PaymentMethod(
    cardHolderName: 'Liliane Mathivat',
    cardNumber: '201406668216886',
    cvv: 355,
    expirationDate: '14/07/2029',
    isSelected: false,
  ),
  PaymentMethod(
    cardHolderName: 'Philippa Dilworth',
    cardNumber: '3566221782577268',
    cvv: 209,
    expirationDate: '14/09/2025',
    isSelected: false,
  ),
];

class PaymentMethod {
  final String cardHolderName;
  final String cardNumber;
  final int cvv;
  final String expirationDate;
  bool isSelected;

  PaymentMethod({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expirationDate,
    this.isSelected = false,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      cardHolderName: json['card_holder_name'],
      cardNumber: json['card_number'],
      cvv: json['cvv'],
      expirationDate: json['expiration_date'],
      isSelected: json['is_selected'],
    );
  }
}
