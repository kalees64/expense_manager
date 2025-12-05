import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color primaryDark = Color(0xFF4B45D9);

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF1A1A2E);

  // Text Colors
  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Color(0xFF95A5A6);

  // Status Colors
  static const Color success = Color(0xFF00B894);
  static const Color warning = Color(0xFFFFBE76);
  static const Color error = Color(0xFFFF7675);
  static const Color info = Color(0xFF74B9FF);

  // Income/Expense Colors
  static const Color income = Color(0xFF00D2A0);
  static const Color expense = Color(0xFFFF6B9D);

  // Category Colors
  static const Color categoryFood = Color(0xFFFFBE76);
  static const Color categoryTransport = Color(0xFF74B9FF);
  static const Color categoryShopping = Color(0xFFFF7675);
  static const Color categoryEntertainment = Color(0xFFA29BFE);
  static const Color categoryBills = Color(0xFFFF6B9D);
  static const Color categoryOthers = Color(0xFF95A5A6);

  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF6C63FF),
    Color(0xFFFF6B9D),
    Color(0xFF00D2A0),
    Color(0xFFFFBE76),
    Color(0xFF74B9FF),
    Color(0xFFA29BFE),
  ];

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF9D97FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient incomeGradient = LinearGradient(
    colors: [Color(0xFF00D2A0), Color(0xFF00B894)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient expenseGradient = LinearGradient(
    colors: [Color(0xFFFF6B9D), Color(0xFFFF7675)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow
  static BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 10,
    offset: const Offset(0, 4),
  );
}
