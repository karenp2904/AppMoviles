import 'package:flutter/material.dart';


class WidgetsDemoScreen extends StatefulWidget {
  @override
  _WidgetsDemoScreenState createState() => _WidgetsDemoScreenState();
}

class _WidgetsDemoScreenState extends State<WidgetsDemoScreen> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String _dropdownValue = 'Option 1';
  final List<String> _favoriteProducts = ['Laptop', 'Smartphone', 'Headphones', 'Smartwatch', 'Camera'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widgets Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Simple Text Widget', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Button Pressed!'))),
                child: const Text('Elevated Button'),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: 'Text Field', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: const Text('Switch'),
                value: _switchValue,
                onChanged: (value) => setState(() => _switchValue = value),
              ),
              const SizedBox(height: 10),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 1,
                onChanged: (value) => setState(() => _sliderValue = value),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _dropdownValue,
                onChanged: (value) => setState(() => _dropdownValue = value!),
                items: const [
                  DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                  DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text('This is a Card'),
                      SizedBox(height: 5),
                      Icon(Icons.star, color: Colors.blue, size: 30),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            
              const Text('Favorite Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: _favoriteProducts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.red),
                      title: Text(_favoriteProducts[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
