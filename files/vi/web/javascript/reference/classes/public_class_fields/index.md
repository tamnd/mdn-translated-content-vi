---
title: Public class fields
slug: Web/JavaScript/Reference/Classes/Public_class_fields
page-type: javascript-language-feature
browser-compat: javascript.classes.public_class_fields
sidebar: jssidebar
---

**Public field** (trường public) là các thuộc tính writable, enumerable và configurable được định nghĩa trên mỗi instance của class hoặc class constructor.

## Cú pháp

```js-nolint
class ClassWithField {
  instanceField;
  instanceFieldWithInitializer = "instance field";
  static staticField;
  static staticFieldWithInitializer = "static field";
}
```

Có một số hạn chế cú pháp bổ sung:

- Tên của thuộc tính static (field hoặc method) không thể là `prototype`.
- Tên của class field (static hoặc instance) không thể là `constructor`.

## Mô tả

Trang này giới thiệu chi tiết về public instance field.

- Đối với public static field, xem [`static`](/en-US/docs/Web/JavaScript/Reference/Classes/static).
- Đối với private field, xem [private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).
- Đối với public method, xem [method definitions](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions).
- Đối với public accessor, xem [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set).

Public instance field tồn tại trên mỗi instance được tạo của class. Bằng cách khai báo một public field, bạn có thể đảm bảo field luôn tồn tại, và định nghĩa class trở nên tự tài liệu hóa hơn.

Public instance field được thêm vào instance tại thời điểm khởi tạo trong base class (trước khi thân constructor chạy), hoặc ngay sau khi `super()` trả về trong subclass. Field không có initializer được khởi tạo thành `undefined`. Giống như các thuộc tính, tên field có thể được tính toán.

```js
const PREFIX = "prefix";

class ClassWithField {
  field;
  fieldWithInitializer = "instance field";
  [`${PREFIX}Field`] = "prefixed field";
}

const instance = new ClassWithField();
console.log(Object.hasOwn(instance, "field")); // true
console.log(instance.field); // undefined
console.log(instance.fieldWithInitializer); // "instance field"
console.log(instance.prefixField); // "prefixed field"
```

Tên field được tính toán chỉ được đánh giá một lần, tại [thời điểm định nghĩa class](/en-US/docs/Web/JavaScript/Reference/Classes#evaluation_order). Điều này có nghĩa là mỗi class luôn có một tập hợp tên field cố định, và hai instance không thể có tên field khác nhau thông qua tên được tính toán. Giá trị `this` trong biểu thức được tính toán là `this` xung quanh định nghĩa class, và việc tham chiếu đến tên class là {{jsxref("ReferenceError")}} vì class chưa được khởi tạo. {{jsxref("Operators/await", "await")}} và {{jsxref("Operators/yield", "yield")}} hoạt động như mong đợi trong biểu thức này.

```js
class C {
  [Math.random()] = 1;
}

console.log(new C());
console.log(new C());
// Both instances have the same field name
```

Trong field initializer, [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) đề cập đến instance class đang được xây dựng, và [`super`](/en-US/docs/Web/JavaScript/Reference/Operators/super) đề cập đến thuộc tính `prototype` của base class, chứa các instance method của base class, nhưng không phải các instance field của nó.

```js
class Base {
  baseField = "base field";
  anotherBaseField = this.baseField;
  baseMethod() {
    return "base method output";
  }
}

class Derived extends Base {
  subField = super.baseMethod();
}

const base = new Base();
const sub = new Derived();

console.log(base.anotherBaseField); // "base field"

console.log(sub.subField); // "base method output"
```

Biểu thức field initializer được đánh giá mỗi lần một instance mới được tạo. (Vì giá trị `this` khác nhau cho mỗi instance, biểu thức initializer có thể truy cập các thuộc tính dành riêng cho từng instance.)

```js
class C {
  obj = {};
}

const instance1 = new C();
const instance2 = new C();
console.log(instance1.obj === instance2.obj); // false
```

Biểu thức được đánh giá đồng bộ. Bạn không thể sử dụng {{jsxref("Operators/await", "await")}} hoặc {{jsxref("Operators/yield", "yield")}} trong biểu thức initializer. (Hãy nghĩ về biểu thức initializer như được bao bọc ngầm trong một hàm.)

Vì instance field của class được thêm vào trước khi constructor tương ứng chạy, bạn có thể truy cập các giá trị field trong constructor. Tuy nhiên, vì instance field của derived class được định nghĩa sau khi `super()` trả về, constructor của base class không có quyền truy cập vào các field của derived class.

```js
class Base {
  constructor() {
    console.log("Base constructor:", this.field);
  }
}

class Derived extends Base {
  field = 1;
  constructor() {
    super();
    console.log("Derived constructor:", this.field);
    this.field = 2;
  }
}

const instance = new Derived();
// Base constructor: undefined
// Derived constructor: 1
console.log(instance.field); // 2
```

Các field được thêm từng cái một. Field initializer có thể tham chiếu đến các giá trị field ở trên nó, nhưng không phải ở dưới. Tất cả instance và static method được thêm vào trước và có thể được truy cập, mặc dù việc gọi chúng có thể không hoạt động như mong đợi nếu chúng tham chiếu đến các field ở dưới field đang được khởi tạo.

```js
class C {
  a = 1;
  b = this.c;
  c = this.a + 1;
  d = this.c + 1;
}

const instance = new C();
console.log(instance.d); // 3
console.log(instance.b); // undefined
```

> [!NOTE]
> Điều này quan trọng hơn với [private field](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements), vì việc truy cập một private field chưa được khởi tạo sẽ ném ra {{jsxref("TypeError")}}, ngay cả khi private field được khai báo ở dưới. (Nếu private field không được khai báo, nó sẽ là {{jsxref("SyntaxError")}} sớm.)

Vì class field được thêm bằng ngữ nghĩa [`[[DefineOwnProperty]]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/defineProperty) (về cơ bản là {{jsxref("Object.defineProperty()")}}), khai báo field trong derived class không gọi setter trong base class. Hành vi này khác với việc sử dụng `this.field = …` trong constructor.

```js
class Base {
  set field(val) {
    console.log(val);
  }
}

class DerivedWithField extends Base {
  field = 1;
}

const instance = new DerivedWithField(); // No log

class DerivedWithConstructor extends Base {
  constructor() {
    super();
    this.field = 1;
  }
}

const instance2 = new DerivedWithConstructor(); // Logs 1
```

> [!NOTE]
> Trước khi đặc tả class field được hoàn thiện với ngữ nghĩa `[[DefineOwnProperty]]`, hầu hết các transpiler, bao gồm [Babel](https://babeljs.io/) và [tsc](https://www.typescriptlang.org/), đã chuyển đổi class field sang dạng `DerivedWithConstructor`, điều này đã gây ra các lỗi tinh tế sau khi class field được chuẩn hóa.

## Ví dụ

### Sử dụng class field

Class field không thể phụ thuộc vào các đối số của constructor, vì vậy field initializer thường đánh giá thành cùng một giá trị cho mỗi instance (trừ khi cùng một biểu thức có thể đánh giá thành các giá trị khác nhau mỗi lần, như {{jsxref("Math.random()")}} hoặc object initializer).

```js example-bad
class Person {
  name = nameArg; // nameArg is out of scope of the constructor
  constructor(nameArg) {}
}
```

```js example-good
class Person {
  // All instances of Person will have the same name
  name = "Dragomir";
}
```

Tuy nhiên, ngay cả khi khai báo một empty class field cũng có lợi, vì nó chỉ ra sự tồn tại của field, cho phép type checker cũng như người đọc phân tích tĩnh cấu trúc của class.

```js
class Person {
  name;
  age;
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
```

Code trên có vẻ lặp lại, nhưng hãy xem xét trường hợp `this` bị thay đổi động: khai báo field rõ ràng làm rõ các field nào chắc chắn sẽ có mặt trên instance.

```js
class Person {
  name;
  age;
  constructor(properties) {
    Object.assign(this, properties);
  }
}
```

Vì initializer được đánh giá sau khi base class đã thực thi, bạn có thể truy cập các thuộc tính được tạo bởi constructor của base class.

```js
class Person {
  name;
  age;
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}

class Professor extends Person {
  name = `Professor ${this.name}`;
}

console.log(new Professor("Radev", 54).name); // "Professor Radev"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Using classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)
- {{jsxref("Statements/class", "class")}}
- [The semantics of all JS class elements](https://rfrn.org/~shu/2018/05/02/the-semantics-of-all-js-class-elements.html) by Shu-yu Guo (2018)
- [Public and private class fields](https://v8.dev/features/class-fields) on v8.dev (2018)
