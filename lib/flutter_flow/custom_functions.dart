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
import '/auth/firebase_auth/auth_util.dart';

String? calculateTargetDate(
  DateTime? posttime,
  int? duration,
) {
  if (posttime == null || duration == null) {
    return null;
  }

  DateTime targetDate = posttime.add(Duration(days: duration));
  String formattedDate = targetDate.toString();
  return formattedDate;
}

String? remainigdays(DateTime? experitonDte) {
  // an argument type datatime ,calculated remsining days from now till the argumant date ,return days
  if (experitonDte == null) {
    return null;
  }

  DateTime now = DateTime.now();
  Duration remainingTime = experitonDte.difference(now);
  int remainingDays = remainingTime.inDays;
  return remainingDays.toString();
}
