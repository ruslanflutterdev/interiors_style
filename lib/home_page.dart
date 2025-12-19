import 'package:flutter/material.dart';
import 'package:interiors_style/style_page.dart';
import 'interior_style.dart';

// Главный экран с сеткой стилей
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Стили интерьера")), // Заголовок приложения
      body: Padding(
        padding: EdgeInsets.all(8.0), // Отступы от краев экрана
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Две колонки в сетке
            crossAxisSpacing: 8, // Расстояние между колонками
            mainAxisSpacing: 8, // Расстояние между строками
            childAspectRatio:
                1.3, // Соотношение сторон элемента (ширина/высота)
          ),
          itemCount: styles.length, // Количество элементов в списке
          itemBuilder: (context, index) {
            final style = styles[index]; // Берем текущий стиль

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StylePage(style: style),
                  ),
                );
                // Здесь будет переход на страницу стиля
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                // Закругленные углы
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                10)), // Закругление только сверху
                        child: Image.asset(
                          style.images[0], // Берем первое изображение из списка
                          fit: BoxFit
                              .cover, // Растягиваем изображение по размеру
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0), // Отступы вокруг текста
                      child: Text(
                        style.name, // Название стиля
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold), // Стиль текста
                        textAlign: TextAlign.center, // Выравнивание по центру
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
