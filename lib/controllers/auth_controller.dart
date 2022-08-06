import 'package:flutter_dev/models/signup_body_model.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpBody signUpBody) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpBody);
  }
}
