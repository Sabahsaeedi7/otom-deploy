import '/auth_screen/create_accountbynewuser/create_accountbynewuser_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'newuser_account_cration_widget.dart' show NewuserAccountCrationWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewuserAccountCrationModel
    extends FlutterFlowModel<NewuserAccountCrationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for createAccountbynewuser component.
  late CreateAccountbynewuserModel createAccountbynewuserModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createAccountbynewuserModel =
        createModel(context, () => CreateAccountbynewuserModel());
  }

  void dispose() {
    unfocusNode.dispose();
    createAccountbynewuserModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
