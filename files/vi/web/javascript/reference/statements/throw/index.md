---
title: throw
slug: Web/JavaScript/Reference/Statements/throw
page-type: javascript-statement
browser-compat: javascript.statements.throw
sidebar: jssidebar
---

Câu lệnh **`throw`** ném ra một ngoại lệ do người dùng định nghĩa. Việc thực thi hàm hiện tại sẽ dừng lại (các câu lệnh sau `throw` sẽ không được thực thi), và quyền kiểm soát sẽ được truyền đến khối [`catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) đầu tiên trong call stack. Nếu không có khối `catch` nào tồn tại trong các hàm gọi, chương trình sẽ kết thúc.

{{InteractiveExample("JavaScript Demo: throw statement")}}

```js interactive-example
function getRectArea(width, height) {
  if (isNaN(width) || isNaN(height)) {
    throw new Error("Parameter is not a number!");
  }
}

try {
  getRectArea(3, "A");
} catch (e) {
  console.error(e);
  // Expected output: Error: Parameter is not a number!
}
```

## Cú pháp

```js-nolint
throw expression;
```

- `expression`
  - : Biểu thức cần ném ra.

## Mô tả

Câu lệnh `throw` hợp lệ trong tất cả các ngữ cảnh mà câu lệnh có thể được sử dụng. Việc thực thi nó tạo ra một ngoại lệ lan truyền qua call stack. Để biết thêm thông tin về việc bong bóng lỗi và xử lý, hãy xem [Điều khiển luồng và xử lý lỗi](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling).

Từ khóa `throw` có thể được theo sau bởi bất kỳ loại biểu thức nào, ví dụ:

```js
throw error; // Throws a previously defined value (e.g. within a catch block)
throw new Error("Required"); // Throws a new Error object
```

Trong thực tế, ngoại lệ bạn ném ra _luôn_ phải là đối tượng {{jsxref("Error")}} hoặc một thể hiện của một lớp con `Error`, chẳng hạn như {{jsxref("RangeError")}}. Điều này là vì code bắt lỗi có thể mong đợi một số thuộc tính nhất định, chẳng hạn như {{jsxref("Error/message", "message")}}, có mặt trên giá trị bị bắt. Ví dụ, các Web API thường ném ra các thể hiện {{domxref("DOMException")}}, kế thừa từ `Error.prototype`.

### Chèn dấu chấm phẩy tự động

Cú pháp cấm các ký tự kết thúc dòng giữa từ khóa `throw` và biểu thức cần được ném ra.

```js-nolint example-bad
throw
new Error();
```

Đoạn code trên được biến đổi bởi [chèn dấu chấm phẩy tự động (ASI)](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#automatic_semicolon_insertion) thành:

```js-nolint
throw;
new Error();
```

Đây là code không hợp lệ, vì không giống như {{jsxref("Statements/return", "return")}}, `throw` phải được theo sau bởi một biểu thức.

Để tránh vấn đề này (để ngăn ASI), bạn có thể sử dụng dấu ngoặc đơn:

```js-nolint
throw (
  new Error()
);
```

## Ví dụ

### Ném ra lỗi do người dùng định nghĩa

Ví dụ này định nghĩa một hàm ném ra {{jsxref("TypeError")}} nếu đầu vào không phải là kiểu dự kiến.

```js
function isNumeric(x) {
  return ["number", "bigint"].includes(typeof x);
}

function sum(...values) {
  if (!values.every(isNumeric)) {
    throw new TypeError("Can only add numbers");
  }
  return values.reduce((a, b) => a + b);
}

console.log(sum(1, 2, 3)); // 6
try {
  sum("1", "2");
} catch (e) {
  console.error(e); // TypeError: Can only add numbers
}
```

### Ném ra một đối tượng hiện có

Ví dụ này gọi một hàm async dựa trên callback, và ném ra lỗi nếu callback nhận được lỗi.

```js
readFile("foo.txt", (err, data) => {
  if (err) {
    throw err;
  }
  console.log(data);
});
```

Lỗi được ném ra theo cách này không thể bị bắt bởi người gọi và sẽ làm cho chương trình bị crash trừ khi (a) chính hàm `readFile` bắt lỗi, hoặc (b) chương trình đang chạy trong một ngữ cảnh bắt các lỗi cấp cao nhất. Bạn có thể xử lý lỗi một cách tự nhiên hơn bằng cách sử dụng hàm tạo {{jsxref("Promise/Promise", "Promise()")}}.

```js
function readFilePromise(path) {
  return new Promise((resolve, reject) => {
    readFile(path, (err, data) => {
      if (err) {
        reject(err);
      }
      resolve(data);
    });
  });
}

try {
  const data = await readFilePromise("foo.txt");
  console.log(data);
} catch (err) {
  console.error(err);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/try...catch", "try...catch")}}
- {{jsxref("Error")}}
