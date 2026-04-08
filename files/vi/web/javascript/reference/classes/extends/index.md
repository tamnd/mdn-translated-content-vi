---
title: extends
slug: Web/JavaScript/Reference/Classes/extends
page-type: javascript-language-feature
browser-compat: javascript.classes.extends
sidebar: jssidebar
---

Từ khóa **`extends`** được sử dụng trong [khai báo class](/en-US/docs/Web/JavaScript/Reference/Statements/class) hoặc [class expression](/en-US/docs/Web/JavaScript/Reference/Operators/class) để tạo một class là con của một class khác.

{{InteractiveExample("JavaScript Demo: Class extends", "taller")}}

```js interactive-example
class DateFormatter extends Date {
  getFormattedDate() {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return `${this.getDate()}-${months[this.getMonth()]}-${this.getFullYear()}`;
  }
}

console.log(new DateFormatter("August 19, 1975 23:15:30").getFormattedDate());
// Expected output: "19-Aug-1975"
```

## Cú pháp

```js-nolint
class ChildClass extends ParentClass { /* … */ }
```

- `ParentClass`
  - : Một biểu thức trả về hàm constructor (bao gồm class) hoặc `null`.

## Mô tả

Từ khóa `extends` có thể được dùng để tạo subclass cho cả class tùy chỉnh lẫn các đối tượng built-in.

Bất kỳ constructor nào có thể được gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) và có thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype) đều có thể là ứng viên cho parent class. Cả hai điều kiện phải thỏa mãn — ví dụ, [bound function](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) và {{jsxref("Proxy")}} có thể được khởi tạo, nhưng chúng không có thuộc tính `prototype`, vì vậy chúng không thể được subclass.

```js
function OldStyleClass() {
  this.someProperty = 1;
}
OldStyleClass.prototype.someMethod = function () {};

class ChildClass extends OldStyleClass {}

class ModernClass {
  someProperty = 1;
  someMethod() {}
}

class AnotherChildClass extends ModernClass {}
```

Thuộc tính `prototype` của `ParentClass` phải là {{jsxref("Object")}} hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), nhưng bạn hiếm khi phải lo lắng về điều này trong thực tế, vì `prototype` không phải đối tượng cũng không hoạt động như mong đợi. (Nó bị bỏ qua bởi toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).)

```js
function ParentClass() {}
ParentClass.prototype = 3;

class ChildClass extends ParentClass {}
// Uncaught TypeError: Class extends value does not have valid prototype property 3

console.log(Object.getPrototypeOf(new ParentClass()));
// [Object: null prototype] {}
// Not actually a number!
```

`extends` thiết lập prototype cho cả `ChildClass` và `ChildClass.prototype`.

|                                   | Prototype của `ChildClass` | Prototype của `ChildClass.prototype` |
| --------------------------------- | -------------------------- | ------------------------------------ |
| Không có mệnh đề `extends`        | `Function.prototype`       | `Object.prototype`                   |
| [`extends null`](#extending_null) | `Function.prototype`       | `null`                               |
| `extends ParentClass`             | `ParentClass`              | `ParentClass.prototype`              |

```js
class ParentClass {}
class ChildClass extends ParentClass {}

// Allows inheritance of static properties
Object.getPrototypeOf(ChildClass) === ParentClass;
// Allows inheritance of instance properties
Object.getPrototypeOf(ChildClass.prototype) === ParentClass.prototype;
```

Vế phải của `extends` không nhất thiết phải là định danh. Bạn có thể sử dụng bất kỳ biểu thức nào trả về constructor. Điều này thường hữu ích để tạo [mixin](#mix-ins). Giá trị `this` trong biểu thức `extends` là `this` bao quanh định nghĩa class, và tham chiếu đến tên class là {{jsxref("ReferenceError")}} vì class chưa được khởi tạo. {{jsxref("Operators/await", "await")}} và {{jsxref("Operators/yield", "yield")}} hoạt động như mong đợi trong biểu thức này.

```js
class SomeClass extends class {
  constructor() {
    console.log("Base class");
  }
} {
  constructor() {
    super();
    console.log("Derived class");
  }
}

new SomeClass();
// Base class
// Derived class
```

Trong khi base class có thể trả về bất cứ gì từ constructor, derived class phải trả về đối tượng hoặc `undefined`, hoặc sẽ ném ra {{jsxref("TypeError")}}.

```js
class ParentClass {
  constructor() {
    return 1;
  }
}

console.log(new ParentClass()); // ParentClass {}
// The return value is ignored because it's not an object
// This is consistent with function constructors

class ChildClass extends ParentClass {
  constructor() {
    super();
    return 1;
  }
}

console.log(new ChildClass()); // TypeError: Derived constructors may only return object or undefined
```

Nếu constructor của parent class trả về một đối tượng, đối tượng đó sẽ được sử dụng làm giá trị `this` cho derived class khi khởi tạo thêm [class field](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields). Thủ thuật này được gọi là ["return overriding"](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements#returning_overriding_object), cho phép các trường của derived class (bao gồm cả [private](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements)) được định nghĩa trên các đối tượng không liên quan.

### Subclass built-in

> [!WARNING]
> Ủy ban tiêu chuẩn hiện giữ quan điểm rằng cơ chế subclassing built-in trong các phiên bản spec trước là quá phức tạp và gây ra tác động không nhỏ đến hiệu suất và bảo mật. Các phương thức built-in mới ít quan tâm hơn đến subclass, và các nhà phát triển engine đang [điều tra xem có loại bỏ một số cơ chế subclassing không](https://github.com/tc39/proposal-rm-builtin-subclassing). Hãy xem xét sử dụng composition thay vì inheritance khi cải tiến built-in.

Dưới đây là một số điều bạn có thể mong đợi khi mở rộng một class:

- Khi gọi phương thức factory tĩnh (như {{jsxref("Promise.resolve()")}} hoặc {{jsxref("Array.from()")}}) trên subclass, instance được trả về luôn là instance của subclass.
- Khi gọi phương thức instance trả về instance mới (như {{jsxref("Promise.prototype.then()")}} hoặc {{jsxref("Array.prototype.map()")}}) trên subclass, instance được trả về luôn là instance của subclass.
- Các phương thức instance cố gắng ủy quyền cho một tập tối thiểu các phương thức nguyên thủy nếu có thể. Ví dụ, đối với subclass của {{jsxref("Promise")}}, ghi đè {{jsxref("Promise/then", "then()")}} tự động thay đổi hành vi của {{jsxref("Promise/catch", "catch()")}}; hoặc đối với subclass của {{jsxref("Map")}}, ghi đè {{jsxref("Map/set", "set()")}} tự động thay đổi hành vi của constructor {{jsxref("Map/Map", "Map()")}}.

Tuy nhiên, các kỳ vọng trên đòi hỏi nỗ lực đáng kể để triển khai đúng cách.

- Điều đầu tiên yêu cầu phương thức tĩnh đọc giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) để lấy constructor để xây dựng instance được trả về. Điều này có nghĩa là `[p1, p2, p3].map(Promise.resolve)` ném ra lỗi vì `this` bên trong `Promise.resolve` là `undefined`. Một cách khắc phục là quay lại base class nếu `this` không phải constructor, như {{jsxref("Array.from()")}} làm, nhưng điều đó vẫn có nghĩa là base class được special-cased.
- Điều thứ hai yêu cầu phương thức instance đọc [`this.constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor) để lấy hàm constructor. Tuy nhiên, `new this.constructor()` có thể phá vỡ code cũ, vì thuộc tính `constructor` vừa writable vừa configurable và không được bảo vệ theo bất kỳ cách nào. Do đó, nhiều phương thức copying built-in sử dụng thuộc tính [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/species) của constructor thay thế (mặc định chỉ trả về `this`, chính constructor). Tuy nhiên, `[Symbol.species]` cho phép chạy code tùy ý và tạo các instance của loại tùy ý, điều này đặt ra lo ngại về bảo mật và làm phức tạp đáng kể ngữ nghĩa subclassing.
- Điều thứ ba dẫn đến các lời gọi hiển thị của code tùy chỉnh, điều này làm cho nhiều tối ưu hóa khó triển khai hơn. Ví dụ, nếu constructor `Map()` được gọi với một iterable gồm _x_ phần tử, thì nó phải gọi phương thức `set()` _x_ lần, thay vì chỉ sao chép các phần tử vào storage nội bộ.

Những vấn đề này không chỉ xảy ra với các class built-in. Đối với class riêng của bạn, bạn cũng sẽ phải đưa ra các quyết định tương tự. Tuy nhiên, đối với các class built-in, khả năng tối ưu hóa và bảo mật là mối quan tâm lớn hơn nhiều. Các phương thức built-in mới luôn xây dựng base class và gọi ít phương thức tùy chỉnh nhất có thể. Nếu bạn muốn subclass built-in trong khi đạt được các kỳ vọng trên, bạn cần ghi đè tất cả các phương thức có hành vi mặc định được tích hợp. Bất kỳ thêm phương thức mới nào trên base class cũng có thể phá vỡ ngữ nghĩa của subclass vì chúng được kế thừa theo mặc định. Do đó, cách tốt hơn để mở rộng built-in là sử dụng [_composition_](#avoiding_inheritance).

### Extending null

`extends null` được thiết kế để cho phép dễ dàng tạo [đối tượng không kế thừa từ `Object.prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects). Tuy nhiên, do các quyết định chưa được giải quyết về việc `super()` có nên được gọi trong constructor hay không, việc xây dựng class như vậy trong thực tế không thể bằng bất kỳ triển khai constructor nào không trả về đối tượng. [Ủy ban TC39 đang làm việc để kích hoạt lại tính năng này](https://github.com/tc39/ecma262/pull/1321).

```js
new (class extends null {})();
// TypeError: Super constructor null of anonymous class is not a constructor

new (class extends null {
  constructor() {}
})();
// ReferenceError: Must call super constructor in derived class before accessing 'this' or returning from derived constructor

new (class extends null {
  constructor() {
    super();
  }
})();
// TypeError: Super constructor null of anonymous class is not a constructor
```

Thay vào đó, bạn cần trả về rõ ràng một instance từ constructor.

```js
class NullClass extends null {
  constructor() {
    // Using new.target allows derived classes to
    // have the correct prototype chain
    return Object.create(new.target.prototype);
  }
}

const proto = Object.getPrototypeOf;
console.log(proto(proto(new NullClass()))); // null
```

## Ví dụ

### Sử dụng extends

Ví dụ đầu tiên tạo một class có tên `Square` từ một class có tên `Polygon`. Ví dụ này được trích từ [demo trực tiếp](https://googlechrome.github.io/samples/classes-es6/index.html) [(nguồn)](https://github.com/GoogleChrome/samples/blob/gh-pages/classes-es6/index.html).

```js
class Square extends Polygon {
  constructor(length) {
    // Here, it calls the parent class' constructor with lengths
    // provided for the Polygon's width and height
    super(length, length);
    // Note: In derived classes, super() must be called before you
    // can use 'this'. Leaving this out will cause a reference error.
    this.name = "Square";
  }

  get area() {
    return this.height * this.width;
  }
}
```

### Mở rộng đối tượng thông thường

Class không thể mở rộng các đối tượng thông thường (không thể khởi tạo). Nếu bạn muốn kế thừa từ một đối tượng thông thường bằng cách làm cho tất cả thuộc tính của đối tượng này có sẵn trên các instance được kế thừa, bạn có thể sử dụng {{jsxref("Object.setPrototypeOf()")}}:

```js
const Animal = {
  speak() {
    console.log(`${this.name} makes a noise.`);
  },
};

class Dog {
  constructor(name) {
    this.name = name;
  }
}

Object.setPrototypeOf(Dog.prototype, Animal);

const d = new Dog("Mitzie");
d.speak(); // Mitzie makes a noise.
```

### Mở rộng built-in object

Ví dụ này mở rộng đối tượng {{jsxref("Date")}} built-in. Ví dụ này được trích từ [demo trực tiếp](https://googlechrome.github.io/samples/classes-es6/index.html) [(nguồn)](https://github.com/GoogleChrome/samples/blob/gh-pages/classes-es6/index.html).

```js-nolint
class MyDate extends Date {
  getFormattedDate() {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    ];
    return `${this.getDate()}-${months[this.getMonth()]}-${this.getFullYear()}`;
  }
}
```

### Mở rộng `Object`

Tất cả đối tượng JavaScript kế thừa từ `Object.prototype` theo mặc định, vì vậy viết `extends Object` thoạt nhìn có vẻ thừa. Điểm khác biệt duy nhất khi không viết `extends` là constructor chính nó kế thừa các phương thức tĩnh từ `Object`, như {{jsxref("Object.keys()")}}. Tuy nhiên, vì không có phương thức tĩnh `Object` nào sử dụng giá trị `this`, vẫn không có giá trị khi kế thừa các phương thức tĩnh này.

Constructor {{jsxref("Object/Object", "Object()")}} special-cases kịch bản subclassing. Nếu nó được gọi ngầm qua [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super), nó luôn khởi tạo một đối tượng mới với `new.target.prototype` là prototype của nó. Bất kỳ giá trị nào được truyền cho `super()` đều bị bỏ qua.

```js
class C extends Object {
  constructor(v) {
    super(v);
  }
}

console.log(new C(1) instanceof Number); // false
console.log(C.keys({ a: 1, b: 2 })); // [ 'a', 'b' ]
```

So sánh hành vi này với wrapper tùy chỉnh không special-case subclassing:

```js
function MyObject(v) {
  return new Object(v);
}
class D extends MyObject {
  constructor(v) {
    super(v);
  }
}
console.log(new D(1) instanceof Number); // true
```

### Species

Bạn có thể muốn trả về các đối tượng {{jsxref("Array")}} trong derived array class `MyArray` của bạn. Mẫu species cho phép bạn ghi đè các constructor mặc định.

Ví dụ, khi sử dụng các phương thức như {{jsxref("Array.prototype.map()")}} trả về constructor mặc định, bạn muốn các phương thức này trả về đối tượng `Array` cha, thay vì đối tượng `MyArray`. Symbol {{jsxref("Symbol.species")}} cho phép bạn làm điều này:

```js
class MyArray extends Array {
  // Overwrite species to the parent Array constructor
  static get [Symbol.species]() {
    return Array;
  }
}

const a = new MyArray(1, 2, 3);
const mapped = a.map((x) => x * x);

console.log(mapped instanceof MyArray); // false
console.log(mapped instanceof Array); // true
```

Hành vi này được triển khai bởi nhiều phương thức copying built-in. Để biết về các lưu ý của tính năng này, hãy xem phần [subclassing built-in](#subclassing_built-ins).

### Mix-ins

Abstract subclass hay _mix-in_ là các mẫu cho class. Một class chỉ có thể có một superclass, vì vậy việc kế thừa nhiều từ các class công cụ, ví dụ, không thể thực hiện. Chức năng phải được cung cấp bởi superclass.

Một hàm với superclass là đầu vào và subclass mở rộng superclass đó là đầu ra có thể được dùng để triển khai mix-in:

```js
const calculatorMixin = (Base) =>
  class extends Base {
    calc() {}
  };

const randomizerMixin = (Base) =>
  class extends Base {
    randomize() {}
  };
```

Một class sử dụng các mix-in này sau đó có thể được viết như thế này:

```js
class Foo {}
class Bar extends calculatorMixin(randomizerMixin(Foo)) {}
```

### Tránh inheritance

Inheritance là một mối quan hệ coupling rất mạnh trong lập trình hướng đối tượng. Có nghĩa là tất cả các hành vi của base class được kế thừa bởi subclass theo mặc định, điều này không phải lúc nào cũng là những gì bạn muốn. Ví dụ, hãy xem xét triển khai `ReadOnlyMap`:

```js
class ReadOnlyMap extends Map {
  set() {
    throw new TypeError("A read-only map must be set at construction time.");
  }
}
```

Hóa ra `ReadOnlyMap` không thể khởi tạo, vì constructor [`Map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map/Map) gọi phương thức `set()` của instance.

```js
const m = new ReadOnlyMap([["a", 1]]); // TypeError: A read-only map must be set at construction time.
```

Chúng ta có thể giải quyết vấn đề này bằng cách sử dụng private flag để chỉ ra liệu instance có đang được xây dựng hay không. Tuy nhiên, một vấn đề quan trọng hơn với thiết kế này là nó vi phạm [Liskov substitution principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle), nguyên tắc cho rằng subclass phải có thể thay thế được cho superclass. Nếu một hàm mong đợi đối tượng `Map`, nó cũng phải có thể sử dụng đối tượng `ReadOnlyMap`, điều này sẽ vi phạm ở đây.

Inheritance thường dẫn đến [vấn đề circle-ellipse](https://en.wikipedia.org/wiki/Circle%E2%80%93ellipse_problem), vì không loại nào hoàn toàn bao hàm hành vi của loại kia, mặc dù chúng chia sẻ nhiều đặc điểm chung. Nhìn chung, trừ khi có lý do rất chính đáng để sử dụng inheritance, tốt hơn là nên sử dụng composition. Composition có nghĩa là một class có tham chiếu đến đối tượng của một class khác, và chỉ sử dụng đối tượng đó như một chi tiết triển khai.

```js
class ReadOnlyMap {
  #data;
  constructor(values) {
    this.#data = new Map(values);
  }
  get(key) {
    return this.#data.get(key);
  }
  has(key) {
    return this.#data.has(key);
  }
  get size() {
    return this.#data.size;
  }
  *keys() {
    yield* this.#data.keys();
  }
  *values() {
    yield* this.#data.values();
  }
  *entries() {
    yield* this.#data.entries();
  }
  *[Symbol.iterator]() {
    yield* this.#data[Symbol.iterator]();
  }
}
```

Trong trường hợp này, class `ReadOnlyMap` không phải là subclass của `Map`, nhưng nó vẫn triển khai hầu hết các phương thức tương tự. Điều này có nghĩa là nhiều code trùng lặp hơn, nhưng cũng có nghĩa là class `ReadOnlyMap` không bị coupling chặt chẽ với class `Map`, và không dễ dàng bị phá vỡ nếu class `Map` bị thay đổi, tránh được [các vấn đề ngữ nghĩa của built-in subclassing](#subclassing_built-ins). Ví dụ, nếu class `Map` thêm phương thức tiện ích mới (như [`getOrInsert()`](https://github.com/tc39/proposal-upsert)) không gọi `set()`, nó sẽ khiến class `ReadOnlyMap` không còn là read-only trừ khi class sau được cập nhật để ghi đè `getOrInsert()` tương ứng. Hơn nữa, các đối tượng `ReadOnlyMap` hoàn toàn không có phương thức `set`, điều này chính xác hơn so với việc ném ra lỗi tại runtime.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Using classes](/en-US/docs/Web/JavaScript/Guide/Using_classes)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Classes/constructor", "constructor")}}
- {{jsxref("Statements/class", "class")}}
- {{jsxref("Operators/super", "super")}}
