//Group Members:
//1. Muhammad Umar Farooq (22K-4218)
//2. SM Abu Bakar Burhan (22K-4184)
//3. Mustafa Shahzad     (22K-4166)

import 'package:flutter/material.dart';

void main() => runApp(WhatsAppClone());

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF111B21),
        primaryColor: Color(0xFF00A884),
      ),
      home: ChatsScreen(),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2C34),
        elevation: 0,
        title: Text(
          'WhatsApp',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterChips(),
          Expanded(child: _buildChatList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF00A884),
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1F2C34),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 12),
          Text(
            'Ask Meta AI or Search',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _filterChip('All', true),
          _filterChip('Unread', false),
          _filterChip('Favourites', false),
          _filterChip('Groups', false),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool selected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: selected ? Color(0xFF1D4D3E) : Color(0xFF1F2C34),
        labelStyle: TextStyle(
          color: selected ? Color(0xFF00A884) : Colors.grey,
        ),
        side: BorderSide.none,
      ),
    );
  }

  Widget _buildChatList() {
    return ListView(
      children: [
        _chatItem(
          name: 'Archived',
          message: '',
          time: '',
          count: '2',
          isArchived: true,
        ),
        _chatItem(
          name: 'Mama',
          message: 'Reached',
          time: '15:15',
          avatar: 'M',
          color: Colors.brown.shade700,
        ),
        _chatItem(
          name: 'Baba',
          message: 'Voice call',
          time: '14:41',
          hasVoiceCall: true,
        ),
        _chatItem(
          name: 'ACM NUCES KHI 2025-2026 U...',
          message: 'Announcements',
          time: '',
          isGroup: true,
        ),
        _chatItem(
          name: 'Umar Farooq',
          message: 'Umar Farooq reacted 👍 to "Friday Ko...',
          time: '12:36',
        ),
      ],
    );
  }

  Widget _chatItem({
    required String name,
    required String message,
    required String time,
    String? avatar,
    Color? color,
    String? count,
    bool isArchived = false,
    bool hasVoiceCall = false,
    bool isGroup = false,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: color ?? Colors.grey.shade800,
        child: isArchived
            ? Icon(Icons.archive, color: Colors.white)
            : Text(
                avatar ?? name[0],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      subtitle: Row(
        children: [
          if (hasVoiceCall) ...[
            Icon(Icons.call, size: 16, color: Colors.grey),
            SizedBox(width: 4),
          ],
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (time.isNotEmpty)
            Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
          if (count != null)
            Container(
              margin: EdgeInsets.only(top: 4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                shape: BoxShape.circle,
              ),
              child: Text(
                count,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1F2C34),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF00A884),
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Communities'),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
      ],
    );
  }
}
