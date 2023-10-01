import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/public_screen/editsuccesss/editsuccesss_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profileprofile_model.dart';
export 'user_profileprofile_model.dart';

class UserProfileprofileWidget extends StatefulWidget {
  const UserProfileprofileWidget({Key? key}) : super(key: key);

  @override
  _UserProfileprofileWidgetState createState() =>
      _UserProfileprofileWidgetState();
}

class _UserProfileprofileWidgetState extends State<UserProfileprofileWidget> {
  late UserProfileprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileprofileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.nameFeild = true;
        _model.phoneFeild = true;
        _model.emailFeild = true;
        _model.locationFeild = true;
      });
    });

    _model.nameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.phoneController ??= TextEditingController(text: currentPhoneNumber);
    _model.emailController ??= TextEditingController(text: currentUserEmail);
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF15161E),
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Profile',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Color(0xFF15161E),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineMediumFamily),
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 290.0,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.coverPhoto, ''),
                                'https://firebasestorage.googleapis.com/v0/b/otombelakam-cb8ef.appspot.com/o/redcar1.png?alt=media&token=2b885e78-fc1b-4618-9eb5-221831687d79&_gl=1*1udy4an*_ga*MTQ3NzQwNzcxNi4xNjc1MTk1MjAw*_ga_CW55HF8NVT*MTY5NTk5NTkzNy4xNzUuMS4xNjk1OTk1OTczLjI0LjAuMA..',
                              ),
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 1.00),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: const CircleBorder(),
                          child: Container(
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset(
                                    'assets/images/redcar0326565.png',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Outfit',
                                color: Color(0xFF15161E),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentPhoneNumber,
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF606A85),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelMediumFamily),
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Container(
                          width: 100.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).grayLighter,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: _model.nameController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.nameController',
                                            Duration(milliseconds: 1000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          readOnly: _model.nameFeild,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Label here...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .nameControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.nameFeild)
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 100.0,
                                      borderWidth: 2.0,
                                      buttonSize: 36.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      hoverColor: Color(0xFFE5006E),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).btnText,
                                      icon: Icon(
                                        Icons.edit_square,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.nameFeild = false;
                                        });
                                      },
                                    ),
                                  if (!_model.nameFeild)
                                    Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: Color(0xF113B419),
                                        hoverColor: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        hoverIconColor: Color(0xE38D289E),
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidSave,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.nameFeild = false;
                                          });

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            displayName:
                                                _model.nameController.text,
                                          ));
                                          setState(() {
                                            _model.nameFeild = true;
                                          });
                                          await showAlignedDialog(
                                            context: context,
                                            isGlobal: true,
                                            avoidOverflow: true,
                                            targetAnchor: AlignmentDirectional(
                                                    -1.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Container(
                                                    height: 180.0,
                                                    width: 200.0,
                                                    child: EditsuccesssWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(width: 20.0))
                                    .addToEnd(SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 250.0,
                                        child: TextFormField(
                                          controller: _model.phoneController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.phoneController',
                                            Duration(milliseconds: 1000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: true,
                                          readOnly: _model.phoneFeild,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: 'Label here...',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .phoneControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.phoneFeild)
                                    Flexible(
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .btnText,
                                        icon: Icon(
                                          Icons.edit_square,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.phoneFeild = false;
                                          });
                                        },
                                      ),
                                    ),
                                  if (!_model.phoneFeild)
                                    Flexible(
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: Color(0xF113B419),
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .btnText,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidSave,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.phoneFeild = false;
                                          });

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            phoneNumber:
                                                _model.phoneController.text,
                                          ));
                                          setState(() {
                                            _model.phoneFeild = true;
                                          });
                                        },
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(width: 25.0))
                                    .addToEnd(SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 250.0,
                                      child: TextFormField(
                                        controller: _model.emailController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.emailController',
                                          Duration(milliseconds: 1000),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        readOnly: _model.emailFeild,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Label here...',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .emailControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  if (_model.emailFeild)
                                    Flexible(
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .btnText,
                                        icon: Icon(
                                          Icons.edit_square,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.emailFeild = false;
                                          });
                                        },
                                      ),
                                    ),
                                  if (!_model.emailFeild)
                                    Flexible(
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: Color(0xF113B419),
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .btnText,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidSave,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.emailFeild = false;
                                          });

                                          await currentUserReference!
                                              .update(createUsersRecordData(
                                            displayName: '0',
                                          ));
                                          setState(() {
                                            _model.emailFeild = true;
                                          });
                                        },
                                      ),
                                    ),
                                ]
                                    .divide(SizedBox(width: 25.0))
                                    .addToEnd(SizedBox(width: 5.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) =>
                                          StreamBuilder<List<StateRecord>>(
                                        stream: queryStateRecord(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitCubeGrid(
                                                  color: Color(0xFFFF0036),
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<StateRecord>
                                              dropDownStateRecordList =
                                              snapshot.data!;
                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??=
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.userCity,
                                                      ''),
                                            ),
                                            options: dropDownStateRecordList
                                                .map((e) =>
                                                    valueOrDefault<String>(
                                                      e.name,
                                                      '0',
                                                    ))
                                                .toList(),
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            width: 250.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: valueOrDefault(
                                                currentUserDocument?.userCity,
                                                ''),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            disabled: _model.locationFeild,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  if (_model.locationFeild)
                                    Flexible(
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 100.0,
                                        borderWidth: 2.0,
                                        buttonSize: 36.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        hoverColor: Color(0xFFE5006E),
                                        hoverIconColor:
                                            FlutterFlowTheme.of(context)
                                                .btnText,
                                        icon: Icon(
                                          Icons.edit_square,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.locationFeild = false;
                                          });
                                        },
                                      ),
                                    ),
                                  if (!_model.locationFeild)
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 100.0,
                                      borderWidth: 2.0,
                                      buttonSize: 36.0,
                                      fillColor: Color(0xF113B419),
                                      hoverColor: Color(0xFFE5006E),
                                      hoverIconColor:
                                          FlutterFlowTheme.of(context).btnText,
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidSave,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.locationFeild = false;
                                        });

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          userCity: _model.dropDownValue,
                                        ));
                                        setState(() {
                                          _model.locationFeild = true;
                                        });
                                      },
                                    ),
                                ].divide(SizedBox(width: 23.0)),
                              ),
                            ]
                                .divide(SizedBox(height: 10.0))
                                .addToStart(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
