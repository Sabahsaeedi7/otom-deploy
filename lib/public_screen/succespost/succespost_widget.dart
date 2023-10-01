import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'succespost_model.dart';
export 'succespost_model.dart';

class SuccespostWidget extends StatefulWidget {
  const SuccespostWidget({Key? key}) : super(key: key);

  @override
  _SuccespostWidgetState createState() => _SuccespostWidgetState();
}

class _SuccespostWidgetState extends State<SuccespostWidget> {
  late SuccespostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccespostModel());

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
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).grayLight,
            Color(0xFFFD204C)
          ],
          stops: [0.3, 0.8, 0.9],
          begin: AlignmentDirectional(1.0, -1.0),
          end: AlignmentDirectional(-1.0, 1.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'سەیارەکەت بە سەرکەوتووی تومار کرا',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  color: FlutterFlowTheme.of(context).grayLighter,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineSmallFamily),
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150.0,
                height: 130.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Lottie.asset(
                  'assets/lottie_animations/succes2.json',
                  width: 150.0,
                  height: 130.0,
                  fit: BoxFit.contain,
                  reverse: true,
                  animate: true,
                ),
              ),
            ],
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed('home01');
            },
            child: FaIcon(
              FontAwesomeIcons.solidArrowAltCircleRight,
              color: Color(0xFFFD204C),
              size: 33.0,
            ),
          ),
        ],
      ),
    );
  }
}
