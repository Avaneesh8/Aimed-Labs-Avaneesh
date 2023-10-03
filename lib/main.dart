import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4F1EE),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          final screenWidth = constraints.maxWidth; // Calculate screenWidth from constraints

          // Determine the desired height and width based on screen size
          double firstContainerHeight = screenHeight * 0.3;
          double secondContainerWidth = screenWidth * 0.2;

          // Determine the left position based on screen size
          double leftPosition = screenWidth * 0.4 ;

          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth, // Set maximum width to the screen width
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.center, // Center content vertically
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Avaneesh Maheshwari',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.05,
                        color: Color(0xFFBE9885),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth * 0.3,
                      maxHeight: screenHeight * 0.7,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DescriptionExpandable(
                      initialText:
                      "I'm a third-year Computer Science B.Tech student at Vellore Institute of Technology, Vellore with a strong academic background. I completed my schooling at Allahabad Public School and St. Joseph's College, where I developed a solid foundation in computer science. I'm proficient in Java, C++, and C, and I have practical experience in application development using Flutter (Dart), Java, and Kotlin. My skills also encompass database management, including SQL and NoSQL databases, and I'm adept at using tools like MongoDB and Firebase.",
                      maxWords: 50,
                      screenWidth: screenWidth, // Pass screenWidth to DescriptionExpandable
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFADAD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: screenWidth,
                          child: SingleChildScrollView(
                            child: Container(
                              child: DescriptionExpandable1(
                                initialText:
                                "You should consider hiring me as a Flutter Developer intern because I have a hands-on experience of completing numerous projects using Flutter as the primary framework. These projects showcase my expertise in utilizing Flutter libraries for efficient state management and leveraging Firebase services, including authentication, cloud storage, and real-time database integration, to enhance application functionality. Additionally, my experience with technologies like NodeJS and MongoDB demonstrates my versatility and adaptability.What sets me apart is my commitment to staying up-to-date with the latest trends and best practices in Flutter development. I am constantly seeking opportunities to expand my skill set and tackle new challenges. With seven completed projects and an ongoing one, I am eager to apply my skills, learn from your team, and contribute to the continued success of your projects.",
                                maxWords: 50,
                                screenWidth: screenWidth, // Pass screenWidth to DescriptionExpandable1
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: leftPosition,
                        width: secondContainerWidth,
                        height: screenHeight * 0.06,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFDEDAF4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cover Letter',
                                style: TextStyle(
                                  fontSize: screenWidth > 500
                                    ? screenWidth * 0.022
                                    : screenWidth * 0.022,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionExpandable extends StatefulWidget {
  final String initialText;
  final int maxWords;
  final double screenWidth;

  DescriptionExpandable({
    required this.initialText,
    required this.maxWords,
    required this.screenWidth,
  });

  @override
  _DescriptionExpandableState createState() => _DescriptionExpandableState();
}

class _DescriptionExpandableState extends State<DescriptionExpandable> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = isExpanded
        ? widget.initialText
        : (widget.initialText.split(' ').take(widget.maxWords).join(' ') +
        '...');

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFADAD),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFDEDAF4),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: widget.screenWidth > 500
                      ? widget.screenWidth * 0.022
                      : widget.screenWidth * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: widget.screenWidth > 500
                    ? widget.screenWidth * 0.018
                    : widget.screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionExpandable1 extends StatefulWidget {
  final String initialText;
  final int maxWords;
  final double screenWidth;

  DescriptionExpandable1({
    required this.initialText,
    required this.maxWords,
    required this.screenWidth,
  });

  @override
  _DescriptionExpandableState1 createState() => _DescriptionExpandableState1();
}

class _DescriptionExpandableState1 extends State<DescriptionExpandable1> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = isExpanded
        ? widget.initialText
        : (widget.initialText.split(' ').take(widget.maxWords).join(' ') +
        '...');

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFADAD),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: widget.screenWidth > 500
                    ? widget.screenWidth * 0.018
                    : widget.screenWidth * 0.035,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
