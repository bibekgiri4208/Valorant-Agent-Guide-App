import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/agent_data.dart';

class DuelistsScreen extends StatelessWidget {
  const DuelistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Duelists",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learn Your\nFaVorite Duelists",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: duelistsData.length,
                itemBuilder: (context, index) {
                  final agent = duelistsData[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 0.5),
                        image: DecorationImage(
                          image: AssetImage(agent["image"]),
                          fit: BoxFit.cover,
                          alignment: const Alignment(0.0, -0.7),
                          colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: 0.5),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          agent["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Valorant",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
