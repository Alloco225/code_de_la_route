import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class BadgeWidget extends StatelessWidget {
  final String? id;
  final String? iconString;
  final IconData? icon;
  const BadgeWidget({
    super.key,
    this.icon,
    this.id,
    this.iconString,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/badges/badge_$id.png",
              fit: BoxFit.contain,
            ),
          ),
          if (icon != null || iconString != null)
            Positioned.fill(
              child: Icon(
                icon ?? iconIndex[iconString] ?? Ionicons.earth,
              ),
            ),
        ],
      ),
    );
  }
}

final Map<String, IconData> iconIndex = {
  "Ionicons.arrow_redo": Ionicons.arrow_redo,
  "Ionicons.ribbon": Ionicons.ribbon,
  "Ionicons.medal": Ionicons.medal,
  "Ionicons.golf": Ionicons.golf,
  "Ionicons.diamond": Ionicons.diamond,
  "Ionicons.earth": Ionicons.earth,
};
