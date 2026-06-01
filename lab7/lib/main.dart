import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 7 Signup Form',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Form Key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Focus nodes for keyboard navigation
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  // State variables
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptedTerms = false;
  String? _asyncEmailError;

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  // Password strength logic
  double _getPasswordStrength() {
    String p = _passwordController.text;
    if (p.isEmpty) return 0.0;
    int criteriaMet = 0;
    if (p.length >= 8) criteriaMet++;
    if (RegExp(r'\d').hasMatch(p)) criteriaMet++;
    if (RegExp(r'[A-Z]').hasMatch(p)) criteriaMet++;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(p)) criteriaMet++;
    return criteriaMet / 4.0;
  }

  Color _getStrengthColor(double strength) {
    if (strength <= 0.25) return Colors.red;
    if (strength <= 0.5) return Colors.orange;
    if (strength <= 0.75) return Colors.yellow;
    return Colors.green;
  }

  // Form submission logic
  Future<void> _submitForm() async {
    // Close keyboard
    FocusScope.of(context).unfocus();

    // Local validation
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Terms check
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the Terms & Conditions')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _asyncEmailError = null;
    });

    // Simulate async server validation
    await Future.delayed(const Duration(seconds: 2));

    if (_emailController.text.toLowerCase().startsWith('taken')) {
      setState(() {
        _isLoading = false;
        _asyncEmailError = 'This email is already taken';
      });
      // Re-trigger validation to show async error
      _formKey.currentState!.validate();
    } else {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Dismiss keyboard when tapping outside
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Account'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sign up to get started',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Full Name
                  TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Full Name is required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_emailFocusNode),
                  ),
                  const SizedBox(height: 20),

                  // Email
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (_asyncEmailError != null) {
                        setState(() => _asyncEmailError = null);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Enter a valid email address';
                      }
                      return _asyncEmailError;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                  ),
                  const SizedBox(height: 20),

                  // Password
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () =>
                            setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return 'Minimum 8 characters';
                      }
                      if (!RegExp(r'\d').hasMatch(value)) {
                        return 'At least 1 digit required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) => FocusScope.of(context)
                        .requestFocus(_confirmPasswordFocusNode),
                  ),
                  const SizedBox(height: 8),

                  // Password Strength Indicator (Bonus)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Password Strength',
                              style: TextStyle(fontSize: 12)),
                          Text(
                            _getPasswordStrength() <= 0.25
                                ? 'Weak'
                                : _getPasswordStrength() <= 0.5
                                    ? 'Fair'
                                    : _getPasswordStrength() <= 0.75
                                        ? 'Good'
                                        : 'Strong',
                            style: TextStyle(
                              fontSize: 12,
                              color: _getStrengthColor(_getPasswordStrength()),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: _getPasswordStrength(),
                          backgroundColor: Colors.grey[200],
                          color: _getStrengthColor(_getPasswordStrength()),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password
                  TextFormField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    obscureText: _obscureConfirmPassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_reset),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => setState(() =>
                            _obscureConfirmPassword = !_obscureConfirmPassword),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) => _submitForm(),
                  ),
                  const SizedBox(height: 12),

                  // Terms and Conditions (Bonus)
                  CheckboxListTile(
                    title: const Text(
                      'I agree to the Terms & Conditions',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: _acceptedTerms,
                    onChanged: (value) =>
                        setState(() => _acceptedTerms = value ?? false),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  FilledButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Sign Up',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
