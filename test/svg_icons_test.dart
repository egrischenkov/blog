import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:blog/core/assets/res//resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(AppSvgIcons.icGithub).existsSync(), isTrue);
    expect(File(AppSvgIcons.icLinkedin).existsSync(), isTrue);
    expect(File(AppSvgIcons.icTelegram).existsSync(), isTrue);
    expect(File(AppSvgIcons.icVk).existsSync(), isTrue);
  });
}
