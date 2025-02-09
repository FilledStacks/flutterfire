// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart=2.9

import 'interop/auth.dart' as auth_interop;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

import 'firebase_auth_web_user.dart';
import 'utils/web_utils.dart';

/// Web delegate implementation of [UserCredentialPlatform].
class UserCredentialWeb extends UserCredentialPlatform {
  /// Creates a new [UserCredentialWeb] instance.
  UserCredentialWeb(
      FirebaseAuthPlatform auth, auth_interop.UserCredential webUserCredential)
      : super(
          auth: auth,
          // TODO(ehesp): confirm after platform migration this is nullable
          additionalUserInfo: convertWebAdditionalUserInfo(
              webUserCredential.additionalUserInfo),
          // TODO(ehesp): confirm after platform migration this is nullable
          credential: convertWebOAuthCredential(webUserCredential.credential),
          user: UserWeb(auth, webUserCredential.user),
        );
}
