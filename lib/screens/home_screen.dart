import 'package:flutter/material.dart';
import 'expert_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> experts = List.generate(
    6,
    (_) => {
      "name": "Rakesh Kaushik",
      "rating": 4.7,
      "experience": "10 years",
      "price": "10₹/min",
      "discount": "20₹/min",
      "oldPrice": "20₹/min"
    },
  );

  final List<Map<String, String>> categories = [
    {"label": "Match Making", "icon": "assets/images/matchmarking.png"},
    {"label": "Subh Muhurat", "icon": "assets/images/subhmuhrat.png"},
    {"label": "Horoscope", "icon": "assets/images/horoscrope.png"},
    {"label": "Kundali", "icon": "assets/images/kundli.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            const Divider(thickness: 4, color: Color(0xFFF3F2F2)),
            _buildCategoryList(),
            _buildPromotionalCards(),
            _buildExpertsHeader(),
            _buildExpertsGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
       selectedItemColor: const Color.fromARGB(255, 126, 126, 126),
      unselectedItemColor: const Color.fromARGB(255, 126, 126, 126),
      items: [
        _buildNavItem("Home", "assets/images/Home.png"),
        _buildNavItem("Courses", "assets/images/course.png"),
        _buildNavItem("Shop", "assets/images/shops.png"),
        _buildNavItem("Profile", "assets/images/UserProfile.png"),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(String label, String iconPath) {
    return BottomNavigationBarItem(
      icon: Image.asset(iconPath, width: 28, height: 28),
      label: label,
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Image.asset('assets/images/Vector.png', width: 36, height: 36),
          const Spacer(),
          Image.asset('assets/images/search.png', width: 28, height: 28),
          const SizedBox(width: 10),
          Image.asset('assets/images/notification.png', width: 28, height: 28),
          const SizedBox(width: 10),
          _buildWalletBox(),
        ],
      ),
    );
  }

  Widget _buildWalletBox() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/shop.png', width: 26, height: 26),
            const SizedBox(width: 4),
            const Text("100 ₹", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 30),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryIcon(
            label: category["label"]!,
            icon: Image.asset(category["icon"]!, width: 50, height: 50),
          );
        },
      ),
    );
  }

  Widget _buildPromotionalCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: List.generate(2, (_) => const _CardWidget()),
      ),
    );
  }

  Widget _buildExpertsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Our Experts", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Image.asset('assets/images/filter.png', width: 20, height: 20),
        ],
      ),
    );
  }

  Widget _buildExpertsGrid(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: experts.length,
        padding: const EdgeInsets.only(bottom: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return ExpertCard(data: experts[index]);
        },
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String label;
  final Widget icon;

  const CategoryIcon({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: icon),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: const Color(0xFFCAC9C9),
      child: Container(
        width: 350,
        height: 120,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "Explore your zodiac and \ncosmic insights live!",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset('assets/images/circle.png', width: 28, height: 28),
                      const SizedBox(width: 6),
                      const Text(
                        "Rakesh Kaushik",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: const Color(0xFFC6C6C6),
              margin: const EdgeInsets.only(left: 16, top: 68),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/view.png', width: 32, height: 32, color: Colors.white),
                    const SizedBox(width: 4),
                    const Text("13k", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpertCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const ExpertCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ExpertProfileScreen())),
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFCCCBCB), width: 0.1),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(radius: 5, backgroundColor: Colors.green),
            const SizedBox(height: 92),
            Text(data['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rating: ", style: TextStyle(color: Colors.grey, fontSize: 14)),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                Text("${data['rating']}", style: const TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Exp: ", style: TextStyle(color: Colors.grey, fontSize: 14)),
                Text(data['experience'], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE5EFFF),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                border: Border.all(color: const Color(0xFFCCCBCB), width: 0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${data['price']} ",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const TextSpan(text: "  "),
                      TextSpan(
                        text: "${data['oldPrice']}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
