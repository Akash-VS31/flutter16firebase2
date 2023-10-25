import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _OrdersummaryState();
}

class _OrdersummaryState extends State<Account> {
  final _namecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _landmarkcontroller = TextEditingController();
  final _pincodecontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _summaryform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
                key: _summaryform,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter your name";
                          }
                          else if(value
                              .contains(RegExp(r'[^a-zA-Z\s]'))){
                            return 'Name cannot contain numbers';
                          }
                          else {
                            return null;
                          }
                        },
                        controller:_namecontroller ,
                        decoration: const InputDecoration(
                            label: Text("Name"),
                            hintText: "enter your name",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " enter your address";
                          }

                          else {
                            return null;
                          }
                        },
                        controller:_addresscontroller,
                        decoration: const InputDecoration(
                            label: Text("Address"),
                            hintText: "enter your address",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " enter your landmark";
                          }
                          else if(value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                            return 'enter proper special character';

                          }
                          else {
                            return null;
                          }
                        },
                        controller:_landmarkcontroller,
                        decoration: const InputDecoration(
                            label: Text("Landmark"),
                            hintText: "enter your landmark",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " enter your pincode";
                          }
                          else if(!value.contains(RegExp(r'[0-9]'))) {
                            return 'only contain numbers';
                          }
                          else {
                            return null;
                          }
                        },
                        controller:_pincodecontroller,
                        decoration: const InputDecoration(
                            label: Text("Pincode"),
                            hintText: "enter your pincode",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                        bottom: 10,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " enter your phone number";
                          }
                          else if(!value.contains(RegExp(r'[0-9]'))){
                            return 'only contain numbers';
                          }
                          else {
                            return null;
                          }
                        },
                        controller:_numbercontroller,
                        decoration: const InputDecoration(
                            label: Text("Phone number"),
                            hintText: "enter your phone number",
                            border: OutlineInputBorder()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_summaryform.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Success")));
                              }
                            });
                          },
                          child: const Text("submit")),
                    )
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
