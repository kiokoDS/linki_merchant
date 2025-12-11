import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          'My Profile',
          style: GoogleFonts.figtree(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE8F5E9),
              child: Icon(Icons.person, size: 50, color: Color(0xFF50C878)),
            ),
            const SizedBox(height: 12),
             Text(
              'John Doe',
              style: GoogleFonts.figtree(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'john@email.com',
              style: GoogleFonts.figtree(color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '42',
                        style: GoogleFonts.figtree(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text('Total Orders'),
                    ],
                  ),
                  Column(
                    children:  [
                      Text(
                        '58,400',
                        style: GoogleFonts.figtree(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Total Spent'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(Icons.edit_outlined, 'Edit Profile'),
            _buildMenuItem(Icons.payment, 'Payment Methods'),
            _buildMenuItem(Icons.book_outlined, 'Address Book'),
            _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
            _buildMenuItem(Icons.lock_outline, 'Change Password'),
            _buildMenuItem(Icons.help_outline, 'Help Center'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) =>  LoginScreen()),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF50C878),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  Text(
                    'Log Out',
                    style: GoogleFonts.figtree(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE8F5E9),
        child: Icon(icon, color: const Color(0xFF50C878)),
      ),
      title: Text(title, style: GoogleFonts.figtree(fontSize: 14),),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}