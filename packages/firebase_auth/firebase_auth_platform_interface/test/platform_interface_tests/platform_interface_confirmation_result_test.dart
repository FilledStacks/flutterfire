// Copyright 2020, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart=2.9

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  String kMockVerificationId = 'test-id';

  group('$ConfirmationResultPlatform()', () {
    /*late*/ TestConfirmationResultPlatform confirmationResultPlatform;

    setUpAll(() async {
      confirmationResultPlatform =
          TestConfirmationResultPlatform(kMockVerificationId);
    });

    test('Constructor', () {
      expect(confirmationResultPlatform, isA<ConfirmationResultPlatform>());
      expect(confirmationResultPlatform, isA<PlatformInterface>());
    });

    group('verifyExtends()', () {
      test('calls successfully', () {
        try {
          ConfirmationResultPlatform.verifyExtends(confirmationResultPlatform);
          return;
        } catch (_) {
          fail('thrown an unexpected exception');
        }
      });

      test('throws an [AssertionError] exception when instance is null', () {
        expect(() => ConfirmationResultPlatform.verifyExtends(null),
            throwsAssertionError);
      });
    });

    test('throws if confirm()', () async {
      try {
        await confirmationResultPlatform.confirm(kMockVerificationId);
      } on UnimplementedError catch (e) {
        expect(e.message, equals('confirm() is not implemented'));
        return;
      }
      fail('Should have thrown an [UnimplementedError]');
    });
  });
}

class TestConfirmationResultPlatform extends ConfirmationResultPlatform {
  TestConfirmationResultPlatform(verificationId) : super(verificationId);
}
