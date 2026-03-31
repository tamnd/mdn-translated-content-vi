---
title: "TypeError: Iterator/AsyncIterator constructor can't be used directly"
slug: Web/JavaScript/Reference/Errors/Constructor_cant_be_used_directly
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Iterator constructor can't be used directly" hoặc "AsyncIterator constructor can't be used directly" xảy ra khi bạn cố gắng sử dụng trực tiếp các constructor {{jsxref("Iterator/Iterator", "Iterator()")}} hoặc {{jsxref("AsyncIterator/AsyncIterator", "AsyncIterator()")}} để tạo instance. Các constructor này là _lớp trừu tượng_ và chỉ nên được kế thừa.

## Thông báo

```plain
TypeError: Abstract class Iterator not directly constructable (V8-based)
TypeError: Iterator constructor can't be used directly (Firefox)
TypeError: Iterator cannot be constructed directly (Safari)

TypeError: Abstract class AsyncIterator not directly constructable (V8-based)
TypeError: AsyncIterator constructor can't be used directly (Firefox)
TypeError: AsyncIterator cannot be constructed directly (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Điều gì đã xảy ra?

Các constructor {{jsxref("Iterator")}} và {{jsxref("AsyncIterator")}} là các lớp trừu tượng và không nên được sử dụng trực tiếp. Chúng kiểm tra giá trị của [`new.target`](/en-US/docs/Web/JavaScript/Reference/Operators/new.target) và ném lỗi nếu giá trị đó giống với chính constructor. Cách duy nhất để sử dụng các constructor này là kế thừa từ chúng trong một lớp con và gọi `super()` trong constructor của lớp con. Lớp con cũng phải định nghĩa phương thức `next()` để có thể sử dụng được.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
new Iterator();
```

### Trường hợp hợp lệ

```js example-good
class MyIterator extends Iterator {
  #step;
  #end;
  constructor(start, end) {
    // Gọi ngầm new Iterator(), nhưng với `new.target` khác
    super();
    this.#step = start;
    this.#end = end;
  }
  next() {
    if (this.#step >= this.#end) {
      return { done: true };
    }
    return { value: this.#step++, done: false };
  }
}

new MyIterator();
```

## Xem thêm

- {{jsxref("AsyncIterator")}}
- {{jsxref("Iterator")}}
