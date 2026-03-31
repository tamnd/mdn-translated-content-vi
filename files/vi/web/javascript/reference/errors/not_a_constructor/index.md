---
title: 'TypeError: "x" is not a constructor'
slug: Web/JavaScript/Reference/Errors/Not_a_constructor
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "is not a constructor" xảy ra khi có cố gắng sử dụng một đối tượng hoặc một biến làm constructor, nhưng đối tượng hoặc biến đó không phải là constructor.

## Thông báo

```plain
TypeError: x is not a constructor (V8-based & Firefox & Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Đã có cố gắng sử dụng một đối tượng hoặc một biến làm constructor, nhưng đối tượng hoặc biến đó không phải là constructor. Xem [constructor](/en-US/docs/Glossary/Constructor) hoặc [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) để biết thêm thông tin về constructor là gì.

Có nhiều đối tượng toàn cục, như {{jsxref("String")}} hoặc {{jsxref("Array")}}, có thể khởi tạo bằng `new`. Tuy nhiên, một số đối tượng toàn cục thì không và các thuộc tính cũng như phương thức của chúng là static. Các đối tượng tích hợp sẵn JavaScript tiêu chuẩn sau đây không phải là constructor: {{jsxref("Math")}}, {{jsxref("JSON")}}, {{jsxref("Symbol")}}, {{jsxref("Reflect")}}, {{jsxref("Intl")}}, {{jsxref("Atomics")}}.

[Hàm generator](/en-US/docs/Web/JavaScript/Reference/Statements/function*) cũng không thể được sử dụng làm constructor.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const Car = 1;
new Car();
// TypeError: Car is not a constructor

new Math();
// TypeError: Math is not a constructor

new Symbol();
// TypeError: Symbol is not a constructor

function* f() {}
const obj = new f();
// TypeError: f is not a constructor
```

### Một constructor car

Giả sử bạn muốn tạo một kiểu đối tượng cho xe ô tô. Bạn muốn kiểu đối tượng này được gọi là `Car`, và bạn muốn nó có các thuộc tính là hãng, kiểu và năm sản xuất. Để làm điều này, bạn sẽ viết hàm sau:

```js
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
```

Bây giờ bạn có thể tạo một đối tượng gọi là `myCar` như sau:

```js
const myCar = new Car("Eagle", "Talon TSi", 1993);
```

### Trong Promises

Khi trả về một Promise được resolve hoặc reject ngay lập tức, bạn không cần tạo `new Promise(...)` và xử lý nó. Thay vào đó, hãy dùng các [phương thức static](<https://en.wikipedia.org/wiki/Method_(computer_programming)#Static_methods>) [`Promise.resolve()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve) hoặc [`Promise.reject()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject).

Đây là không hợp lệ (constructor [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise) không được gọi đúng cách) và sẽ ném ra ngoại lệ `TypeError: this is not a constructor`:

```js example-bad
function fn() {
  return new Promise.resolve(true);
}
```

Đây là hợp lệ, nhưng không cần thiết dài dòng:

```js
function fn() {
  return new Promise((resolve, reject) => {
    resolve(true);
  });
}
```

Thay vào đó, hãy trả về phương thức static:

```js example-good
function resolveAlways() {
  return Promise.resolve(true);
}

function rejectAlways() {
  return Promise.reject(new Error());
}
```

## Xem thêm

- [constructor](/en-US/docs/Glossary/Constructor)
- [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new)
