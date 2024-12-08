import 'package:flutter/material.dart';

/// Number extension with caching
extension NumberExtensions on num {
  /// Static cache for SizedBox instances
  static final Map<String, SizedBox> _cache = {};

  /// Add vertical space with caching
  SizedBox get h {
    final key = 'h_$this';
    return _cache.putIfAbsent(
      key,
      () => SizedBox(height: toDouble()),
    );
  }

  /// Add horizontal space with caching
  SizedBox get w {
    final key = 'w_$this';
    return _cache.putIfAbsent(
      key,
      () => SizedBox(width: toDouble()),
    );
  }
}
