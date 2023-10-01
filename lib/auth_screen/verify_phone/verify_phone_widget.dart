import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_phone_model.dart';
export 'verify_phone_model.dart';

class VerifyPhoneWidget extends StatefulWidget {
  const VerifyPhoneWidget({Key? key}) : super(key: key);

  @override
  _VerifyPhoneWidgetState createState() => _VerifyPhoneWidgetState();
}

class _VerifyPhoneWidgetState extends State<VerifyPhoneWidget> {
  late VerifyPhoneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyPhoneModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primaryBtnText,
            Color(0xFF890DCE)
          ],
          stops: [0.0, 0.5],
          begin: AlignmentDirectional(1.0, 0.0),
          end: AlignmentDirectional(-1.0, 0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'ئەو کۆدەی بە ڕسالە بۆت هات داخیلی بکە',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Noto Sans Arabic',
                  color: FlutterFlowTheme.of(context).customColor1,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
          PinCodeTextField(
            autoDisposeControllers: false,
            appContext: context,
            length: 6,
            textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            enableActiveFill: false,
            autoFocus: true,
            enablePinAutofill: false,
            errorTextSpace: 16.0,
            showCursor: true,
            cursorColor: FlutterFlowTheme.of(context).primary,
            obscureText: false,
            hintCharacter: '●',
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              fieldHeight: 44.0,
              fieldWidth: 44.0,
              borderWidth: 2.0,
              borderRadius: BorderRadius.circular(12.0),
              shape: PinCodeFieldShape.box,
              activeColor: FlutterFlowTheme.of(context).primaryText,
              inactiveColor: FlutterFlowTheme.of(context).alternate,
              selectedColor: FlutterFlowTheme.of(context).primary,
              activeFillColor: FlutterFlowTheme.of(context).primaryText,
              inactiveFillColor: FlutterFlowTheme.of(context).alternate,
              selectedFillColor: FlutterFlowTheme.of(context).primary,
            ),
            controller: _model.pinCodeController,
            onChanged: (_) {},
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _model.pinCodeControllerValidator.asValidator(context),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.solidClock,
                color: Color(0xE1FFDA78),
                size: 30.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: FlutterFlowTimer(
                  initialTime: _model.timerMilliseconds,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    milliSecond: false,
                  ),
                  controller: _model.timerController,
                  updateStateInterval: Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.timerMilliseconds = value;
                    _model.timerValue = displayTime;
                    if (shouldUpdate) setState(() {});
                  },
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
              ),
            ].divide(SizedBox(width: 15.0)),
          ),
          FFButtonWidget(
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              final smsCodeVal = _model.pinCodeController!.text;
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

              context.pushNamedAuth('home01', context.mounted);
            },
            text: 'داخیل بە',
            options: FFButtonOptions(
              width: 250.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
              hoverBorderSide: BorderSide(
                color: FlutterFlowTheme.of(context).warning,
                width: 1.0,
              ),
              hoverElevation: 10.0,
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              context.safePop();
            },
            text: 'بگەرێوە',
            options: FFButtonOptions(
              width: 250.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Noto Sans Arabic',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15.0),
              hoverBorderSide: BorderSide(
                color: FlutterFlowTheme.of(context).warning,
                width: 1.0,
              ),
              hoverElevation: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
