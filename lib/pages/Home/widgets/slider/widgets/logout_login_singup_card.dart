import 'package:klik_app/constants/exports.dart';

class LogoutLoginSignupCard extends StatelessWidget {
  const LogoutLoginSignupCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = LocalStorageService().isUserLoggedIn();

    return RoundedCard(
      backgroundColor: AppColors.lightAmbaer.withValues(alpha: 0.9),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 28.sp,
            color: AppColors.iconColor,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              isLoggedIn
                  ? "Welcome back!"
                  : "Join us to get the best experience",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
          ),
          if (isLoggedIn)
            TextButton(
              onPressed: () async {
                await LocalStorageService().clearSession();
                ToastHelper.showSuccess("You have been logged out.");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInWithEmail()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                "Logout",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            )
          else ...[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignInWidget()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
            SizedBox(width: 6.w),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupWithEmail()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Text(
                "Signup",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
