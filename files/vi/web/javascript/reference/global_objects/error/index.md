---
title: Error
slug: Web/JavaScript/Reference/Global_Objects/Error
page-type: javascript-class
browser-compat: javascript.builtins.Error
sidebar: jsref
---

Các đối tượng **`Error`** được ném ra khi xảy ra lỗi runtime. Đối tượng `Error` cũng có thể được dùng làm đối tượng cơ sở cho các ngoại lệ do người dùng định nghĩa. Xem bên dưới để biết các loại lỗi dựng sẵn tiêu chuẩn.

## Mô tả

Các lỗi runtime dẫn đến việc tạo và ném ra các đối tượng `Error` mới.

`Error` là một {{Glossary("serializable object")}}, vì vậy nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Worker](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker/postMessage()", "postMessage()")}}.

### Các loại Error

Bên cạnh constructor `Error` chung, có các constructor lỗi cốt lõi khác trong JavaScript. Để biết về các ngoại lệ phía client, xem [Các câu lệnh xử lý ngoại lệ](/en-US/docs/Web/JavaScript/Guide/Control_flow_and_error_handling#exception_handling_statements).

- {{jsxref("EvalError")}}
  - : Tạo một instance đại diện cho lỗi xảy ra liên quan đến hàm toàn cục {{jsxref("Global_Objects/eval", "eval()")}}.
- {{jsxref("RangeError")}}
  - : Tạo một instance đại diện cho lỗi xảy ra khi một biến hoặc tham số số nằm ngoài phạm vi hợp lệ của nó.
- {{jsxref("ReferenceError")}}
  - : Tạo một instance đại diện cho lỗi xảy ra khi hủy tham chiếu một tham chiếu không hợp lệ.
- {{jsxref("SyntaxError")}}
  - : Tạo một instance đại diện cho lỗi cú pháp.
- {{jsxref("TypeError")}}
  - : Tạo một instance đại diện cho lỗi xảy ra khi một biến hoặc tham số không thuộc kiểu hợp lệ.
- {{jsxref("URIError")}}
  - : Tạo một instance đại diện cho lỗi xảy ra khi {{jsxref("encodeURI()")}} hoặc {{jsxref("decodeURI()")}} được truyền tham số không hợp lệ.
- {{jsxref("AggregateError")}}
  - : Tạo một instance đại diện cho nhiều lỗi được gói trong một lỗi duy nhất khi nhiều lỗi cần được báo cáo bởi một thao tác, ví dụ bởi {{jsxref("Promise.any()")}}.
- {{jsxref("InternalError")}} {{non-standard_inline}}
  - : Tạo một instance đại diện cho lỗi xảy ra khi một lỗi nội bộ trong JavaScript engine được ném ra. Ví dụ: "too much recursion".

## Constructor

- {{jsxref("Error/Error", "Error()")}}
  - : Tạo một đối tượng `Error` mới.

## Thuộc tính tĩnh

- {{jsxref("Error.stackTraceLimit")}} {{non-standard_inline}}
  - : Thuộc tính số không chuẩn giới hạn số lượng stack frame được bao gồm trong stack trace của lỗi.

## Phương thức tĩnh

- {{jsxref("Error.captureStackTrace()")}}
  - : Hàm không chuẩn tạo thuộc tính {{jsxref("Error/stack", "stack")}} trên đối tượng được cung cấp.
- {{jsxref("Error.isError()")}}
  - : Trả về `true` nếu đối số là một lỗi, hoặc `false` trong trường hợp ngược lại.
- `Error.prepareStackTrace()` {{non-standard_inline}} {{optional_inline}}
  - : Hàm không chuẩn mà nếu được cung cấp bởi code người dùng, sẽ được JavaScript engine gọi cho các ngoại lệ được ném ra, cho phép người dùng cung cấp định dạng tùy chỉnh cho stack trace. Xem tài liệu [V8 Stack Trace API](https://v8.dev/docs/stack-trace-api#customizing-stack-traces).

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Error.prototype` và được chia sẻ bởi tất cả các instance `Error`.

- {{jsxref("Object/constructor", "Error.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Error`, giá trị khởi tạo là constructor {{jsxref("Error/Error", "Error")}}.
- {{jsxref("Error.prototype.name")}}
  - : Đại diện cho tên của loại lỗi. Đối với `Error.prototype.name`, giá trị khởi tạo là `"Error"`. Các lớp con như {{jsxref("TypeError")}} và {{jsxref("SyntaxError")}} cung cấp các thuộc tính `name` riêng của chúng.
- {{jsxref("Error.prototype.stack")}} {{non-standard_inline}}
  - : Thuộc tính không chuẩn cho một stack trace.

Các thuộc tính này là thuộc tính riêng của mỗi instance `Error`.

- {{jsxref("Error/cause", "cause")}}
  - : Nguyên nhân lỗi chỉ ra lý do tại sao lỗi hiện tại được ném ra — thường là một lỗi khác đã bắt được. Đối với các đối tượng `Error` do người dùng tạo, đây là giá trị được cung cấp làm thuộc tính `cause` của đối số thứ hai của constructor.
- {{jsxref("Error/columnNumber", "columnNumber")}} {{non-standard_inline}}
  - : Thuộc tính Mozilla không chuẩn cho số cột trong dòng đã gây ra lỗi này.
- {{jsxref("Error/fileName", "fileName")}} {{non-standard_inline}}
  - : Thuộc tính Mozilla không chuẩn cho đường dẫn đến tệp đã gây ra lỗi này.
- {{jsxref("Error/lineNumber", "lineNumber")}} {{non-standard_inline}}
  - : Thuộc tính Mozilla không chuẩn cho số dòng trong tệp đã gây ra lỗi này.
- {{jsxref("Error/message", "message")}}
  - : Thông báo lỗi. Đối với các đối tượng `Error` do người dùng tạo, đây là chuỗi được cung cấp làm đối số đầu tiên của constructor.

## Phương thức instance

- {{jsxref("Error.prototype.toString()")}}
  - : Trả về chuỗi biểu diễn đối tượng được chỉ định. Ghi đè phương thức {{jsxref("Object.prototype.toString()")}}.

## Ví dụ

### Ném một lỗi chung

Thông thường bạn tạo đối tượng `Error` với ý định ném nó bằng từ khóa {{jsxref("Statements/throw", "throw")}}.
Bạn có thể xử lý lỗi bằng cấu trúc {{jsxref("Statements/try...catch", "try...catch")}}:

```js
try {
  throw new Error("Whoops!");
} catch (e) {
  console.error(`${e.name}: ${e.message}`);
}
```

### Xử lý một loại lỗi cụ thể

Bạn có thể chọn chỉ xử lý các loại lỗi cụ thể bằng cách kiểm tra loại lỗi với từ khóa {{jsxref("Operators/instanceof", "instanceof")}}:

```js
try {
  foo.bar();
} catch (e) {
  if (e instanceof EvalError) {
    console.error(`${e.name}: ${e.message}`);
  } else if (e instanceof RangeError) {
    console.error(`${e.name}: ${e.message}`);
  }
  // etc.
  else {
    // If none of our cases matched leave the Error unhandled
    throw e;
  }
}
```

### Phân biệt giữa các lỗi tương tự

Đôi khi một khối code có thể thất bại vì những lý do đòi hỏi cách xử lý khác nhau, nhưng lại ném ra các lỗi rất giống nhau (tức là, cùng loại và thông báo).

Nếu bạn không kiểm soát được các lỗi gốc được ném ra, một lựa chọn là bắt chúng và ném các đối tượng `Error` mới có thông báo cụ thể hơn.
Lỗi gốc nên được truyền đến `Error` mới trong tham số `options` của constructor dưới dạng thuộc tính `cause`. Điều này đảm bảo rằng lỗi gốc và stack trace có sẵn cho các khối try/catch cấp cao hơn.

Ví dụ dưới đây minh họa điều này cho hai phương thức mà nếu không sẽ thất bại với các lỗi tương tự (`doFailSomeWay()` và `doFailAnotherWay()`):

```js
function doWork() {
  try {
    doFailSomeWay();
  } catch (err) {
    throw new Error("Failed in some way", { cause: err });
  }
  try {
    doFailAnotherWay();
  } catch (err) {
    throw new Error("Failed in another way", { cause: err });
  }
}

try {
  doWork();
} catch (err) {
  switch (err.message) {
    case "Failed in some way":
      handleFailSomeWay(err.cause);
      break;
    case "Failed in another way":
      handleFailAnotherWay(err.cause);
      break;
  }
}
```

> [!NOTE]
> Nếu bạn đang xây dựng thư viện, bạn nên ưu tiên sử dụng error cause để phân biệt giữa các lỗi khác nhau — thay vì yêu cầu người dùng phân tích thông báo lỗi. Xem [trang error cause](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error/cause#providing_structured_data_as_the_error_cause) để biết ví dụ.

[Các loại error tùy chỉnh](#custom_error_types) cũng có thể sử dụng thuộc tính `cause`, với điều kiện constructor của lớp con truyền tham số `options` khi gọi `super()`. Constructor lớp cơ sở `Error()` sẽ đọc `options.cause` và định nghĩa thuộc tính `cause` trên instance lỗi mới.

```js
class MyError extends Error {
  constructor(message, options) {
    // Need to pass `options` as the second parameter to install the "cause" property.
    super(message, options);
  }
}

console.log(new MyError("test", { cause: new Error("cause") }).cause);
// Error: cause
```

### Các loại error tùy chỉnh

Bạn có thể muốn định nghĩa các loại lỗi của riêng mình được dẫn xuất từ `Error` để có thể `throw new MyError()` và sử dụng `instanceof MyError` để kiểm tra loại lỗi trong exception handler. Điều này giúp code xử lý lỗi gọn gàng và nhất quán hơn.

Xem ["What's a good way to extend Error in JavaScript?"](https://stackoverflow.com/questions/1382107/whats-a-good-way-to-extend-error-in-javascript) trên Stack Overflow để có thảo luận chuyên sâu.

> [!WARNING]
> Subclassing dựng sẵn không thể được chuyển đổi đáng tin cậy sang code trước ES6, vì không có cách nào để xây dựng lớp cơ sở với một `new.target` cụ thể mà không có {{jsxref("Reflect.construct()")}}. Bạn cần [cấu hình thêm](https://github.com/loganfsmyth/babel-plugin-transform-builtin-extend) hoặc gọi thủ công {{jsxref("Object/setPrototypeOf", "Object.setPrototypeOf(this, CustomError.prototype)")}} ở cuối constructor; nếu không, instance được tạo sẽ không phải là instance `CustomError`. Xem [TypeScript FAQ](https://github.com/microsoft/TypeScript/wiki/FAQ#why-doesnt-extending-built-ins-like-error-array-and-map-work) để biết thêm thông tin.

> [!NOTE]
> Một số trình duyệt bao gồm constructor `CustomError` trong stack trace khi sử dụng các class ES2015.

```js
class CustomError extends Error {
  constructor(foo = "bar", ...params) {
    // Pass remaining arguments (including vendor specific ones) to parent constructor
    super(...params);

    // Maintains proper stack trace for where our error was thrown (non-standard)
    if (Error.captureStackTrace) {
      Error.captureStackTrace(this, CustomError);
    }

    this.name = "CustomError";
    // Custom debugging information
    this.foo = foo;
    this.date = new Date();
  }
}

try {
  throw new CustomError("baz", "bazMessage");
} catch (e) {
  console.error(e.name); // CustomError
  console.error(e.foo); // baz
  console.error(e.message); // bazMessage
  console.error(e.stack); // stack trace
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Error` với hỗ trợ `cause` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-error)
- [Polyfill es-shims của Error `cause`](https://www.npmjs.com/package/error-cause)
- {{jsxref("Statements/throw", "throw")}}
- {{jsxref("Statements/try...catch", "try...catch")}}
- [Stack trace API](https://v8.dev/docs/stack-trace-api) trong tài liệu V8
