import 'dart:async';
import 'package:flutter/material.dart';

class WhatsAppCallScreen extends StatefulWidget {
  @override
  _WhatsAppCallScreenState createState() => _WhatsAppCallScreenState();
}

class _WhatsAppCallScreenState extends State<WhatsAppCallScreen> {
  bool isMuted = false;
  bool isSpeakerOn = false;
  int seconds = 0; // To track seconds
  Timer? _timer;   // Timer instance

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the screen is initialized
  }

  // Start timer function to increment time every second
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        seconds++;
      });
    });
  }

  // Format time to display in minutes:seconds format
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg/dsa.png'),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/avatars/avatar-8.jpg'), // Use any image or asset for user profile
              ),
              const SizedBox(height: 20),
      
              // User Name
              const Text(
                'Darling ❤️', // Example user name
                style: TextStyle(
                    fontFamily: "Helvetica-obl",
                    color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
      
              // Call Status
              Text(
                'WhatsApp Audio Calling...',

                style: TextStyle(
                    fontFamily: "Helvetica-bold",
                    color: Colors.grey[400], fontSize: 16),
              ),
              const SizedBox(height: 30),
      
              // Timer (Dynamic now)
              Text(
                formatTime(seconds), // Dynamic timer
                style: const TextStyle(
                    color: Colors.white70, fontSize: 26, letterSpacing: 2),
              ),
              const Spacer(),
      
              // Call Control Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute Button
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          isMuted ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isMuted = !isMuted;
                          });
                        },
                      ),
                      const Text(
                        'Mute',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),

                  // End Call Button
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call_end, color: Colors.red, size: 50),
                        onPressed: () {
                          Navigator.pop(context); // End call and return to the previous screen
                        },
                      ),
                      const Text(
                        'End',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),

                  // Speaker Button
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          isSpeakerOn ? Icons.volume_up : Icons.volume_off,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSpeakerOn = !isSpeakerOn;
                          });
                        },
                      ),
                      const Text(
                        'Speaker',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
