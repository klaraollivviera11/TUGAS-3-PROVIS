import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareProfile extends StatelessWidget {
  final String username = "@hafsahcantik";
  final String profileUrl = "https://example.com/profile/hafsohcantik";

  const ShareProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00897B), // Teal background color
      appBar: AppBar(
        backgroundColor: Color(0xFF00897B),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // QR Code Card
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Username
                  Text(
                    username,
                    style: TextStyle(
                      color: Color(0xFF4DB6AC),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  
                  // Custom QR Code (simplified representation)
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF4DB6AC), width: 2),
                    ),
                    child: CustomPaint(
                      painter: SimplifiedQRPainter(color: Color(0xFF4DB6AC)),
                      size: Size(200, 200),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Action Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        context, 
                        "Share Profile", 
                        () => _shareProfile(context)
                      ),
                      _buildActionButton(
                        context, 
                        "Copy Link", 
                        () => _copyLink(context)
                      ),
                      _buildActionButton(
                        context, 
                        "Download", 
                        () => _downloadQR(context)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xFF00897B),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB2DFDB),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
    );
  }

  void _shareProfile(BuildContext context) {
    // Show a dialog instead of using the share package
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Share Profile'),
        content: Text('Share your profile: $profileUrl'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _copyLink(BuildContext context) {
    Clipboard.setData(ClipboardData(text: profileUrl));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile link copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _downloadQR(BuildContext context) {
    // Show a notification since we can't actually download without additional packages
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('QR Code download feature would be implemented here'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

// A simple custom painter to draw a simplified QR code representation
class SimplifiedQRPainter extends CustomPainter {
  final Color color;
  
  SimplifiedQRPainter({required this.color});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    
    // Draw a simplified QR code pattern
    // Corner squares
    final double blockSize = size.width / 10;
    
    // Top-left corner
    canvas.drawRect(Rect.fromLTWH(blockSize, blockSize, blockSize * 3, blockSize * 3), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 2, blockSize * 2, blockSize, blockSize), paint);
    
    // Top-right corner
    canvas.drawRect(Rect.fromLTWH(blockSize * 6, blockSize, blockSize * 3, blockSize * 3), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 7, blockSize * 2, blockSize, blockSize), paint);
    
    // Bottom-left corner
    canvas.drawRect(Rect.fromLTWH(blockSize, blockSize * 6, blockSize * 3, blockSize * 3), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 2, blockSize * 7, blockSize, blockSize), paint);
    
    // Draw some random blocks to make it look like a QR code
    canvas.drawRect(Rect.fromLTWH(blockSize * 5, blockSize * 3, blockSize, blockSize), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 3, blockSize * 5, blockSize, blockSize), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 7, blockSize * 5, blockSize, blockSize), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 5, blockSize * 7, blockSize, blockSize), paint);
    canvas.drawRect(Rect.fromLTWH(blockSize * 4, blockSize * 4, blockSize * 2, blockSize * 2), paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}