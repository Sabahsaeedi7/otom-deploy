import '/auth_screen/create_accountbynewuser/create_accountbynewuser_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'newuser_account_cration_model.dart';
export 'newuser_account_cration_model.dart';

class NewuserAccountCrationWidget extends StatefulWidget {
  const NewuserAccountCrationWidget({Key? key}) : super(key: key);

  @override
  _NewuserAccountCrationWidgetState createState() =>
      _NewuserAccountCrationWidgetState();
}

class _NewuserAccountCrationWidgetState
    extends State<NewuserAccountCrationWidget> {
  late NewuserAccountCrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewuserAccountCrationModel());

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.createAccountbynewuserModel,
                updateCallback: () => setState(() {}),
                child: CreateAccountbynewuserWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
