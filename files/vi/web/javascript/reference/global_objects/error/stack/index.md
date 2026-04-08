---
title: Error.prototype.stack
short-title: stack
slug: Web/JavaScript/Reference/Global_Objects/Error/stack
page-type: javascript-instance-data-property
status:
  - non-standard
browser-compat: javascript.builtins.Error.stack
sidebar: jsref
---

{{Non-standard_Header}}

> [!NOTE]
> Thuộc tính `stack` được triển khai trên thực tế bởi tất cả các JavaScript engine chính, và [ủy ban tiêu chuẩn JavaScript đang xem xét để chuẩn hóa nó](https://github.com/tc39/proposal-error-stacks). Bạn không thể dựa vào nội dung chính xác của chuỗi stack do sự không nhất quán giữa các triển khai, nhưng nhìn chung bạn có thể giả định nó tồn tại và sử dụng nó cho mục đích debug.

Thuộc tính **`stack`** không chuẩn của một instance {{jsxref("Error")}} cung cấp dấu vết về các hàm nào đã được gọi, theo thứ tự nào, từ dòng và tệp nào, và với đối số nào. Chuỗi stack tiến hành từ các lời gọi gần nhất đến các lời gọi trước đó, dẫn ngược về lời gọi phạm vi toàn cục ban đầu.

## Giá trị

Một chuỗi.

Vì thuộc tính `stack` không chuẩn, các triển khai khác nhau về nơi nó được cài đặt.

- Trong Firefox, đây là thuộc tính accessor trên `Error.prototype`.
- Trong Chrome và Safari, đây là thuộc tính dữ liệu trên mỗi instance `Error`, với bộ mô tả:

{{js_property_attributes(1, 0, 1)}}

## Mô tả

Mỗi JavaScript engine sử dụng định dạng riêng cho stack trace, nhưng chúng khá nhất quán ở cấu trúc cấp cao. Mọi triển khai đều dùng một dòng riêng trong stack để biểu diễn mỗi lời gọi hàm. Lời gọi trực tiếp gây ra lỗi được đặt ở đầu, và lời gọi bắt đầu toàn bộ chuỗi gọi được đặt ở cuối. Dưới đây là một số ví dụ về stack trace:

```js
function foo() {
  bar();
}

function bar() {
  baz();
}

function baz() {
  console.log(new Error().stack);
}

foo();
```

```plain
#### JavaScriptCore
baz@filename.js:10:24
bar@filename.js:6:6
foo@filename.js:2:6
global code@filename.js:13:4

#### SpiderMonkey
baz@filename.js:10:15
bar@filename.js:6:3
foo@filename.js:2:3
@filename.js:13:1

#### V8
Error
    at baz (filename.js:10:15)
    at bar (filename.js:6:3)
    at foo (filename.js:2:3)
    at filename.js:13:1
```

V8 cung cấp [stack trace API](https://v8.dev/docs/stack-trace-api) không chuẩn để tùy chỉnh stack trace, bao gồm {{jsxref("Error.captureStackTrace()")}}, {{jsxref("Error.stackTraceLimit")}}, và `Error.prepareStackTrace()`. Các engine khác hỗ trợ API này ở các mức độ khác nhau.

Các engine khác nhau thiết lập giá trị này vào các thời điểm khác nhau. Hầu hết các engine hiện đại thiết lập nó khi đối tượng {{jsxref("Error")}} được tạo. Điều này có nghĩa là bạn có thể lấy toàn bộ thông tin call stack trong một hàm bằng cách sau:

```js
function foo() {
  console.log(new Error().stack);
}
```

Mà không cần ném lỗi rồi bắt lại.

Stack frame cũng có thể là những thứ khác ngoài lời gọi hàm tường minh. Ví dụ, event listener, timeout job, và promise handler đều bắt đầu chuỗi gọi riêng của chúng. Code nguồn bên trong {{jsxref("Global_Objects/eval", "eval()")}} và lời gọi constructor {{jsxref("Function")}} cũng xuất hiện trong stack:

```js
console.log(new Function("return new Error('Function failed')")().stack);
console.log("====");
console.log(eval("new Error('eval failed')").stack);
```

```plain
#### JavaScriptCore
anonymous@
global code@filename.js:1:65
====
eval code@
eval@[native code]
global code@filename.js:3:17

#### SpiderMonkey
anonymous@filename.js line 1 > Function:1:8
@filename.js:1:65

====
@filename.js line 3 > eval:1:1
@filename.js:3:13

#### V8
Error: Function failed
    at eval (eval at <anonymous> (filename.js:1:13), <anonymous>:1:8)
    at filename.js:1:65
====
Error: eval failed
    at eval (eval at <anonymous> (filename.js:3:13), <anonymous>:1:1)
    at filename.js:3:13
```

Trong Firefox, bạn có thể dùng chỉ thị `//# sourceURL` để đặt tên cho nguồn eval. Xem tài liệu Firefox [Debug eval sources](https://firefox-source-docs.mozilla.org/devtools-user/debugger/how_to/debug_eval_sources/index.html).

## Ví dụ

### Sử dụng thuộc tính stack

Script sau minh họa cách sử dụng thuộc tính `stack` để xuất một stack trace vào cửa sổ trình duyệt. Bạn có thể dùng điều này để kiểm tra cấu trúc stack của trình duyệt của bạn trông như thế nào.

```html hidden
<div id="output"></div>
```

```css hidden
#output {
  white-space: pre;
  font-family: monospace;
}
```

```js
function trace() {
  throw new Error("trace() failed");
}
function b() {
  trace();
}
function a() {
  b(3, 4, "\n\n", undefined, {});
}
try {
  a("first call, first arg");
} catch (e) {
  document.getElementById("output").textContent = e.stack;
}
```

{{EmbedLiveSample("Using_the_stack_property", "700", "200")}}

## Đặc tả kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [TraceKit](https://github.com/csnover/TraceKit/) trên GitHub
- [stacktrace.js](https://github.com/stacktracejs/stacktrace.js) trên GitHub
- [Stack trace API](https://v8.dev/docs/stack-trace-api) trong tài liệu V8
