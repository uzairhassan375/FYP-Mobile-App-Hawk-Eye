import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/custom_button.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _studentNameController = TextEditingController();
  final _sapIdController = TextEditingController();
  final _departmentController = TextEditingController();

  String? _selectedCategory;
  bool _showOptionalFields = false;

  final List<String> _categories = [
    'Littering',
    'Noise Disturbance',
    'Smoking',
    'Parking Violation',
    'Vandalism',
    'Other',
  ];

  @override
  void dispose() {
    _categoryController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _studentNameController.dispose();
    _sapIdController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Submit Report',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF333333)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video Evidence Section
                const Text(
                  'Video Evidence (5-10 sec)',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    // Handle video recording/upload
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.videocam,
                          size: 48,
                          color: Color(0xFF999999),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Record or Upload Video',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'MP4, MOV • Max 50MB • 5-10 seconds',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle record
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Record'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFF2196F3)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Handle upload
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: Color(0xFF2196F3)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Category Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                        Text(
                          ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      hint: const Text('Select violation type'),
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Description Field
                CustomInputField(
                  label: 'Description',
                  placeholder: 'Describe what happened...',
                  prefixIcon: Icons.description,
                  controller: _descriptionController,
                  isRequired: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Location Field
                CustomInputField(
                  label: 'Location',
                  placeholder: 'e.g., Building A, Room 101',
                  prefixIcon: Icons.location_on,
                  controller: _locationController,
                ),
                const SizedBox(height: 24),
                // Student Details (Optional)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showOptionalFields = !_showOptionalFields;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Student Details (Optional)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                        Icon(
                          _showOptionalFields ? Icons.expand_less : Icons.expand_more,
                          color: const Color(0xFF333333),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_showOptionalFields) ...[
                  const SizedBox(height: 16),
                  CustomInputField(
                    label: 'Student Name',
                    placeholder: 'If known',
                    prefixIcon: Icons.person,
                    controller: _studentNameController,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: 'SAP ID',
                    placeholder: 'SAP123456',
                    prefixIcon: Icons.badge,
                    controller: _sapIdController,
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                    label: 'Department',
                    placeholder: 'CS, ECE...',
                    prefixIcon: Icons.school,
                    controller: _departmentController,
                  ),
                ],
                const SizedBox(height: 32),
                // Submit Button
                CustomButton(
                  text: 'Submit Report',
                  icon: Icons.send,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Report submitted successfully!')),
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
