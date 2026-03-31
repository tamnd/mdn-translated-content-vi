---
title: "ReferenceError: super() called twice in derived class constructor"
slug: Web/JavaScript/Reference/Errors/Super_called_twice
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "super() called twice in derived class constructor" xảy ra khi {{jsxref("Operators/super", "super()")}} được gọi lần thứ hai trong một hàm tạo lớp dẫn xuất nhất định.

## Thông báo

```plain
ReferenceError: Super constructor may only be called once (V8-based)
ReferenceError: super() called twice in derived class constructor (Firefox)
ReferenceError: 'super()' can't be called more than once in a constructor. (Safari)
```

## Loại lỗi

{{jsxref("ReferenceError")}}

## Điều gì đã xảy ra?

Lời gọi `super()` chỉ có thể được gọi tối đa một lần cho mỗi lần gọi `new` đến hàm tạo lớp dẫn xuất. Điều này là vì `super()` chịu trách nhiệm khởi tạo lớp cha, và việc gọi nó nhiều hơn một lần sẽ dẫn đến hàm tạo lớp cha bị gọi nhiều lần.

Cách tốt nhất để ngăn chặn điều này là đảm bảo rằng `super()` được đặt ngoài bất kỳ cấu trúc luồng điều khiển nào. Nếu không, hãy đảm bảo rằng tất cả các đường dẫn code trong hàm tạo dẫn đến chỉ một lần gọi `super()`.

Lời gọi `super()` có thể được "lưu" trong một hàm mũi tên lồng trong hàm tạo. Sau đó, khi bạn gọi hàm mũi tên, bạn cũng sẽ gọi `super()`, và quy tắc tương tự áp dụng: hàm mũi tên chỉ có thể được gọi tối đa một lần.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
class Base {}

class Derived extends Base {
  constructor() {
    super();
    super();
  }
}
```

Đôi khi lỗi có thể tinh vi hơn.

```js example-bad
class Base {
  constructor(flavor) {
    // Làm gì đó với flavor
  }
}

class Derived extends Base {
  constructor(flavors) {
    if (flavors.includes("chocolate")) {
      super("chocolate");
    }
    if (flavors.includes("vanilla")) {
      super("vanilla");
    }
  }
}
```

Ban đầu, `flavors` có thể không bao giờ bao gồm cả "chocolate" và "vanilla" cùng một lúc, nhưng nếu điều đó xảy ra, hàm tạo sẽ gọi `super()` hai lần. Bạn cần suy nghĩ lại về cách cấu trúc lớp của mình để tránh vấn đề này.

### Các trường hợp hợp lệ

```js example-good
class Base {}

class Derived extends Base {
  constructor() {
    super();
    // Thêm logic khởi tạo
  }
}
```

## Xem thêm

- [Lớp](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Operators/super", "super")}}
