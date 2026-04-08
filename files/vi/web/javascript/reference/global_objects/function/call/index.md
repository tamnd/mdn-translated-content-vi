---
title: Function.prototype.call()
short-title: call()
slug: Web/JavaScript/Reference/Global_Objects/Function/call
page-type: javascript-instance-method
browser-compat: javascript.builtins.Function.call
sidebar: jsref
---

Phương thức **`call()`** của các instance {{jsxref("Function")}} gọi hàm này với một giá trị `this` cho trước và các tham số được cung cấp riêng lẻ.

{{InteractiveExample("JavaScript Demo: Function.prototype.call()")}}

```js interactive-example
function Product(name, price) {
  this.name = name;
  this.price = price;
}

function Food(name, price) {
  Product.call(this, name, price);
  this.category = "food";
}

console.log(new Food("cheese", 5).name);
// Expected output: "cheese"
```

## Syntax

```js-nolint
call(thisArg)
call(thisArg, arg1)
call(thisArg, arg1, arg2)
call(thisArg, arg1, arg2, /* …, */ argN)
```

### Parameters

- `thisArg`
  - : Giá trị được dùng làm `this` khi gọi `func`. Nếu hàm không ở [chế độ strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và [`undefined`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined) sẽ được thay thế bằng đối tượng toàn cục, và các giá trị nguyên thủy sẽ được chuyển đổi thành object.
- `arg1`, …, `argN` {{optional_inline}}
  - : Các tham số cho hàm.

### Return value

Kết quả của việc gọi hàm với giá trị `this` và tham số đã chỉ định.

## Description

> [!NOTE]
> Hàm này gần giống hệt {{jsxref("Function/apply", "apply()")}}, ngoại trừ các tham số hàm được truyền vào `call()` riêng lẻ dưới dạng danh sách, còn với `apply()` chúng được kết hợp trong một đối tượng, thường là mảng — ví dụ: `func.call(this, "eat", "bananas")` so với `func.apply(this, ["eat", "bananas"])`.

Thông thường, khi gọi một hàm, giá trị của [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this) bên trong hàm là đối tượng mà hàm đó được truy cập từ. Với `call()`, bạn có thể gán một giá trị tùy ý làm `this` khi gọi một hàm hiện có, mà không cần gắn hàm đó vào đối tượng như một thuộc tính trước. Điều này cho phép bạn sử dụng các phương thức của một đối tượng như các hàm tiện ích chung.

> [!WARNING]
> Không dùng `call()` để nối chuỗi các constructor (ví dụ, để thực hiện kế thừa). Việc này gọi hàm constructor như một hàm thông thường, nghĩa là [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) là `undefined`, và các class sẽ báo lỗi vì chúng không thể được gọi mà không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Hãy dùng {{jsxref("Reflect.construct()")}} hoặc [`extends`](/en-US/docs/Web/JavaScript/Reference/Classes/extends) thay thế.

## Examples

### Sử dụng call() để gọi hàm và chỉ định giá trị this

Trong ví dụ bên dưới, khi chúng ta gọi `greet`, giá trị của `this` sẽ được ràng buộc với đối tượng `obj`, ngay cả khi `greet` không phải là phương thức của `obj`.

```js
function greet() {
  console.log(this.animal, "typically sleep between", this.sleepDuration);
}

const obj = {
  animal: "cats",
  sleepDuration: "12 and 16 hours",
};

greet.call(obj); // cats typically sleep between 12 and 16 hours
```

### Sử dụng call() để gọi hàm mà không chỉ định tham số đầu tiên

Nếu tham số `thisArg` đầu tiên bị bỏ qua, mặc định là `undefined`. Trong chế độ non-strict, giá trị `this` sau đó được thay thế bằng {{jsxref("globalThis")}} (tương đương với đối tượng toàn cục).

```js
globalThis.globProp = "foo";

function display() {
  console.log(`globProp value is ${this.globProp}`);
}

display.call(); // Logs "globProp value is foo"
```

Trong chế độ strict, giá trị của `this` không được thay thế, vì vậy nó vẫn là `undefined`.

```js
"use strict";

globalThis.globProp = "foo";

function display() {
  console.log(`globProp value is ${this.globProp}`);
}

display.call(); // throws TypeError: Cannot read the property of 'globProp' of undefined
```

### Chuyển đổi phương thức thành hàm tiện ích

`call()` gần như tương đương với một lời gọi hàm thông thường, ngoại trừ `this` được truyền như một tham số thông thường thay vì là giá trị mà hàm được truy cập từ. Điều này tương tự như cách các hàm tiện ích đa năng hoạt động: thay vì gọi `array.map(callback)`, bạn dùng `map(array, callback)`, cho phép bạn dùng `map` với các đối tượng giống mảng không phải mảng (ví dụ, [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments)) mà không làm thay đổi `Object.prototype`.

Lấy {{jsxref("Array.prototype.slice()")}} làm ví dụ, bạn muốn dùng nó để chuyển đổi một đối tượng giống mảng thành mảng thực sự. Bạn có thể tạo một shortcut như thế này:

```js
const slice = Array.prototype.slice;

// …

slice.call(arguments);
```

Lưu ý rằng bạn không thể lưu `slice.call` và gọi nó như một hàm thông thường, vì phương thức `call()` cũng đọc giá trị `this` của nó, tức là hàm mà nó cần gọi. Trong trường hợp này, bạn có thể dùng {{jsxref("Function/bind", "bind()")}} để ràng buộc giá trị `this` cho `call()`. Trong đoạn code sau, `slice()` là phiên bản ràng buộc của `Function.prototype.call()`, với giá trị `this` được ràng buộc với {{jsxref("Array.prototype.slice()")}}. Điều này có nghĩa là các lời gọi `call()` bổ sung có thể được loại bỏ:

```js
// Same as "slice" in the previous example
const unboundSlice = Array.prototype.slice;
const slice = Function.prototype.call.bind(unboundSlice);

// …

slice(arguments);
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{jsxref("Function.prototype.bind()")}}
- {{jsxref("Function.prototype.apply()")}}
- {{jsxref("Reflect.apply()")}}
- [Spread syntax (`...`)](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
- [Introduction to Object-Oriented JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects)
