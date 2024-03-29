import 'package:flutter/material.dart';
import 'package:review_premier_pearl/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
   Locale? _locale;

   Locale get locale => _locale ?? const Locale('vi');

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    //_locale = null;
    notifyListeners();
  }
}
