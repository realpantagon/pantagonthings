import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>?> showAddItemDialog(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _warrantyTimeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  String _selectedBuyFrom = 'Shopee';
  String _selectedType = 'Accessory';
  String _selectedFavorite = 'No';

  return showDialog<Map<String, dynamic>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Item'),
        content: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextFormField(
                  controller: _nameController,
                  label: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: _brandController,
                  label: 'Brand',
                ),
                _buildTextFormField(
                  controller: _warrantyTimeController,
                  label: 'Warranty Time',
                ),
                _buildTextFormField(
                  controller: _priceController,
                  label: 'Price',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    if (double.tryParse(value) == null ||
                        double.parse(value) <= 0) {
                      return 'Please enter a valid positive number';
                    }
                    return null;
                  },
                ),
                _buildTextFormField(
                  controller: _discountController,
                  label: 'Discount',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      if (double.parse(value) < 0) {
                        return 'Discount cannot be negative';
                      }
                    }
                    return null;
                  },
                ),
                _buildDropdownButtonFormField(
                  value: _selectedBuyFrom,
                  label: 'Buy From',
                  items: ['Shopee', 'Lazada', 'TikTok', 'Other'],
                  onChanged: (newValue) {
                    _selectedBuyFrom = newValue!;
                  },
                ),
                _buildDropdownButtonFormField(
                  value: _selectedType,
                  label: 'Type',
                  items: ['Accessory', 'Electronics', 'Clothing'],
                  onChanged: (newValue) {
                    _selectedType = newValue!;
                  },
                ),
                _buildDropdownButtonFormField(
                  value: _selectedFavorite,
                  label: 'Favorite',
                  items: ['Yes', 'No'],
                  onChanged: (newValue) {
                    _selectedFavorite = newValue!;
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final data = {
                  'Name': _nameController.text,
                  'Brand': _brandController.text,
                  'Warranty Time': _warrantyTimeController.text,
                  'Price': _priceController.text,
                  'Discount': _discountController.text.isEmpty
                      ? null
                      : _discountController.text,
                  'Buy From': _selectedBuyFrom,
                  'Type': [_selectedType],
                  'Favorite': _selectedFavorite,
                };
                Navigator.of(context).pop(data);
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

Widget _buildTextFormField({
  required TextEditingController controller,
  required String label,
  TextInputType keyboardType = TextInputType.text,
  FormFieldValidator<String>? validator,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      validator: validator,
    ),
  );
}

Widget _buildDropdownButtonFormField({
  required String value,
  required String label,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    ),
  );
}
