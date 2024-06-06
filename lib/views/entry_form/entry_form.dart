import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValueYear = '';
  String dropdownValueOfficeType = '';
  String dropdownValueWonerType = '';
  String dropdownValueEconomicType = '';

  var nameEditController = TextEditingController();
  var phoneEditController = TextEditingController();
  var alterPhoneEditController = TextEditingController();
  var emailEditController = TextEditingController();
  var maleEditController = TextEditingController();
  var femaleEditController = TextEditingController();
  var totalEditController = TextEditingController();

  List<ItemData> yearList = [];
  List<ItemData> officeTypeList = [];
  List<ItemData> wonerTypeList = [];
  List<ItemData> economicTypeList = [];

  int male = 0;
  int female = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListData();
    // maleEditController.text = male.toString();
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
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('লিস্টিং ফরম'),
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
                                      hint: Text('প্রতিষ্ঠান প্রতিষ্ঠার বছর'),
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
                                      hint: Text('অফিসের ধরণ '),
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
                                          // yearList.forEach((element){
                                          //   if(newValue != 'Select division' && newValue == element.name){
                                          //     //divisionId = element.id.toString();
                                          //     countryName = element.name.toString();
                                          //    // getDistrict();
                                          //   }
                                          // });
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
                                      hint: Text('মালিকানার ধরণ'),
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
                                          // yearList.forEach((element){
                                          //   if(newValue != 'Select division' && newValue == element.name){
                                          //     //divisionId = element.id.toString();
                                          //     countryName = element.name.toString();
                                          //    // getDistrict();
                                          //   }
                                          // });
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
                                                    color: Colors.black),
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
                                      hint: Text('অর্থনৈতিক কর্মকান্ডের ধরণ'),
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
                                          // yearList.forEach((element){
                                          //   if(newValue != 'Select division' && newValue == element.name){
                                          //     //divisionId = element.id.toString();
                                          //     countryName = element.name.toString();
                                          //    // getDistrict();
                                          //   }
                                          // });
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
                      SizedBox(
                        height: 40,
                      ),

                      Row(
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
                              child: Text(
                                'জমা দিন',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {} catch (error) {}
                              } else {
                                //final bool isValidEmail = false;
                                final bool isValidEmail =
                                    EmailValidator.validate(
                                        emailEditController.text.toString());

                                if (nameEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের নাম দিন'));
                                } else if (phoneEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'প্রতিষ্ঠানের ফোন/মোবাইল (১) দিন'));
                                } else if (emailEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের ইমেইল দিন'));
                                } else if (!isValidEmail) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('প্রতিষ্ঠানের বৈধ ইমেইল দিন'));
                                } else if (dropdownValueYear.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'প্রতিষ্ঠান প্রতিষ্ঠার বছর নির্বাচন করুন'));
                                } else if (dropdownValueOfficeType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('অফিসের ধরণ নির্বাচন করুন'));
                                } else if (dropdownValueWonerType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'মালিকানার ধরণ নির্বাচন করুন'));
                                } else if (dropdownValueEconomicType.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'অর্থনৈতিক কর্মকান্ডের ধরণ নির্বাচন করুন'));
                                } else if (maleEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'কর্মরত জনবল পুরুষ সংখ্যা দিন'));
                                } else if (femaleEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg(
                                          'কর্মরত জনবল মহিলা সংখ্যা দিন'));
                                } else if (totalEditController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      snacbarMsg('মোট কর্মরত জনবল সংখ্যা দিন'));
                                }
                              }
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
    print('year' + yearList.length.toString());
    for (int k = 1999; k < 2024; k++) {
      int val = k + 1;
      print('year' + yearList.length.toString());
      yearList.add(ItemData(name: val.toString(), id: '0'));
    }
    yearList = yearList.reversed.toList();
    officeTypeList.add(ItemData(name: 'ক. প্রধান অফিস'.toString(), id: '0'));
    officeTypeList.add(ItemData(name: 'খ. শাখা অফিস'.toString(), id: '0'));
    officeTypeList.add(ItemData(name: 'গ. একক ইউনিট'.toString(), id: '0'));

    wonerTypeList.add(ItemData(name: 'ক. একক'.toString(), id: '0'));
    wonerTypeList
        .add(ItemData(name: 'খ. যৌথ বা অংশীদারিত্ব'.toString(), id: '0'));

    economicTypeList
        .add(ItemData(name: 'ক. কৃষি (খামার) সম্পর্কিত'.toString(), id: '0'));
    economicTypeList
        .add(ItemData(name: 'খ. শিল্প সম্পর্কিত'.toString(), id: '0'));
    economicTypeList
        .add(ItemData(name: 'গ. সেবা সম্পর্কিত'.toString(), id: '0'));

    //print('year'+yearList.length.toString());
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
  String? id;
  ItemData({this.name, this.id});
}