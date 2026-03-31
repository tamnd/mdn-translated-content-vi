---
title: static
slug: Web/JavaScript/Reference/Classes/static
page-type: javascript-language-feature
browser-compat: javascript.classes.static
sidebar: jssidebar
---

Từ khóa **`static`** định nghĩa [phương thức hoặc trường static](/en-US/docs/Web/JavaScript/Reference/Classes#static_methods_and_fields) cho một class, hoặc một [khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks) (xem liên kết để biết thêm thông tin về cách sử dụng này). Các thuộc tính static không thể được truy cập trực tiếp trên các instance của class. Thay vào đó, chúng được truy cập trên chính class đó.

Các phương thức static thường là các hàm tiện ích, như hàm để tạo hoặc sao chép đối tượng, trong khi các thuộc tính static hữu ích cho cache, cấu hình cố định, hoặc bất kỳ dữ liệu nào bạn không cần sao chép qua các instance.

> [!NOTE]
> Trong ngữ cảnh của class, nội dung MDN Web Docs sử dụng các thuật ngữ properties và [fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) thay thế cho nhau.

{{InteractiveExample("JavaScript Demo: Class static", "taller")}}

```js interactive-example
class ClassWithStaticMethod {
  static staticProperty = "someValue";
  static staticMethod() {
    return "static method has been called.";
  }
  static {
    console.log("Class static initialization block called");
  }
}

console.log(ClassWithStaticMethod.staticProperty);
// Expected output: "someValue"
console.log(ClassWithStaticMethod.staticMethod());
// Expected output: "static method has been called."
```

## Cú pháp

```js-nolint
class ClassWithStatic {
  static staticField;
  static staticFieldWithInitializer = value;
  static staticMethod() {
    // …
  }
}
```

Có một số hạn chế cú pháp bổ sung:

- Tên của thuộc tính static (field hoặc method) không thể là `prototype`.
- Tên của class field (static hoặc instance) không thể là `constructor`.

## Mô tả

Trang này giới thiệu các public static property của class, bao gồm static method, static accessor và static field.

- Đối với các tính năng private static, xem [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).
- Đối với các tính năng instance, xem [methods definitions](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions), [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get), [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set), và [public class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields).

Các public static feature được khai báo bằng từ khóa `static`. Chúng được thêm vào class constructor tại thời điểm [class được đánh giá](/en-US/docs/Web/JavaScript/Reference/Classes#evaluation_order) bằng ngữ nghĩa [`[[DefineOwnProperty]]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty) (về cơ bản là {{jsxref("Object.defineProperty()")}}). Chúng được truy cập lại từ class constructor.

Các phương thức static thường là các hàm tiện ích, như hàm để tạo hoặc sao chép instance. Các public static field hữu ích khi bạn muốn một field chỉ tồn tại một lần cho mỗi class, không phải trên mỗi instance của class bạn tạo. Điều này hữu ích cho cache, cấu hình cố định, hoặc bất kỳ dữ liệu nào bạn không cần sao chép qua các instance.

Tên static field có thể được [tính toán](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names). Giá trị `this` trong biểu thức tính toán là `this` xung quanh định nghĩa class, và việc tham chiếu đến tên class là {{jsxref("ReferenceError")}} vì class chưa được khởi tạo. {{jsxref("Operators/await", "await")}} và {{jsxref("Operators/yield", "yield")}} hoạt động như mong đợi trong biểu thức này.

Static field có thể có initializer. Static field không có initializer được khởi tạo thành `undefined`. Các public static field không được khởi tạo lại trên subclass, nhưng có thể được truy cập thông qua prototype chain.

```js
class ClassWithStaticField {
  static staticField;
  static staticFieldWithInitializer = "static field";
}

class SubclassWithStaticField extends ClassWithStaticField {
  static subStaticField = "subclass field";
}

console.log(Object.hasOwn(ClassWithStaticField, "staticField")); // true
console.log(ClassWithStaticField.staticField); // undefined
console.log(ClassWithStaticField.staticFieldWithInitializer); // "static field"
console.log(SubclassWithStaticField.staticFieldWithInitializer); // "static field"
console.log(SubclassWithStaticField.subStaticField); // "subclass field"
```

Trong field initializer, [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) đề cập đến class hiện tại (mà bạn cũng có thể truy cập thông qua tên của nó), và [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super) đề cập đến class constructor cơ sở.

```js
class ClassWithStaticField {
  static baseStaticField = "base static field";
  static anotherBaseStaticField = this.baseStaticField;

  static baseStaticMethod() {
    return "base static method output";
  }
}

class SubClassWithStaticField extends ClassWithStaticField {
  static subStaticField = super.baseStaticMethod();
}

console.log(ClassWithStaticField.anotherBaseStaticField); // "base static field"
console.log(SubClassWithStaticField.subStaticField); // "base static method output"
```

Biểu thức được đánh giá đồng bộ. Bạn không thể sử dụng {{jsxref("Operators/await", "await")}} hoặc {{jsxref("Operators/yield", "yield")}} trong biểu thức initializer. (Hãy nghĩ về biểu thức initializer như được bao bọc ngầm trong một hàm.)

Các static field initializer và [static initialization block](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks) được đánh giá lần lượt từng cái một. Field initializer có thể tham chiếu đến các giá trị field ở trên nó, nhưng không phải ở dưới. Tất cả static method được thêm vào trước và có thể được truy cập, mặc dù việc gọi chúng có thể không hoạt động như mong đợi nếu chúng tham chiếu đến các field ở dưới field đang được khởi tạo.

> [!NOTE]
> Điều này quan trọng hơn với [private static field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), vì việc truy cập một private field chưa được khởi tạo sẽ ném ra {{jsxref("TypeError")}}, ngay cả khi private field được khai báo ở dưới. (Nếu private field không được khai báo, nó sẽ là {{jsxref("SyntaxError")}} sớm.)

## Ví dụ

### Sử dụng static member trong class

Ví dụ sau minh họa một số điều:

1. Cách một static member (method hoặc property) được định nghĩa trên một class.
2. Rằng một class có static member có thể được kế thừa.
3. Cách một static member có thể và không thể được gọi.

```js
class Triple {
  static customName = "Tripler";
  static description = "I triple any number you provide";
  static calculate(n = 1) {
    return n * 3;
  }
}

class SquaredTriple extends Triple {
  static longDescription;
  static description = "I square the triple of any number you provide";
  static calculate(n) {
    return super.calculate(n) * super.calculate(n);
  }
}

console.log(Triple.description); // 'I triple any number you provide'
console.log(Triple.calculate()); // 3
console.log(Triple.calculate(6)); // 18

const tp = new Triple();

console.log(SquaredTriple.calculate(3)); // 81 (not affected by parent's instantiation)
console.log(SquaredTriple.description); // 'I square the triple of any number you provide'
console.log(SquaredTriple.longDescription); // undefined
console.log(SquaredTriple.customName); // 'Tripler'

// This throws because calculate() is a static member, not an instance member.
console.log(tp.calculate()); // 'tp.calculate is not a function'
```

### Gọi static member từ một static method khác

Để gọi một static method hoặc property trong một static method khác của cùng một class, bạn có thể sử dụng từ khóa [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this).

```js
class StaticMethodCall {
  static staticProperty = "static property";
  static staticMethod() {
    return `Static method and ${this.staticProperty} has been called`;
  }
  static anotherStaticMethod() {
    return `${this.staticMethod()} from another static method`;
  }
}
StaticMethodCall.staticMethod();
// 'Static method and static property has been called'

StaticMethodCall.anotherStaticMethod();
// 'Static method and static property has been called from another static method'
```

### Gọi static member từ class constructor và các phương thức khác

Các static member không thể được truy cập trực tiếp bằng từ khóa {{jsxref("Operators/this", "this")}} từ các phương thức không phải static. Bạn cần gọi chúng bằng tên class: `CLASSNAME.STATIC_METHOD_NAME()` / `CLASSNAME.STATIC_PROPERTY_NAME` hoặc bằng cách gọi phương thức như một thuộc tính của `constructor`: `this.constructor.STATIC_METHOD_NAME()` / `this.constructor.STATIC_PROPERTY_NAME`

```js
class StaticMethodCall {
  constructor() {
    console.log(StaticMethodCall.staticProperty); // 'static property'
    console.log(this.constructor.staticProperty); // 'static property'
    console.log(StaticMethodCall.staticMethod()); // 'static method has been called.'
    console.log(this.constructor.staticMethod()); // 'static method has been called.'
  }

  static staticProperty = "static property";
  static staticMethod() {
    return "static method has been called.";
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Using classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Static initialization blocks](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)
- {{jsxref("Statements/class", "class")}}
