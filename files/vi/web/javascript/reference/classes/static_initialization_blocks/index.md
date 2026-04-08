---
title: Static initialization blocks
slug: Web/JavaScript/Reference/Classes/Static_initialization_blocks
page-type: javascript-language-feature
browser-compat: javascript.classes.static.initialization_blocks
sidebar: jssidebar
---

**Static initialization block** (khối khởi tạo static) được khai báo trong một {{jsxref("Statements/class", "class")}}. Nó chứa các câu lệnh được đánh giá trong quá trình khởi tạo class. Điều này cho phép logic khởi tạo linh hoạt hơn so với thuộc tính {{jsxref("Classes/static", "static")}}, chẳng hạn như sử dụng `try...catch` hoặc thiết lập nhiều field từ một giá trị. Khởi tạo được thực hiện trong ngữ cảnh của khai báo class hiện tại, với quyền truy cập vào trạng thái private, cho phép class chia sẻ thông tin về các private element của nó với các class hoặc hàm khác được khai báo trong cùng phạm vi (tương tự như class "friend" trong C++).

{{InteractiveExample("JavaScript Demo: Class static initialization blocks")}}

```js interactive-example
class ClassWithStaticInitializationBlock {
  static staticProperty1 = "Property 1";
  static staticProperty2;
  static {
    this.staticProperty2 = "Property 2";
  }
}

console.log(ClassWithStaticInitializationBlock.staticProperty1);
// Expected output: "Property 1"
console.log(ClassWithStaticInitializationBlock.staticProperty2);
// Expected output: "Property 2"
```

## Cú pháp

```js-nolint
class ClassWithSIB {
  static {
    // …
  }
}
```

## Mô tả

Nếu không có static initialization block, việc khởi tạo static phức tạp có thể được thực hiện bằng cách gọi một static method sau khai báo class:

```js
class MyClass {
  static init() {
    // Access to private static fields is allowed here
  }
}

MyClass.init();
```

Tuy nhiên, cách tiếp cận này làm lộ chi tiết triển khai (phương thức `init()`) cho người dùng class. Mặt khác, bất kỳ logic khởi tạo nào được khai báo bên ngoài class đều không có quyền truy cập vào private static field. Static initialization block cho phép logic khởi tạo tùy ý được khai báo trong class và thực thi trong quá trình đánh giá class.

Một {{jsxref("Statements/class", "class")}} có thể có bất kỳ số lượng khối khởi tạo `static {}` nào trong thân class. Các khối này được [đánh giá](/en-US/docs/Web/JavaScript/Reference/Classes#evaluation_order), cùng với bất kỳ static field initializer xen kẽ nào, theo thứ tự chúng được khai báo. Bất kỳ khởi tạo static nào của super class được thực hiện trước, trước khởi tạo của các subclass của nó.

Phạm vi của các biến được khai báo bên trong static block là cục bộ với block. Điều này bao gồm khai báo `var`, `function`, `const`, và `let`. Khai báo `var` sẽ không được hoist ra ngoài static block.

```js
var y = "Outer y";

class A {
  static field = "Inner y";
  static {
    // var y only hoisted inside block
    console.log(y); // undefined <-- not 'Outer y'

    var y = this.field;
  }
}

// var y defined in static block is not hoisted
// outside the block
console.log(y); // 'Outer y'
```

`this` bên trong static block đề cập đến đối tượng constructor của class. `super.property` có thể được sử dụng để truy cập các thuộc tính static của super class. Tuy nhiên, lưu ý rằng đây là lỗi cú pháp khi gọi {{jsxref("Operators/super", "super()")}} trong static initialization block của class, hoặc sử dụng đối tượng {{jsxref("Functions/arguments", "arguments")}}.

Các câu lệnh được đánh giá đồng bộ. Bạn không thể sử dụng {{jsxref("Operators/await", "await")}} hoặc {{jsxref("Operators/yield", "yield")}} trong block này. (Hãy nghĩ về các câu lệnh khởi tạo như được bao bọc ngầm trong một hàm.)

Phạm vi của static block được lồng _trong_ phạm vi từ vựng của thân class, và có thể truy cập [tên private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) được khai báo trong class mà không gây ra lỗi cú pháp.

[Static field](/en-US/docs/Web/JavaScript/Reference/Classes/static) initializer và static initialization block được đánh giá lần lượt từng cái một. Khối khởi tạo có thể tham chiếu đến các giá trị field ở trên nó, nhưng không phải ở dưới. Tất cả static method được thêm vào trước và có thể được truy cập, mặc dù việc gọi chúng có thể không hoạt động như mong đợi nếu chúng tham chiếu đến các field ở dưới block hiện tại.

> [!NOTE]
> Điều này quan trọng hơn với [private static field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), vì việc truy cập một private field chưa được khởi tạo sẽ ném ra {{jsxref("TypeError")}}, ngay cả khi private field được khai báo ở dưới. (Nếu private field không được khai báo, nó sẽ là {{jsxref("SyntaxError")}} sớm.)

Static initialization block không thể có decorator (bản thân class có thể có).

## Ví dụ

### Nhiều block

Code dưới đây minh họa một class với các static initialization block và static field initializer xen kẽ. Đầu ra cho thấy các block và field được đánh giá theo thứ tự thực thi.

```js
class MyClass {
  static field1 = console.log("static field1");
  static {
    console.log("static block1");
  }
  static field2 = console.log("static field2");
  static {
    console.log("static block2");
  }
}
// 'static field1'
// 'static block1'
// 'static field2'
// 'static block2'
```

Lưu ý rằng bất kỳ khởi tạo static nào của super class được thực hiện trước, trước khởi tạo của các subclass.

### Sử dụng this và super

`this` bên trong static block đề cập đến đối tượng constructor của class. Code này cho thấy cách truy cập một public static field.

```js
class A {
  static field = "static field";
  static {
    console.log(this.field);
  }
}
// 'static field'
```

Cú pháp [`super.property`](/en-US/docs/Web/JavaScript/Reference/Operators/super) có thể được sử dụng bên trong `static` block để tham chiếu đến các thuộc tính static của super class.

```js
class A {
  static field = "static field";
}

class B extends A {
  static {
    console.log(super.field);
  }
}
// 'static field'
```

### Truy cập private element

Ví dụ dưới đây cho thấy cách cấp quyền truy cập vào private instance field của một class từ một đối tượng bên ngoài class (ví dụ từ [blog v8.dev](https://v8.dev/features/class-static-initializer-blocks#access-to-private-fields)):

```js
let getDPrivateField;

class D {
  #privateField;
  constructor(v) {
    this.#privateField = v;
  }
  static {
    getDPrivateField = (d) => d.#privateField;
  }
}

console.log(getDPrivateField(new D("private"))); // 'private'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Using classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Classes/static", "static")}}
- {{jsxref("Statements/class", "class")}}
- [Class static initialization blocks](https://v8.dev/features/class-static-initializer-blocks) on v8.dev (2021)
- [ES2022 feature: class static initialization blocks](https://2ality.com/2021/09/class-static-block.html) by Dr. Axel Rauschmayer (2021)
