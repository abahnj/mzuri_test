import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mzuri_test/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812,
      width: 375,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Profile(),
        routes: {
          'profile': (context) => Profile(),
          'personalDetails': (context) => PersonalDetails(),
          'businessDetails': (context) => BusinessDetails(),
          'addBusiness': (context) => AddBusiness(),
          'otpScreen': (context) => OTPScreen(),
          'changePassword': (context) => ChangePassword(),
        },
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 812, maxWidth: 375),
      child: Center(
        child: Scaffold(
          backgroundColor: Color(0xfffafafa),
          body: Stack(
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff0ca1db),
                      Color(0xff0477a3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Avatar(),
              SafeArea(
                child: Stack(
                  children: [
                    AppBar(),
                    Positioned(
                      top: 128,
                      left: 0,
                      right: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'PERSONAL',
                              style: titleStyle,
                            ),
                          ),
                          ListTile(
                            tileColor: Color(0xffffffff),
                            title: Text(
                              'Personal Details',
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, 'personalDetails'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          ListTile(
                            tileColor: Color(0xffffffff),
                            title: Text(
                              'Change Password',
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, 'otpScreen'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Business',
                              style: titleStyle,
                            ),
                          ),
                          ListTile(
                            tileColor: Color(0xffffffff),
                            title: Text(
                              'Ada & Sons',
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, 'businessDetails'),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                          ListTile(
                            tileColor: Color(0xffffffff),
                            leading: Icon(
                              Icons.add,
                              color: blue,
                            ),
                            onTap: () =>
                                Navigator.pushNamed(context, 'addBusiness'),
                            title: Text(
                              'Add Business',
                              style: TextStyle(
                                color: blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Text(
              'PROFILE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 24,
              width: 24,
            )
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 108,
      left: MediaQuery.of(context).size.width / 2 - 32,
      child: Stack(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(color: Colors.white, width: 4),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2,
                  color: Color(0xfff5a623),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editAppBar(context, enabled, () {
                    setState(() {
                      enabled = !enabled;
                    });
                  }),
                  spacerH32,
                  Text(
                    'Personal Details',
                    style: titleStyle,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Name',
                    text: 'Thomas Olatunji',
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Email',
                    text: 'Thomas.Olatunji@gmail.com',
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Phone Number',
                    text: '08034229212',
                  ),
                  spacerH32,
                  spacerH32,
                  if (enabled)
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            enabled = !enabled;
                          });
                        },
                        color: blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Row editAppBar(BuildContext context, bool enabled, VoidCallback onTap) {
  return Row(
    children: [
      IconButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: blue,
        ),
      ),
      Spacer(),
      if (!enabled)
        TextButton(
          onPressed: onTap,
          child: Text(
            'Edit',
            style: TextStyle(color: blue),
          ),
        )
    ],
  );
}

class MzuriTextField extends StatelessWidget {
  final bool enabled;
  final String title;
  final String text;
  final bool trailing;
  final bool isPassword;

  MzuriTextField({
    this.enabled = false,
    @required this.title,
    this.text = '',
    this.trailing = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: enabled
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
              : UnderlineInputBorder(),
          labelText: title,
          labelStyle: TextStyle(color: enabled ? blue : Colors.black),
          isDense: true,
          enabled: enabled,
          suffixIcon: trailing ? Icon(Icons.keyboard_arrow_down) : null),
      controller: TextEditingController()..text = text,
      obscureText: isPassword ? true : false,
    );
  }
}

class BusinessDetails extends StatelessWidget {
  BusinessDetails({this.enabled = false});

  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: Color(0xfff5a623),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editAppBar(context, enabled, () {}),
                  spacerH32,
                  Text(
                    'Business Details',
                    style: titleStyle,
                  ),
                  spacerH32,
                  Image.asset(
                    'assets/avatar.png',
                    fit: BoxFit.cover,
                    height: 96,
                    width: 96,
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Business Type',
                    text: 'Boldseams Stitches',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Business Type',
                    text: 'Sole Proprietorship',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Industry',
                    text: 'Fashion Design',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'RC Number',
                    text: 'FS-906374',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Email',
                    text: 'b.stitches@gmail.com',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Phone Number',
                    text: '08012345678',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Country',
                    text: 'Nigeria',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'State',
                    text: 'Lagos',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Local Government',
                    text: 'Ijaye',
                  ),
                  spacerH32,
                  MzuriTextField(
                    title: 'Address',
                    text: '5 Abiola Way, Ikeja',
                  ),
                  spacerH32,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddBusiness extends StatelessWidget {
  AddBusiness({this.enabled = true});

  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: Color(0xfff5a623),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editAppBar(context, enabled, () {}),
                  spacerH32,
                  Text(
                    'Business Details',
                    style: titleStyle,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Business Name',
                    text: null,
                  ),
                  spacerH32,
                  TextField(
                    decoration: InputDecoration(
                      border: enabled
                          ? OutlineInputBorder()
                          : UnderlineInputBorder(),
                      labelText: 'Upload your company logo',
                      labelStyle: TextStyle(
                        color: enabled ? blue : Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.image_outlined,
                        size: 36,
                        color: Colors.grey,
                      ),
                      isDense: true,
                      enabled: enabled,
                    ),
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Business Type',
                    text: null,
                    trailing: true,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Industry',
                    text: null,
                    trailing: true,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'RC Number',
                    text: null,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Email',
                    text: null,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Phone Number',
                    text: null,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Country',
                    text: null,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'State',
                    text: null,
                    trailing: true,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Local Government',
                    text: null,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: enabled,
                    title: 'Address',
                    text: null,
                  ),
                  spacerH32,
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {},
                      color: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editAppBar(context, true, null),
              spacerH32,
              Text(
                'OTP Verification',
                style: titleStyle,
              ),
              spacerH16,
              Text(
                  'An OTP code was sent to your phone and email kindly input the code below.'),
              spacerH32,
              Center(
                child: PinCodeTextField(
                  autofocus: true,
                  controller: TextEditingController(),
                  hideCharacter: true,
                  highlight: true,
                  highlightColor: Colors.blue,
                  defaultBorderColor: Color(0xffeaeaea),
                  hasTextBorderColor: Colors.green,
                  maxLength: 4,
                  pinBoxRadius: 4,
                  hasError: false,
                  maskCharacter: "😎",
                  onTextChanged: (text) {},
                  onDone: (text) {
                    print("DONE $text");
                  },
                  pinBoxWidth: 48,
                  pinBoxBorderWidth: 1,
                  pinBoxHeight: 48,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration: (
                    Color borderColor,
                    Color pinBoxColor, {
                    double borderWidth = 2.0,
                    double radius = 5.0,
                  }) {
                    return BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                        width: borderWidth,
                      ),
                      color: pinBoxColor,
                      borderRadius: BorderRadius.circular(radius),
                    );
                  },
                  pinTextStyle: TextStyle(fontSize: 22.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  pinBoxColor: Color(0xfff9f9f9),
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                  //highlightAnimation: true,
                  highlightAnimationBeginColor: Colors.black,
                  highlightAnimationEndColor: Colors.white12,
                  keyboardType: TextInputType.number,
                ),
              ),
              spacerH32,
              spacerH32,
              spacerH32,
              spacerH32,
              Container(
                width: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'changePassword');
                  },
                  color: blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 2,
                  color: Color(0xfff5a623),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  editAppBar(context, true, () {}),
                  spacerH32,
                  Text(
                    'Change Password',
                    style: titleStyle,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: true,
                    title: 'Old Password',
                    isPassword: true,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: true,
                    title: 'New Password',
                    isPassword: true,
                  ),
                  spacerH32,
                  MzuriTextField(
                    enabled: true,
                    title: 'Confirm Password',
                    isPassword: true,
                  ),
                  spacerH32,
                  spacerH32,
                  Container(
                    width: double.infinity,
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              log(MediaQuery.of(context).size.width.toString());
                              return _showAlert(context);
                            });
                      },
                      color: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AlertDialog _showAlert(BuildContext context) {
  return AlertDialog(
    content: new Container(
      width: 260.0,
      height: 260.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: new BorderRadius.all(
          new Radius.circular(32.0),
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // dialog top
          Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
            size: 48,
          ),
          new Container(
            // padding: new EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: new Text(
              'Successful',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontFamily: 'helvetica_neue_light',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          spacerH16,

          // dialog centre
          new Expanded(
            child: new Container(
              child: Text(
                'Your password has been changed successfully',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18.0,
                  fontFamily: 'helvetica_neue_light',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),

          // dialog bottom
          new Expanded(
            child: Center(
              child: FlatButton(
                height: double.infinity,
                minWidth: 700,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
