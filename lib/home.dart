import 'package:flutter/material.dart';
import 'app_theme/app_color.dart';
import 'app_theme/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'image': 'assets/img.png',
      'title': 'FinnNavian',
      'subtitle': 'Scandinavian small sized double sofa imported full leather',
      'price': '\$248',
    },
    {
      'image': 'assets/img.png',
      'title': 'Luxury Sofa',
      'subtitle': 'Comfortable and elegant design',
      'price': '\$299',
    },
    {
      'image': 'assets/img.png',
      'title': 'Modern Chair',
      'subtitle': 'Stylish and compact',
      'price': '\$180',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.selectedItemColor,
        unselectedItemColor: AppColors.unselectedItemColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.container,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/user.jpg'),
                        radius: 25,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.shopping_cart, color: Colors.white),
                            onPressed: () {},
                          ),
                          const Icon(Icons.menu, color: Colors.white, size: 30),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(AppStrings.welcomeMessage),
                  const SizedBox(height: 5),
                  const Text(
                    AppStrings.question,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search, color: Colors.yellow),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(icon: Icons.chair, label: "Sofas"),
                CategoryItem(icon: Icons.bedroom_parent, label: "Wardrobe"),
                CategoryItem(icon: Icons.desktop_windows, label: "Desk"),
                CategoryItem(icon: Icons.bedroom_baby, label: "Dresser"),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(product['image']!, fit: BoxFit.cover),
                      ListTile(
                        title: Text(product['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(product['subtitle']!),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: const Icon(Icons.favorite_border),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product['price']!, style: const TextStyle(color: Colors.orange, fontSize: 16)),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                              child: const Text("Add to cart"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
