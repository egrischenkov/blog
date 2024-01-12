import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:blog/core/assets/res//resources.dart';

void main() {
  test('images assets test', () {
    expect(File(AppImages.imgArticlePlaceholder).existsSync(), isTrue);
    expect(File(AppImages.imgAvatar).existsSync(), isTrue);
    expect(File(AppImages.imgHomeBackground).existsSync(), isTrue);
  });
}
