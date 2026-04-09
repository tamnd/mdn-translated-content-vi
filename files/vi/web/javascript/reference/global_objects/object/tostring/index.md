---
title: Object.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Object/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Object.toString
sidebar: jsref
---

Phương thức **`toString()`** của các instance {{jsxref("Object")}} trả về một chuỗi đại diện cho đối tượng này. Phương thức này được thiết kế để các đối tượng dẫn xuất ghi đè với logic [ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion) tùy chỉnh.

{{InteractiveExample("JavaScript Demo: Object.prototype.toString()")}}

```js interactive-example
const map = new Map();

console.log(map.toString());
// Expected output: "[object Map]"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Theo mặc định `toString()` không nhận tham số. Tuy nhiên, các đối tượng kế thừa từ `Object` có thể ghi đè nó bằng các triển khai riêng có nhận tham số. Ví dụ, các phương thức [`Number.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) và [`BigInt.prototype.toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/toString) nhận tham số `radix` tùy chọn.

### Giá trị trả về

Một chuỗi đại diện cho đối tượng.

## Mô tả

JavaScript gọi phương thức `toString` để [chuyển đổi đối tượng thành giá trị nguyên thủy](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion). Bạn hiếm khi cần tự gọi phương thức `toString`; JavaScript tự động gọi nó khi gặp đối tượng ở nơi cần giá trị nguyên thủy.

Phương thức này được gọi ưu tiên bởi [string conversion](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), nhưng [numeric conversion](/en-US/docs/Web/JavaScript/Guide/Data_structures#numeric_coercion) và [primitive conversion](/en-US/docs/Web/JavaScript/Guide/Data_structures#primitive_coercion) gọi `valueOf()` ưu tiên hơn. Tuy nhiên, vì phương thức [`valueOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/valueOf) cơ sở trả về đối tượng, phương thức `toString()` thường được gọi cuối cùng, trừ khi đối tượng ghi đè `valueOf()`. Ví dụ, `+[1]` trả về `1`, vì phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) của nó trả về `"1"`, sau đó được chuyển đổi thành số.

Tất cả các đối tượng kế thừa từ `Object.prototype` (tức là tất cả trừ [đối tượng có prototype `null`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object#null-prototype_objects)) đều kế thừa phương thức `toString()`. Khi bạn tạo đối tượng tùy chỉnh, bạn có thể ghi đè `toString()` để gọi phương thức tùy chỉnh, giúp đối tượng tùy chỉnh của bạn có thể chuyển đổi thành giá trị chuỗi. Ngoài ra, bạn có thể thêm phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), cho phép kiểm soát nhiều hơn quá trình chuyển đổi, và sẽ luôn được ưu tiên hơn `valueOf` hoặc `toString` cho bất kỳ chuyển đổi kiểu nào.

Để sử dụng `Object.prototype.toString()` cơ sở với một đối tượng đã ghi đè nó (hoặc gọi nó trên `null` hoặc `undefined`), bạn cần gọi {{jsxref("Function.prototype.call()")}} hoặc {{jsxref("Function.prototype.apply()")}} trên nó, truyền đối tượng bạn muốn kiểm tra làm tham số đầu tiên (gọi là `thisArg`).

```js
const arr = [1, 2, 3];

arr.toString(); // "1,2,3"
Object.prototype.toString.call(arr); // "[object Array]"
```

`Object.prototype.toString()` trả về `"[object Type]"`, trong đó `Type` là kiểu của đối tượng. Nếu đối tượng có thuộc tính [`Symbol.toStringTag`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) có giá trị là chuỗi, giá trị đó sẽ được dùng làm `Type`. Nhiều đối tượng dựng sẵn, bao gồm [`Map`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) và [`Symbol`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol), có `Symbol.toStringTag`. Một số đối tượng có trước ES6 không có `Symbol.toStringTag`, nhưng vẫn có tag đặc biệt. Chúng bao gồm (tag giống với tên kiểu được liệt kê dưới đây):

- [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
- [`Function`](/en-US/docs/Web/JavaScript/Reference/Functions) (bất cứ thứ gì mà [`typeof`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof) trả về `"function"`)
- [`Error`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error)
- [`Boolean`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean)
- [`Number`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)
- [`String`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)
- [`Date`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
- [`RegExp`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp)

Đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) trả về `"[object Arguments]"`. Tất cả mọi thứ khác, bao gồm các class người dùng định nghĩa, trừ khi có `Symbol.toStringTag` tùy chỉnh, sẽ trả về `"[object Object]"`.

`Object.prototype.toString()` được gọi trên [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và {{jsxref("undefined")}} trả về `[object Null]` và `[object Undefined]`, tương ứng.

## Ví dụ

### Ghi đè toString cho đối tượng tùy chỉnh

Bạn có thể tạo một hàm để gọi thay cho phương thức `toString()` mặc định. Hàm `toString()` bạn tạo phải trả về giá trị chuỗi. Nếu nó trả về đối tượng và phương thức được gọi ngầm trong [chuyển đổi kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion), thì kết quả của nó bị bỏ qua và giá trị của phương thức liên quan, {{jsxref("Object/valueOf", "valueOf()")}}, được dùng thay thế, hoặc `TypeError` được ném nếu không có phương thức nào trả về giá trị nguyên thủy.

Đoạn code sau định nghĩa class `Dog`.

```js
class Dog {
  constructor(name, breed, color, sex) {
    this.name = name;
    this.breed = breed;
    this.color = color;
    this.sex = sex;
  }
}
```

Nếu bạn gọi phương thức `toString()`, tường minh hoặc ngầm định, trên một instance của `Dog`, nó trả về giá trị mặc định được kế thừa từ {{jsxref("Object")}}:

```js
const theDog = new Dog("Gabby", "Lab", "chocolate", "female");

theDog.toString(); // "[object Object]"
`${theDog}`; // "[object Object]"
```

Đoạn code sau ghi đè phương thức `toString()` mặc định. Phương thức này tạo ra chuỗi chứa `name`, `breed`, `color` và `sex` của đối tượng.

```js
class Dog {
  constructor(name, breed, color, sex) {
    this.name = name;
    this.breed = breed;
    this.color = color;
    this.sex = sex;
  }
  toString() {
    return `Dog ${this.name} is a ${this.sex} ${this.color} ${this.breed}`;
  }
}
```

Với đoạn code trên, bất cứ khi nào một instance của `Dog` được sử dụng trong ngữ cảnh chuỗi, JavaScript tự động gọi phương thức `toString()`.

```js
const theDog = new Dog("Gabby", "Lab", "chocolate", "female");

`${theDog}`; // "Dog Gabby is a female chocolate Lab"
```

### Sử dụng toString() để phát hiện class của đối tượng

`toString()` có thể được dùng với mọi đối tượng và (theo mặc định) cho phép bạn lấy class của nó.

```js
const toString = Object.prototype.toString;

toString.call(new Date()); // [object Date]
toString.call(new String()); // [object String]
// Math có Symbol.toStringTag
toString.call(Math); // [object Math]

toString.call(undefined); // [object Undefined]
toString.call(null); // [object Null]
```

Sử dụng `toString()` theo cách này không đáng tin cậy; các đối tượng có thể thay đổi hành vi của `Object.prototype.toString()` bằng cách định nghĩa thuộc tính {{jsxref("Symbol.toStringTag")}}, dẫn đến kết quả không mong đợi. Ví dụ:

```js
const myDate = new Date();
Object.prototype.toString.call(myDate); // [object Date]

myDate[Symbol.toStringTag] = "myDate";
Object.prototype.toString.call(myDate); // [object myDate]

Date.prototype[Symbol.toStringTag] = "prototype polluted";
Object.prototype.toString.call(new Date()); // [object prototype polluted]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Object.prototype.toString` với hỗ trợ `Symbol.toStringTag` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-object)
- {{jsxref("Object.prototype.valueOf()")}}
- {{jsxref("Number.prototype.toString()")}}
- {{jsxref("Symbol.toPrimitive")}}
- {{jsxref("Symbol.toStringTag")}}
