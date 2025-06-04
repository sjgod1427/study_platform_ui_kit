import 'package:flutter/material.dart';
import 'package:canwa/Screens/add_new_card_screen.dart'; // Import the new screen

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  // Sample data for payment methods
  final List<Map<String, String>> _paymentMethods = [
    {
      'name': 'Mastercard',
      'logo':
          'https://picsum.photos/id/1084/60/40', // Placeholder for Mastercard
      'details': 'Master Card ****2',
    },
    {
      'name': 'Gopay',
      'logo': 'https://picsum.photos/id/403/60/40', // Placeholder for Gopay
      'details': 'Master Card ****2',
    },
    {
      'name': 'Qris',
      'logo': 'https://picsum.photos/id/402/60/40', // Placeholder for Qris
      'details': 'Master Card ****2',
    },
    {
      'name': 'Shopee Pay',
      'logo':
          'https://picsum.photos/id/401/60/40', // Placeholder for Shopee Pay
      'details': 'Master Card ****2',
    },
    {
      'name': 'Visa',
      'logo': 'https://picsum.photos/id/405/60/40', // Placeholder for Visa
      'details': 'Master Card ****2',
    },
  ];

  void _addPaymentMethod() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewCardScreen()),
    );
  }

  void _editPaymentMethod(String methodName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Editing $methodName (logic not implemented).'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _confirmSelection() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment method confirmed (logic not implemented).'),
        duration: Duration(seconds: 2),
      ),
    );
    // Potentially navigate back or to the next step in checkout
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                Colors
                    .grey[100], // Light grey background as seen in notification screen
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black), // Black icon
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Payment Method',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100], // Light grey background
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.black), // Plus icon
              onPressed: _addPaymentMethod,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                return _buildPaymentMethodTile(
                  context,
                  method['name']!,
                  method['logo']!,
                  method['details']!,
                  textTheme,
                  () => _editPaymentMethod(method['name']!),
                );
              },
              separatorBuilder:
                  (context, index) => const Divider(
                    height: 24, // Space between items
                    thickness: 1,
                    color:
                        Colors
                            .transparent, // Invisible divider for spacing, or can be a very light grey
                  ),
            ),
          ),
          // Confirmation Button at the bottom
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmSelection,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Confirmation',
                  style: textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodTile(
    BuildContext context,
    String name,
    String logoUrl,
    String details,
    TextTheme textTheme,
    VoidCallback onEdit,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color:
                  Colors.grey[100], // Light grey background for logo container
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Image.network(
                logoUrl,
                height: 28, // Adjust logo size as per image
                width: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  details,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.grey[600],
            ), // Edit icon
            onPressed: onEdit,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}
