import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //so scaffold will have some body section here
      backgroundColor: const Color(0xffe8dbf6),
      //here body that'll hv container in it a lot of child that'll hv columns n rows within child its children
      body: Container(
          padding: const EdgeInsets.only(
            //here its for styling the text & arranging of it
            top: 25,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              //first major Heading i.e. for Routininca

              Row(
                children: [
                  const Text(
                    "CHOOSE TASK",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xff4a063e),
                        fontWeight: FontWeight.w700),
                  ),

                  Expanded(child: Container()),
                  //here just by writing this container in child it adjust the spacing of 3 icons along with Routinica --> this spacing adjusted is btwn Text given n icons not in btwn icon spacing
                  const Icon(Icons.arrow_back_ios,
                      size: 20, color: Color(0xff4a063e)),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: Color(0xff4a063e),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      size: 20, color: Color(0xff4a063e)),
                  const SizedBox(
                    width: 9,
                  ),
                  //so here then placing all the icons along with the Routininca now we need to give spacing accordingly cos this just places them with name give with it
                ], //this whole is one children Routinica n icons
              ),
              const SizedBox(
                height: 30,
              ),

              //comes the other row Sub-Heading
              Row(
                children: [
                  const Text(
                    "Your Tasks",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(
                            0xff690a58), //for the other heading say sub-heading
                        fontWeight: FontWeight.w700),
                  ),
                  //Need to make spacing adjustment btwn both text as in same level
                  Expanded(
                      child:
                          Container()), //whenerver use expanded takes available space btwn 2 widgets
                  const Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(
                          0xff934084), //for the other heading say sub-heading
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Color(0xff4a063e),
                  )
                ],
              ),
              const SizedBox(
                //so sizedBox is basically for giving space btwn containers n elements
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 185,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xff410862).withOpacity(0.9),
                        const Color(0xff662896).withOpacity(0.9),
                        const Color(0xff9e6ace).withOpacity(0.9),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(75)
                        //so here we made a rectangle then by help of mediaQuery to adjust it acc to device it's in then setting up its radius accordingly
                        // then giving the radius letting to the curve n mentioining circular here
                        ),
                    boxShadow: [
                      //the shadow i.e. there after the Box is made
                      BoxShadow(
                          offset: const Offset(10, 10),
                          blurRadius: 15,
                          color: const Color(0xff68289a).withOpacity(0.2))
                    ]),
                //container under which writing cols carrying txt of the gradient box
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 25,
                  ),
                  child: Column(
                    // so when hv a column crossAxis one is the horizontal axis n main one is vertical axis
                    crossAxisAlignment: CrossAxisAlignment
                        .start, //styling the text by adjusting it
                    children: [
                      const Text(
                        "Upcoming Tasks",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffe2d6ed)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Upcoming Budget meeting",
                        style:
                            TextStyle(fontSize: 26, color: Color(0xffe2d6ed)),
                      ),
                      //Now comes the icons n small symbol in box they r in row
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 25,
                                color: Color(0xffe8ddf5),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "45 min",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xffe2d6ed)),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              const Icon(
                                //the playfill icon for playing the timer
                                Icons.play_circle_fill,
                                color: Color(0xffe8ddf5),
                                size: 45,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /*
                    const Text(
                      "Area of Interest",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff511a7b),
                          fontSize: 20),
                    ),
                    */
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 175,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    makeItem(image: 'assets/images/Work.png', title: 'Work'),
                    makeItem(
                        image: 'assets/images/ChillMe.png',
                        title: 'Relaxed Time'),
                    makeItem(
                        image: 'assets/images/Health.jpg', title: 'Health'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}

Widget makeItem({image, title}) {
  return AspectRatio(
    aspectRatio: 1 / 1,
    child: Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: const TextStyle(
              color: Color(0xff690a58),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
