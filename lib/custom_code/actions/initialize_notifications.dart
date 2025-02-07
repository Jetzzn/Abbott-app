// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool initializeNotifications() {
  try {
    FirebaseMessaging.instance
        .requestPermission(
      alert: true,
      badge: true,
      sound: true,
    )
        .then((settings) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        FirebaseMessaging.instance.getToken().then((token) {
          print('FCM Token: $token');

          final currentUser = FirebaseAuth.instance.currentUser;
          if (token != null && currentUser != null) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.uid)
                .set({
              'fcmToken': token,
              'lastTokenUpdate': DateTime.now().toUtc(),
            }, SetOptions(merge: true));
          }
        });
      }
    });
    return true;
  } catch (e) {
    print('Error initializing notifications: $e');
    return false;
  }
}
