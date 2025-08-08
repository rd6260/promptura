// class DarkTheme {
//   // Background colors
//   static const int primaryBackground = 0xFF121212;
//   static const int secondaryBackground = 0xFF1E1E1E;
//   static const int surfaceBackground = 0xFF2D2D2D;

//   // Text colors
//   static const int primaryText = 0xFFFFFFFF;
//   static const int secondaryText = 0xFFB3B3B3;
//   static const int tertiaryText = 0xFF808080;

//   // Accent colors
//   static const int accent = 0xFFC8102E;
//   static const int accentSecondary = 0xFF4CAF50;

//   // Border and divider colors
//   static const int border = 0xFF404040;
//   static const int divider = 0xFF333333;

//   // Status colors
//   static const int error = 0xFFFF5252;
//   static const int warning = 0xFFFF9800;
//   static const int success = 0xFF4CAF50;
// }

// class LightTheme {
//   // Background colors
//   static const int primaryBackground = 0xFFFFFFFF;
//   static const int secondaryBackground = 0xFFF8F9FA;
//   static const int surfaceBackground = 0xFFF1F3F4;

//   // Text colors
//   static const int primaryText = 0xFF212121;
//   static const int secondaryText = 0xFF757575;
//   static const int tertiaryText = 0xFF9E9E9E;

//   // Accent colors
//   static const int accent = 0xFFC8102E;
//   static const int accentSecondary = 0xFF4CAF50;

//   // Border and divider colors
//   static const int border = 0xFFE0E0E0;
//   static const int divider = 0xFFEEEEEE;

//   // Status colors
//   static const int error = 0xFFD32F2F;
//   static const int warning = 0xFFFF6F00;
//   static const int success = 0xFF388E3C;
// }
import 'package:flutter/cupertino.dart';

class DarkTheme {
  // Background
  static Color primaryBackground = HSLColor.fromAHSL(1, 0, 0, 0).toColor();
  static Color secondaryBackground = HSLColor.fromAHSL(1, 0, 0, 0.05).toColor();
  static Color surfaceBackground = HSLColor.fromAHSL(1, 0, 0, 0.10).toColor();

  // Text
  static Color primaryText = HSLColor.fromAHSL(1, 0, 0, 0.95).toColor();
  static Color secondaryText = HSLColor.fromAHSL(1, 0, 0, 0.70).toColor();

  // Border
  static Color border = HSLColor.fromAHSL(1, 0, 0, 0.30).toColor();
}

class LightTheme {
  // Background colors
  static Color primaryBackground = HSLColor.fromAHSL(1, 0, 0, 0.90).toColor();
  static Color secondaryBackground = HSLColor.fromAHSL(1, 0, 0, 0.95).toColor();
  static Color surfaceBackground = HSLColor.fromAHSL(1, 0, 0, 1.00).toColor();

  // Text colors
  static Color primaryText = HSLColor.fromAHSL(1, 0, 0, 0.05).toColor();
  static Color secondaryText = HSLColor.fromAHSL(1, 0, 0, 0.30).toColor();

  // Accent colors

  // Border and divider colors

  // Status colors
}



// --bg-dark: hsl(336 0% 1%);
// --bg: hsl(330 0% 4%);
// --bg-light: hsl(0 0% 9%);

// --text: hsl(0 0% 95%);
// --text-muted: hsl(300 0% 69%);

// --highlight: hsl(330 0% 39%);

// --border: hsl(0 0% 28%);
// --border-muted: hsl(300 0% 18%);

// --primary: hsl(0 66% 75%);
// --secondary: hsl(183 52% 57%);
// --danger: hsl(9 26% 64%);
// --warning: hsl(52 19% 57%);
// --success: hsl(146 17% 59%);
// --info: hsl(217 28% 65%);