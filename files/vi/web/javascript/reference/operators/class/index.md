---
title: class expression
slug: Web/JavaScript/Reference/Operators/class
page-type: javascript-operator
browser-compat: javascript.operators.class
sidebar: jssidebar
---

Từ khóa **`class`** có thể được dùng để định nghĩa một class bên trong một biểu thức.

Bạn cũng có thể định nghĩa class bằng [khai báo `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class).

{{InteractiveExample("JavaScript Demo: class expression")}}

```js interactive-example
const Rectangle = class {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  area() {
    return this.height * this.width;
  }
};

console.log(new Rectangle(5, 8).area());
// Expected output: 40
```

## Cú pháp

```js-nolint
class {
  // class body
}
class name {
  // class body
}
```

> [!NOTE]
> Một [expression statement](/en-US/docs/Web/JavaScript/Reference/Statements/Expression_statement) không thể bắt đầu bằng từ khóa `class` để tránh mơ hồ với [khai báo `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class). Từ khóa `class` chỉ bắt đầu một biểu thức khi nó xuất hiện trong ngữ cảnh không thể chấp nhận câu lệnh.

## Mô tả

Một `class` expression rất giống và có cú pháp gần như giống hệt với [khai báo `class`](/en-US/docs/Web/JavaScript/Reference/Statements/class). Giống như khai báo `class`, thân của `class` expression được thực thi trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode). Sự khác biệt chính giữa `class` expression và khai báo `class` là _tên class_, có thể bỏ qua trong `class` expression để tạo các class _ẩn danh_. Class expression cho phép bạn định nghĩa lại class, trong khi khai báo lại class bằng khai báo `class` sẽ ném ra {{jsxref("SyntaxError")}}. Hãy xem thêm chương về [classes](/en-US/docs/Web/JavaScript/Reference/Classes) để biết thêm thông tin.

## Ví dụ

### Class expression cơ bản

Đây chỉ là một class expression ẩn danh mà bạn có thể tham chiếu bằng biến `Foo`.

```js
const Foo = class {
  constructor() {}
  bar() {
    return "Hello World!";
  }
};

const instance = new Foo();
instance.bar(); // "Hello World!"
Foo.name; // "Foo"
```

### Named class expression

Nếu bạn muốn tham chiếu đến class hiện tại bên trong thân class, bạn có thể tạo một _named class expression_. Tên chỉ hiển thị trong phạm vi của class expression đó.

```js
const Foo = class NamedFoo {
  constructor() {}
  whoIsThere() {
    return NamedFoo.name;
  }
};
const bar = new Foo();
bar.whoIsThere(); // "NamedFoo"
NamedFoo.name; // ReferenceError: NamedFoo is not defined
Foo.name; // "NamedFoo"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/class", "class")}}
- {{jsxref("Classes", "Classes", "", 1)}}
