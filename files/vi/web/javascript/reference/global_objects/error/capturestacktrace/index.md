---
title: Error.captureStackTrace()
short-title: captureStackTrace()
slug: Web/JavaScript/Reference/Global_Objects/Error/captureStackTrace
page-type: javascript-static-method
browser-compat: javascript.builtins.Error.captureStackTrace
sidebar: jsref
---

Phương thức tĩnh **`Error.captureStackTrace()`** cài đặt thông tin stack trace lên một đối tượng được cung cấp dưới dạng thuộc tính [`stack`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/stack).

## Cú pháp

```js-nolint
Error.captureStackTrace(object)
Error.captureStackTrace(object, constructor)
```

### Tham số

- `object`
  - : Đối tượng cần thêm thuộc tính `stack`.
- `constructor` {{optional_inline}}
  - : Một hàm, thường là constructor nơi `object` được tạo ra. Khi thu thập stack trace, tất cả các frame phía trên lần gọi cao nhất đến hàm này, bao gồm cả lần gọi đó, sẽ bị loại khỏi stack trace.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

`object` được sửa đổi tại chỗ với một thuộc tính own bổ sung có tên `stack` được định nghĩa, có giá trị chuỗi theo cùng định dạng như {{jsxref("Error.prototype.stack")}}. Thuộc tính này là non-enumerable và configurable. Trong V8, nó là một cặp getter-setter. Trong SpiderMonkey và JavaScriptCore, nó là một data property có thể ghi.

## Ví dụ

### Sử dụng Error.captureStackTrace()

Hàm tiện ích `getStack()` trả về stack trace hiện tại tại điểm nó được gọi, loại bỏ chính nó khỏi stack. Điều này phục vụ cùng mục đích gỡ lỗi như {{domxref("console.trace()")}}, nhưng cho phép bạn xuất chuỗi ở nơi khác. Lưu ý rằng nó không tạo một instance `Error` cho mục đích này, mà cài đặt `stack` trên một đối tượng thuần túy, điều này sẽ hiệu quả hơn cho mục đích của chúng ta. Thông thường, bạn sẽ gọi `Error.captureStackTrace` trên các đối tượng dự định được ném ra như các lỗi, như được hiển thị trong ví dụ tiếp theo.

```js
function getStack() {
  const obj = {};
  if ("captureStackTrace" in Error) {
    // Avoid getStack itself in the stack trace
    Error.captureStackTrace(obj, getStack);
  }
  return obj.stack;
}

function foo() {
  console.log(getStack());
}

foo();
// Error
//     at foo (<anonymous>:8:15)
//     at <anonymous>:11:1
```

### Cài đặt stack trace trên đối tượng lỗi tùy chỉnh

Trường hợp sử dụng chính của `Error.captureStackTrace()` là cài đặt stack trace trên một đối tượng lỗi tùy chỉnh. Thông thường, bạn định nghĩa [các lỗi tùy chỉnh](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error#custom_error_types) bằng cách mở rộng lớp `Error`, điều này tự động cung cấp thuộc tính `stack` thông qua kế thừa. Tuy nhiên, vấn đề với stack trace mặc định là nó bao gồm lần gọi constructor, điều này để lộ chi tiết triển khai. Bạn có thể tránh điều này bằng cách sử dụng `Error.captureStackTrace()`, cho phép stack trace được cài đặt ngay cả đối với các lỗi tùy chỉnh không kế thừa từ `Error`.

```js
class MyError extends Error {
  constructor(message, options) {
    super(message, options);
    if ("captureStackTrace" in Error) {
      // Avoid MyError itself in the stack trace
      Error.captureStackTrace(this, MyError);
    }
  }
}

const myError = new MyError("Something went wrong");
console.log(myError.stack);
// Error: Something went wrong
//     at <anonymous>:8:17
```

Lưu ý rằng ngay cả khi bạn không gọi `Error.captureStackTrace()` ở đây, một số engine vẫn đủ thông minh để tránh `MyError` trong stack trace nếu constructor kế thừa từ `Error`. Gọi `Error.captureStackTrace()` quan trọng hơn đối với các lỗi tùy chỉnh mà vì lý do nào đó không kế thừa từ `Error`.

```js
class MyError {
  constructor(message) {
    this.message = message;
    if ("captureStackTrace" in Error) {
      // Avoid MyError itself in the stack trace
      Error.captureStackTrace(this, MyError);
    }
  }
}

const myError = new MyError("Something went wrong");
console.log(myError.stack);
// Error: Something went wrong
//     at <anonymous>:8:17
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error.prototype.stack")}}
- {{jsxref("Error.stackTraceLimit")}}
- [Stack trace API](https://v8.dev/docs/stack-trace-api) trong tài liệu V8
