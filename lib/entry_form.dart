
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryForm extends StatefulWidget{
  const EntryForm({super.key});

  @override
  State<EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValueCountry = 'Select country';
  String dropdownValueDivision = '';
  String dropdownValueDistrict = 'Select district';
  String dropdownValueUpozila = 'Select upozila';
  String dropdownValueUp = 'Select union parishad';

  var nameEditController = TextEditingController();
  var phoneEditController = TextEditingController();
  var alterPhoneEditController = TextEditingController();
  var emailEditController = TextEditingController();
  var addressEditController = TextEditingController();
  var couponEditController = TextEditingController();

  List<ItemData> yearList = [];


  String countryName = '';

  @override
  void initState()   {
    // TODO: implement initState
    super.initState();
    addListData();

  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(title: Text('লিস্টিং ফরম'),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child:
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        width: width,
                        height: width/8,
                        child: TextFormField(
                          controller: nameEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি)',
                            hintText: 'প্রতিষ্ঠানের নাম (বাংলা/ইংরেজি)',
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(fontSize: 13,),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                            width: width,
                            height: width/8,
                            child: TextFormField(
                              controller: phoneEditController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'ফোন/মোবাইল (১)';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'ফোন/মোবাইল (১)',
                                hintText: 'ফোন/মোবাইল (১)',
                                contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              ),
                              style: TextStyle(fontSize: 13),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                      SizedBox(height: 20,),
                      //phone alter
                      Container(
                        width: width,
                        height: width/8,
                        child: TextFormField(
                          controller: alterPhoneEditController,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'মোবাইল (২)';
                          //   }
                          //   return null;
                          // },
                          decoration: InputDecoration(
                            labelText: 'মোবাইল (২)',
                            hintText: 'মোবাইল (২)',
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(fontSize: 13,),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: width,
                        height: width/8,
                        child: TextFormField(
                          controller: emailEditController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'ইমেইল';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'ইমেইল',
                            hintText: 'ইমেইল',
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          ),
                          style: TextStyle(fontSize: 13,),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 20,),
                      yearList.length>0?
                      Container(
                          width: width,
                          height: width/8,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 15.0),
                              labelText: 'প্রতিষ্ঠান প্রতিষ্ঠার বছর',
                              border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                            ),

                            child: DropdownButtonHideUnderline( child:DropdownButton(
                              hint: Text('data'),
                              value: dropdownValueDivision.isNotEmpty ? dropdownValueDivision : null,
                              //key: divisionKey,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? newValue) {
                                setState(() {
                                dropdownValueDivision = newValue!;
                                // yearList.forEach((element){
                                //   if(newValue != 'Select division' && newValue == element.name){
                                //     //divisionId = element.id.toString();
                                //     countryName = element.name.toString();
                                //    // getDistrict();
                                //   }
                                // });
                                 });
                              },
                              items: yearList.map((country){
                                return DropdownMenuItem(
                                  child: Container(width:width*0.2,
                                      height: width/8,
                                      child: Text(country.name!,style: TextStyle(color: Colors.black),)),
                                  value: country.name,
                                );
                              }).toList(),
                            ),)
                          )
                      ):SizedBox(),
                      SizedBox(height: 20,),
                      yearList.length>0?
                      Container(
                          width: width,
                          height: width/8,
                          child: InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15.0),
                                labelText: 'প্রতিষ্ঠান প্রতিষ্ঠার বছর',
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                              ),

                              child: DropdownButtonHideUnderline( child:DropdownButton(
                                hint: Text('data'),
                                value: dropdownValueDivision.isNotEmpty ? dropdownValueDivision : null,
                                //key: divisionKey,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValueDivision = newValue!;
                                    // yearList.forEach((element){
                                    //   if(newValue != 'Select division' && newValue == element.name){
                                    //     //divisionId = element.id.toString();
                                    //     countryName = element.name.toString();
                                    //    // getDistrict();
                                    //   }
                                    // });
                                  });
                                },
                                items: yearList.map((country){
                                  return DropdownMenuItem(
                                    child: Container(width:width*0.2,
                                        height: width/8,
                                        child: Text(country.name!,style: TextStyle(color: Colors.black),)),
                                    value: country.name,

                                  );
                                }).toList(),
                              ),)
                          )
                      ):SizedBox()

                    ],
                  )
              ),
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

  void addListData() async{
    print('year'+yearList.length.toString());
    for (int k = 2000; k < 2024; k++) {
      int val = k+1;
      print('year'+yearList.length.toString());
      yearList.add(ItemData(name: val.toString(),id: '0'));
    }
    //print('year'+yearList.length.toString());
    setState(() {

    });
  }
}

class ItemData {
  String? name;
  String? id;
  ItemData({this.name,this.id});
}