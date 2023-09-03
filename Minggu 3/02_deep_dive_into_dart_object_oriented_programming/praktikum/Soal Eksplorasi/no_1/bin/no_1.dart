import 'package:no_1/no_1.dart' as no_1;

class Shape {
  int getArea() {
    return 0;
  }

  int getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int radius;

  Circle({required this.radius});

  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }

  @override
  int getPerimeter() {
    return (3.14 * 2 * radius).toInt();
  }
}

class Square implements Shape {
  int side;

  Square({required this.side});

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }
}

class Rectangle implements Shape {
  int width, height;

  Rectangle({required this.width, required this.height});

  @override
  int getArea() {
    return height * width;
  }

  @override
  int getPerimeter() {
    return 2 * (height + width);
  }
}

void main(List<String> arguments) {
  Circle circle1 = Circle(radius: 3);
  print(circle1.getArea());
  print('${circle1.getPerimeter()}\n');

  Square square1 = Square(side: 3);
  print(square1.getArea());
  print('${square1.getPerimeter()}\n');

  Rectangle rectangle1 = Rectangle(width: 5, height: 10);
  print(rectangle1.getArea());
  print(rectangle1.getPerimeter());
}
