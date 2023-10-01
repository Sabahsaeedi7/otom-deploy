import '/auth_screen/create_accountby_phone/create_accountby_phone_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'current_user_login_model.dart';
export 'current_user_login_model.dart';

class CurrentUserLoginWidget extends StatefulWidget {
  const CurrentUserLoginWidget({Key? key}) : super(key: key);

  @override
  _CurrentUserLoginWidgetState createState() => _CurrentUserLoginWidgetState();
}

class _CurrentUserLoginWidgetState extends State<CurrentUserLoginWidget> {
  late CurrentUserLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentUserLoginModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: wrapWithModel(
              model: _model.createAccountbyPhoneModel,
              updateCallback: () => setState(() {}),
              child: CreateAccountbyPhoneWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
