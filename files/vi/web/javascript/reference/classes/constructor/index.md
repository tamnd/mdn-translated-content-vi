---
title: constructor
slug: Web/JavaScript/Reference/Classes/constructor
page-type: javascript-language-feature
browser-compat: javascript.classes.constructor
sidebar: jssidebar
---

Phương thức **`constructor`** là một phương thức đặc biệt của [class](/en-US/docs/Web/JavaScript/Reference/Classes) dùng để tạo và khởi tạo một instance đối tượng của class đó.

> [!NOTE]
> Trang này giới thiệu cú pháp `constructor`. Để tìm hiểu về thuộc tính `constructor` có trên tất cả đối tượng, xem {{jsxref("Object.prototype.constructor")}}.

{{InteractiveExample("JavaScript Demo: Class constructor")}}

```js interactive-example
class Polygon {
  constructor() {
    this.name = "Polygon";
  }
}

const poly = new Polygon();

console.log(poly.name);
// Expected output: "Polygon"
```

## Cú pháp

```js-nolint
constructor() { /* … */ }
constructor(argument0) { /* … */ }
constructor(argument0, argument1) { /* … */ }
constructor(argument0, argument1, /* …, */ argumentN) { /* … */ }
```

Có một số hạn chế cú pháp bổ sung:

- Một phương thức class được đặt tên là `constructor` không thể là [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get), [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set), [async](/en-US/docs/Web/JavaScript/Reference/Statements/async_function), hoặc [generator](/en-US/docs/Web/JavaScript/Reference/Statements/function*).
- Một class không thể có nhiều hơn một phương thức `constructor`.

## Mô tả

Một constructor cho phép bạn cung cấp bất kỳ khởi tạo tùy chỉnh nào phải được thực hiện trước khi bất kỳ phương thức nào khác có thể được gọi trên một đối tượng đã được khởi tạo.

```js
class Person {
  constructor(name) {
    this.name = name;
  }

  introduce() {
    console.log(`Hello, my name is ${this.name}`);
  }
}

const otto = new Person("Otto");

otto.introduce(); // Hello, my name is Otto
```

Nếu bạn không cung cấp constructor riêng, một constructor mặc định sẽ được cung cấp cho bạn.
Nếu class của bạn là base class, constructor mặc định là rỗng:

```js-nolint
constructor() {}
```

Nếu class của bạn là derived class, constructor mặc định gọi constructor cha, truyền vào tất cả các tham số được cung cấp:

```js-nolint
constructor(...args) {
  super(...args);
}
```

> [!NOTE]
> Sự khác biệt giữa một constructor tường minh như trên và constructor mặc định là constructor mặc định không thực sự gọi [iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator) thông qua [spread tham số](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

Điều đó cho phép code như thế này hoạt động:

```js
class ValidationError extends Error {
  printCustomerMessage() {
    return `Validation failed :-( (details: ${this.message})`;
  }
}

try {
  throw new ValidationError("Not a valid phone number");
} catch (error) {
  if (error instanceof ValidationError) {
    console.log(error.name); // This is Error instead of ValidationError!
    console.log(error.printCustomerMessage());
  } else {
    console.log("Unknown error", error);
    throw error;
  }
}
```

Class `ValidationError` không cần một constructor tường minh, vì nó không cần thực hiện bất kỳ khởi tạo tùy chỉnh nào.
Constructor mặc định sau đó sẽ khởi tạo `Error` cha từ tham số được cung cấp.

Tuy nhiên, nếu bạn cung cấp constructor riêng và class của bạn kế thừa từ một lớp cha nào đó, thì bạn phải tường minh gọi constructor lớp cha bằng cách sử dụng [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super).
Ví dụ:

```js
class ValidationError extends Error {
  constructor(message) {
    super(message); // gọi constructor lớp cha
    this.name = "ValidationError";
    this.code = "42";
  }

  printCustomerMessage() {
    return `Validation failed :-( (details: ${this.message}, code: ${this.code})`;
  }
}

try {
  throw new ValidationError("Not a valid phone number");
} catch (error) {
  if (error instanceof ValidationError) {
    console.log(error.name); // Bây giờ là ValidationError!
    console.log(error.printCustomerMessage());
  } else {
    console.log("Unknown error", error);
    throw error;
  }
}
```

Sử dụng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) trên một class sẽ trải qua các bước sau:

1. (Nếu đây là derived class) Thân `constructor` trước lệnh gọi `super()` được đánh giá. Phần này không nên truy cập `this` vì nó chưa được khởi tạo.
2. (Nếu đây là derived class) Lệnh gọi `super()` được đánh giá, khởi tạo lớp cha thông qua cùng một quy trình.
3. Các [trường](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) của class hiện tại được khởi tạo.
4. Thân `constructor` sau lệnh gọi `super()` (hoặc toàn bộ thân, nếu đây là base class) được đánh giá.

Trong thân `constructor`, bạn có thể truy cập đối tượng đang được tạo thông qua [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) và truy cập class được gọi bằng [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) thông qua [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target). Lưu ý rằng các phương thức (bao gồm [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set)) và [chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) đã được khởi tạo trên `this` trước khi `constructor` được thực thi, vì vậy bạn thậm chí có thể truy cập các phương thức của lớp con từ constructor của lớp cha. Tuy nhiên, nếu các phương thức đó sử dụng `this`, thì `this` vẫn chưa được khởi tạo hoàn toàn. Điều này có nghĩa là việc đọc các trường public của lớp dẫn xuất sẽ trả về `undefined`, trong khi đọc các trường private sẽ gây ra `TypeError`.

```js example-bad
new (class C extends class B {
  constructor() {
    console.log(this.foo());
  }
} {
  #a = 1;
  foo() {
    return this.#a; // TypeError: Cannot read private member #a from an object whose class did not declare it
    // Không thực sự là vì class không khai báo nó,
    // mà vì trường private chưa được khởi tạo
    // khi constructor lớp cha đang chạy
  }
})();
```

Phương thức `constructor` có thể có giá trị trả về. Trong khi base class có thể trả về bất kỳ giá trị nào từ constructor, derived class phải trả về một đối tượng hoặc `undefined`, nếu không sẽ ném ra {{jsxref("TypeError")}}.

```js
class ParentClass {
  constructor() {
    return 1;
  }
}

console.log(new ParentClass()); // ParentClass {}
// Giá trị trả về bị bỏ qua vì nó không phải là đối tượng
// Điều này nhất quán với function constructor

class ChildClass extends ParentClass {
  constructor() {
    return 1;
  }
}

console.log(new ChildClass()); // TypeError: Derived constructors may only return object or undefined
```

Nếu constructor lớp cha trả về một đối tượng, đối tượng đó sẽ được dùng làm giá trị `this` để các [trường class](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) của lớp dẫn xuất được định nghĩa trên đó. Kỹ thuật này được gọi là ["return overriding"](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#returning_overriding_object), cho phép các trường của derived class (bao gồm cả trường [private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)) được định nghĩa trên các đối tượng không liên quan.

`constructor` tuân theo cú pháp [phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) thông thường, vì vậy [giá trị tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), v.v. đều có thể được sử dụng.

```js
class Person {
  constructor(name = "Anonymous") {
    this.name = name;
  }
  introduce() {
    console.log(`Hello, my name is ${this.name}`);
  }
}

const person = new Person();
person.introduce(); // Hello, my name is Anonymous
```

Constructor phải là một tên bằng chữ. [Thuộc tính được tính toán](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer#computed_property_names) không thể trở thành constructor.

```js
class Foo {
  // Đây là thuộc tính được tính toán. Nó sẽ không được nhận dạng là constructor.
  ["constructor"]() {
    console.log("called");
    this.a = 1;
  }
}

const foo = new Foo(); // Không có log
console.log(foo); // Foo {}
foo.constructor(); // Logs "called"
console.log(foo); // Foo { a: 1 }
```

Các phương thức async, phương thức generator, accessor, và trường class bị cấm được đặt tên là `constructor`. Tên private không thể được gọi là `#constructor`. Bất kỳ thành viên nào có tên `constructor` đều phải là một phương thức thông thường.

## Ví dụ

### Sử dụng constructor

Đoạn code này được lấy từ [mẫu classes](https://github.com/GoogleChrome/samples/blob/gh-pages/classes-es6/index.html) ([demo trực tiếp](https://googlechrome.github.io/samples/classes-es6/index.html)).

```js
class Square extends Polygon {
  constructor(length) {
    // Ở đây, nó gọi constructor lớp cha với độ dài
    // được cung cấp cho chiều rộng và chiều cao của Polygon
    super(length, length);
    // LƯU Ý: Trong derived class, `super()` phải được gọi trước khi
    // bạn có thể sử dụng `this`. Bỏ qua điều này sẽ gây ra ReferenceError.
    this.name = "Square";
  }

  get area() {
    return this.height * this.width;
  }

  set area(value) {
    this.height = value ** 0.5;
    this.width = value ** 0.5;
  }
}
```

### Gọi super trong constructor được ràng buộc với prototype khác

`super()` gọi constructor là prototype của class hiện tại. Nếu bạn thay đổi prototype của chính class hiện tại, `super()` sẽ gọi constructor là prototype mới. Việc thay đổi prototype của thuộc tính `prototype` của class hiện tại không ảnh hưởng đến constructor mà `super()` gọi.

```js
class Polygon {
  constructor() {
    this.name = "Polygon";
  }
}

class Rectangle {
  constructor() {
    this.name = "Rectangle";
  }
}

class Square extends Polygon {
  constructor() {
    super();
  }
}

// Làm cho Square kế thừa từ Rectangle (là base class) thay vì Polygon
Object.setPrototypeOf(Square, Rectangle);

const newInstance = new Square();

// newInstance vẫn là instance của Polygon, vì chúng ta không
// thay đổi prototype của Square.prototype, vì vậy chuỗi prototype
// của newInstance vẫn là
//   newInstance --> Square.prototype --> Polygon.prototype
console.log(newInstance instanceof Polygon); // true
console.log(newInstance instanceof Rectangle); // false

// Tuy nhiên, vì super() gọi Rectangle là constructor, thuộc tính name
// của newInstance được khởi tạo với logic trong Rectangle
console.log(newInstance.name); // Rectangle
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Sử dụng classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Các khối khởi tạo static](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks)
- {{jsxref("Statements/class", "class")}}
- {{jsxref("Operators/super", "super()")}}
- {{jsxref("Object.prototype.constructor")}}
