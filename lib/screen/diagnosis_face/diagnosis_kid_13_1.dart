import 'package:bridze/provider/face_evaluation.dart';
import 'package:bridze/screen/diagnosis_face/diagnosis_kid_13_2.dart';
import 'package:bridze/widgets/audio_kid_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiagnosisKid131Page extends StatefulWidget {
  const DiagnosisKid131Page({Key? key, required String avrScore})
      : super(key: key);

  @override
  DiagnosisKid131PageState createState() => DiagnosisKid131PageState();
}

class DiagnosisKid131PageState extends State<DiagnosisKid131Page> {
  AudioKid2 myAudioPlayer = AudioKid2();
  bool isPlaying = false;
  int selectedFace = 0;
  int totalScore = 0;

  void onFaceButtonTapped(int faceValue) {
    setState(() {
      selectedFace = faceValue;
      totalScore = calculateTotalScore(selectedFace);
    });

    context.read<TotalScoreProvider>().addRelationshipScore(totalScore);
  }

  int calculateTotalScore(int faceValue) {
    if (faceValue == 1) return 1;
    if (faceValue == 2) return 2;
    if (faceValue == 3) return 6;
    if (faceValue == 4) return 8;
    if (faceValue == 5) return 10;
    return 0;
  }

  @override
  void initState() {
    super.initState();
    myAudioPlayer.initAudio().then((_) {
      setState(() {
        isPlaying = true;
        myAudioPlayer.toggleAudio();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/diagnosis_kid_2.png',
            fit: BoxFit.cover,
            height: 1024,
            width: 1440,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/chat.png',
                      height: 40,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "đánh giá tình cảm",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/torizzi.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "너는 부모님을 믿어 ?",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'BMJUA',
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(5),
                      child: Container(
                        color: selectedFace == 5
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face5.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "5",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(4),
                      child: Container(
                        color: selectedFace == 4
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face4.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "4",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(3),
                      child: Container(
                        color: selectedFace == 3
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face3.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "3",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(2),
                      child: Container(
                        color: selectedFace == 2
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face2.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "2",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () => onFaceButtonTapped(1),
                      child: Container(
                        color: selectedFace == 1
                            ? Colors.pink.withOpacity(0.2)
                            : null,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/face1.png',
                              width: 80,
                              height: 80,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "1",
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'BMJUA',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 40, 40),
                    child: GestureDetector(
                      onTap: () {
                        myAudioPlayer.dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosisKid132Page(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/images/cursor.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
