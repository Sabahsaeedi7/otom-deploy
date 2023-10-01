import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_accountby_phone_widget.dart' show CreateAccountbyPhoneWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountbyPhoneModel
    extends FlutterFlowModel<CreateAccountbyPhoneWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tel widget.
  TextEditingController? telController;
  String? Function(BuildContext, String?)? telControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    telController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
