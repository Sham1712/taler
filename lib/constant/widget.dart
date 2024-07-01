// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'color.dart';

class SearchFieldDrawer extends StatelessWidget {

  Color color;

  SearchFieldDrawer({Key? key,
    this.color = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: color, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon:  Icon(Icons.search, color: color, size: 20,),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

}

class Userhead extends StatelessWidget {

  Color color;
  String name,email;
  IconData icon;

  Userhead({super.key,
    required this.color,
    required this.name,
    required this.email,
    this.icon = FontAwesomeIcons.user
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.15,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.fill,
              child: CircleAvatar(
                backgroundColor: color,
                child: const Icon(IconlyBold.profile,color: cr_wht,size: 20,),
              ),
            ),
          ),
          wspace(10),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: cr_wht,
                  ),
                  textAlign: TextAlign.start,
                ),
                hspace(20),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                      color: cr_wht
                  ),
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class Draw3r extends Drawer {

  const Draw3r({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: cr_sec.withOpacity(0.8),// Color(0xff4338CA),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  hspace(12),
                  SearchFieldDrawer(),
                  Userhead(
                      color: cr_pri,
                      name: 'Dark3r',
                      email: 'auth.currentuser.email'
                  ),
                  MenuItem(
                    text: 'Account',
                    icon: IconlyBroken.user_2,
                    onClicked: () => selectedItem(context,0),
                  ),
                  hspace(5),
                  MenuItem(
                    text: 'Notifications',
                    icon: IconlyBold.notification,
                    onClicked: () => selectedItem(context,1),
                  ),
                  hspace(8),
                  const Divider(color: Colors.white70),
                  hspace(8),
                  MenuItem(
                    text: 'Settings',
                    icon: IconlyBold.setting,
                    onClicked: () => selectedItem(context,2),
                  ),
                  MenuItem(
                    text: 'Log out',
                    icon: IconlyLight.logout,
                    onClicked: () async{
                      //await auth.signOut();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    /*switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 2
        ));
        break;
    }

     */
  }

}

class GlassCard extends StatelessWidget {

  Widget child;
  double width,heigth;
  EdgeInsets padding;
  Color? color;
  GlassCard({
    required this.child,
    this.width = 150,
    this.heigth = 200,
    this.color,
    this.padding = const EdgeInsets.all(10),
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: Container(
          width: width,
          height: heigth,
          padding: padding,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: .25),
              borderRadius: BorderRadius.circular(15.0),
              color: color==null ? Colors.grey.shade200.withOpacity(0.2) : color!.withOpacity(0.2)),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

class Glassbutton extends StatelessWidget {

  Function onpressed;
  String name;
  Color color;
  Glassbutton({Key? key,required this.name,required this.color,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: InkWell(
          onTap: ()=>onpressed,
          splashColor: color.withOpacity(0.5),
          hoverColor: color.withOpacity(0.5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: color, width: .4),
                borderRadius: BorderRadius.circular(15.0),
                color: color.withOpacity(0.25)),
            child: Center(
              child: Text(
                name.toUpperCase(),
                style: TextStyle(
                    fontSize: 20.0,
                    color: color,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassIcon extends StatelessWidget {
  GlassIcon(this.icon,{
    Key? key,
    required this.color,
    required this.onpressed,
  }) : super(key: key);
  Color color;
  Function onpressed;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => onpressed,
        child: GlassCard(
          color: color,
          heigth: 50,
          width: 50,
          child: Center(
            child: Icon(
              icon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

Widget option({Color color=cr_pri}){
  return PopupMenuButton<String>(
    icon: ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (boulds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors:[color,color],
      ).createShader(boulds),
      child: const Icon(IconlyLight.wallet),
    ),
    itemBuilder: (context) => [
      PopupMenuItem(
        value: '0',
        onTap: (){

        },
        child: const Row(
          children: [
            Icon(CupertinoIcons.delete,),
            Spacer(),
            Center(child: Text('')),
          ],
        ),
      ),
      PopupMenuItem(
        value: '0',
        onTap: (){

        },
        child: const Row(
          children: [
            Icon(Icons.edit,),
            SizedBox(width: 15,),
            Center(child: Text('')),
          ],
        ),
      )
    ],
  );
}

Widget back(VoidCallback function){
  return IconButton(
      onPressed: () {
        function();
      },
      icon: const Icon(
        CupertinoIcons.back,
        color: Colors.white,
      )
  );
}

Widget hspace(double height) => SizedBox(height: height,);

Widget wspace(double width) => SizedBox(width: width,);

OutlineInputBorder border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(color: cr_pri)
);

class Textbox extends StatelessWidget{
  Textbox({
    Key? key,
    required this.controller,
    required this.texttype,
    required this.hint,
    required this.err,
  }) : super(key: key);
  TextEditingController controller;
  TextInputType texttype;
  String hint;
  bool err;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: border,
          enabledBorder: border,
          contentPadding: const EdgeInsets.all(20),
          hintText: hint,
          errorText: err ? 'Enter a $hint' : null,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.red)
          ),
        ),
        keyboardType: texttype,
        controller: controller,
        cursorColor: cr_pri,
        maxLines: texttype==TextInputType.multiline ? 5 : 1,
      ),
    );
  }
}

class DateTextbox extends StatelessWidget {
  DateTextbox({
    Key? key,
    required this.controller,
    required this.texttype,
    required this.hint,
    required this.onpressd,
  }) : super(key: key);
  TextEditingController controller;
  TextInputType texttype;
  String hint;
  Function(String datestr) onpressd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: border,
          enabledBorder: border,
          contentPadding: const EdgeInsets.all(20),
          hintText: hint,
        ),
        keyboardType: texttype,
        controller: controller,
        cursorColor: cr_pri,
        maxLines: texttype==TextInputType.multiline ? 5 : 1,
        onTap: (){
          if(texttype==TextInputType.datetime){
            _selectDate(context, (picdarte) => {
              onpressd(picdarte)
            });
          }
        },
      ),
    );
  }
}

class Togglelist extends StatelessWidget {

  Togglelist({Key? key,
    required this.title,
    required this.tlist,
    required this.tvalue,
    required this.onchange,
  }) : super(key: key);
  List<String> tlist;
  String tvalue,title;
  Function(String? value) onchange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          child:  Text(
            'Choose the choice for $title',
            style: const TextStyle(
                letterSpacing: 1.5,
                wordSpacing: 5,
                color: cr_pri
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tlist.length,
          padding: const EdgeInsets.only(left: 20),
          itemBuilder: (context,index){
            return
              ListTile(
                leading: Radio<String>(
                  activeColor: cr_pri,
                  value: tlist[index],
                  groupValue: tvalue,
                  onChanged: (value) => onchange(value),
                ),
                title: Text(tlist[index],style: const TextStyle(color: cr_sec),),
              );
          },
        ),
      ],
    );
  }
}

Widget present(){
  return Container(
    height: 60,
    width: 120,
    decoration: BoxDecoration(
      color: Colors.lightGreen,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          Expanded(
            child: Opacity(
              opacity: 0.4,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: (){

                },
              ),

            ),
          ),
          Expanded(
            child: Center(
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.checkmark_alt_circle_fill,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: (){},
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget future(){
  return FutureBuilder(
    future: Future.value(),
    builder: (context,AsyncSnapshot snapshot){
      if(!snapshot.hasError){
        if(snapshot.connectionState != ConnectionState.waiting) {
          if(snapshot.hasData){
            List lists = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: lists.length,
              itemBuilder: (context,index){
                //var item = lists[index];
                return const Card();
              },
            );
          }else {
            return const Center(child: Text(' has no data'),);
          }
        }else {
          return const Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }
      }else {
        return Center(
          child: Text(
            snapshot.error.toString(),
            style: TextStyle(color: Colors.redAccent.withOpacity(0.5)),
          ),
        );
      }

    },
  );
}

class ButtonImageFb1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const ButtonImageFb1({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: AspectRatio(
        aspectRatio: 208 / 71,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: const Color(0x004960f9).withOpacity(.3),
                spreadRadius: 4,
                blurRadius: 50)
          ]),
          child: MaterialButton(
            onPressed: onPressed,
            splashColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
                decoration: BoxDecoration(
                  //gradient:
                  image: const DecorationImage(
                    image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2FbuttonBackgroundSmall.png?alt=media&token=fa2f9bba-120a-4a94-8bc2-f3adc2b58a73"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 36.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child:  Text(text,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)))),
          ),
        ),
      ),
    );
  }
}

Future<void> _selectDate(BuildContext context,Function(String picdarte) set) async {
  final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050));
  if (pickedDate != null) {
    String datestr = DateFormat('dd-MM-yyyy').format(pickedDate);
    set(datestr);
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final Function() onMoreTap;

  final String subInfoTitle;
  final String subInfoText;
  final Widget subIcon;

  const InfoCard(
      {required this.title,
        this.body =
        """Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudi conseqr!""",
        required this.onMoreTap,
        this.subIcon = const CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 25,
          child: Icon(
            Icons.directions,
            color: Colors.white,
          ),
        ),
        this.subInfoText = "545 miles",
        this.subInfoTitle = "Directions",
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 10),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ],
          gradient: const RadialGradient(
            colors: [Colors.orangeAccent, Colors.orange],
            focal: Alignment.topCenter,
            radius: .85,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 75,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  gradient: const LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: GestureDetector(
                  onTap: onMoreTap,
                  child: const Center(
                      child: Text(
                        "More",
                        style: TextStyle(color: Colors.orange),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style:
            TextStyle(color: Colors.white.withOpacity(.75), fontSize: 14),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  subIcon,
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subInfoTitle),
                      Text(
                        subInfoText,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCarouselFB2 extends StatefulWidget {
  const CustomCarouselFB2({Key? key}) : super(key: key);

  @override
  _CustomCarouselFB2State createState() => _CustomCarouselFB2State();
}

class _CustomCarouselFB2State extends State<CustomCarouselFB2> {

  List<Widget> cards = [
    CardFb1(
        text: "Explore",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Working_late_re_0c3y%201.png?alt=media&token=7b880917-2390-4043-88e5-5d58a9d70555",
        subtitle: "+30 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Designer_re_5v95%201.png?alt=media&token=5d053bd8-d0ea-4635-abb6-52d87539b7ec",
        subtitle: "+30 books",
        onPressed: () {}),
    CardFb1(
        text: "Explore",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/illustrations%2Fundraw_Accept_terms_re_lj38%201.png?alt=media&token=476b97fd-ba66-4f62-94a7-bce4be794f36",
        subtitle: "+30 books",
        onPressed: () {})
  ];

  final double carouselItemMargin = 16;

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: .7);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: cards.length,
        onPageChanged: (int position) {
          setState(() {
          });
        },
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (BuildContext context, widget) {
        return Container(
          margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: Container(
        child: cards[position],
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb1(
      {required this.text,
        required this.imageUrl,
        required this.subtitle,
        required this.onPressed,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250,
        height: 230,
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 90, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class DialogFb1 extends StatelessWidget {
  const DialogFb1({Key? key}) : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: 25,
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/FlutterBricksLogo-Med.png?alt=media&token=7d03fedc-75b8-44d5-a4be-c1878de7ed52"),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("How are you doing?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 3.5,
            ),
            const Text("This is a sub text, use it to clarify",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(text: "Great", onPressed: () {}),
                SimpleBtn1(
                  text: "Not bad",
                  onPressed: () {
                  },
                  invertedColors: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  const SimpleBtn1(
      {required this.text,
        required this.onPressed,
        this.invertedColors = false,
        Key? key})
      : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}

class EmailInputFb1 extends StatelessWidget {
  final TextEditingController inputController;
  const EmailInputFb1({Key? key,required this.inputController}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.white.withOpacity(.9)),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            controller: inputController,
            onChanged: (value) {
              //Do something wi
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.email),
              filled: true,
              fillColor: accentColor,
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder:const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ) ,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

gradient4(){
  return LinearGradient(colors: [Colors.blue, Colors.blue.shade900]);
}

class AnimatedPageIndicatorFb1 extends StatelessWidget {
  const AnimatedPageIndicatorFb1(
      {Key? key,
        required this.currentPage,
        required this.numPages,
        this.dotHeight = 10,
        this.activeDotHeight = 10,
        this.dotWidth = 10,
        this.activeDotWidth = 20,
        this.gradient =
        const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
        this.activeGradient =
        const LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)])})
      : super(key: key);

  final int currentPage; //the index of the active dot, i.e. the index of the page you're on
  final int numPages; //the total number of dots, i.e. the number of pages your displaying

  final double dotWidth; //the width of all non-active dots
  final double activeDotWidth; //the width of the active dot
  final double activeDotHeight; //the height of the active dot
  final double dotHeight; //the height of all dots
  final Gradient gradient; //the gradient of all non-active dots
  final Gradient activeGradient; //the gradient of the active dot

  double _calcRowSize() {
    //Calculates the size of the outer row that creates spacing that is equivalent to the width of a dot
    const int widthFactor = 2; //assuming spacing is equal to the width of a dot
    return (dotWidth * numPages * widthFactor) + activeDotWidth - dotWidth;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _calcRowSize(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          numPages,
              (index) => AnimatedPageIndicatorDot(isActive: currentPage == index, gradient: gradient, activeGradient: activeGradient, activeWidth: activeDotWidth, activeHeight: activeDotHeight,),
        ),
      ),
    );
  }
}

class AnimatedPageIndicatorDot extends StatelessWidget {
  const AnimatedPageIndicatorDot(
      {Key? key,
        required this.isActive,
        this.height = 10,
        this.width = 10,
        this.activeWidth = 20,
        this.activeHeight = 10,
        required this.gradient,
        required this.activeGradient})
      : super(key: key);

  final bool isActive;
  final double height;
  final double width;
  final double activeWidth;
  final double activeHeight;
  final Gradient gradient;
  final Gradient activeGradient;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? activeWidth : width,
      height: isActive? activeHeight : height,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          gradient: isActive ? activeGradient : gradient,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
    );
  }
}
