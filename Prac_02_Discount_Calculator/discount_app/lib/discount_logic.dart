class DiscountLogic {
  const DiscountLogic._();

  static double calculate({
    required double price,
    required double discountPercentage,
  }) {
    if (price < 0) {
      throw ArgumentError('Price cannot be negative.');
    }

    if (discountPercentage < 0 || discountPercentage > 100) {
      throw ArgumentError('Discount percentage must be between 0 and 100.');
    }

    final double discountAmount = price * discountPercentage / 100;

    return price - discountAmount;
  }
}
