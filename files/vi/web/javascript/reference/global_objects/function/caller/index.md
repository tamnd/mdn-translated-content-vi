---
title: Function.prototype.caller
short-title: caller
slug: Web/JavaScript/Reference/Global_Objects/Function/caller
page-type: javascript-instance-accessor-property
status:
  - deprecated
  - non-standard
browser-compat: javascript.builtins.Function.caller
sidebar: jsref
---

{{Non-standard_Header}}{{Deprecated_Header}}

> [!NOTE]
> Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), truy cập `caller` của một hàm sẽ ném ra lỗi — API này bị xóa mà không có sự thay thế. Điều này nhằm ngăn chặn mã có thể "đi theo call stack", vừa gây ra rủi ro bảo mật vừa hạn chế nghiêm trọng các khả năng tối ưu hóa như inlining và tail-call optimization. Để biết thêm giải thích, bạn có thể đọc [lý do deprecated của `arguments.callee`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments/callee#description).

Accessor property **`caller`** của các instance {{jsxref("Function")}} trả về hàm đã gọi hàm này. Đối với các hàm [strict](/en-US/docs/Web/JavaScript/Reference/Strict_mode), arrow, async, và generator, việc truy cập thuộc tính `caller` sẽ ném ra {{jsxref("TypeError")}}.

## Mô tả

Nếu hàm `f` được gọi từ code cấp cao nhất (top-level), giá trị của `f.caller` là {{jsxref("Operators/null", "null")}}; ngược lại đó là hàm đã gọi `f`. Nếu hàm đã gọi `f` là một hàm strict mode, giá trị của `f.caller` cũng là `null`.

Lưu ý rằng hành vi duy nhất được đặc tả bởi ECMAScript specification là `Function.prototype` có một accessor `caller` ban đầu luôn ném ra {{jsxref("TypeError")}} cho bất kỳ yêu cầu `get` hay `set` nào (được gọi là "poison pill accessor"), và các implementation không được phép thay đổi ngữ nghĩa này cho bất kỳ hàm nào ngoài các plain function không phải strict mode, trong trường hợp đó giá trị không được là một hàm strict mode. Hành vi thực tế của thuộc tính `caller`, nếu nó khác với việc ném lỗi, được định nghĩa bởi từng implementation. Ví dụ, Chrome định nghĩa nó là own data property, trong khi Firefox và Safari mở rộng accessor poison-pill `Function.prototype.caller` ban đầu để xử lý đặc biệt các giá trị `this` là hàm không phải strict mode.

```js
(function f() {
  if (Object.hasOwn(f, "caller")) {
    console.log(
      "caller is an own property with descriptor",
      Object.getOwnPropertyDescriptor(f, "caller"),
    );
  } else {
    console.log(
      "f doesn't have an own property named caller. Trying to get f.[[Prototype]].caller",
    );
    console.log(
      Object.getOwnPropertyDescriptor(
        Object.getPrototypeOf(f),
        "caller",
      ).get.call(f),
    );
  }
})();

// In Chrome:
// caller is an own property with descriptor {value: null, writable: false, enumerable: false, configurable: false}

// In Firefox:
// f doesn't have an own property named caller. Trying to get f.[[Prototype]].caller
// null
```

Thuộc tính này thay thế thuộc tính `arguments.caller` đã lỗi thời của đối tượng {{jsxref("Functions/arguments", "arguments")}}.

Thuộc tính đặc biệt `__caller__`, vốn trả về activation object của caller qua đó cho phép tái tạo call stack, đã bị xóa vì lý do bảo mật.

## Ví dụ

### Kiểm tra giá trị của thuộc tính caller của một hàm

Đoạn code sau kiểm tra giá trị của thuộc tính `caller` của một hàm.

```js
function myFunc() {
  if (myFunc.caller === null) {
    return "The function was called from the top!";
  }
  return `This function's caller was ${myFunc.caller}`;
}
```

### Tái tạo call stack và đệ quy

Lưu ý rằng trong trường hợp đệ quy, bạn không thể tái tạo call stack bằng thuộc tính này. Xem xét:

```js
function f(n) {
  g(n - 1);
}
function g(n) {
  if (n > 0) {
    f(n);
  } else {
    stop();
  }
}
f(2);
```

Tại thời điểm `stop()` được gọi, call stack sẽ là:

```plain
f(2) -> g(1) -> f(1) -> g(0) -> stop()
```

Điều sau đây là đúng:

```js
stop.caller === g && f.caller === g && g.caller === f;
```

vì vậy nếu bạn cố lấy stack trace trong hàm `stop()` như thế này:

```js
let f = stop;
let stack = "Stack trace:";
while (f) {
  stack += `\n${f.name}`;
  f = f.caller;
}
```

vòng lặp sẽ không bao giờ dừng.

### Caller trong strict mode

Nếu caller là một hàm strict mode, giá trị của `caller` là `null`.

```js
function callerFunc() {
  calleeFunc();
}

function strictCallerFunc() {
  "use strict";
  calleeFunc();
}

function calleeFunc() {
  console.log(calleeFunc.caller);
}

(function () {
  callerFunc();
})();
// Logs [Function: callerFunc]

(function () {
  strictCallerFunc();
})();
// Logs null
```

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Function.prototype.name")}}
- {{jsxref("Functions/arguments", "arguments")}}
