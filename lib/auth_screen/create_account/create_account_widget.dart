import '/auth_screen/create_account_with_email/create_account_with_email_widget.dart';
import '/auth_screen/create_accountby_phone/create_accountby_phone_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_account_model.dart';
export 'create_account_model.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  late CreateAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAccountModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiary,
      body: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).primary,
              FlutterFlowTheme.of(context).grayLight
            ],
            stops: [0.5, 1.0],
            begin: AlignmentDirectional(1.0, -1.0),
            end: AlignmentDirectional(-1.0, 1.0),
          ),
        ),
        child: Builder(
          builder: (context) {
            if (FFAppState().createAcount == true) {
              return wrapWithModel(
                model: _model.createAccountWithEmailModel1,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CreateAccountWithEmailWidget(),
              );
            } else if (FFAppState().createAcount == false) {
              return wrapWithModel(
                model: _model.createAccountbyPhoneModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CreateAccountbyPhoneWidget(),
              );
            } else {
              return wrapWithModel(
                model: _model.createAccountWithEmailModel2,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: CreateAccountWithEmailWidget(),
              );
            }
          },
        ),
      ),
    );
  }
}
