// 4. WAP to create abstract classes & methods to define in child class.

abstract class Shape {
  //abstract method
  double calculateArea();

  //abstract method
  double calculatePerimeter();

  //non abstract method
  String getShapeName();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14 * radius * radius;
  }

  @override
  double calculatePerimeter() {
    return 2 * 3.14 * radius;
  }

  @override
  String getShapeName() {
    return 'Circle';
  }
}

class Rectangle extends Shape {
  final double length;
  final double width;

  Rectangle(this.length, this.width);

  @override
  double calculateArea() {
    return length * width;
  }

  @override
  double calculatePerimeter() {
    return 2 * (length + width);
  }

  @override
  String getShapeName() {
    return 'Rectangle';
  }
}
