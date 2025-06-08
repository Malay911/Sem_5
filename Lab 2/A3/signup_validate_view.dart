import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(
    home: SignupValidateView(),
    debugShowCheckedModeBanner: false,
  ));
}

class SignupValidateView extends StatefulWidget {
  const SignupValidateView({super.key});

  @override
  State<SignupValidateView> createState() => _SignupValidateViewState();
}

class _SignupValidateViewState extends State<SignupValidateView> {
  final SignupController _controller = SignupController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Form with Validation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLength: 10,
                controller: _phoneController,
                decoration: const InputDecoration(
                  counterText: "",
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validatePhone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: _controller.validatePassword,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => _controller.validateConfirmPassword(
                  _passwordController.text,
                  value,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _controller.addUser(
                        _nameController.text,
                        _emailController.text,
                        _phoneController.text,
                        _passwordController.text,
                        _confirmPasswordController.text,
                      );
                    });

                    _nameController.clear();
                    _emailController.clear();
                    _phoneController.clear();
                    _passwordController.clear();
                    _confirmPasswordController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signup Successful!')),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 32),
              const Text(
                'Registered Users:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.getUsers().length,
                itemBuilder: (context, index) {
                  final user = _controller.getUsers()[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${user['name']}'),
                          Text('Email: ${user['email']}'),
                          Text('Phone: ${user['phoneNumber']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
