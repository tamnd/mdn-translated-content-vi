---
title: "InternalError: too much recursion"
slug: Web/JavaScript/Reference/Errors/Too_much_recursion
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "too much recursion" hoặc "Maximum call stack size exceeded" xảy ra khi có quá nhiều lần gọi hàm, hoặc một hàm thiếu trường hợp cơ sở.

## Thông báo

```plain
RangeError: Maximum call stack size exceeded (Chrome)
InternalError: too much recursion (Firefox)
RangeError: Maximum call stack size exceeded. (Safari)
```

## Loại lỗi

{{jsxref("InternalError")}} trong Firefox; {{jsxref("RangeError")}} trong Chrome và Safari.

## Điều gì đã xảy ra?

Một hàm tự gọi chính nó được gọi là _hàm đệ quy_. Khi một điều kiện được đáp ứng, hàm dừng gọi chính nó. Đây được gọi là _trường hợp cơ sở_.

Theo một cách nào đó, đệ quy tương tự như vòng lặp. Cả hai đều thực thi cùng một code nhiều lần, và cả hai đều yêu cầu một điều kiện (để tránh vòng lặp vô hạn, hay chính xác hơn là đệ quy vô hạn trong trường hợp này). Khi có quá nhiều lần gọi hàm, hoặc một hàm thiếu trường hợp cơ sở, JavaScript sẽ ném ra lỗi này.

## Ví dụ

Hàm đệ quy này chạy 10 lần, theo điều kiện thoát.

```js
function loop(x) {
  if (x >= 10)
    // "x >= 10" là điều kiện thoát
    return;
  // làm gì đó
  loop(x + 1); // lần gọi đệ quy
}
loop(0);
```

Thiết lập điều kiện này thành một giá trị cực kỳ cao sẽ không hoạt động:

```js example-bad
function loop(x) {
  if (x >= 1000000000000) return;
  // làm gì đó
  loop(x + 1);
}
loop(0);

// InternalError: too much recursion
```

Hàm đệ quy này thiếu trường hợp cơ sở. Vì không có điều kiện thoát, hàm sẽ gọi chính nó vô hạn.

```js example-bad
function loop(x) {
  // Thiếu trường hợp cơ sở
  loop(x + 1); // Lần gọi đệ quy
}

loop(0);

// InternalError: too much recursion
```

### Lỗi class: too much recursion

```js example-bad
class Person {
  constructor() {}
  set name(name) {
    this.name = name; // Lần gọi đệ quy
  }
}

const tony = new Person();
tony.name = "Tonisha"; // InternalError: too much recursion
```

Khi một giá trị được gán cho thuộc tính name (this.name = name;) JavaScript cần thiết lập thuộc tính đó. Khi điều này xảy ra, hàm setter được kích hoạt.

Trong ví dụ này khi setter được kích hoạt, nó được yêu cầu làm điều tương tự một lần nữa: _thiết lập cùng một thuộc tính mà nó được tạo ra để xử lý._ Điều này khiến hàm gọi chính nó, lặp đi lặp lại, khiến nó đệ quy vô hạn.

Vấn đề này cũng xảy ra nếu cùng một biến được sử dụng trong getter.

```js example-bad
class Person {
  get name() {
    return this.name; // Lần gọi đệ quy
  }
}
```

Để tránh vấn đề này, hãy đảm bảo rằng thuộc tính được gán bên trong hàm setter khác với thuộc tính ban đầu kích hoạt setter. Tương tự áp dụng cho getter.

```js
class Person {
  constructor() {}
  set name(name) {
    this._name = name;
  }
  get name() {
    return this._name;
  }
}
const tony = new Person();
tony.name = "Tonisha";
console.log(tony);
```

## Xem thêm

- {{Glossary("Recursion")}}
- [Các hàm đệ quy](/en-US/docs/Web/JavaScript/Guide/Functions#recursion)
