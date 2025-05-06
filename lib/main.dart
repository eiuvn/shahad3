import 'package:flutter/material.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'عداد رقمي',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int currentCount = 0;

  void increment() {
    setState(() {
      currentCount++;
    });
    _checkMilestone();
  }

  void decrement() {
    setState(() {
      currentCount--;
    });
  }

  void resetCount() {
    setState(() {
      currentCount = 0;
    });
    _showMessage('تم تصفير العداد');
  }

  void _checkMilestone() {
    if (currentCount % 10 == 0 && currentCount != 0) {
      _showMessage('أحسنت! وصلت إلى $currentCount 🎉');
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
    Color? color,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: color,
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عداد رقمي'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$currentCount',
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'استخدم الأزرار للتحكم بالعدد',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildActionButton(
              icon: Icons.remove,
              onPressed: decrement,
              tooltip: 'إنقاص',
              color: Colors.redAccent,
            ),
            const SizedBox(width: 14),
            buildActionButton(
              icon: Icons.add,
              onPressed: increment,
              tooltip: 'زيادة',
              color: Colors.green,
            ),
            const SizedBox(width: 14),
            buildActionButton(
              icon: Icons.refresh,
              onPressed: resetCount,
              tooltip: 'إعادة تصفير',
              color: Colors.grey.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
