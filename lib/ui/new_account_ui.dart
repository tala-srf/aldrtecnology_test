import 'dart:math';



import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:test_/ui/condition%20_ui.dart';
import 'package:test_/ui/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({Key? key}) : super(key: key);

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  @override
  void initState() {
     AutoOrientation.portraitUpMode();
    super.initState();
       

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffe6f2eb),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "إنشاء حساب",
                style: TextStyle(
                    color: const Color(0xfff59b18),
                    fontSize: MediaQuery.of(context).size.height * 0.05),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff0f3fa),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Row(children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.person_outline,
                            color: Color(0xff91949b),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            showCursor: true,
                            decoration: InputDecoration(
                              fillColor: Color(0xfff0f3fa),
                              filled: true,

                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xfff0f3fa), width: 2.0),
                              ),
                              hintText: "الاسم بالكامل",

                              //  icon:Icon(Icons.person_outline) ,
                            ),
                            // controller: namecontroller,
                          ),
                        ),
                      ])),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      top: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.height * 0.04,
                      left: MediaQuery.of(context).size.height * 0.04,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xfff0f3fa),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  )),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Icon(
                                      Icons.phone_enabled_rounded,
                                      color: Color(0xff91949b),
                                    ),
                                  ),
                                  Flexible(
                                    child: TextField(
                                      maxLength: 8,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        fillColor: Color(0xfff0f3fa),
                                        filled: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xfff0f3fa),
                                              width: 2.0),
                                        ),
                                        hintText: "رقم الهاتف",
                                        //suffixIcon: Icon(Icons.phone_enabled_rounded),
                                      ),
                                      // controller: namecontroller,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 13.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: const BoxDecoration(
                                color: Color(0xfff0f3fa),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: const Center(
                                child: Text(
                              "09",
                              style: TextStyle(color: Color(0xff91949b)),
                            )),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff0f3fa),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Row(children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.lock_outline_sharp,
                            color: Color(0xff91949b),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Color(0xfff0f3fa),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xfff0f3fa), width: 2.0),
                              ),
                              hintText: "كلمة المرور",
                            ),
                            // controller: namecontroller,
                          ),
                        ),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    //  bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xfff0f3fa),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Row(children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.lock_outline_sharp,
                            color: Color(0xff91949b),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Color(0xfff0f3fa),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xfff0f3fa), width: 2.0),
                              ),
                              hintText: "تأكيد كلمة المرور",
                            ),
                            // controller: namecontroller,
                          ),
                        ),
                      ])),
                ),
              ],
            ),
          ),
          Condtion(),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Color(0xfff59b18),
                          ),
                          Text(
                            ' إنشاء حساب',
                            style: TextStyle(
                                color: Color(0xfff59b18),
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xfff59b18)),
                      ),
                      onPressed: () async {
                        String generateRandomString(int length) {
                          final random = Random();
                          const availableChars =
                              'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                          final randomString = List.generate(
                              length,
                              (index) => availableChars[random
                                  .nextInt(availableChars.length)]).join();

                          return randomString;
                        }

                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();

                        sharedPreferences.setString(
                            'backend_token', generateRandomString(18));
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => DataUI()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.arrow_forward_rounded,
                            color: Color(0xffe6f2eb),
                          ),
                          Text(
                            'الدخول كضيف',
                            style: TextStyle(
                                color: Color(0xffdaedea),
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                              color: Color(0xfff59b18),
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Condtion extends StatefulWidget {
  const Condtion({Key? key}) : super(key: key);

  @override
  State<Condtion> createState() => _CondtionState();
}

class _CondtionState extends State<Condtion> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: value,
            onChanged: (value) {
              setState(() {
                this.value = value!;
              });
            }),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ConditonUI()));
            },
            child: Row(
              children: const [
                Text(
                  "أوافق على",
                  style: TextStyle(
                    color: Color(0xfff59b18),
                    // fontSize: MediaQuery.of(context).size.width * 0.02,
                  ),
                ),
                Text(
                  " سياسة الخصوصية والشروط والأحكام",
                  style: TextStyle(
                      color: Color(0xfff59b18),
                      // fontSize: MediaQuery.of(context).size.width * 0.02,
                      decoration: TextDecoration.underline),
                ),
              ],
            )),
      ],
    );
  }
}
