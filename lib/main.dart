import 'package:flutter/material.dart';
import 'package:mzuri_test/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
      routes: {
        'profile': (context) => Profile(),
        'personalDetails': (context) => PersonalDetails(),
        'businessDetails': (context) => BusinessDetails(),
        'addBusiness': (context) => AddBusiness()
      },
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

  MzuriTextField({
    this.enabled = false,
    @required this.title,
    @required this.text,
    this.trailing = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: enabled ? OutlineInputBorder() : UnderlineInputBorder(),
          labelText: title,
          labelStyle: TextStyle(color: enabled ? blue : Colors.black),
          isDense: true,
          enabled: enabled,
          suffixIcon: trailing ? Icon(Icons.keyboard_arrow_down) : null),
      controller: TextEditingController()..text = text,
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
