import 'package:flutter/material.dart';

class RateofusScreen extends StatefulWidget {
  const RateofusScreen({super.key});

  @override
  State<RateofusScreen> createState() => _RateofusScreenState();
}

class _RateofusScreenState extends State<RateofusScreen> {
  int selectedStar = 0;

  void selectStar(int star) {
    setState(() {
      selectedStar = star;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Rate of Us'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Rating Us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        selectStar(index + 1);
                      },
                      child: Icon(
                        index < selectedStar ? Icons.star : Icons.star_border,
                        size: 50,
                        color: Colors.orange,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Your Rated : $selectedStar',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
