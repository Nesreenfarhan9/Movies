class APIConstants {
  static const String baseURL = 'https://route-movie-apis.vercel.app/';
  static const String registerEndpoint = 'auth/register';
  static const String loginEndpoint = 'auth/login';
  static const String forgetPasswordEndpoint = 'auth/reset-password';
  static const String ListMoviesHome = 'https://yts.mx/api/v2/list_movies.json';
}
class Validation {
  static  String? emailValidator(String? email) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
    if (!emailValid) {
      return 'please enter valid email';
    } else if (email.isEmpty) {
      return 'email is required';
    }
    return null;
  }



static  String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

}