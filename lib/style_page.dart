import 'package:flutter/material.dart';
import 'interior_style.dart';

class StylePage extends StatefulWidget {
  final InteriorStyle style;

  const StylePage({super.key, required this.style});

  @override
  _StylePageState createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  int _currentIndex = 0; // Текущий индекс изображения

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.style.name)),
      // Название стиля в заголовке
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Свайп изображений только внутри конкретного стиля
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: widget.style.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index; // Меняем текущий индекс
                  });
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.style.images[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Индикаторы (точки) для текущего изображения
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.style.images.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),

            // Описание стиля
            Text(
              widget.style.description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
