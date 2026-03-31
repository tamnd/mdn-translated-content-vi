---
title: class
slug: Web/JavaScript/Reference/Statements/class
page-type: javascript-statement
browser-compat: javascript.statements.class
sidebar: jssidebar
---

Khai báo **`class`** tạo một {{Glossary("binding")}} của [class](/en-US/docs/Web/JavaScript/Reference/Classes) mới với tên đã cho.

Bạn cũng có thể định nghĩa class bằng cách sử dụng [biểu thức `class`](/en-US/docs/Web/JavaScript/Reference/Operators/class).

{{InteractiveExample("JavaScript Demo: class declaration")}}

```js interactive-example
class Polygon {
  constructor(height, width) {
    this.area = height * width;
  }
}

console.log(new Polygon(4, 3).area);
// Expected output: 12
```

## Cú pháp

```js-nolint
class name {
  // class body
}
class name extends otherName {
  // class body
}
```

## Mô tả

Thân class của một khai báo class được thực thi trong [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Khai báo `class` rất giống với {{jsxref("Statements/let", "let")}}:

- Khai báo `class` có phạm vi trong cả block lẫn hàm.
- Khai báo `class` chỉ có thể được truy cập sau khi đạt đến vị trí khai báo (xem [temporal dead zone](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz)). Vì lý do này, khai báo `class` thường được coi là [không được hoisted](/en-US/docs/Glossary/Hoisting) (khác với [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function)).
- Khai báo `class` không tạo thuộc tính trên {{jsxref("globalThis")}} khi được khai báo ở cấp cao nhất của một script (khác với [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function)).
- Khai báo `class` không thể được [khai báo lại](/en-US/docs/Web/JavaScript/Reference/Statements/let#redeclarations) bởi bất kỳ khai báo nào khác trong cùng phạm vi.

Bên ngoài thân class, khai báo `class` có thể được gán lại như `let`, nhưng bạn nên tránh làm vậy. Bên trong thân class, binding là hằng số như `const`.

```js
class Foo {
  static {
    Foo = 1; // TypeError: Assignment to constant variable.
  }
}

class Foo2 {
  bar = (Foo2 = 1); // TypeError: Assignment to constant variable.
}

class Foo3 {}
Foo3 = 1;
console.log(Foo3); // 1
```

## Ví dụ

### Khai báo class

Trong ví dụ sau, trước tiên chúng ta định nghĩa một class có tên `Rectangle`, sau đó mở rộng nó để tạo một class có tên `FilledRectangle`.

Lưu ý rằng `super()`, được sử dụng trong `constructor`, chỉ có thể được dùng trong các constructor, và _bắt buộc_ phải được gọi _trước_ khi từ khóa `this` có thể được sử dụng.

```js
class Rectangle {
  constructor(height, width) {
    this.name = "Rectangle";
    this.height = height;
    this.width = width;
  }
}

class FilledRectangle extends Rectangle {
  constructor(height, width, color) {
    super(height, width);
    this.name = "Filled rectangle";
    this.color = color;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`function`](/en-US/docs/Web/JavaScript/Reference/Statements/function)
- [Biểu thức `class`](/en-US/docs/Web/JavaScript/Reference/Operators/class)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
