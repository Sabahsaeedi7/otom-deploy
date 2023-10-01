import '/auth/firebase_auth/auth_util.dart';
import '/auth_screen/verify_phone/verify_phone_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'verifyphonecurrent_user_widget.dart' show VerifyphonecurrentUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyphonecurrentUserModel
    extends FlutterFlowModel<VerifyphonecurrentUserWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for verifyPhone component.
  late VerifyPhoneModel verifyPhoneModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    verifyPhoneModel = createModel(context, () => VerifyPhoneModel());
  }

  void dispose() {
    unfocusNode.dispose();
    verifyPhoneModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
