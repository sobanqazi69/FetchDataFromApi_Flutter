// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> chapterList = [];
  List<String> verseList = [];
  String selectedVerse = '';

  String selectedChapter = '';

  @override
  void initState() {
    super.initState();
    fetchChapterNames();
    fetchVerseNumbers();
  }

  Future<void> fetchChapterNames() async {
    final response = await http
        .get(Uri.parse('http://178.16.131.229:8080/api/QR/ShowAllChapter'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> chapters =
          data.map((item) => item['ChapterName'].toString()).toList();

      setState(() {
        chapterList = chapters;
      });
    } else {
      print('Failed to fetch chapter names.');
    }
  }

  Future<void> fetchVerseNumbers() async {
    final response = await http
        .get(Uri.parse('http://178.16.131.229:8080/api/QR/ShowAllChapter'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<String> verses =
          data.map((item) => item['verses'].toString()).toList();

      setState(() {
        verseList = verses;
      });
    } else {
      print('Failed to fetch verse numbers.');
    }
  }

  String? selectedValueforname1;
  String? selectedValueforname2;

  String? selectedValueforverse1;
  String? selectedValueforverse2;

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    double h = Get.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'HIRING TASK',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w * .05),
                    child: Container(
                      width: w * .35,
                      height: h * .1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            selectedChapter,
                          ),
                          items: chapterList
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueforname1,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValueforname1 = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * .05),
                    child: Container(
                      width: w * .35,
                      height: h * .1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            selectedVerse,
                          ),
                          items: verseList
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueforverse1,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValueforverse1 = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * .05,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: w * .05),
                    child: Container(
                      width: w * .35,
                      height: h * .1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            selectedChapter,
                          ),
                          items: chapterList
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueforname2,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValueforname2 = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w * .05),
                    child: Container(
                      width: w * .35,
                      height: h * .1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            selectedVerse,
                          ),
                          items: verseList
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValueforverse2,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValueforverse2 = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 40,
                            width: 140,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }


}
