import 'package:flutter/material.dart';

final scaffoldBackgroundColor = Color(0xfff5f5f5);

ThemeData appTheme = ThemeData(
  primaryColor: appPrimary,
  // accentColor: appSecondary,
  fontFamily: "Futura",
  visualDensity: VisualDensity.adaptivePlatformDensity,
  tabBarTheme: TabBarTheme(
    labelColor: appPrimaryBg,
    labelStyle: $title.copyWith(fontSize: 14),
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 3,
          color: appSecondary,
        ),
      ),
    ),
  ),
);

var progressBarColor = AlwaysStoppedAnimation<Color>(appPrimary);

const Color mainColor = Color(0xff0029fc);
const Color accentColor = Color(0xff000000);
const Color lightBlue = Color(0xffd1e4ff);
const Color lightGreen = Color(0xffcbeddf);
const Color lightGray = Color(0xfff5f5f5);
const Color deepGreen = Color(0xff95d8b9);

// const Color appPrimary = Color(0xFF2abd69);
const Color appPrimary = Color(0xFF175694);
const Color appBlack = Color(0xFF282828);
//
const Color appPrimary100 = Color(0xFF2483E2);
const Color appPrimary200 = Color(0xFF2175C9);
const Color appPrimary300 = Color(0xFFe44a4d);
const Color appPrimary400 = Color(0xFFe03437);
const Color appPrimary500 = appPrimary;
const Color appPrimary600 = Color(0xFFc71a1e);
const Color appPrimary700 = Color(0xFF185897);
const Color appPrimary800 = Color(0xFF134577);
const Color appPrimary900 = Color(0xFF0D3358);
//
// const Color appSecondary = Color(0xFF1e345b);
const Color appSecondary = Color(0xFF3CC26D);
const Color appSecondary100 = Color(0xFF38F087);
const Color appSecondary200 = Color(0xFF32DA7B);
const Color appSecondary500 = appSecondary;
const Color appSecondary700 = Color(0xFF11a952);
const Color appSecondary800 = Color(0xFF076d33);
const Color appSecondary900 = Color(0xFF044620);

//
// const Color appPrimaryBg100 = Color(0xFFB6D2E5);
const Color appPrimaryBg100 = Color(0xFF094e920c);
// const Color appPrimaryBg100 = Color(0xFFCFE3F0);
const Color appPrimaryBg200 = Color(0xFFECF1F5);
const Color appPrimaryBg = Color(0xFFD2E5F3);
const Color appPrimaryBg500 = Color(0xFF9FD4F8);
const Color appPrimaryBorder = Color(0xFF87B7EA);
const Color appPrimaryText = Color(0xFF003F7C);
const Color appPrimaryDark = Color(0xFF003F7C);
const Color appSecondaryBg = Color(0xFF3CC26D);
// const Color appSecondaryBorder = Color(0xFF3CC26D);
const Color appSecondaryBorder = Color(0xFF2C8F50);
const Color appSecondaryDark = Color(0xFF246E3F);
// const Color appSecondaryBorder = Color(0xFF707070);
const Color appSecondaryText = Color(0xFFffffff);
const Color appDisabled = Color(0xFF707070);
const Color appDisabledDark = Color(0xFF4D4D4D);

class AppColors {
  static Color getColorHexFromStr(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static final Color colorAccent = getColorHexFromStr('#1e345b');
  static final Color colorPrimary = getColorHexFromStr('#2abd69');
  static final Color colorPrimaryDark = getColorHexFromStr('#11a952');
}

///** BOXDECORATIONS */

BorderRadius appRadius = BorderRadius.circular(5); //

// Button Primary Decoration
BoxDecoration decorationPrimary = BoxDecoration(
  borderRadius: appRadius,
  border: Border.all(
    width: 1.2,
    color: appPrimaryBorder,
  ),
  color: appPrimaryBg,
);

// Button Secondary Decoration

BoxDecoration decorationSecondary = BoxDecoration(
  borderRadius: appRadius,
  border: Border.all(
    width: 1.2,
    color: appSecondaryBorder,
  ),
  color: appSecondaryBg,
);
// Button Secondary Decoration

BoxDecoration decorationDisabled = BoxDecoration(
  borderRadius: appRadius,
  border: Border.all(
    width: 1.2,
    // color: appSecondaryBorder,
    color: appDisabled,
  ),
  color: appDisabled,
);

// Light Box Decoration
BoxDecoration decorationLightBox = BoxDecoration(
  borderRadius: appRadius,
  color: appPrimaryBg,
);

///** TEXTSTYLES */

// Djamo Todo

TextStyle $hintStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);
//
TextStyle $appTitle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  fontSize: 27,
);

//
TextStyle $appBarTitle = $appTitle.copyWith(
  fontSize: 20,
  fontStyle: FontStyle.normal,
);

TextStyle $title = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 20,
);

TextStyle $titleBlue = $title.copyWith(color: mainColor);

TextStyle $subtitle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

TextStyle $boldBlueText = TextStyle(
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: mainColor,
  fontSize: 18,
);

/// options text style
TextStyle $settingOption = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
);

/// for versions
TextStyle $smallText = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

// Buttons
TextStyle $buttonTextBlue = TextStyle(
  fontWeight: FontWeight.w600,
  color: mainColor,
);
