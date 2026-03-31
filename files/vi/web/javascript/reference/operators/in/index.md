---
title: in
slug: Web/JavaScript/Reference/Operators/in
page-type: javascript-operator
browser-compat: javascript.operators.in
sidebar: jssidebar
---

Toán tử **`in`** trả về `true` nếu thuộc tính đã chỉ định nằm trong object đã chỉ định hoặc chuỗi prototype của nó.

Toán tử `in` không thể được sử dụng để tìm kiếm giá trị trong các collection khác. Để kiểm tra xem một giá trị nhất định có tồn tại trong mảng không, hãy sử dụng {{jsxref("Array.prototype.includes()")}}. Đối với set, hãy sử dụng {{jsxref("Set.prototype.has()")}}.

{{InteractiveExample("JavaScript Demo: in operator")}}

```js interactive-example
const car = { make: "Honda", model: "Accord", year: 1998 };

console.log("make" in car);
// Expected output: true

delete car.make;
if ("make" in car === false) {
  car.make = "Suzuki";
}

console.log(car.make);
// Expected output: "Suzuki"
```

## Cú pháp

```js-nolint
prop in object
#prop in object
```

### Tham số

- `prop`
  - : Một string hoặc symbol đại diện cho tên thuộc tính (các ký hiệu không phải symbol sẽ được [ép kiểu sang string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion)). Cũng có thể là [private element identifier](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).
- `object`
  - : Object cần kiểm tra nếu nó (hoặc chuỗi prototype của nó) chứa thuộc tính với tên đã chỉ định (`prop`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `object` không phải là object (tức là một primitive).

## Mô tả

Toán tử `in` kiểm tra xem một thuộc tính string hoặc symbol có tồn tại trong object hay chuỗi prototype của nó không. Nếu bạn muốn kiểm tra chỉ các thuộc tính _không kế thừa_, hãy sử dụng {{jsxref("Object.hasOwn()")}} thay thế.

Một thuộc tính có thể tồn tại trong object nhưng có giá trị `undefined`. Do đó, `"x" in obj` không giống như `obj.x !== undefined`. Để làm cho `in` trả về `false` sau khi một thuộc tính được thêm vào, hãy sử dụng toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete) thay vì đặt giá trị của thuộc tính đó thành `undefined`.

Bạn cũng có thể sử dụng toán tử `in` để kiểm tra xem một [private class field hoặc method](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) cụ thể đã được định nghĩa trong object hay chưa. Toán tử trả về `true` nếu thuộc tính được định nghĩa, và `false` nếu không. Điều này được gọi là _branded check_, vì nó trả về `true` khi và chỉ khi object được tạo ra với class constructor đó, sau đó bạn có thể truy cập an toàn các private elements khác.

Đây là một cú pháp đặc biệt — bên trái của toán tử `in` là một property identifier thay vì một biểu thức, nhưng không có dấu ngoặc kép (vì nếu không nó là thuộc tính string, không phải private element).

Vì việc truy cập các private elements trên các object không liên quan đến class hiện tại ném ra {{jsxref("TypeError")}} thay vì trả về `undefined`, cú pháp này cho phép bạn rút ngắn:

```js
class C {
  #x;
  static isC(obj) {
    try {
      obj.#x;
      return true;
    } catch {
      return false;
    }
  }
}
```

Thành:

```js
class C {
  #x;
  static isC(obj) {
    return #x in obj;
  }
}
```

Nó cũng thường tránh được nhu cầu xử lý lỗi chỉ để truy cập một private element có thể không tồn tại.

Tuy nhiên, toán tử `in` vẫn yêu cầu private element phải được khai báo trước trong class bao quanh — nếu không, nó sẽ ném ra {{jsxref("SyntaxError")}} ("Private field '#x' must be declared in an enclosing class"), giống như khi bạn cố gắng truy cập một private element chưa được khai báo.

```js-nolint example-bad
class C {
  foo() {
    #x in this;
  }
}

new C().foo(); // SyntaxError: Private field '#x' must be declared in an enclosing class
```

## Ví dụ

### Sử dụng cơ bản

Các ví dụ sau đây cho thấy một số cách sử dụng toán tử `in`.

```js
// Arrays
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
0 in trees; // returns true
3 in trees; // returns true
6 in trees; // returns false
"bay" in trees; // returns false (you must specify the index number, not the value at that index)
"length" in trees; // returns true (length is an Array property)
Symbol.iterator in trees; // returns true

// Predefined objects
"PI" in Math; // returns true

// Custom objects
const myCar = { make: "Honda", model: "Accord", year: 1998 };
"make" in myCar; // returns true
"model" in myCar; // returns true
```

Bạn phải chỉ định một object ở bên phải của toán tử `in`. Ví dụ: bạn có thể chỉ định một string được tạo bằng constructor `String`, nhưng bạn không thể chỉ định một string literal.

```js
const color1 = new String("green");
"length" in color1; // returns true

const color2 = "coral";
// generates an error (color2 is not a String object)
"length" in color2;
```

### Sử dụng toán tử in với các thuộc tính đã bị xóa hoặc undefined

Nếu bạn xóa một thuộc tính bằng toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete), toán tử `in` trả về `false` cho thuộc tính đó.

```js
const myCar = { make: "Honda", model: "Accord", year: 1998 };
delete myCar.make;
"make" in myCar; // returns false

const trees = ["redwood", "bay", "cedar", "oak", "maple"];
delete trees[3];
3 in trees; // returns false
```

Nếu bạn đặt một thuộc tính thành {{jsxref("undefined")}} nhưng không xóa nó, toán tử `in` trả về true cho thuộc tính đó.

```js
const myCar = { make: "Honda", model: "Accord", year: 1998 };
myCar.make = undefined;
"make" in myCar; // returns true
```

```js
const trees = ["redwood", "bay", "cedar", "oak", "maple"];
trees[3] = undefined;
3 in trees; // returns true
```

Toán tử `in` sẽ trả về `false` cho [các vị trí mảng rỗng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), ngay cả khi truy cập trực tiếp trả về `undefined`.

```js
const empties = new Array(3);
empties[2]; // returns undefined
2 in empties; // returns false
```

Để tránh điều này, hãy đảm bảo một mảng mới luôn được điền bằng các giá trị không rỗng hoặc không ghi vào các chỉ số vượt quá cuối mảng.

```js
const empties = new Array(3).fill(undefined);
2 in empties; // returns true
```

### Thuộc tính kế thừa

Toán tử `in` trả về `true` cho các thuộc tính trong chuỗi prototype. Điều này có thể không mong muốn nếu bạn đang sử dụng các object để lưu trữ các cặp key-value tùy ý.

```js example-bad
const ages = { alice: 18, bob: 27 };

function hasPerson(name) {
  return name in ages;
}

hasPerson("hasOwnProperty"); // true
```

Bạn có thể sử dụng {{jsxref("Object.hasOwn()")}} để kiểm tra xem object có key hay không.

```js
const ages = { alice: 18, bob: 27 };

function hasPerson(name) {
  return Object.hasOwn(ages, name);
}

hasPerson("hasOwnProperty"); // false
```

Ngoài ra, bạn nên cân nhắc sử dụng [null prototype object](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects) hoặc {{jsxref("Map")}} để lưu trữ `ages`, để tránh các lỗi khác.

```js example-good
const ages = new Map([
  ["alice", 18],
  ["bob", 27],
]);

function hasPerson(name) {
  return ages.has(name);
}

hasPerson("hasOwnProperty"); // false
```

### Sử dụng toán tử in để thực hiện branded checks

Đoạn code dưới đây minh chứng một hàm tĩnh cho biết liệu một object có được tạo ra với constructor `Person` không, và do đó có thể thực hiện các phương thức khác một cách an toàn.

```js
class Person {
  #age;
  constructor(age) {
    this.#age = age;
  }
  static isPerson(o) {
    return #age in o;
  }
  ageDifference(other) {
    return this.#age - other.#age;
  }
}

const p1 = new Person(20);
const p2 = new Person(30);
console.log(p1.ageDifference(p2)); // -10
console.log(Person.isPerson(p1)); // true

if (Person.isPerson(p1) && Person.isPerson(p2)) {
  console.log(p1.ageDifference(p2)); // -10
}
```

Nó giúp ngăn chặn trường hợp sau:

```js
const p2 = {};

p1.ageDifference(p2); // TypeError: Cannot read private member #age from an object whose class did not declare it
```

Không có toán tử `in`, bạn sẽ phải sử dụng khối `try...catch` để kiểm tra xem object có private element hay không.

Bạn cũng có thể triển khai điều này như một phương thức [`[Symbol.hasInstance]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/hasInstance) của class, để bạn có thể sử dụng toán tử [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) để thực hiện cùng một kiểm tra (mà theo mặc định, chỉ kiểm tra sự tồn tại của `Person.prototype` trong chuỗi prototype của object).

```js
class Person {
  #age;
  constructor(age) {
    this.#age = age;
  }
  static [Symbol.hasInstance](o) {
    // Testing `this` to prevent false-positives when
    // calling `instanceof SubclassOfPerson`
    return this === Person && #age in o;
  }
  ageDifference(other) {
    return this.#age - other.#age;
  }
}

const p1 = new Person(20);
const p2 = new Person(30);

if (p1 instanceof Person && p2 instanceof Person) {
  console.log(p1.ageDifference(p2)); // -10
}
```

Để biết thêm ví dụ, xem [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements) và [hướng dẫn class](/en-US/docs/Web/JavaScript/Guide/Using_classes#private_fields).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in)
- [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete)
- {{jsxref("Object.hasOwn()")}}
- {{jsxref("Reflect.has()")}}
- [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties)
