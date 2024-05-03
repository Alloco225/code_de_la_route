import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../modules/auth/services/auth_service.dart';

class PremiumGuard extends GetMiddleware {
  // Our middleware content

  final authService = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    return authService.isPremium.value
        ? null
        : const RouteSettings(name: Routes.LOGIN);
  }
}
