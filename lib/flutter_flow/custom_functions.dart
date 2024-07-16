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

String? getFirebaseStoragePath(String? filePath) {
  if (filePath == null) {
    return null;
  }

  final pathPrefix = 'users/$currentUserUid/uploads';
  final timestamp = DateTime.now().microsecondsSinceEpoch;
  final ext = filePath.split('.').last;

  return '$pathPrefix/$timestamp.$ext';
}

FileType getFileTypeFromFilePath(String? filePath) {
  if (filePath == null) {
    return FileType.UNKNOWN;
  }

  String? extension = filePath.split('.').last;

  switch (extension) {
    case 'mp3':
    case 'm4a':
    case 'oga':
    case 'aac':
    case 'wav':
    case 'opus':
    case 'flac':
      return FileType.AUDIO;
    case 'mp4':
    case 'mov':
    case 'm4v':
    case 'avi':
    case 'mpeg':
    case 'webm':
    case 'ogg':
    case 'wmv':
    case 'flv':
    case 'mkv':
    case 'ts':
      return FileType.VIDEO;
    case 'jpg':
    case 'jpeg':
    case 'png':
    case 'gif':
    case 'tiff':
    case 'webp':
    case 'svg':
    case 'bmp':
    case 'ico':
    case 'heic':
    case 'heif':
      return FileType.IMAGE;
    default:
      return FileType.UNKNOWN;
  }
}

int howManySecondsFromNow(DateTime? moment) {
  final now = DateTime.now();
  final difference = moment?.difference(now);
  return difference?.inSeconds ?? 0;
}

List<UploadedFileStruct> sortUploadingFilesDescByUploadStartedAt(
    List<UploadedFileStruct> uploadedFiles) {
  return uploadedFiles;
}

String? getFileNameFromFilePath(String? filePath) {
  if (filePath == null) {
    return null;
  }

  return Uri.decodeFull(filePath.split('/').last);
}

String? getFileExtensionFromFilePath(String? filePath) {
  if (filePath == null) {
    return null;
  }

  return filePath.split('.').last;
}

String? getMimeTypeFromFilePath(String? filePath) {
  return null; // implemeted localy because it depends on 'package:mime_type/mime_type.dart'
}
