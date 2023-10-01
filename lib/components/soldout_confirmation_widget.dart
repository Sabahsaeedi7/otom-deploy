import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'soldout_confirmation_model.dart';
export 'soldout_confirmation_model.dart';

class SoldoutConfirmationWidget extends StatefulWidget {
  const SoldoutConfirmationWidget({
    Key? key,
    required this.carrefForSoldingOut,
  }) : super(key: key);

  final DocumentReference? carrefForSoldingOut;

  @override
  _SoldoutConfirmationWidgetState createState() =>
      _SoldoutConfirmationWidgetState();
}

class _SoldoutConfirmationWidgetState extends State<SoldoutConfirmationWidget> {
  late SoldoutConfirmationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoldoutConfirmationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 377.0,
        height: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Color(0xFFE5006E),
            width: 3.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Text(
                'دلنیای لە فرۆشتنی سەیارەکەت؟',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Lottie.asset(
                'assets/lottie_animations/soldout.json',
                width: 200.0,
                height: 130.0,
                fit: BoxFit.cover,
                animate: true,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  hoverColor: FlutterFlowTheme.of(context).customColor3,
                  hoverIconColor: FlutterFlowTheme.of(context).primaryBtnText,
                  icon: Icon(
                    Icons.cancel,
                    color: FlutterFlowTheme.of(context).customColor3,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  hoverColor: FlutterFlowTheme.of(context).customColor3,
                  hoverIconColor: FlutterFlowTheme.of(context).primaryBtnText,
                  icon: FaIcon(
                    FontAwesomeIcons.solidCheckCircle,
                    color: Color(0xF113B419),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.carrefForSoldingOut!
                        .update(createCarsRecordData(
                      soldout: true,
                      dateOfSale: getCurrentTimestamp,
                    ));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ].divide(SizedBox(height: 20.0)).addToStart(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
