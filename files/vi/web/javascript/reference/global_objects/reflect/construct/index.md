---
title: Reflect.construct()
short-title: construct()
slug: Web/JavaScript/Reference/Global_Objects/Reflect/construct
page-type: javascript-static-method
browser-compat: javascript.builtins.Reflect.construct
sidebar: jsref
---

Phương thức tĩnh **`Reflect.construct()`** giống như toán tử {{jsxref("Operators/new", "new")}}, nhưng dưới dạng hàm. Nó tương đương với việc gọi `new target(...args)`. Nó còn cho phép chỉ định một giá trị [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) khác.

{{InteractiveExample("JavaScript Demo: Reflect.construct()", "taller")}}

```js interactive-example
function func1(a, b, c) {
  this.sum = a + b + c;
}

const args = [1, 2, 3];
const object1 = new func1(...args);
const object2 = Reflect.construct(func1, args);

console.log(object2.sum);
// Expected output: 6

console.log(object1.sum);
// Expected output: 6
```

## Cú pháp

```js-nolint
Reflect.construct(target, argumentsList)
Reflect.construct(target, argumentsList, newTarget)
```

### Tham số

- `target`
  - : Hàm target cần gọi.
- `argumentsList`
  - : Một [đối tượng giống mảng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects) xác định các đối số mà `target` sẽ được gọi cùng.
- `newTarget` {{optional_inline}}
  - : Giá trị của biểu thức [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) bên trong `target`. Mặc định là `target`. Nhìn chung ([xem ví dụ](#thay_đổi_new.target)), `target` xác định _logic_ để khởi tạo đối tượng, trong khi `newTarget.prototype` xác định _prototype_ của đối tượng được tạo.

### Giá trị trả về

Một instance mới của `target` (hoặc `newTarget`, nếu có), được khởi tạo bởi `target` như một constructor với `argumentsList` đã cho.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `target` hoặc `newTarget` không phải là constructor, hoặc nếu `argumentsList` không phải là đối tượng.

## Mô tả

`Reflect.construct()` cung cấp ngữ nghĩa phản chiếu của một lời gọi constructor. Tức là, `Reflect.construct(target, argumentsList, newTarget)` tương đương về mặt ngữ nghĩa với:

```js
new target(...argumentsList);
```

Lưu ý rằng khi dùng toán tử `new`, `target` và `newTarget` luôn là cùng một constructor — nhưng `Reflect.construct()` cho phép bạn truyền một giá trị [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) khác. Về mặt khái niệm, `newTarget` là hàm mà `new` được gọi trên đó, và `newTarget.prototype` sẽ trở thành prototype của đối tượng được tạo, trong khi `target` là constructor thực sự được thực thi để khởi tạo đối tượng. Ví dụ, `new.target` cũng có thể khác với constructor đang thực thi hiện tại trong kế thừa lớp.

```js
class A {
  constructor() {
    console.log(new.target.name);
  }
}
class B extends A {}

new B(); // "B"
```

`Reflect.construct()` cho phép bạn gọi một constructor với số lượng đối số biến đổi. (Điều này cũng có thể thực hiện với [cú pháp spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) trong một lời gọi constructor thông thường.)

```js
const obj = new Foo(...args);
const obj = Reflect.construct(Foo, args);
```

`Reflect.construct()` gọi phương thức nội tại `[[Construct]]` [của đối tượng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy#object_internal_methods) trên `target`.

## Ví dụ

### Sử dụng Reflect.construct()

```js
const d = Reflect.construct(Date, [1776, 6, 4]);
d instanceof Date; // true
d.getFullYear(); // 1776
```

### Thay đổi new.target

Nếu `newTarget` được truyền vào, nó thay đổi giá trị của `new.target` bên trong constructor. Đối tượng được tạo sẽ là instance của `newTarget`, không phải `target`.

```js
function OneClass() {
  console.log("OneClass executed");
  console.log(`new.target is ${new.target.name}`);
}

function OtherClass() {
  console.log("OtherClass executed");
  console.log(`new.target is ${new.target.name}`);
}

const obj1 = Reflect.construct(OneClass, []);
// Logs:
// OneClass executed
// new.target is OneClass
console.log(obj1 instanceof OneClass); // true

const obj2 = Reflect.construct(OneClass, [], OtherClass);
// Logs:
// OneClass executed
// new.target is OtherClass
console.log(obj2 instanceof OtherClass); // true
console.log(obj2 instanceof OneClass); // false
```

Tất nhiên, không có sự đảm bảo mạnh mẽ nào về chuỗi prototype của đối tượng được tạo, vì điều đó phụ thuộc vào triển khai của constructor. Ví dụ, nếu constructor `target` trả về một đối tượng, thì đối tượng đó sẽ là đối tượng được tạo, bất kể giá trị `newTarget`. Nếu `target` là một proxy với trap `construct`, thì trap đó kiểm soát hoàn toàn quá trình tạo.

```js
function OneClass() {
  return { name: "one" };
}

function OtherClass() {
  return { name: "other" };
}

const obj1 = Reflect.construct(OneClass, [], OtherClass);
console.log(obj1.name); // 'one'
console.log(obj1 instanceof OneClass); // false
console.log(obj1 instanceof OtherClass); // false
```

Một `new.target` hợp lệ phải là hàm constructor với thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype), nhưng điều sau không được thực thi. Nếu giá trị của thuộc tính `prototype` không phải là đối tượng, đối tượng được khởi tạo sẽ kế thừa từ `Object.prototype`.

```js
function OneClass() {
  console.log("OneClass executed");
  console.log(`new.target is ${new.target.name}`);
}

function OtherClass() {
  console.log("OtherClass executed");
  console.log(`new.target is ${new.target.name}`);
}

OtherClass.prototype = null;

const obj = Reflect.construct(OneClass, [], OtherClass);
// Logs:
// OneClass executed
// new.target is OtherClass
console.log(Object.getPrototypeOf(obj) === Object.prototype); // true
```

### Reflect.construct() so với Object.create()

Trước khi giới thiệu `Reflect`, các đối tượng có thể được tạo bằng cách kết hợp tùy ý các constructor và prototype sử dụng {{jsxref("Object.create()")}}.

```js
function OneClass() {
  this.name = "one";
}

function OtherClass() {
  this.name = "other";
}

const args = [];
const obj1 = Reflect.construct(OneClass, args, OtherClass);
const obj2 = Object.create(OtherClass.prototype);
OneClass.apply(obj2, args);

console.log(obj1.name); // 'one'
console.log(obj2.name); // 'one'

console.log(obj1 instanceof OneClass); // false
console.log(obj2 instanceof OneClass); // false

console.log(obj1 instanceof OtherClass); // true
console.log(obj2 instanceof OtherClass); // true
```

Tuy nhiên, mặc dù kết quả cuối cùng giống nhau, có một sự khác biệt quan trọng trong quá trình. Khi dùng `Object.create()` và {{jsxref("Function.prototype.apply()")}}, toán tử `new.target` sẽ trỏ đến `undefined` trong hàm được dùng làm constructor, vì từ khóa `new` không được dùng để tạo đối tượng. (Thực ra, nó dùng ngữ nghĩa [`apply`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Reflect/apply), không phải `construct`, mặc dù các hàm thông thường hoạt động gần như giống nhau.)

Khi gọi `Reflect.construct()`, ngược lại, toán tử `new.target` sẽ trỏ đến tham số `newTarget` nếu được cung cấp, hoặc `target` nếu không.

```js
function OneClass() {
  console.log("OneClass");
  console.log(new.target);
}
function OtherClass() {
  console.log("OtherClass");
  console.log(new.target);
}

const obj1 = Reflect.construct(OneClass, args);
// Logs:
// OneClass
// function OneClass { ... }

const obj2 = Reflect.construct(OneClass, args, OtherClass);
// Logs:
// OneClass
// function OtherClass { ... }

const obj3 = Object.create(OtherClass.prototype);
OneClass.apply(obj3, args);
// Output:
//     OneClass
//     undefined
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Reflect.construct` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-reflect)
- {{jsxref("Reflect")}}
- {{jsxref("Operators/new", "new")}}
- [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target)
- [`handler.construct()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/Proxy/construct)
