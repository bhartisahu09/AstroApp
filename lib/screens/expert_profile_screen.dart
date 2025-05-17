import 'package:flutter/material.dart';

class ExpertProfileScreen extends StatelessWidget {
  const ExpertProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 8),
          _buildInfoCard(),
          const SizedBox(height: 16),
          _buildSectionTitle("Images"),
          const SizedBox(height: 5),
          _buildImageCarousel(),
          const SizedBox(height: 8),
          _buildSectionTitle("Send Gifts"),
          const SizedBox(height: 8),
          _buildGiftRow(),
          const SizedBox(height: 16),
          _buildSectionTitle("Profile Summary"),
          const SizedBox(height: 4),
          const Text(
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium...",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          _buildSectionTitle("Specialization"),
          const SizedBox(height: 4),
          const Text("Expert in Love, Marriage, Career, Business"),
          const SizedBox(height: 8),
          _buildSectionTitle("Languages"),
          const SizedBox(height: 4),
          const Text("Kannada, Telugu, Tamil, English, Hindi"),
          const SizedBox(height: 14),
          _buildChatWithAssistantButton(),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey),
          _buildUserReview(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 84, 220, 1),
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Rakesh Kaushik", style: TextStyle(color: Colors.white)),
          SizedBox(width: 8),
          CircleAvatar(radius: 5, backgroundColor: Colors.green),
        ],
      ),
      actions: const [
        Icon(Icons.share_outlined),
        SizedBox(width: 5),
        Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2)),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: BottomButton(icon: 'assets/images/bubble-chat.png', label: "10₹/min")),
          SizedBox(width: 10),
          Expanded(child: BottomButton(icon: 'assets/images/calls.png', label: "10₹/min")),
          SizedBox(width: 10),
          Expanded(child: BottomButton(icon: 'assets/images/video.png', label: "10₹/min")),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: Text("Rakesh Kaushik", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color.fromARGB(255, 204, 203, 203), width: 0.2),
      ),
      color: const Color.fromRGBO(235, 243, 255, 1),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: InfoBox(title: "⭐ 4.2", subtitle: "Rating")),
              Expanded(child: InfoBox(title: "10", subtitle: "Experience")),
              Expanded(child: InfoBox(title: "10K", subtitle: "Followers")),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: const Color.fromRGBO(247, 247, 247, 1),
            child: Row(
              children: [
                Image.asset('assets/images/call.png', width: 28, height: 28),
                const SizedBox(width: 4),
                const Text('9k mins'),
                const SizedBox(width: 10),
                Image.asset('assets/images/Chat.png', width: 28, height: 28),
                const SizedBox(width: 4),
                const Text('22k mins'),
                const Spacer(),
                SizedBox(
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 84, 220, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }

  Widget _buildImageCarousel() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: const Color.fromARGB(255, 220, 221, 221),
              child: const SizedBox(width: 150, height: 150),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildGiftRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GiftTile(label: "Pooja", price: 47),
        GiftTile(label: "Heart", price: 23),
        GiftTile(label: "Rose", price: 68),
        GiftTile(label: "Gem", price: 85),
      ],
    );
  }

  Widget _buildChatWithAssistantButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 247, 246, 246),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/supportchat.png', width: 28, height: 28),
                const SizedBox(width: 8),
                const Text("Chat With Assistant", style: TextStyle(color: Colors.black)),
              ],
            ),
            Image.asset('assets/images/arrow.png', width: 28, height: 28),
          ],
        ),
      ),
    );
  }

  Widget _buildUserReview() {
    return const Row(
      children: [
        Text("User Review", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(width: 10),
        Text(
          "(400 peoples)",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color.fromARGB(255, 79, 79, 79)),
        ),
      ],
    );
  }
}

// Reusable Info Box
class InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoBox({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Text(subtitle, style: const TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }
}

// Reusable Gift Tile
class GiftTile extends StatelessWidget {
  final String label;
  final int price;

  const GiftTile({required this.label, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 66,
          height: 66,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
        Text("₹ $price"),
      ],
    );
  }
}

// Reusable Bottom Button
class BottomButton extends StatelessWidget {
  final String label;
  final String icon;
  final double? width;
  final double? height;

  const BottomButton({
    super.key,
    required this.label,
    required this.icon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 34,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(18, 187, 17, 1),
          padding: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 20, height: 20, color: Colors.white, fit: BoxFit.contain),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}
