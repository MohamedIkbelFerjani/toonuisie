
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1588196749339-cf8b8ac87138?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Placeholder image
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  const Icon(
                    Icons.public,
                    size: 100,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choose a square. Clean it. Make Tunisia shine 🌍🇹🇳',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.g_mobiledata),
                    label: const Text('Sign in with Google'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.facebook),
                    label: const Text('Sign in with Facebook'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: const Color(0xFF1877F2),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.phone),
                    label: const Text('Sign in with Phone'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
