import '/auth/firebase_auth/auth_util.dart';
import '/auth_screen/verify_phone/verify_phone_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verifyphonecurrent_user_model.dart';
export 'verifyphonecurrent_user_model.dart';

class VerifyphonecurrentUserWidget extends StatefulWidget {
  const VerifyphonecurrentUserWidget({Key? key}) : super(key: key);

  @override
  _VerifyphonecurrentUserWidgetState createState() =>
      _VerifyphonecurrentUserWidgetState();
}

class _VerifyphonecurrentUserWidgetState
    extends State<VerifyphonecurrentUserWidget> {
  late VerifyphonecurrentUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyphonecurrentUserModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      final smsCodeVal = _model.verifyPhoneModel.pinCodeController!.text;
      if (smsCodeVal == null || smsCodeVal.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Enter SMS verification code.'),
          ),
        );
        return;
      }
      final phoneVerifiedUser = await authManager.verifySmsCode(
        context: context,
        smsCode: smsCodeVal,
      );
      if (phoneVerifiedUser == null) {
        return;
      }

      await currentUserReference!.update(createUsersRecordData(
        isonline: true,
      ));

      context.pushNamedAuth(
        'phonecrationAcount',
        context.mounted,
        queryParameters: {
          'refToupdate': serializeParam(
            currentUserReference,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
      );
    });

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
          child: wrapWithModel(
            model: _model.verifyPhoneModel,
            updateCallback: () => setState(() {}),
            child: VerifyPhoneWidget(),
          ),
        ),
      ),
    );
  }
}
