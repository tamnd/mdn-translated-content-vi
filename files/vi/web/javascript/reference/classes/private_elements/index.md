---
title: Private elements
slug: Web/JavaScript/Reference/Classes/Private_elements
page-type: javascript-language-feature
browser-compat:
  - javascript.classes.private_class_fields
  - javascript.classes.private_class_fields_in
  - javascript.classes.private_class_methods
sidebar: jssidebar
---

**Private elements** (phần tử private) là các đối ứng của các phần tử class thông thường là public, bao gồm [class field](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields), class method, v.v. Private element được tạo bằng cách sử dụng tiền tố hash `#` và không thể được tham chiếu hợp lệ từ bên ngoài class. Tính đóng gói quyền riêng tư của các phần tử class này được JavaScript tự thực thi. Cách duy nhất để truy cập một private element là thông qua [dot notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#dot_notation), và bạn chỉ có thể làm vậy trong class định nghĩa private element đó.

Private element không phải là tính năng native của ngôn ngữ trước khi cú pháp này tồn tại. Trong kế thừa prototype, hành vi của nó có thể được mô phỏng bằng các đối tượng [`WeakMap`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/WeakMap#emulating_private_members) hoặc [closure](/en-US/docs/Web/JavaScript/Guide/Closures#emulating_private_methods_with_closures), nhưng chúng không thể so sánh với cú pháp `#` về mặt thuận tiện sử dụng.

> [!NOTE]
> Trên MDN, chúng tôi tránh sử dụng thuật ngữ "private property". Một [property](/en-US/docs/Glossary/Property/JavaScript) trong JavaScript có key là chuỗi hoặc symbol, và có các thuộc tính như `writable`, `enumerable`, và `configurable`, nhưng private element không có những điều này. Trong khi private element được truy cập bằng dot notation quen thuộc, chúng không thể được [proxy hóa](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy), liệt kê, xóa, hoặc tương tác bằng bất kỳ phương thức {{jsxref("Object")}} nào.

## Cú pháp

```js-nolint
class ClassWithPrivate {
  #privateField;
  #privateFieldWithInitializer = 42;

  #privateMethod() {
    // …
  }

  static #privateStaticField;
  static #privateStaticFieldWithInitializer = 42;

  static #privateStaticMethod() {
    // …
  }
}
```

Có một số hạn chế cú pháp bổ sung:

- Tất cả các private identifier được khai báo trong một class phải là duy nhất. Namespace được chia sẻ giữa các phần tử static và instance. Ngoại lệ duy nhất là khi hai khai báo định nghĩa một cặp getter-setter.
- Private identifier không thể là `#constructor`.

## Mô tả

Hầu hết các phần tử class đều có đối ứng private của chúng:

- Private field
- Private method
- Private static field
- Private static method
- Private getter
- Private setter
- Private static getter
- Private static setter

Những tính năng này được gọi chung là _private element_. Tuy nhiên, [constructor](/en-US/docs/Web/JavaScript/Reference/Classes/constructor) không thể là private trong JavaScript. Để ngăn các class được tạo từ bên ngoài class, bạn phải [sử dụng một private flag](#simulating_private_constructors).

Private element được khai báo bằng **# name** (đọc là "hash name"), là các định danh có tiền tố `#`. Tiền tố hash là một phần cố hữu của tên thuộc tính — bạn có thể liên hệ với quy ước tiền tố gạch dưới cũ `_privateField` — nhưng nó không phải là thuộc tính chuỗi thông thường, vì vậy bạn không thể truy cập động nó bằng [bracket notation](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation).

Việc tham chiếu đến `#` name từ bên ngoài class là lỗi cú pháp. Việc tham chiếu đến private element không được khai báo trong thân class, hoặc cố gắng xóa các phần tử đã khai báo bằng [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) cũng là lỗi cú pháp.

```js-nolint example-bad
class ClassWithPrivateField {
  #privateField;

  constructor() {
    delete this.#privateField; // Syntax error
    this.#undeclaredField = 42; // Syntax error
  }
}

const instance = new ClassWithPrivateField();
instance.#privateField; // Syntax error
```

JavaScript, là ngôn ngữ động, có thể thực hiện kiểm tra compile-time này nhờ cú pháp hash identifier đặc biệt, làm cho nó khác với các thuộc tính thông thường ở cấp độ cú pháp.

> [!NOTE]
> Code chạy trong Chrome console có thể truy cập private element từ bên ngoài class. Đây là sự nới lỏng giới hạn cú pháp JavaScript chỉ dành cho DevTools.

Nếu bạn truy cập một private element từ một đối tượng không có phần tử đó, {{jsxref("TypeError")}} sẽ được ném ra, thay vì trả về `undefined` như các thuộc tính thông thường.

```js example-bad
class C {
  #x;

  static getX(obj) {
    return obj.#x;
  }
}

console.log(C.getX(new C())); // undefined
console.log(C.getX({})); // TypeError: Cannot read private member #x from an object whose class did not declare it
```

Ví dụ này cũng minh họa rằng bạn có thể truy cập private element trong các hàm static, và trên các instance được định nghĩa bên ngoài class.

Bạn có thể sử dụng toán tử [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in) để kiểm tra xem một đối tượng được định nghĩa bên ngoài có sở hữu một private element hay không. Điều này sẽ trả về `true` nếu private field hoặc method tồn tại, và `false` nếu không.

```js example-good
class C {
  #x;
  constructor(x) {
    this.#x = x;
  }
  static getX(obj) {
    if (#x in obj) return obj.#x;

    return "obj must be an instance of C";
  }
}
console.log(C.getX(new C("foo"))); // "foo"
console.log(C.getX(new C(0.196))); // 0.196
console.log(C.getX(new C(new Date()))); // the current date and time
console.log(C.getX({})); // "obj must be an instance of C"
```

Lưu ý một hệ quả của việc private name luôn được khai báo trước và không thể xóa: nếu bạn phát hiện một đối tượng sở hữu một private element của class hiện tại (từ `try...catch` hoặc kiểm tra `in`), thì nó phải sở hữu tất cả các private element khác. Một đối tượng sở hữu các private element của một class thường có nghĩa là nó được tạo bởi class đó (mặc dù [không phải lúc nào cũng vậy](#returning_overriding_object)).

Private element không phải là một phần của mô hình [kế thừa prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) vì chúng chỉ có thể được truy cập trong thân class hiện tại và không được kế thừa bởi subclass. Private element cùng tên trong các class khác nhau là hoàn toàn khác biệt và không tương tác với nhau. Hãy xem chúng như metadata bên ngoài được gắn vào mỗi instance, được quản lý bởi class. Vì lý do này, {{DOMxRef("Window.structuredClone", "structuredClone()")}} không sao chép private element, và {{jsxref("Object.freeze()")}} và {{jsxref("Object.seal()")}} không có hiệu lực trên private element.

Để biết thêm thông tin về cách và thời điểm private field được khởi tạo, xem [public class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields).

## Ví dụ

### Private field

Private field bao gồm private instance field và private static field. Private field chỉ có thể truy cập từ bên trong khai báo class.

#### Private instance field

Giống như đối ứng public của chúng, private instance field:

- được thêm vào trước khi constructor chạy trong base class, hoặc ngay sau khi [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) được gọi trong subclass, và
- chỉ có thể truy cập trên các instance của class.

```js
class ClassWithPrivateField {
  #privateField;

  constructor() {
    this.#privateField = 42;
  }
}

class Subclass extends ClassWithPrivateField {
  #subPrivateField;

  constructor() {
    super();
    this.#subPrivateField = 23;
  }
}

new Subclass(); // In some dev tools, it shows Subclass {#privateField: 42, #subPrivateField: 23}
```

> [!NOTE]
> `#privateField` từ base class `ClassWithPrivateField` là private đối với `ClassWithPrivateField` và không thể truy cập từ `Subclass` dẫn xuất.

#### Trả về đối tượng ghi đè

Constructor của class có thể trả về một đối tượng khác, sẽ được sử dụng làm `this` mới cho constructor của class dẫn xuất. Class dẫn xuất sau đó có thể định nghĩa private field trên đối tượng được trả về đó — nghĩa là có thể "đóng dấu" private field lên các đối tượng không liên quan.

```js
class Stamper extends class {
  // A base class whose constructor returns the object it's given
  constructor(obj) {
    return obj;
  }
} {
  // This declaration will "stamp" the private field onto the object
  // returned by the base class constructor
  #stamp = 42;
  static getStamp(obj) {
    return obj.#stamp;
  }
}

const obj = {};
new Stamper(obj);
// `Stamper` calls `Base`, which returns `obj`, so `obj` is
// now the `this` value. `Stamper` then defines `#stamp` on `obj`

console.log(obj); // In some dev tools, it shows {#stamp: 42}
console.log(Stamper.getStamp(obj)); // 42
console.log(obj instanceof Stamper); // false

// You cannot stamp private elements twice
new Stamper(obj); // Error: Initializing an object twice is an error with private fields
```

> [!WARNING]
> Đây là điều có thể gây nhầm lẫn rất cao. Bạn thường nên tránh trả về bất kỳ thứ gì từ constructor — đặc biệt là những thứ không liên quan đến `this`.

#### Private static field

Giống như đối ứng public của chúng, private static field:

- được thêm vào class constructor tại thời điểm class được đánh giá, và
- chỉ có thể truy cập trên chính class đó.

```js
class ClassWithPrivateStaticField {
  static #privateStaticField = 42;

  static publicStaticMethod() {
    return ClassWithPrivateStaticField.#privateStaticField;
  }
}

console.log(ClassWithPrivateStaticField.publicStaticMethod()); // 42
```

Có một hạn chế đối với private static field: chỉ class định nghĩa private static field mới có thể truy cập field đó. Điều này có thể dẫn đến hành vi không mong muốn khi sử dụng [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this). Trong ví dụ sau, `this` đề cập đến class `Subclass` (không phải class `ClassWithPrivateStaticField`) khi chúng ta cố gắng gọi `Subclass.publicStaticMethod()`, vì vậy gây ra `TypeError`.

```js
class ClassWithPrivateStaticField {
  static #privateStaticField = 42;

  static publicStaticMethod() {
    return this.#privateStaticField;
  }
}

class Subclass extends ClassWithPrivateStaticField {}

Subclass.publicStaticMethod(); // TypeError: Cannot read private member #privateStaticField from an object whose class did not declare it
```

Điều này cũng xảy ra nếu bạn gọi phương thức bằng `super`, vì [`super` method không được gọi với super class là `this`](/en-US/docs/Web/JavaScript/Reference/Operators/super#calling_methods_from_super).

```js
class ClassWithPrivateStaticField {
  static #privateStaticField = 42;

  static publicStaticMethod() {
    // When invoked through super, `this` still refers to Subclass
    return this.#privateStaticField;
  }
}

class Subclass extends ClassWithPrivateStaticField {
  static callSuperMethod() {
    return super.publicStaticMethod();
  }
}

Subclass.callSuperMethod(); // TypeError: Cannot read private member #privateStaticField from an object whose class did not declare it
```

Bạn nên luôn truy cập private static field thông qua tên class, không phải qua `this`, để kế thừa không làm hỏng phương thức.

### Private method

Private method bao gồm private instance method và private static method. Private method chỉ có thể truy cập từ bên trong khai báo class.

#### Private instance method

Không giống như đối ứng public của chúng, private instance method:

- được cài đặt ngay trước khi các instance field được cài đặt, và
- chỉ có thể truy cập trên các instance của class, không phải trên thuộc tính `.prototype` của nó.

```js
class ClassWithPrivateMethod {
  #privateMethod() {
    return 42;
  }

  publicMethod() {
    return this.#privateMethod();
  }
}

const instance = new ClassWithPrivateMethod();
console.log(instance.publicMethod()); // 42
```

Private instance method có thể là hàm generator, async, hoặc async generator. Private getter và setter cũng có thể, và tuân theo các yêu cầu cú pháp tương tự như đối ứng public [getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) và [setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) của chúng.

```js
class ClassWithPrivateAccessor {
  #message;

  get #decoratedMessage() {
    return `🎬${this.#message}🛑`;
  }
  set #decoratedMessage(msg) {
    this.#message = msg;
  }

  constructor() {
    this.#decoratedMessage = "hello world";
    console.log(this.#decoratedMessage);
  }
}

new ClassWithPrivateAccessor(); // 🎬hello world🛑
```

Không giống như public method, private method không thể truy cập trên thuộc tính `.prototype` của class của chúng.

```js
class C {
  #method() {}

  static getMethod(x) {
    return x.#method;
  }
}

console.log(C.getMethod(new C())); // [Function: #method]
console.log(C.getMethod(C.prototype)); // TypeError: Receiver must be an instance of class C
```

#### Private static method

Giống như đối ứng public của chúng, private static method:

- được thêm vào class constructor tại thời điểm class được đánh giá, và
- chỉ có thể truy cập trên chính class đó.

```js
class ClassWithPrivateStaticMethod {
  static #privateStaticMethod() {
    return 42;
  }

  static publicStaticMethod() {
    return ClassWithPrivateStaticMethod.#privateStaticMethod();
  }
}

console.log(ClassWithPrivateStaticMethod.publicStaticMethod()); // 42
```

Private static method có thể là hàm generator, async, và async generator.

Hạn chế tương tự đã đề cập trước đó cho private static field cũng áp dụng cho private static method, và tương tự có thể dẫn đến hành vi không mong muốn khi sử dụng `this`. Trong ví dụ sau, khi chúng ta cố gắng gọi `Subclass.publicStaticMethod()`, `this` đề cập đến class `Subclass` (không phải class `ClassWithPrivateStaticMethod`) vì vậy gây ra `TypeError`.

```js
class ClassWithPrivateStaticMethod {
  static #privateStaticMethod() {
    return 42;
  }

  static publicStaticMethod() {
    return this.#privateStaticMethod();
  }
}

class Subclass extends ClassWithPrivateStaticMethod {}

console.log(Subclass.publicStaticMethod()); // TypeError: Cannot read private member #privateStaticMethod from an object whose class did not declare it
```

### Mô phỏng private constructor

Nhiều ngôn ngữ khác có khả năng đánh dấu constructor là private, điều này ngăn class được khởi tạo từ bên ngoài class — bạn chỉ có thể sử dụng các static factory method để tạo instance, hoặc không thể tạo instance nào cả. JavaScript không có cách native để làm điều này, nhưng có thể thực hiện bằng cách sử dụng một private static flag.

```js
class PrivateConstructor {
  static #isInternalConstructing = false;

  constructor() {
    if (!PrivateConstructor.#isInternalConstructing) {
      throw new TypeError("PrivateConstructor is not constructable");
    }
    PrivateConstructor.#isInternalConstructing = false;
    // More initialization logic
  }

  static create() {
    PrivateConstructor.#isInternalConstructing = true;
    const instance = new PrivateConstructor();
    return instance;
  }
}

new PrivateConstructor(); // TypeError: PrivateConstructor is not constructable
PrivateConstructor.create(); // PrivateConstructor {}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Using classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- [Public class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields)
- {{jsxref("Statements/class", "class")}}
- [Private Syntax FAQ](https://github.com/tc39/proposal-class-fields/blob/main/PRIVATE_SYNTAX_FAQ.md) in the TC39 class-fields proposal
- [The semantics of all JS class elements](https://rfrn.org/~shu/2018/05/02/the-semantics-of-all-js-class-elements.html) by Shu-yu Guo (2018)
- [Public and private class fields](https://v8.dev/features/class-fields) on v8.dev (2018)
