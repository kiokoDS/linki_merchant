import 'package:flutter/material.dart';
import 'package:linky/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linky/send.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children:  [
            Image.asset(
              "assets/images/linki.png",
              fit: BoxFit.contain,
              height: 100,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),
              Text(
                'Suggestions',
                style: GoogleFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),

              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSuggestionCard(
                    Icons.shopping_bag_outlined,
                    'Pickup',
                    const Color(0xFFE8F5E9),
                  ),
                  _buildSuggestionCard(
                    Icons.delivery_dining,
                    'Delivery',
                    const Color(0xFFE3F2FD),
                  ),
                  _buildSuggestionCard(
                    Icons.schedule,
                    'Schedule',
                    const Color(0xFFFFF3E0),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Popular Near You',
                    style: GoogleFonts.figtree(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    // style: TextStyle(
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:  Text(
                      'See All',
                      style: GoogleFonts.figtree(color: Color(0xFF50C878)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRestaurantCard(
                      'Mama Oliech\'s Kitchen',
                      'African • Seafood',
                      '4.5',
                      'https://images.unsplash.com/photo-1665332195309-9d75071138f0?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    _buildRestaurantCard(
                      'Warid Supermarket',
                      'Groceries • Fresh Produce',
                      '4.8',
                      'https://images.unsplash.com/photo-1604329756574-bda1f2cada6f?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
               Text(
                'Recent',
                style: GoogleFonts.figtree(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              _buildRecentOrder(
                'Home',
                '23, Loreto close, By Spades',
                Icons.home_outlined,
              ),
              _buildRecentOrder(
                'Work',
                '450, Senator Rd, Tuvaco',
                Icons.work_outline,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.figtree(color: Colors.black54),
        unselectedLabelStyle: GoogleFonts.figtree(),
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF50C878),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard(IconData icon, String label, Color bgColor) {
    return GestureDetector(
      onTap: (){
        switch (label) {
          case "Pickup":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SendPage()),
            );
            break;

          case "Delivery":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SendPage()),
            );
            break;

          case "Schedule":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SendPage()),
            );
            break;

          default:
            print("Unknown label: $label");
        }
      },
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: const Color(0xFF50C878)),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.figtree(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(
      String name, String category, String rating, String image) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(12)),
              color: Colors.grey[300],
            ),
            child: Center(child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
                )
              ,
              child: Image.network(
                image,
                loadingBuilder: (context, child, loading) {
                  if (loading == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, err, stack) => const Icon(Icons.error),
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style:  GoogleFonts.figtree(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  category,
                  style: GoogleFonts.figtree(fontSize: 12, color: Colors.grey[600]),

                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    Text(' $rating'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrder(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFE8F5E9),
        child: Icon(icon, color: const Color(0xFF50C878)),
      ),
      title: Text(title, style:  GoogleFonts.figtree(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
    );
  }
}
