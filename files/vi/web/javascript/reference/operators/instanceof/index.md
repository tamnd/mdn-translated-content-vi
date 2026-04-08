---
title: instanceof
slug: Web/JavaScript/Reference/Operators/instanceof
page-type: javascript-operator
browser-compat: javascript.operators.instanceof
sidebar: jssidebar
---

Toán tử **`instanceof`** kiểm tra xem thuộc tính `prototype` của một constructor có xuất hiện ở bất kỳ đâu trong chuỗi prototype của một object hay không. Giá trị trả về là một giá trị boolean. Hành vi của nó có thể được tùy chỉnh với [`Symbol.hasInstance`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance).

{{InteractiveExample("JavaScript Demo: instanceof operator")}}

```js interactive-example
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
const auto = new Car("Honda", "Accord", 1998);

console.log(auto instanceof Car);
// Expected output: true

console.log(auto instanceof Object);
// Expected output: true
```

## Cú pháp

```js-nolint
object instanceof constructor
```

### Tham số

- `object`
  - : Object cần kiểm tra.
- `constructor`
  - : Constructor cần kiểm tra với.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `constructor` không phải là object. Nếu `constructor` không có phương thức [`[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance), nó cũng phải là một hàm.

## Mô tả

Toán tử `instanceof` kiểm tra sự hiện diện của `constructor.prototype` trong chuỗi prototype của `object`. Điều này thường (mặc dù [không phải lúc nào](#overriding_the_behavior_of_instanceof)) có nghĩa là `object` được xây dựng với `constructor`.

```js
// defining constructors
function C() {}
function D() {}

const o = new C();

// true, because: Object.getPrototypeOf(o) === C.prototype
o instanceof C;

// false, because D.prototype is nowhere in o's prototype chain
o instanceof D;

o instanceof Object; // true, because:
C.prototype instanceof Object; // true

// Re-assign `constructor.prototype`: you should
// rarely do this in practice.
C.prototype = {};
const o2 = new C();

o2 instanceof C; // true

// false, because C.prototype is nowhere in
// o's prototype chain anymore
o instanceof C;

D.prototype = new C(); // add C to [[Prototype]] linkage of D
const o3 = new D();
o3 instanceof D; // true
o3 instanceof C; // true since C.prototype is now in o3's prototype chain
```

Lưu ý rằng giá trị của kiểm tra `instanceof` có thể thay đổi nếu `constructor.prototype` được gán lại sau khi tạo object (điều này thường không được khuyến khích). Nó cũng có thể được thay đổi bằng cách thay đổi prototype của `object` bằng [`Object.setPrototypeOf`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/setPrototypeOf).

Class hoạt động theo cùng cách, vì class cũng có thuộc tính `prototype`.

```js
class A {}
class B extends A {}

const o1 = new A();
// true, because Object.getPrototypeOf(o1) === A.prototype
o1 instanceof A;
// false, because B.prototype is nowhere in o1's prototype chain
o1 instanceof B;

const o2 = new B();
// true, because Object.getPrototypeOf(Object.getPrototypeOf(o2)) === A.prototype
o2 instanceof A;
// true, because Object.getPrototypeOf(o2) === B.prototype
o2 instanceof B;
```

Đối với [bound functions](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind), `instanceof` tìm kiếm thuộc tính `prototype` trên hàm target, vì bound functions không có `prototype`.

```js
class Base {}
const BoundBase = Base.bind(null, 1, 2);
console.log(new Base() instanceof BoundBase); // true
```

### instanceof và Symbol.hasInstance

Nếu `constructor` có phương thức [`Symbol.hasInstance`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance), phương thức sẽ được gọi ưu tiên, với `object` là đối số duy nhất của nó và `constructor` là `this`.

```js
// This class allows plain objects to be disguised as this class's instance,
// as long as the object has a particular flag as its property.
class Forgeable {
  static isInstanceFlag = Symbol("isInstanceFlag");

  static [Symbol.hasInstance](obj) {
    return Forgeable.isInstanceFlag in obj;
  }
}

const obj = { [Forgeable.isInstanceFlag]: true };
console.log(obj instanceof Forgeable); // true
```

Vì tất cả các hàm đều kế thừa từ `Function.prototype` theo mặc định, hầu hết thời gian, phương thức [`Function.prototype[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Symbol.hasInstance) chỉ định hành vi của `instanceof` khi bên phải là một hàm. Xem trang {{jsxref("Symbol.hasInstance")}} để biết thuật toán chính xác của `instanceof`.

### instanceof và nhiều realm

Các môi trường thực thi JavaScript (windows, frames, v.v.) đều nằm trong _realm_ riêng của chúng. Điều này có nghĩa là chúng có các built-ins khác nhau (object global khác nhau, các constructor khác nhau, v.v.). Điều này có thể dẫn đến kết quả bất ngờ. Ví dụ: `[] instanceof window.frames[0].Array` sẽ trả về `false`, vì `Array.prototype !== window.frames[0].Array.prototype` và các mảng trong realm hiện tại kế thừa từ cái trước.

Điều này có thể không có ý nghĩa lúc đầu, nhưng đối với các script xử lý nhiều frames hoặc windows, và truyền các object từ một context sang context khác qua các hàm, đây sẽ là một vấn đề hợp lệ và quan trọng. Ví dụ: bạn có thể kiểm tra an toàn xem một object đã cho có thực sự là Array bằng cách sử dụng {{jsxref("Array.isArray()")}}, bất kể nó đến từ realm nào.

Ví dụ: để kiểm tra xem một [`Node`](/en-US/docs/Web/API/Node) có phải là [`SVGElement`](/en-US/docs/Web/API/SVGElement) trong một context khác không, bạn có thể sử dụng `myNode instanceof myNode.ownerDocument.defaultView.SVGElement`.

## Ví dụ

### Sử dụng instanceof với String

Ví dụ sau đây cho thấy hành vi của `instanceof` với các object `String`.

```js
const literalString = "This is a literal string";
const stringObject = new String("String created with constructor");

literalString instanceof String; // false, string primitive is not a String
stringObject instanceof String; // true

literalString instanceof Object; // false, string primitive is not an Object
stringObject instanceof Object; // true

stringObject instanceof Date; // false
```

### Sử dụng instanceof với Map

Ví dụ sau đây cho thấy hành vi của `instanceof` với các object `Map`.

```js
const myMap = new Map();

myMap instanceof Map; // true
myMap instanceof Object; // true
myMap instanceof String; // false
```

### Các object được tạo bằng Object.create()

Ví dụ sau đây cho thấy hành vi của `instanceof` với các object được tạo bằng {{jsxref("Object.create()")}}.

```js
function Shape() {}

function Rectangle() {
  Shape.call(this); // call super constructor.
}

Rectangle.prototype = Object.create(Shape.prototype);

Rectangle.prototype.constructor = Rectangle;

const rect = new Rectangle();

rect instanceof Object; // true
rect instanceof Shape; // true
rect instanceof Rectangle; // true
rect instanceof String; // false

const literalObject = {};
const nullObject = Object.create(null);
nullObject.name = "My object";

literalObject instanceof Object; // true, every object literal has Object.prototype as prototype
({}) instanceof Object; // true, same case as above
nullObject instanceof Object; // false, prototype is end of prototype chain (null)
```

### Minh chứng rằng myCar có kiểu Car và kiểu Object

Đoạn code sau đây tạo kiểu object `Car` và một instance của kiểu object đó, `myCar`. Toán tử `instanceof` minh chứng rằng object `myCar` thuộc kiểu `Car` và kiểu `Object`.

```js
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
const myCar = new Car("Honda", "Accord", 1998);
const a = myCar instanceof Car; // returns true
const b = myCar instanceof Object; // returns true
```

### Không phải instanceof

Để kiểm tra xem một object có **không** phải là `instanceof` của một constructor cụ thể, bạn có thể làm:

```js
if (!(myCar instanceof Car)) {
  // Do something, like:
  // myCar = new Car(myCar)
}
```

Điều này thực sự khác với:

```js-nolint example-bad
if (!myCar instanceof Car) {
  // unreachable code
}
```

Điều này sẽ luôn là `false`. (`!myCar` sẽ được đánh giá trước `instanceof`, vì vậy bạn luôn cố gắng biết liệu một boolean có phải là instance của `Car` không).

### Ghi đè hành vi của instanceof

Một sai lầm phổ biến khi sử dụng `instanceof` là tin rằng, nếu `x instanceof C`, thì `x` được tạo ra bằng cách sử dụng `C` như constructor. Điều này không đúng, vì `x` có thể được gán trực tiếp với `C.prototype` làm prototype của nó. Trong trường hợp này, nếu code của bạn đọc [private fields](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) của `C` từ `x`, nó vẫn sẽ thất bại:

```js
class C {
  #value = "foo";
  static getValue(x) {
    return x.#value;
  }
}

const x = { __proto__: C.prototype };

if (x instanceof C) {
  console.log(C.getValue(x)); // TypeError: Cannot read private member #value from an object whose class did not declare it
}
```

Để tránh điều này, bạn có thể ghi đè hành vi của `instanceof` bằng cách thêm phương thức `Symbol.hasInstance` vào `C`, để nó thực hiện branded check với [`in`](/en-US/docs/Web/JavaScript/Reference/Operators/in):

```js
class C {
  #value = "foo";

  static [Symbol.hasInstance](x) {
    return #value in x;
  }

  static getValue(x) {
    return x.#value;
  }
}

const x = { __proto__: C.prototype };

if (x instanceof C) {
  // Doesn't run, because x is not a C
  console.log(C.getValue(x));
}
```

Lưu ý rằng bạn có thể muốn giới hạn hành vi này cho class hiện tại; nếu không, nó có thể dẫn đến false positives cho các subclass:

```js
class D extends C {}
console.log(new C() instanceof D); // true; because D inherits [Symbol.hasInstance] from C
```

Bạn có thể làm điều này bằng cách kiểm tra rằng `this` là constructor hiện tại:

```js
class C {
  #value = "foo";

  static [Symbol.hasInstance](x) {
    return this === C && #value in x;
  }
}

class D extends C {}
console.log(new C() instanceof D); // false
console.log(new C() instanceof C); // true
console.log({ __proto__: C.prototype } instanceof C); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof)
- {{jsxref("Symbol.hasInstance")}}
- {{jsxref("Object.prototype.isPrototypeOf")}}
