import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/screens/home_screen.dart';
import 'package:ak_kurim_app/services/auth_service.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    var showPaassword = useState(false);

    ref.listen(authServiceProvider, (previous, next) {
      if (next.state == AuthStateEnum.initial) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else if (next.state == AuthStateEnum.authenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else if (next.state == AuthStateEnum.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error ?? 'Login failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: !showPaassword.value,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          // hide the password input
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showPaassword.value = !showPaassword.value;
                      },
                      icon: Icon(
                        showPaassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    ref.read(authServiceProvider.notifier).login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
          if (ref.watch(authServiceProvider).state == AuthStateEnum.loading)
            Container(
              color: Colors.black.withValues(alpha: 0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
