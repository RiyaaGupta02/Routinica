import 'package:flutter/material.dart';
import 'neu_box.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcacacb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // back button and menu button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: NeuBox(child: Icon(Icons.arrow_back)),
                  ),
                  Text('P L A Y L I S T'),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: NeuBox(child: Icon(Icons.menu)),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // cover art, artist name, song name
              NeuBox(
                child: Column(
                  children: [
                    // ClipRRect(

                    //   borderRadius: BorderRadius.circular(8),
                    //   child: Image.asset('assets/images/cover_art.png'),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 250, // specify the desired width
                        height: 250, // specify the desired height
                        child: Image.asset('assets/images/cover_art.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kota The Friend',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0xff616161),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Birdie',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // start time, shuffle button, repeat button, end time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('0:00'),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text('4:22')
                ],
              ),

              const SizedBox(height: 10),

              // linear bar
              NeuBox(
                child: LinearPercentIndicator(
                  lineHeight: 10,
                  percent: 0.8,
                  progressColor: Color(0xff550962),
                  backgroundColor: Colors.transparent,
                ),
              ),

              const SizedBox(height: 20),

              // previous song, pause play, skip next song
              SizedBox(
                height: 40,
                child: Row(
                  children: const [
                    Expanded(
                      child: NeuBox(
                          child: Icon(
                        Icons.skip_previous,
                        size: 15,
                      )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: NeuBox(
                            child: Icon(
                          Icons.play_arrow,
                          size: 15,
                        )),
                      ),
                    ),
                    Expanded(
                      child: NeuBox(
                          child: Icon(
                        Icons.skip_next,
                        size: 15,
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
