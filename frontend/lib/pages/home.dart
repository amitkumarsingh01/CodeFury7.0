import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:frontend/main/PinCode.dart';

class HomeCorner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Disaster Management Facts',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 0.9 * MediaQuery.of(context).size.width,
              child: CarouselSlider(
                items: [
                  _buildFactCard(
                    'Effective disaster management requires a multi-disciplinary approach, involving coordination between government, NGOs, and the public.',
                    Colors.black54,
                  ),
                  _buildFactCard(
                    'Preparedness and early warning systems can significantly reduce the impact of natural disasters.',
                    Colors.black45,
                  ),
                  _buildFactCard(
                    'Community involvement is key in disaster risk reduction and resilience building.',
                    Colors.black38,
                  ),
                  _buildFactCard(
                    'Climate change is increasing the frequency and intensity of natural disasters globally.',
                    Colors.black26,
                  ),
                  _buildFactCard(
                    'Post-disaster recovery planning should prioritize vulnerable populations.',
                    Colors.black12,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 9,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Did You Know?',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 0.9 * MediaQuery.of(context).size.width,
              child: CarouselSlider(
                items: [
                  _buildFactCard(
                    'The 2004 Indian Ocean tsunami was one of the deadliest natural disasters in recorded history, affecting 14 countries.',
                    Colors.black54,
                  ),
                  _buildFactCard(
                    'Hurricanes can produce tornadoes and cause extensive inland flooding, not just coastal damage.',
                    Colors.black45,
                  ),
                  _buildFactCard(
                    'Wildfires are a major natural hazard, especially in areas experiencing prolonged droughts.',
                    Colors.black38,
                  ),
                  _buildFactCard(
                    'Earthquakes can cause tsunamis, landslides, and fires, making them one of the most complex disasters.',
                    Colors.black26,
                  ),
                  _buildFactCard(
                    'Floods are the most common natural disaster worldwide, affecting more people than any other type of disaster.',
                    Colors.black12,
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 18 / 9,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconCard(
                  context,
                  icon: Icons.library_books,
                  text: 'Learn More',
                  onTap: () {
                    // Navigate to relevant screen
                  },
                ),
                SizedBox(width: 20),
                _buildIconCard(
                  context,
                  icon: Icons.contact_support,
                  text: 'Get Help',
                  onTap: () {
                    // Navigate to relevant screen
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 0.9 * MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PincodePage()),
                      );
                    },
                    child: Text(
                      'Know Your RISK!!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to FAQ page
                    },
                    child: Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFactCard(String text, Color backgroundColor) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildIconCard(BuildContext context, {required IconData icon, required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 0.4 * MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(height: 8),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
