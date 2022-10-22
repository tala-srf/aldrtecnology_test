// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:test_/service/data_service.dart';
import 'package:test_/ui/new_account_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataUI extends StatefulWidget {
  const DataUI({Key? key}) : super(key: key);

  @override
  State<DataUI> createState() => _DataUIState();
}

class _DataUIState extends State<DataUI> {
  DataService data = DataService();
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController listScrollController = ScrollController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffe6f2eb),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (listScrollController.hasClients) {
              final position = listScrollController.position.minScrollExtent;
              listScrollController.animateTo(
                position,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            }
          },
          child: const Icon(
            Icons.home,
            color: Color(0xfff4991c),
          ),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: Container(
          clipBehavior:
              Clip.hardEdge, //or better look(and cost) using Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xfff4991c),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            backgroundColor: Color(0xfff4991c),
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(
                  Icons.menu_open,
                  color: Colors.white,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: '',
              ),
            ],
          ),
        ),
        body: currentPageIndex == 1
            ? InkWell(
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString('backend_token', 'EMPTY_TOKEN');
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NewAccount()));
                },
                child: const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xfff4991c),
                    child: Center(child: Text("هل تود الخروج")),
                  ),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Flexible(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          showCursor: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 116, 130, 164),
                                  width: 2.0),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 116, 130, 164),
                            ),
                            hintText: "ابحث عن المنتج",
                          ),
                          // controller: namecontroller,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                           SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:   (MediaQuery.of(context).size.height / MediaQuery.of(context).size.width > 1 )? 2:3,
                      ),
                      itemCount: data.proudect!.data!.length,
                      controller: listScrollController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(

                            shape: RoundedRectangleBorder(

                              borderRadius:
                                  BorderRadius.circular(30), // if you need this
                              side: BorderSide(
                                color: Colors.grey.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            elevation: 10, // has value when shape is null
                            shadowColor: const Color(0xff190836),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Image.network(
                                          "${data.proudect?.data![index].image}",),
                                    )),
                                Text(
                                  "${data.proudect?.data![index].name}",
                                  style: TextStyle(color: Color(0xfff4c089),fontSize: 19),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
