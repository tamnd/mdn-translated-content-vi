---
title: undefined
slug: Web/JavaScript/Reference/Global_Objects/undefined
page-type: javascript-global-property
browser-compat: javascript.builtins.undefined
sidebar: jssidebar
---

Thuộc tính toàn cục **`undefined`** đại diện cho giá trị nguyên thủy [`undefined`](/en-US/docs/Web/JavaScript/Guide/Data_structures#undefined_type). Đây là một trong các {{Glossary("Primitive", "kiểu nguyên thủy")}} của JavaScript.

{{InteractiveExample("JavaScript Demo: undefined")}}

```js interactive-example
function test(t) {
  if (t === undefined) {
    return "Undefined value!";
  }
  return t;
}

let x;

console.log(test(x));
// Expected output: "Undefined value!"
```

## Giá trị

Giá trị nguyên thủy [`undefined`](/en-US/docs/Web/JavaScript/Guide/Data_structures#undefined_type).

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`undefined` là một thuộc tính của _đối tượng toàn cục_. Nghĩa là, nó là một biến trong phạm vi toàn cục.

Trong tất cả các trình duyệt không phải legacy, `undefined` là một thuộc tính không thể cấu hình, không thể ghi. Ngay cả khi điều này không phải vậy, hãy tránh ghi đè nó.

Một biến chưa được gán giá trị có kiểu `undefined`. Một hàm trả về `undefined` nếu không có giá trị nào được {{jsxref("Statements/return", "return")}}. Việc truy cập một thuộc tính không tồn tại cũng trả về `undefined`. Toán tử {{jsxref("Operators/void", "void")}} luôn trả về `undefined`.

> [!NOTE]
> Mặc dù bạn có thể dùng `undefined` như một {{Glossary("identifier")}} (tên biến) trong bất kỳ phạm vi nào khác ngoài phạm vi toàn cục (vì `undefined` không phải là [từ khóa dành riêng](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words)), nhưng làm vậy là một ý tưởng rất tệ khiến mã của bạn khó bảo trì và debug.
>
> ```js example-bad
> // DON'T DO THIS
>
> (() => {
>   const undefined = "foo";
>   console.log(undefined, typeof undefined); // foo string
> })();
>
> ((undefined) => {
>   console.log(undefined, typeof undefined); // foo string
> })("foo");
> ```

## Ví dụ

### So sánh nghiêm ngặt và undefined

Bạn có thể dùng `undefined` và các toán tử so sánh bằng và không bằng nghiêm ngặt để xác định xem một biến có giá trị không. Trong đoạn mã sau, biến `x` chưa được khởi tạo, và câu lệnh `if` đánh giá là true.

```js
let x;
if (x === undefined) {
  // these statements execute
} else {
  // these statements do not execute
}
```

> [!NOTE]
> Toán tử _so sánh bằng nghiêm ngặt_ (trái ngược với toán tử _so sánh bằng lỏng lẻo_) phải được dùng ở đây, vì `x == undefined` cũng kiểm tra xem `x` có phải là `null` không, trong khi so sánh nghiêm ngặt không làm vậy. Điều này là vì `null` không tương đương với `undefined`.
>
> Xem [So sánh bằng và tính đồng nhất](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness) để biết thêm chi tiết.

### Toán tử typeof và undefined

{{jsxref("Operators/typeof", "typeof")}} cũng có thể xác định xem một biến có phải là `undefined` không:

```js
let x;
if (typeof x === "undefined") {
  // these statements execute
}
```

Một lý do để dùng {{jsxref("Operators/typeof", "typeof")}} là nó không ném lỗi nếu biến không tồn tại trong phạm vi hiện tại.

```js
// x has not been declared before
// evaluates to true without errors
if (typeof x === "undefined") {
  // these statements execute
}

// Throws a ReferenceError
if (x === undefined) {
}
```

Nó cũng hoạt động với các biến được khai báo bằng `var` _sau_ kiểm tra, vì khai báo được hoisted lên đầu phạm vi với giá trị `undefined`.

```js
if (typeof x === "undefined") {
  // these statements execute
}
var x = 1;
```

Kỹ thuật này thường chỉ hữu ích để kiểm tra các biến toàn cục. Bạn có thể biết liệu một biến có tồn tại ở bất kỳ phạm vi nào khác (khối, hàm, module, v.v.) chỉ bằng cách nhìn vào mã nguồn. Phạm vi toàn cục được ràng buộc với {{jsxref("globalThis", "đối tượng toàn cục", "", 1)}}, vì vậy việc kiểm tra sự tồn tại của biến trong ngữ cảnh toàn cục có thể được thực hiện bằng cách kiểm tra sự tồn tại của thuộc tính trên _đối tượng toàn cục_, chẳng hạn bằng cách dùng toán tử {{jsxref("Operators/in", "in")}}:

```js
if ("x" in window) {
  // These statements execute only if x is defined globally
}
```

Tuy nhiên, không có kỹ thuật nào ở trên hoạt động nếu biến được khai báo bằng `let`, `const`, hoặc các khai báo từ vựng khác. Sử dụng `typeof` trước dòng khai báo vẫn tạo ra `ReferenceError`, do [vùng chết tạm thời (TDZ)](/en-US/docs/Web/JavaScript/Reference/Statements/let#temporal_dead_zone_tdz).

```js example-bad
if (typeof z === "undefined") {
  // Uncaught ReferenceError: Cannot access 'z' before initialization
}
let z = 1;
```

Hơn nữa, các khai báo `let` và `const` không tạo thuộc tính trên đối tượng toàn cục, vì vậy chúng cũng không thể được kiểm tra với toán tử `in`.

```js example-bad
let z;
if ("z" in window) {
  // false, even if z is declared globally with let or const
}
```

Nếu bạn muốn chia sẻ các biến toàn cục qua các script khác nhau, nên dùng `var` hoặc gắn chúng rõ ràng vào đối tượng toàn cục:

```js
window.myGlobalVar = "foo";
```

### Toán tử void và undefined

Toán tử {{jsxref("Operators/void", "void")}} cũng có thể được dùng để tạo ra giá trị `undefined`. Điều này rất phổ biến trong mã đã được minified vì `void 0` ngắn hơn 3 byte và không thể bị ghi đè. Thông thường bạn nên tránh pattern này trong mã của riêng bạn.

```js
let x;
if (x === void 0) {
  // these statements execute
}

// y has not been declared before
if (y === void 0) {
  // throws Uncaught ReferenceError: y is not defined
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kiểu dữ liệu và cấu trúc dữ liệu JavaScript](/en-US/docs/Web/JavaScript/Guide/Data_structures)
- [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
