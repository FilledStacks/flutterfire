// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart=2.9

import 'package:firebase_auth_platform_interface/src/auth_provider.dart';

/// Security Assertion Markup Language based provider.
class SAMLAuthProvider extends AuthProvider {
  // ignore: public_member_api_docs
  SAMLAuthProvider(this.providerId)
      : assert(providerId != null),
        super(providerId);

  final String providerId;
}
