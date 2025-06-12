import 'package:klik_app/constants/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    final storage = LocalStorageService();
    final isLoggedIn = storage.isUserLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SignInWithEmail()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset('assets/klik_logo.png', height: 120),
            const SizedBox(height: 24),

            // App Name
            Text(
              'Klick App',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFF6F00),
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            // Tagline
            Text(
              'Your Smart Shopping Partner',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 40),

            const SpinKitFadingCircle(color: Color(0xFFFF6F00), size: 40.0),
          ],
        ),
      ),
    );
  }
}
