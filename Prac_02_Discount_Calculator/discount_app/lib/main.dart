import 'package:flutter/material.dart';

import 'discount_logic.dart';

void main() {
  runApp(const DiscountCalculatorApp());
}

class DiscountCalculatorApp extends StatelessWidget {
  const DiscountCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discount Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const DiscountCalculatorScreen(),
    );
  }
}

class DiscountCalculatorScreen extends StatefulWidget {
  const DiscountCalculatorScreen({super.key});

  @override
  State<DiscountCalculatorScreen> createState() =>
      _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState
    extends State<DiscountCalculatorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _priceController =
  TextEditingController();

  final TextEditingController _discountController =
  TextEditingController();

  String _result = 'Enter the price and discount percentage.';
  bool _hasError = false;

  void _calculatePrice() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      setState(() {
        _hasError = true;
        _result = 'Please correct the highlighted fields.';
      });
      return;
    }

    try {
      final double price =
      double.parse(_priceController.text.trim());

      final double discountPercentage =
      double.parse(_discountController.text.trim());

      final double finalPrice = DiscountLogic.calculate(
        price: price,
        discountPercentage: discountPercentage,
      );

      final double amountSaved = price - finalPrice;

      setState(() {
        _hasError = false;
        _result =
        'Final Price: \$${finalPrice.toStringAsFixed(2)}\n'
            'You Save: \$${amountSaved.toStringAsFixed(2)}';
      });
    } on ArgumentError catch (error) {
      setState(() {
        _hasError = true;
        _result = error.message.toString();
      });
    } catch (_) {
      setState(() {
        _hasError = true;
        _result = 'Invalid input. Please enter valid numbers.';
      });
    }
  }

  void _clearFields() {
    FocusScope.of(context).unfocus();

    _priceController.clear();
    _discountController.clear();

    _formKey.currentState?.reset();

    setState(() {
      _hasError = false;
      _result = 'Enter the price and discount percentage.';
    });
  }

  @override
  void dispose() {
    _priceController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme =
        Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Calculator'),
        centerTitle: true,
        backgroundColor: colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          Icons.calculate_outlined,
                          size: 70,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Calculate Your Discount',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Enter the original price and discount percentage.',
                          textAlign: TextAlign.center,
                          style:
                          Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 28),
                        TextFormField(
                          controller: _priceController,
                          keyboardType:
                          const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Original Price',
                            hintText: 'Example: 100',
                            prefixIcon:
                            Icon(Icons.attach_money),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter the original price.';
                            }

                            final double? price =
                            double.tryParse(value.trim());

                            if (price == null) {
                              return 'Please enter a valid number.';
                            }

                            if (price < 0) {
                              return 'Price cannot be negative.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 18),
                        TextFormField(
                          controller: _discountController,
                          keyboardType:
                          const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            _calculatePrice();
                          },
                          decoration: const InputDecoration(
                            labelText: 'Discount Percentage',
                            hintText: 'Example: 20',
                            prefixIcon: Icon(Icons.percent),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty) {
                              return 'Please enter the discount percentage.';
                            }

                            final double? discount =
                            double.tryParse(value.trim());

                            if (discount == null) {
                              return 'Please enter a valid number.';
                            }

                            if (discount < 0 ||
                                discount > 100) {
                              return 'Discount must be between 0 and 100.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        FilledButton.icon(
                          onPressed: _calculatePrice,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Calculate'),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: _clearFields,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Clear'),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: _hasError
                                ? colorScheme.errorContainer
                                : colorScheme.secondaryContainer,
                            borderRadius:
                            BorderRadius.circular(12),
                          ),
                          child: Text(
                            _result,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: _hasError
                                  ? colorScheme.onErrorContainer
                                  : colorScheme
                                  .onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}