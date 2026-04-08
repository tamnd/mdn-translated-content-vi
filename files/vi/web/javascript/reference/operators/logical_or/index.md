---
title: Logical OR (||)
slug: Web/JavaScript/Reference/Operators/Logical_OR
page-type: javascript-operator
browser-compat: javascript.operators.logical_or
sidebar: jssidebar
---

Toán tử **logical OR (`||`)** (phép tuyển logic) cho một tập hợp các toán hạng là true khi và chỉ khi một hoặc nhiều toán hạng của nó là true. Thông thường nó được sử dụng với các giá trị boolean (logical). Khi được dùng như vậy, nó trả về một giá trị Boolean. Tuy nhiên, toán tử `||` thực sự trả về giá trị của một trong các toán hạng đã chỉ định, vì vậy nếu toán tử này được sử dụng với các giá trị không phải Boolean, nó sẽ trả về một giá trị không phải Boolean.

{{InteractiveExample("JavaScript Demo: Logical OR (||) operator", "shorter")}}

```js interactive-example
const a = 3;
const b = -2;

console.log(a > 0 || b > 0);
// Expected output: true
```

## Cú pháp

```js-nolint
x || y
```

## Mô tả

Nếu `x` có thể được chuyển đổi thành `true`, trả về `x`; nếu không, trả về `y`.

Nếu một giá trị có thể được chuyển đổi thành `true`, giá trị đó được gọi là {{Glossary("truthy")}}. Nếu một giá trị có thể được chuyển đổi thành `false`, giá trị đó được gọi là {{Glossary("falsy")}}.

Ví dụ về các biểu thức có thể được chuyển đổi thành false là:

- `null`;
- `NaN`;
- `0`;
- chuỗi rỗng (`""` hoặc `''` hoặc ` `` `);
- `undefined`.

Mặc dù toán tử `||` có thể được sử dụng với các toán hạng không phải giá trị Boolean, nó vẫn có thể được coi là toán tử boolean vì giá trị trả về của nó luôn có thể được chuyển đổi thành [boolean primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type). Để chuyển đổi tường minh giá trị trả về của nó (hoặc bất kỳ biểu thức nào nói chung) sang giá trị boolean tương ứng, hãy sử dụng toán tử {{jsxref("Operators/Logical_NOT", "NOT", "", 1)}} kép hoặc constructor {{jsxref("Boolean/Boolean", "Boolean()")}}.

### Đánh giá short-circuit

Biểu thức logical OR được đánh giá từ trái sang phải, nó được kiểm tra khả năng đánh giá "short-circuit" bằng quy tắc sau:

`(some truthy expression) || expr` được đánh giá short-circuit thành biểu thức truthy.

Short circuit có nghĩa là phần `expr` ở trên **không được đánh giá**, do đó mọi tác dụng phụ của việc thực hiện như vậy đều không có hiệu lực (ví dụ: nếu `expr` là một lời gọi hàm, việc gọi không bao giờ xảy ra). Điều này xảy ra vì giá trị của toán tử đã được xác định sau khi đánh giá toán hạng đầu tiên. Xem ví dụ:

```js
function A() {
  console.log("called A");
  return false;
}
function B() {
  console.log("called B");
  return true;
}

console.log(B() || A());
// Logs "called B" due to the function call,
// then logs true (which is the resulting value of the operator)
```

### Độ ưu tiên toán tử

Các biểu thức sau có thể trông tương đương, nhưng không phải vậy, vì toán tử `&&` được thực thi trước toán tử `||` (xem [độ ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)).

```js-nolint
true || false && false; // returns true, because && is executed first
(true || false) && false; // returns false, because grouping has the highest precedence
```

## Ví dụ

### Sử dụng OR

Đoạn code sau đây hiển thị các ví dụ về toán tử `||` (logical OR).

```js
true || true; // t || t returns true
false || true; // f || t returns true
true || false; // t || f returns true
false || 3 === 4; // f || f returns false
"Cat" || "Dog"; // t || t returns "Cat"
false || "Cat"; // f || t returns "Cat"
"Cat" || false; // t || f returns "Cat"
"" || false; // f || f returns false
false || ""; // f || f returns ""
false || varObject; // f || object returns varObject
```

> [!NOTE]
> Nếu bạn sử dụng toán tử này để cung cấp giá trị mặc định cho một biến nào đó, hãy lưu ý rằng bất kỳ giá trị _falsy_ nào sẽ không được sử dụng. Nếu bạn chỉ cần lọc ra [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) hoặc {{jsxref("undefined")}}, hãy xem xét sử dụng [toán tử nullish coalescing](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing).

### Quy tắc chuyển đổi cho boolean

#### Chuyển đổi AND sang OR

Phép toán sau liên quan đến **boolean**:

```js-nolint
bCondition1 && bCondition2
```

luôn bằng:

```js-nolint
!(!bCondition1 || !bCondition2)
```

#### Chuyển đổi OR sang AND

Phép toán sau liên quan đến **boolean**:

```js-nolint
bCondition1 || bCondition2
```

luôn bằng:

```js-nolint
!(!bCondition1 && !bCondition2)
```

### Loại bỏ dấu ngoặc lồng nhau

Vì các biểu thức logic được đánh giá từ trái sang phải, luôn có thể loại bỏ dấu ngoặc khỏi một biểu thức phức tạp theo một số quy tắc.

Phép toán tổng hợp sau liên quan đến **boolean**:

```js-nolint
bCondition1 && (bCondition2 || bCondition3)
```

luôn bằng:

```js-nolint
!(!bCondition1 || !bCondition2 && !bCondition3)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nullish coalescing operator (`??`)](/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing)
- {{jsxref("Boolean")}}
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
