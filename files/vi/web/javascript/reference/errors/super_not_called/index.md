---
title: "ReferenceError: must call super constructor before using 'this' in derived class constructor"
slug: Web/JavaScript/Reference/Errors/Super_not_called
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "must call super constructor before using 'this' in derived class constructor" xảy ra khi {{jsxref("Operators/super", "super()")}} không được gọi trong một hàm tạo lớp dẫn xuất nhất định, và hàm tạo dẫn xuất cố gắng truy cập giá trị của {{jsxref("Operators/this", "this")}}, hoặc hàm tạo dẫn xuất đã trả về và giá trị trả về không phải là một đối tượng.

## Thông báo

```plain
ReferenceError: Must call super constructor in derived class before accessing 'this' or returning from derived constructor (V8-based)
ReferenceError: must call super constructor before using 'this' in derived class constructor (Firefox)
ReferenceError: 'super()' must be called in derived constructor before accessing |this| or returning non-object. (Safari)
```

## Loại lỗi

{{jsxref("ReferenceError")}}

## Điều gì đã xảy ra?

Lời gọi `super()` chỉ có thể được gọi tối đa một lần cho mỗi lần gọi `new` đến hàm tạo lớp dẫn xuất. Thông thường, bạn cần gọi nó chính xác một lần, vì nếu bạn không gọi nó, hàm tạo lớp cha không thể khởi tạo giá trị của `this`, vì vậy bạn không thể truy cập `this` trong hàm tạo dẫn xuất và `this` không được coi là một đối tượng đã được xây dựng hợp lệ (và ném lỗi nếu hàm tạo dẫn xuất hoàn thành trong trạng thái này). Cách để xử lý điều này là trả về một đối tượng từ hàm tạo lớp dẫn xuất, trong trường hợp đó đối tượng được trả về sẽ được sử dụng như đối tượng được xây dựng thay vì `this`, cho phép bạn không cần gọi `super()`. Điều này hiếm khi được thực hiện.

## Ví dụ

### Các trường hợp không hợp lệ

```js example-bad
class Base {
  constructor() {
    this.x = 1;
  }
}

class Derived extends Base {
  constructor() {
    console.log(this.x);
    // Hàm tạo Base chưa được gọi, vì vậy this.x là undefined
    // ReferenceError: must call super constructor before using 'this' in derived class constructor
  }
}
```

### Các trường hợp hợp lệ

```js example-good
class Base {
  constructor() {
    this.x = 1;
  }
}

class Derived extends Base {
  constructor() {
    super();
    console.log(this.x); // 1
  }
}
```

## Xem thêm

- [Lớp](/en-US/docs/Web/JavaScript/Reference/Classes)
- {{jsxref("Operators/super", "super")}}
