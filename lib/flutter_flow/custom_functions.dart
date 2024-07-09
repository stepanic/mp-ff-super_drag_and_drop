import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? fileUrlToAudioPath(String? fileUrl) {
  if (fileUrl == null) {
    return null;
  }

  return fileUrl;
}

String imageKitAsFirebaseStorageProxy(
  String firebaseStorageUrl,
  String firebaseStoragePrefix,
  String imageKitPrefix,
) {
  String inputUrl = firebaseStorageUrl;

  // Define the part of the URL to be replaced
  String partToReplace = firebaseStoragePrefix;
  // Define the replacement part of the URL
  String replacementPart = imageKitPrefix;

  // Replace the specified part of the input URL with the replacement part
  String outputUrl = inputUrl.replaceAll(partToReplace, replacementPart);

  // Replace %2F with /
  outputUrl = outputUrl.replaceAll("%2F", "/");

  // Remove query parameters if they exist
  outputUrl = outputUrl.split("?").first;

  return outputUrl;
}
