---
title: "Function: prototype"
short-title: prototype
slug: Web/JavaScript/Reference/Global_Objects/Function/prototype
page-type: javascript-instance-data-property
spec-urls: https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-function-instances-prototype
sidebar: jsref
---

Thuộc tính dữ liệu **`prototype`** của một instance {{jsxref("Function")}} được dùng khi hàm được sử dụng như một constructor với toán tử [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Nó sẽ trở thành prototype của đối tượng mới.

> [!NOTE]
> Không phải tất cả các đối tượng {{jsxref("Function")}} đều có thuộc tính `prototype` — xem [mô tả](#description).

## Giá trị

Một đối tượng.

{{js_property_attributes(1, 0, 0)}}

> [!NOTE]
> [Class](/en-US/docs/Web/JavaScript/Reference/Classes) là một loại hàm, vì vậy hầu hết mô tả ở đây cũng áp dụng cho thuộc tính `prototype` của class. Điểm khác biệt đáng chú ý duy nhất là thuộc tính `prototype` của class không phải là writable.

## Mô tả

Khi một hàm được gọi với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), thuộc tính `prototype` của constructor sẽ trở thành prototype của đối tượng kết quả.

```js
function Ctor() {}
const inst = new Ctor();
console.log(Object.getPrototypeOf(inst) === Ctor.prototype); // true
```

Bạn có thể đọc [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain#constructors) để biết thêm thông tin về sự tương tác giữa thuộc tính `prototype` của hàm constructor và prototype của đối tượng kết quả.

Một hàm có thuộc tính `prototype` không đủ điều kiện để trở thành constructor. [Generator function](/en-US/docs/Web/JavaScript/Reference/Statements/function*) có thuộc tính `prototype`, nhưng không thể được gọi với `new`:

```js
async function* asyncGeneratorFunction() {}
function* generatorFunction() {}
```

Thay vào đó, thuộc tính `prototype` của generator function được dùng khi chúng được gọi _mà không có_ `new`. Thuộc tính `prototype` sẽ trở thành prototype của đối tượng [`Generator`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) được trả về.

Ngoài ra, một số hàm có thể có `prototype` nhưng ném ngoại lệ vô điều kiện khi được gọi với `new`. Ví dụ, các hàm [`Symbol()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol) và [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) ném ngoại lệ khi được gọi với `new`, vì `Symbol.prototype` và `BigInt.prototype` chỉ nhằm cung cấp các phương thức cho các giá trị primitive, còn các đối tượng wrapper không nên được khởi tạo trực tiếp.

Các hàm sau không có `prototype`, và do đó không đủ điều kiện làm constructor, dù thuộc tính `prototype` sau đó được gán thủ công:

```js
const method = { foo() {} }.foo;
const arrowFunction = () => {};
async function asyncFunction() {}
```

Các hàm sau là constructor hợp lệ và có `prototype`:

```js
class Class {}
function fn() {}
```

Một [bound function](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) không có thuộc tính `prototype`, nhưng có thể được dùng như constructor. Khi được dùng như constructor, hàm mục tiêu sẽ được khởi tạo thay thế, và nếu hàm mục tiêu có thể được dùng như constructor, nó sẽ trả về một instance bình thường.

```js
const boundFunction = function () {}.bind(null);
```

Thuộc tính `prototype` của một hàm, theo mặc định, là một đối tượng thuần với một thuộc tính: [`constructor`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/constructor), là tham chiếu đến chính hàm đó. Thuộc tính `constructor` là writable, non-enumerable và configurable.

Nếu `prototype` của một hàm được gán lại bằng thứ gì đó khác ngoài {{jsxref("Object")}}, khi hàm được gọi với `new`, prototype của đối tượng được trả về sẽ là `Object.prototype` thay thế. (Nói cách khác, `new` bỏ qua thuộc tính `prototype` và khởi tạo một đối tượng thuần.)

```js
function Ctor() {}
Ctor.prototype = 3;
console.log(Object.getPrototypeOf(new Ctor()) === Object.prototype); // true
```

## Ví dụ

### Thay đổi prototype của tất cả instance bằng cách thay đổi thuộc tính prototype

```js
function Ctor() {}
const p1 = new Ctor();
const p2 = new Ctor();
Ctor.prototype.prop = 1;
console.log(p1.prop); // 1
console.log(p2.prop); // 1
```

### Thêm thuộc tính không phải phương thức vào thuộc tính prototype của class

[Class field](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields) thêm thuộc tính vào từng instance. Các phương thức class khai báo thuộc tính _function_ trên prototype. Tuy nhiên, không có cách nào để thêm thuộc tính không phải hàm vào prototype. Nếu bạn muốn chia sẻ dữ liệu tĩnh giữa tất cả instance (ví dụ: [`Error.prototype.name`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/name) giống nhau giữa tất cả instance error), bạn có thể gán thủ công nó vào `prototype` của class.

```js
class Dog {
  constructor(name) {
    this.name = name;
  }
}

Dog.prototype.species = "dog";

console.log(new Dog("Jack").species); // "dog"
```

Điều này có thể tiện lợi hơn bằng cách dùng [static initialization blocks](/en-US/docs/Web/JavaScript/Reference/Classes/Static_initialization_blocks), được gọi khi class được khởi tạo.

```js
class Dog {
  static {
    Dog.prototype.species = "dog";
  }
  constructor(name) {
    this.name = name;
  }
}

console.log(new Dog("Jack").species); // "dog"
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{jsxref("Function")}}
- [Kế thừa và chuỗi prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain#constructors)
