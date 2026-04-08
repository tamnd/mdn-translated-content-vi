---
title: SuppressedError
slug: Web/JavaScript/Reference/Global_Objects/SuppressedError
page-type: javascript-class
browser-compat: javascript.builtins.SuppressedError
sidebar: jsref
---

Đối tượng **`SuppressedError`** đại diện cho một lỗi được tạo ra trong quá trình xử lý một lỗi khác. Nó được tạo ra trong quá trình giải phóng tài nguyên khi sử dụng {{jsxref("Statements/using", "using")}} hoặc {{jsxref("Statements/await_using", "await using")}}.

So với {{jsxref("AggregateError")}}, `SuppressedError` đại diện cho một lỗi xảy ra trong quá trình xử lý một lỗi khác, trong khi `AggregateError` đại diện cho một danh sách các lỗi không liên quan. Tuy nhiên, một `SuppressedError` có thể chứa một chuỗi các lỗi bị che khuất (`e.suppressed.suppressed.suppressed...`). Nó cũng có ngữ nghĩa khác với {{jsxref("Error/cause", "cause")}} vì lỗi không phải do một lỗi khác _gây ra_, mà _xảy ra trong khi_ xử lý một lỗi khác.

`SuppressedError` là một subclass của {{jsxref("Error")}}.

## Constructor

- {{jsxref("SuppressedError/SuppressedError", "SuppressedError()")}}
  - : Tạo một đối tượng `SuppressedError` mới.

## Thuộc tính instance

_Cũng kế thừa các thuộc tính instance từ lớp cha {{jsxref("Error")}}_.

Các thuộc tính này được định nghĩa trên `SuppressedError.prototype` và được chia sẻ bởi tất cả các instance của `SuppressedError`.

- {{jsxref("Object/constructor", "SuppressedError.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Với các instance của `SuppressedError`, giá trị ban đầu là constructor {{jsxref("SuppressedError/SuppressedError", "SuppressedError")}}.
- {{jsxref("Error/name", "SuppressedError.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Với `SuppressedError.prototype.name`, giá trị ban đầu là `"SuppressedError"`.

> [!NOTE]
> `SuppressedError` không bao giờ có thuộc tính {{jsxref("Error/cause", "cause")}}, vì ngữ nghĩa của `cause` trùng lặp với `suppressed`.

Các thuộc tính sau là thuộc tính riêng của mỗi instance `SuppressedError`.

- {{jsxref("SuppressedError/error", "error")}}
  - : Tham chiếu đến lỗi gây ra việc bị che khuất.
- {{jsxref("SuppressedError/suppressed", "suppressed")}}
  - : Tham chiếu đến lỗi bị che khuất bởi `error`.

## Phương thức instance

_Kế thừa các phương thức instance từ lớp cha {{jsxref("Error")}}_.

## Ví dụ

### Bắt một SuppressedError

Một `SuppressedError` được ném khi có lỗi xảy ra trong quá trình [giải phóng tài nguyên](/en-US/docs/Web/JavaScript/Guide/Resource_management). Việc ném một lỗi gây ra quá trình dọn dẹp scope, và mỗi disposer trong quá trình dọn dẹp có thể ném lỗi riêng của nó. Tất cả các lỗi này được thu thập thành một chuỗi các instance `SuppressedError`, với lỗi ban đầu là thuộc tính `suppressed` và lỗi mới do disposer tiếp theo ném là thuộc tính `error`.

```js
try {
  using resource1 = {
    [Symbol.dispose]() {
      throw new Error("Error while disposing resource1");
    },
  };
  using resource2 = {
    [Symbol.dispose]() {
      throw new Error("Error while disposing resource2");
    },
  };
  throw new Error("Original error");
} catch (e) {
  console.log(e instanceof SuppressedError); // true
  console.log(e.message); // "An error was suppressed during disposal"
  console.log(e.name); // "SuppressedError"
  console.log(e.error); // Error: Error while disposing resource1
  console.log(e.suppressed); // SuppressedError: An error was suppressed during disposal
  console.log(e.suppressed.error); // Error: Error while disposing resource2
  console.log(e.suppressed.suppressed); // Error: Original error
}
```

Chuỗi trông như thế này:

```plain
       SuppressedError --suppressed--> SuppressedError --suppressed--> Original error
              |                               |
            error                           error
              v                               v
Error while disposing resource1   Error while disposing resource2
    (Disposal happens later)        (Disposal happens earlier)
```

### Tạo một SuppressedError

```js
try {
  throw new SuppressedError(
    new Error("New error"),
    new Error("Original error"),
    "Hello",
  );
} catch (e) {
  console.log(e instanceof SuppressedError); // true
  console.log(e.message); // "Hello"
  console.log(e.name); // "SuppressedError"
  console.log(e.error); // Error: "New error"
  console.log(e.suppressed); // Error: "Original error"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `SuppressedError` trong `core-js`](https://github.com/zloirock/core-js#explicit-resource-management)
- {{jsxref("Error")}}
- {{jsxref("Statements/using", "using")}}
- {{jsxref("Statements/await_using", "await using")}}
- {{jsxref("DisposableStack")}}
- {{jsxref("AsyncDisposableStack")}}
