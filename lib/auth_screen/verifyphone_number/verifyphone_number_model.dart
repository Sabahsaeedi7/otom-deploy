import '/auth/firebase_auth/auth_util.dart';
import '/auth_screen/verifynumber_newuser/verifynumber_newuser_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'verifyphone_number_widget.dart' show VerifyphoneNumberWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyphoneNumberModel extends FlutterFlowModel<VerifyphoneNumberWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for verifynumberNewuser component.
  late VerifynumberNewuserModel verifynumberNewuserModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    verifynumberNewuserModel =
        createModel(context, () => VerifynumberNewuserModel());
  }

  void dispose() {
    unfocusNode.dispose();
    verifynumberNewuserModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
