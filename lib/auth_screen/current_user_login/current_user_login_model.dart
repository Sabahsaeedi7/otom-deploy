import '/auth_screen/create_accountby_phone/create_accountby_phone_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'current_user_login_widget.dart' show CurrentUserLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentUserLoginModel extends FlutterFlowModel<CurrentUserLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for createAccountbyPhone component.
  late CreateAccountbyPhoneModel createAccountbyPhoneModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createAccountbyPhoneModel =
        createModel(context, () => CreateAccountbyPhoneModel());
  }

  void dispose() {
    unfocusNode.dispose();
    createAccountbyPhoneModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
