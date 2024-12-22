import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({super.key});

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xffF1EFEF),
              const Color(0xffFFFFFF),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
          ),
        ),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                          width: MediaQuery.of(context).size.width * .07,
                          child: Icon(
                            Icons.keyboard_arrow_left,
                          ))),
                  Transform.translate(
                    offset: Offset(-40, 0),
                    child: Text(
                      'Help Desk',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                    width: 0,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Text('Contact options', style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500),),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height*.035,
                        width: MediaQuery.of(context).size.width*.06,
                        child: Image.asset('assets/images/img_7.png')),
                    SizedBox(width: MediaQuery.of(context).size.width*.04,),
                    Text('Email Us', style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600),),

                  ],
                ),
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(Color(0xffE6E7E6).withOpacity(.4)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                    ))),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*.025,
              // ),
              TextButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height*.035,
                          width: MediaQuery.of(context).size.width*.06,
                          child: Image.asset('assets/images/img_8.png')),
                      SizedBox(width: MediaQuery.of(context).size.width*.04,),
                      Text('Call Us', style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),),

                    ],
                  ),
                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Color(0xffE6E7E6).withOpacity(.4)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      )))
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*.025,
              // ),
              TextButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height*.035,
                          width: MediaQuery.of(context).size.width*.06,
                          child: Image.asset('assets/images/img_9.png')),
                      SizedBox(width: MediaQuery.of(context).size.width*.04,),
                      Text('Chat with Us', style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600),),

                    ],
                  ),
                  style: ButtonStyle(overlayColor: MaterialStateProperty.all(Color(0xffE6E7E6).withOpacity(.4)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      )))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
