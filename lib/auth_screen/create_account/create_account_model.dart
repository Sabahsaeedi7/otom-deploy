import '/auth_screen/create_account_with_email/create_account_with_email_widget.dart';
import '/auth_screen/create_accountby_phone/create_accountby_phone_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for createAccountWithEmail component.
  late CreateAccountWithEmailModel createAccountWithEmailModel1;
  // Model for createAccountbyPhone component.
  late CreateAccountbyPhoneModel createAccountbyPhoneModel;
  // Model for createAccountWithEmail component.
  late CreateAccountWithEmailModel createAccountWithEmailModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createAccountWithEmailModel1 =
        createModel(context, () => CreateAccountWithEmailModel());
    createAccountbyPhoneModel =
        createModel(context, () => CreateAccountbyPhoneModel());
    createAccountWithEmailModel2 =
        createModel(context, () => CreateAccountWithEmailModel());
  }

  void dispose() {
    createAccountWithEmailModel1.dispose();
    createAccountbyPhoneModel.dispose();
    createAccountWithEmailModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
