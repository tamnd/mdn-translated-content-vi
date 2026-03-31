---
title: try...catch
slug: Web/JavaScript/Reference/Statements/try...catch
page-type: javascript-statement
browser-compat: javascript.statements.try_catch
sidebar: jssidebar
---

Câu lệnh **`try...catch`** bao gồm một khối `try` và một khối `catch`, một khối `finally`, hoặc cả hai. Code trong khối `try` được thực thi đầu tiên, và nếu nó ném ra một ngoại lệ, code trong khối `catch` sẽ được thực thi. Code trong khối `finally` sẽ luôn được thực thi trước khi luồng điều khiển thoát khỏi toàn bộ cấu trúc.

{{InteractiveExample("JavaScript Demo: try...catch statement")}}

```js interactive-example
try {
  nonExistentFunction();
} catch (error) {
  console.error(error);
  // Expected output: ReferenceError: nonExistentFunction is not defined
  // (Note: the exact output may be browser-dependent)
}
```

## Cú pháp

```js-nolint
try {
  tryStatements
} catch (exceptionVar) {
  catchStatements
} finally {
  finallyStatements
}
```

- `tryStatements`
  - : Các câu lệnh cần được thực thi.
- `catchStatements`
  - : Câu lệnh được thực thi nếu một ngoại lệ được ném ra trong khối `try`.
- `exceptionVar` {{optional_inline}}
  - : Một [định danh hoặc mẫu](#catch_binding) tùy chọn để giữ ngoại lệ bị bắt cho khối `catch` liên quan. Nếu khối `catch` không sử dụng giá trị ngoại lệ, bạn có thể bỏ qua `exceptionVar` và các dấu ngoặc đơn bao quanh nó.
- `finallyStatements`
  - : Các câu lệnh được thực thi trước khi luồng điều khiển thoát khỏi cấu trúc `try...catch...finally`. Các câu lệnh này thực thi bất kể ngoại lệ có được ném ra hay bắt hay không.

## Mô tả

Câu lệnh `try` luôn bắt đầu với một khối `try`. Sau đó, phải có khối `catch` hoặc khối `finally`. Cũng có thể có cả khối `catch` và `finally`. Điều này cho chúng ta ba dạng cho câu lệnh `try`:

- `try...catch`
- `try...finally`
- `try...catch...finally`

Không giống như các cấu trúc khác như [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else) hoặc [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for), các khối `try`, `catch`, và `finally` phải là _các khối_, thay vì các câu lệnh đơn.

```js-nolint example-bad
try doSomething(); // SyntaxError
catch (e) console.log(e);
```

Một khối `catch` chứa các câu lệnh chỉ định phải làm gì nếu một ngoại lệ được ném ra trong khối `try`. Nếu bất kỳ câu lệnh nào trong khối `try` (hoặc trong một hàm được gọi từ trong khối `try`) ném ra một ngoại lệ, quyền kiểm soát ngay lập tức được chuyển sang khối `catch`. Nếu không có ngoại lệ nào được ném ra trong khối `try`, khối `catch` sẽ bị bỏ qua.

Khối `finally` sẽ luôn thực thi trước khi luồng điều khiển thoát khỏi cấu trúc `try...catch...finally`. Nó luôn thực thi, bất kể ngoại lệ có được ném ra hay bắt hay không.

Bạn có thể lồng một hoặc nhiều câu lệnh `try`. Nếu câu lệnh `try` bên trong không có khối `catch`, khối `catch` của câu lệnh `try` bên ngoài sẽ được sử dụng thay thế.

Bạn cũng có thể sử dụng câu lệnh `try` để xử lý các ngoại lệ JavaScript. Xem [Hướng dẫn JavaScript](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling#exception_handling_statements) để biết thêm thông tin về các ngoại lệ JavaScript.

### Catch binding

Khi một ngoại lệ được ném ra trong khối `try`, `exceptionVar` (tức là `e` trong `catch (e)`) giữ giá trị ngoại lệ. Bạn có thể sử dụng {{Glossary("binding")}} này để lấy thông tin về ngoại lệ đã được ném ra. {{Glossary("binding")}} này chỉ có sẵn trong {{Glossary("Scope", "phạm vi")}} của khối `catch`.

Nó không cần phải là một định danh đơn. Bạn có thể sử dụng [mẫu destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) để gán nhiều định danh cùng một lúc.

```js
try {
  throw new TypeError("oops");
} catch ({ name, message }) {
  console.log(name); // "TypeError"
  console.log(message); // "oops"
}
```

Các binding được tạo bởi mệnh đề `catch` tồn tại trong cùng phạm vi với khối `catch`, vì vậy bất kỳ biến nào được khai báo trong khối `catch` không thể có cùng tên với các binding được tạo bởi mệnh đề `catch`. (Có [một ngoại lệ cho quy tắc này](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#statements), nhưng đó là cú pháp không còn được dùng.)

```js-nolint example-bad
try {
  throw new TypeError("oops");
} catch ({ name, message }) {
  var name; // SyntaxError: Identifier 'name' has already been declared
  let message; // SyntaxError: Identifier 'message' has already been declared
}
```

Exception binding có thể ghi được. Ví dụ, bạn có thể muốn chuẩn hóa giá trị ngoại lệ để đảm bảo nó là đối tượng {{jsxref("Error")}}.

```js
try {
  throw "Oops; this is not an Error object";
} catch (e) {
  if (!(e instanceof Error)) {
    e = new Error(e);
  }
  console.error(e.message);
}
```

Nếu bạn không cần giá trị ngoại lệ, bạn có thể bỏ qua nó cùng với dấu ngoặc đơn bao quanh.

```js
function isValidJSON(text) {
  try {
    JSON.parse(text);
    return true;
  } catch {
    return false;
  }
}
```

### Khối finally

Khối `finally` chứa các câu lệnh để thực thi sau khi khối `try` và khối `catch` thực thi, nhưng trước các câu lệnh tiếp theo sau khối `try...catch...finally`. Luồng điều khiển sẽ luôn vào khối `finally`, và có thể tiến hành theo một trong những cách sau:

- Ngay sau khi luồng điều khiển thoát khỏi khối `try` trong cấu trúc `try...finally` (hoặc sau câu lệnh cuối cùng hoặc câu lệnh `throw`, `return`, `break`, hoặc `continue`);
- Ngay sau khi luồng điều khiển thoát khỏi khối `catch` trong cấu trúc `try...catch...finally`;
- Ngay sau khi luồng điều khiển thoát khỏi khối `try` trong cấu trúc `try...catch...finally`, trừ khi nó thoát qua câu lệnh `throw` (trong trường hợp đó, luồng điều khiển vào khối `catch` trước).

Nếu khối `finally` được vào sau một câu lệnh điều khiển luồng (`return`, `throw`, `break`, `continue`) trong khối `try` hoặc `catch`, tác dụng của câu lệnh này sẽ bị hoãn lại cho đến sau câu lệnh cuối cùng được thực thi trong khối `finally`. Ví dụ, nếu một ngoại lệ được ném ra từ khối `try`, ngay cả khi không có khối `catch` để xử lý ngoại lệ, khối `finally` vẫn thực thi, và ngoại lệ được ném ra ngay sau khi khối `finally` hoàn thành việc thực thi.

Tuy nhiên, có một ngoại lệ cho quy tắc này: nếu câu lệnh cuối cùng được thực thi trong khối `finally` là một câu lệnh điều khiển luồng, câu lệnh đó sẽ ghi đè tác dụng của câu lệnh trước (không có sự hoãn lại); xem [trả về từ khối `finally`](#returning_from_a_finally_block) để biết ví dụ. Nhìn chung, việc sử dụng các câu lệnh điều khiển luồng (`return`, `throw`, `break`, `continue`) trong khối `finally` là không nên vì chúng có thể ghi đè tác dụng của các câu lệnh điều khiển luồng đã được thực thi trước đó, điều này hiếm khi có chủ đích. Hầu hết thời gian, khối `finally` nên được dành riêng cho code dọn dẹp không sửa đổi logic chính.

## Ví dụ

### Khối catch vô điều kiện

Khi một khối `catch` được sử dụng, khối `catch` được thực thi khi bất kỳ ngoại lệ nào được ném ra từ trong khối `try`. Ví dụ, khi ngoại lệ xảy ra trong code sau, quyền kiểm soát được chuyển đến khối `catch`.

```js
try {
  throw new Error("My exception"); // generates an exception
} catch (e) {
  // statements to handle any exceptions
  logMyErrors(e); // pass exception object to error handler
}
```

Khối `catch` chỉ định một định danh (`e` trong ví dụ trên) giữ giá trị ngoại lệ; giá trị này chỉ có sẵn trong {{Glossary("Scope", "phạm vi")}} của khối `catch`.

### Các khối catch có điều kiện

Bạn có thể tạo "Các khối `catch` có điều kiện" bằng cách kết hợp các khối `try...catch` với các cấu trúc `if...else if...else`, như sau:

```js
try {
  myRoutine(); // may throw three types of exceptions
} catch (e) {
  if (e instanceof TypeError) {
    // statements to handle TypeError exceptions
  } else if (e instanceof RangeError) {
    // statements to handle RangeError exceptions
  } else if (e instanceof EvalError) {
    // statements to handle EvalError exceptions
  } else {
    // statements to handle any unspecified exceptions
    logMyErrors(e); // pass exception object to error handler
  }
}
```

Một trường hợp sử dụng phổ biến là chỉ bắt (và im lặng) một tập hợp nhỏ các lỗi dự kiến, và sau đó ném lại lỗi trong các trường hợp khác:

```js
try {
  myRoutine();
} catch (e) {
  if (e instanceof RangeError) {
    // statements to handle this very common expected error
  } else {
    throw e; // re-throw the error unchanged
  }
}
```

Điều này có thể bắt chước cú pháp từ các ngôn ngữ khác, như Java:

```java
try {
  myRoutine();
} catch (RangeError e) {
  // statements to handle this very common expected error
}
// Other errors are implicitly re-thrown
```

### Các khối try lồng nhau

Đầu tiên, hãy xem điều gì xảy ra với đoạn code này:

```js
try {
  try {
    throw new Error("oops");
  } finally {
    console.log("finally");
  }
} catch (ex) {
  console.error("outer", ex.message);
}

// Logs:
// "finally"
// "outer" "oops"
```

Bây giờ, nếu chúng ta đã bắt ngoại lệ trong khối `try` bên trong bằng cách thêm một khối `catch`:

```js
try {
  try {
    throw new Error("oops");
  } catch (ex) {
    console.error("inner", ex.message);
  } finally {
    console.log("finally");
  }
} catch (ex) {
  console.error("outer", ex.message);
}

// Logs:
// "inner" "oops"
// "finally"
```

Và bây giờ, hãy ném lại lỗi.

```js
try {
  try {
    throw new Error("oops");
  } catch (ex) {
    console.error("inner", ex.message);
    throw ex;
  } finally {
    console.log("finally");
  }
} catch (ex) {
  console.error("outer", ex.message);
}

// Logs:
// "inner" "oops"
// "finally"
// "outer" "oops"
```

Bất kỳ ngoại lệ nào cũng sẽ chỉ bị bắt một lần bởi khối `catch` bao quanh gần nhất trừ khi nó được ném lại. Tất nhiên, bất kỳ ngoại lệ mới nào được tạo ra trong khối "inner" (vì code trong khối `catch` có thể làm gì đó ném ra), sẽ bị bắt bởi khối "outer".

### Dọn dẹp tài nguyên sử dụng finally

Ví dụ sau cho thấy một trường hợp sử dụng cho khối `finally`. Code mở một tệp và sau đó thực thi các câu lệnh sử dụng tệp; khối `finally` đảm bảo tệp luôn được đóng sau khi sử dụng ngay cả khi một ngoại lệ được ném ra.

```js
openMyFile();
try {
  // tie up a resource
  writeMyFile(theData);
} finally {
  closeMyFile(); // always close the resource
  // any uncaught exception is deferred here
}
```

Theo cách tương tự, tác dụng của bất kỳ câu lệnh `return` nào trong khối `try` bị hoãn lại ở cuối khối `finally`, mặc dù biểu thức giá trị trả về được đánh giá trước khi vào khối `finally`.

```js
function safeWriteMyFile() {
  openMyFile();
  try {
    return writeMyFile(theData); // function call is evaluated
  } finally {
    closeMyFile(); // always close the resource
    // return is deferred here
  }
}
```

### Trả về từ khối finally

Ví dụ sau minh họa cách các câu lệnh điều khiển luồng trong khối `finally` hoạt động. Khi luồng điều khiển thoát khỏi khối `try` qua câu lệnh `return` đầu tiên, biểu thức giá trị trả về (`order.sort()`) được đánh giá trước khi vào khối `finally`, và hàm được lên kế hoạch trả về giá trị đó sau khi khối `finally` hoàn thành thực thi. Tuy nhiên, câu lệnh `return` trong khối `finally` ghi đè tác dụng của câu lệnh `return` trước, bao gồm cả giá trị trả về của nó.

```js
function doIt() {
  const order = ["z"];
  try {
    order.push("try");
    return order.sort(); // "z" is now after "try"
  } finally {
    order.push("finally");
    return order;
  }
}
doIt();
// returns ["try", "z", "finally"], not ["finally", "try", "z"] or ["try", "z"]
```

Logic tương tự áp dụng cho các câu lệnh điều khiển luồng khác. Ở đây, hàm được lên kế hoạch đầu tiên để ném giá trị `"catch"`, nhưng thay vào đó trả về giá trị `"finally"`.

```js
function doIt() {
  try {
    throw "try"; // makes control flow enter the `catch` block
  } catch {
    throw "catch"; // makes control flow enter the `finally` block
  } finally {
    return "finally"; // returns "finally" instead of throwing "catch"
  }
}
doIt(); // returns "finally"
```

Một lần nữa, các câu lệnh điều khiển luồng không được khuyến khích trong khối `finally` vì tác dụng này có lẽ không có chủ đích.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Error")}}
- {{jsxref("Statements/throw", "throw")}}
