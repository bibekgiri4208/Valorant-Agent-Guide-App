import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // --- Accent (same in both themes) ---
  static const Color accent = Color(0xFFFF4654);
  static const Color accentDark = Color(0xFFB52331);

  // --- Teal / Blue / Gold (guide categories) ---
  static const Color teal = Color(0xFF00D4AA);
  static const Color blue = Color(0xFF5B8DEF);
  static const Color gold = Color(0xFFFFB800);

  // --- Role purple ---
  static const Color rolePurple = Color(0xFF9B6DFF);

  // --- Scaffold ---
  static Color scaffold(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF1C252E) : const Color(0xFFF5F5F7);

  // --- Card / Surface ---
  static Color card(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF12181F) : Colors.white;

  // --- Deepest surface (nav bar, modals) ---
  static Color deepSurface(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF0D1117) : const Color(0xFFE8E8EC);

  // --- Primary text ---
  static Color textPrimary(Brightness b) =>
      b == Brightness.dark ? Colors.white : const Color(0xFF1A1A2E);

  // --- Secondary text ---
  static Color textSecondary(Brightness b) =>
      b == Brightness.dark ? Colors.grey : const Color(0xFF6B7280);

  // --- Muted text ---
  static Color textMuted(Brightness b) =>
      b == Brightness.dark ? Colors.white54 : const Color(0xFF9CA3AF);

  // --- Divider / Border ---
  static Color divider(Brightness b) =>
      b == Brightness.dark ? Colors.grey.shade800 : const Color(0xFFE5E7EB);

  // --- Border subtle ---
  static Color borderSubtle(Brightness b) =>
      b == Brightness.dark ? Colors.grey : const Color(0xFFD1D5DB);

  // --- Back arrow tint ---
  static Color backArrow(Brightness b) =>
      b == Brightness.dark ? Colors.white : const Color(0xFF1A1A2E);

  // --- Shadow color for cards ---
  static Color cardShadow(Brightness b) =>
      b == Brightness.dark ? Colors.black.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.08);

  // --- Nav bar border ---
  static Color navBarBorder(Brightness b) =>
      b == Brightness.dark ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.08);

  // --- Nav bar inactive icon ---
  static Color navInactive(Brightness b) =>
      b == Brightness.dark ? Colors.white54 : const Color(0xFF9CA3AF);

  // --- Chip selected text ---
  static Color chipSelectedText(Brightness b) =>
      b == Brightness.dark ? Colors.black : Colors.white;

  // --- Ability description box ---
  static Color abilityDescBox(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF1C252E) : const Color(0xFFF9FAFB);

  // --- Modal barrier / sheet ---
  static Color modalSurface(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF12181F) : Colors.white;

  // --- Loading shimmer placeholder ---
  static Color shimmerPlaceholder(Brightness b) =>
      b == Brightness.dark ? const Color(0xFF1C252E) : const Color(0xFFE5E7EB);

  // --- Overlay black for image darken ---
  static Color imageOverlay(Brightness b) =>
      b == Brightness.dark ? Colors.black.withValues(alpha: 0.5) : Colors.black.withValues(alpha: 0.3);

  // --- Overlay for card background ---
  static Color cardOverlay(Brightness b) =>
      b == Brightness.dark ? Colors.black.withValues(alpha: 0.25) : Colors.black.withValues(alpha: 0.15);

  // --- Video player pause overlay ---
  static Color videoPauseOverlay(Brightness b) =>
      b == Brightness.dark ? Colors.black45 : Colors.black38;

  // --- Splash background ---
  static const Color splashBg = Color(0xFF0F141A);
}
