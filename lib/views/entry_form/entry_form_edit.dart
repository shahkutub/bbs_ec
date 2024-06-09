import 'package:bbs_ec/controllers/data_controller.dart';
import 'package:bbs_ec/database/info_data_table.dart';
import 'package:bbs_ec/helper/common_method.dart';
import 'package:bbs_ec/helper/location_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/global.dart';

class EntryFormEdit extends StatefulWidget {
  final InfoData? data;
  EntryFormEdit({super.key, this.data});

  @override
  State<EntryFormEdit> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryFormEdit> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValueYear = '';
  String dropdownValueOfficeType = '';
  String dropdownValueWonerType = '';
  String dropdownValueEconomicType = '';

  String officeTypehint = '';
  String ownerTypehint = '';
  String economicTypehint = '';
  int officeType = 1;
  int ownerType = 1;
  int economicType = 1;

  var nameEditController = TextEditingController();
  var phoneEditController = TextEditingController();
  var alterPhoneEditController = TextEditingController();
  var emailEditController = TextEditingController();
  var maleEditController = TextEditingController();
  var femaleEditController = TextEditingController();
  var totalEditController = TextEditingController();
  var latEditController = TextEditingController();
  var lonEditController = TextEditingController();

  List<ItemData> yearList = [];
  List<ItemData> officeTypeList = [];
  List<ItemData> wonerTypeList = [];
  List<ItemData> economicTypeList = [];
  final f = DateFormat('dd-MM-yyyy');

  int male = 0;
  int female = 0;
  String? _currentAddress;
  Position? _currentPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Get.find<DataController>().getDataList();
    getLocation();
    addListData();

    nameEditController.text = widget.data!.institutionName.toString();
    phoneEditController.text = widget.data!.phone.toString();
    alterPhoneEditController.text = widget.data!.mobile.toString();
    emailEditController.text = widget.data!.email.toString();
    emailEditController.text = widget.data!.email.toString();
    maleEditController.text = widget.data!.maleWorkerCount.toString();
    femaleEditController.text = widget.data!.femaleWorkerCount.toString();
    int total = widget.data!.maleWorkerCount! + widget.data!.femaleWorkerCount!;
    totalEditController.text = total.toString();

    // femaleEditController.text = female.toString();
    maleEditController.addListener(() {
      male = maleEditController.text.isNotEmpty
          ? int.parse(maleEditController.text)
          : 0;
      female = femaleEditController.text.isNotEmpty
          ? int.parse(femaleEditController.text)
          : 0;
      totalEditController.text = (male + female).toString();
    });

    femaleEditController.addListener(() {
      male = maleEditController.text.isNotEmpty
          ? int.parse(maleEditController.text)
          : 0;
      female = femaleEditController.text.isNotEmpty
          ? int.parse(femaleEditController.text)
          : 0;
      totalEditController.text = (male + female).toString();
    });
  }

  Future<void> getLocation() async {
    _currentPosition = await LocationHelper.getCurrentPosition();
    latEditController.text = _currentPosition!.latitude.toString();
    lonEditController.text = _currentPosition!.longitude.toString();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    maleEditController.dispose();
    femaleEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.data!.server ?? false)
              ? 'উপাত্ত্ব প্রদর্শনী ফরম'
              : 'উপাত্ত্ব সংশোধন ফরম',
          style: TextStyle(fontSize: (Global.isIPad ? 30 : 16)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Container(
          //margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        height: width / 6,
                        child: TextFormField(
                          controller: nameEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি) দিন';
                            }
                            return null;
                          },
                          readOnly: widget.data!.server ?? true,
                          decoration: InputDecoration(
                            labelText: 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি)',
                            hintText: 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি)',
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      // SizedBox(height: 20,),
                      Container(
                        width: width,
                        height: width / 6,
                        child: TextFormField(
                          controller: phoneEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ফোন/মোবাইল (১) দিন';
                            }
                            return null;
                          },
                          readOnly: widget.data!.server ?? true,
                          decoration: InputDecoration(
                            labelText: 'ফোন/মোবাইল (১)',
                            hintText: 'ফোন/মোবাইল (১)',
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      // SizedBox(height: 20,),
                      //phone alter
                      Container(
                        width: width,
                        height: width / 6,
                        child: TextFormField(
                          controller: alterPhoneEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'মোবাইল (২) দিন';
                            }
                            return null;
                          },
                          readOnly: widget.data!.server ?? true,
                          decoration: InputDecoration(
                            labelText: 'মোবাইল (২)',
                            hintText: 'মোবাইল (২)',
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            contentPadding:
                                EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      //SizedBox(height: 20,),
                      Container(
                        width: width,
                        height: width / 6,
                        child: TextFormField(
                          controller: emailEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ইমেইল দিন';
                            }
                            return null;
                          },
                          readOnly: widget.data!.server ?? true,
                          decoration: InputDecoration(
                            labelText: 'ইমেইল',
                            hintText: 'ইমেইল',
                            labelStyle: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                            contentPadding:
                                EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 25.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      yearList.length > 0
                          ? Container(
                              width: width,
                              height: width / 6,
                              child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 15.0),
                                    labelText: 'প্রতিষ্ঠান প্রতিষ্ঠার বছর',
                                    labelStyle: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        widget.data!.establishYear.toString(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      value: dropdownValueYear.isNotEmpty
                                          ? dropdownValueYear
                                          : null,
                                      //key: divisionKey,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValueYear = newValue!;
                                          // yearList.forEach((element){
                                          //   if(newValue != 'Select division' && newValue == element.name){
                                          //     //divisionId = element.id.toString();
                                          //     countryName = element.name.toString();
                                          //    // getDistrict();
                                          //   }
                                          // });
                                        });
                                      },
                                      menuMaxHeight: width / 2,
                                      items: yearList.map((country) {
                                        return DropdownMenuItem(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              width: width * 0.2,
                                              height: width / 8,
                                              child: Text(
                                                CommonMethods
                                                    .englishToBanglaNumberConverter(
                                                        country.name!),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              )),
                                          value: country.name,
                                        );
                                      }).toList(),
                                    ),
                                  )))
                          : SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      officeTypeList.length > 0
                          ? Container(
                              width: width,
                              height: width / 6,
                              child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 15.0),
                                    labelText: 'অফিসের ধরণ',
                                    labelStyle: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        officeTypehint,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      value: dropdownValueOfficeType.isNotEmpty
                                          ? dropdownValueOfficeType
                                          : null,
                                      //key: divisionKey,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValueOfficeType = newValue!;
                                          officeType = officeTypeList
                                                  .where((element) =>
                                                      element.name == newValue)
                                                  .first
                                                  .id ??
                                              1;
                                        });
                                      },
                                      items: officeTypeList.map((country) {
                                        return DropdownMenuItem(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              //width:width*0.2,
                                              height: width / 8,
                                              child: Text(
                                                country.name!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              )),
                                          value: country.name,
                                        );
                                      }).toList(),
                                    ),
                                  )))
                          : SizedBox(),

                      SizedBox(
                        height: 20,
                      ),
                      wonerTypeList.length > 0
                          ? Container(
                              width: width,
                              height: width / 6,
                              child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 15.0),
                                    labelText: 'মালিকানার ধরণ',
                                    labelStyle: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        ownerTypehint,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      value: dropdownValueWonerType.isNotEmpty
                                          ? dropdownValueWonerType
                                          : null,
                                      //key: divisionKey,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValueWonerType = newValue!;
                                          ownerType = wonerTypeList
                                                  .where((element) =>
                                                      element.name == newValue)
                                                  .first
                                                  .id ??
                                              1;
                                        });
                                      },
                                      items: wonerTypeList.map((country) {
                                        return DropdownMenuItem(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              //width:width*0.2,
                                              height: width / 8,
                                              child: Text(
                                                country.name!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              )),
                                          value: country.name,
                                        );
                                      }).toList(),
                                    ),
                                  )))
                          : SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      economicTypeList.length > 0
                          ? Container(
                              width: width,
                              height: width / 6,
                              child: InputDecorator(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 15.0),
                                    labelText: 'অর্থনৈতিক কর্মকান্ডের ধরণ',
                                    labelStyle: TextStyle(
                                        color: Colors.blueAccent, fontSize: 20),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        economicTypehint,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                      value:
                                          dropdownValueEconomicType.isNotEmpty
                                              ? dropdownValueEconomicType
                                              : null,
                                      //key: divisionKey,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      iconSize: 24,
                                      elevation: 16,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValueEconomicType = newValue!;
                                          economicType = economicTypeList
                                                  .where((element) =>
                                                      element.name == newValue)
                                                  .first
                                                  .id ??
                                              1;
                                        });
                                      },
                                      items: economicTypeList.map((country) {
                                        return DropdownMenuItem(
                                          child: Container(
                                              alignment: Alignment.centerLeft,
                                              //width:width*0.2,
                                              height: width / 8,
                                              child: Text(
                                                country.name!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17),
                                              )),
                                          value: country.name,
                                        );
                                      }).toList(),
                                    ),
                                  )))
                          : SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: width,
                          //height: width/6,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15.0),
                              labelText: 'কর্মরত জনবল',
                              labelStyle: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      controller: maleEditController,
                                      // onChanged: (text){
                                      //
                                      // },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'কর্মরত জনবল পুরুষ সংখ্যা দিন';
                                        }
                                        return null;
                                      },
                                      readOnly: widget.data!.server ?? true,
                                      decoration: InputDecoration(
                                        labelText: 'পুরুষ',
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                        hintText: 'পপুরুষ',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      controller: femaleEditController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'কর্মরত জনবল মহিলা সংখ্যা দিন';
                                        }
                                        return null;
                                      },
                                      readOnly: widget.data!.server ?? true,
                                      decoration: InputDecoration(
                                        labelText: 'মহিলা',
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                        hintText: 'মহিলা',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: totalEditController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'মোট কর্মরত জনবল সংখ্যা দিন';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'মোট',
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                        hintText: 'মোট',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      //latlon
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          width: width,
                          //height: width/6,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15.0),
                              labelText: 'জিপিএস অবস্থান',
                              labelStyle: TextStyle(
                                  color: Colors.blueAccent, fontSize: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      controller: latEditController,
                                      readOnly: true,
                                      // onChanged: (text){
                                      //
                                      // },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'অক্ষাংশ';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'অক্ষাংশ',
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                        hintText: 'অক্ষাংশ',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      //keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: lonEditController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'দ্রাঘিমাংশ';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'দ্রাঘিমাংশ',
                                        labelStyle: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15),
                                        hintText: 'দ্রাঘিমাংশ',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 15.0, 10.0, 15.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),

                      Visibility(
                        visible: (widget.data!.server ?? false) == false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: width / 2,
                                height: width / 8,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  'জমা দিন',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              onTap: () async {
                                final bool isValidEmail =
                                    EmailValidator.validate(
                                        emailEditController.text.toString());

                                if (nameEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের নাম দিন'));
                                  return;
                                } else if (phoneEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'প্রতিষ্ঠানের ফোন/মোবাইল (১) দিন'));
                                  return;
                                } else if (emailEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের ইমেইল দিন'));
                                  return;
                                } else if (!isValidEmail) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের বৈধ ইমেইল দিন'));
                                  return;
                                } else if (dropdownValueYear.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'প্রতিষ্ঠান প্রতিষ্ঠার বছর নির্বাচন করুন'));
                                  return;
                                } else if (dropdownValueOfficeType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('অফিসের ধরণ নির্বাচন করুন'));
                                  return;
                                } else if (dropdownValueWonerType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'মালিকানার ধরণ নির্বাচন করুন'));
                                  return;
                                } else if (dropdownValueEconomicType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'অর্থনৈতিক কর্মকান্ডের ধরণ নির্বাচন করুন'));
                                  return;
                                } else if (maleEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'কর্মরত জনবল পুরুষ সংখ্যা দিন'));
                                  return;
                                } else if (femaleEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'কর্মরত জনবল মহিলা সংখ্যা দিন'));
                                  return;
                                } else if (totalEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('মোট কর্মরত জনবল সংখ্যা দিন'));
                                  return;
                                }

                                InfoData srdModel = InfoData(
                                  institutionName: nameEditController.text,
                                  mobile: phoneEditController.text,
                                  phone: alterPhoneEditController.text,
                                  email: emailEditController.text,
                                  establishYear: dropdownValueYear,
                                  officeType: officeType,
                                  ownershipType: ownerType,
                                  economicActivityType: economicType,
                                  maleWorkerCount:
                                      int.parse(maleEditController.text),
                                  femaleWorkerCount:
                                      int.parse(femaleEditController.text),
                                  status: 1,
                                  dateTime: f.format(DateTime.now()),
                                  server: false,
                                );
                                Get.find<DataController>().storeData(srdModel);
                              },
                              // onTap: (){
                              //   final bool isValidEmail = false;
                              //   //final bool isValidEmail = EmailValidator.validate(emailEditController.text.toString());
                              //
                              //
                              //   if(nameEditController.text.isEmpty){
                              //     ScaffoldMessenger.of(context).showSnackBar(snacbarMsg('প্রতিষ্ঠানের নাম দিন'));
                              //   }else if(emailEditController.text.isEmpty){
                              //     // ToastComponent.showDialog(
                              //     //   "Input email address",
                              //     // );
                              //
                              //   }else if(!isValidEmail){
                              //     // ToastComponent.showDialog(
                              //     //   "Invalid email address",
                              //     // );
                              //   }else if(phoneEditController.text.isEmpty){
                              //     // ToastComponent.showDialog(
                              //     //   "Input mobile number",
                              //     // );
                              //
                              //   }
                              // },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),

      // InkWell(
      //   onTap: (){
      //     FocusScope.of(context).requestFocus(FocusNode());
      //   },
      //   child:
      //
      // ),
    );
  }

  void addListData() async {
    for (int k = 1999; k < 2024; k++) {
      int val = k + 1;
      yearList.add(ItemData(name: val.toString(), id: 0));
    }
    yearList = yearList.reversed.toList();

    officeTypeList.add(ItemData(name: 'ক. প্রধান অফিস'.toString(), id: 1));
    officeTypeList.add(ItemData(name: 'খ. শাখা অফিস'.toString(), id: 2));
    officeTypeList.add(ItemData(name: 'গ. একক ইউনিট'.toString(), id: 3));

    wonerTypeList.add(ItemData(name: 'ক. একক'.toString(), id: 1));
    wonerTypeList
        .add(ItemData(name: 'খ. যৌথ বা অংশীদারিত্ব'.toString(), id: 2));

    economicTypeList
        .add(ItemData(name: 'ক. কৃষি (খামার) সম্পর্কিত'.toString(), id: 1));
    economicTypeList
        .add(ItemData(name: 'খ. শিল্প সম্পর্কিত'.toString(), id: 2));
    economicTypeList.add(ItemData(name: 'গ. সেবা সম্পর্কিত'.toString(), id: 3));

    dropdownValueYear = widget.data!.establishYear.toString();
    officeTypeList.forEach((element) {
      if (element.id == widget.data!.officeType) {
        officeTypehint = element.name!;
        dropdownValueOfficeType = element.name!;
      }
    });

    wonerTypeList.forEach((element) {
      if (element.id == widget.data!.ownershipType) {
        ownerTypehint = element.name!;
        dropdownValueWonerType = element.name!;
      }
    });

    economicTypeList.forEach((element) {
      if (element.id == widget.data!.economicActivityType) {
        economicTypehint = element.name!;
        dropdownValueEconomicType = element.name!;
      }
    });

    setState(() {});
  }

  SnackBar snacbarMsg(String msg) {
    return SnackBar(
      content: Text(
        msg,
        style: TextStyle(fontSize: 20),
      ),
      backgroundColor: Colors.red,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
    );
  }
}

class ItemData {
  String? name;
  int? id;
  ItemData({this.name, this.id});
}
