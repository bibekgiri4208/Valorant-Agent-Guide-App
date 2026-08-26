import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _autoplayKey = 'video_autoplay';
  bool _autoplayEnabled = true;

  bool get autoplayEnabled => _autoplayEnabled;

  SettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _autoplayEnabled = prefs.getBool(_autoplayKey) ?? true;
    notifyListeners();
  }

  Future<void> setAutoplay(bool enabled) async {
    _autoplayEnabled = enabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_autoplayKey, enabled);
  }

  void toggleAutoplay() {
    setAutoplay(!_autoplayEnabled);
  }
}
