#!/usr/bin/env bash

fvm flutter pub run spider build &&
  fvm dart format -l 120 . && fvm flutter test --update-goldens test/images_test.dart && fvm flutter test --update-goldens test/svg_icons_test.dart
