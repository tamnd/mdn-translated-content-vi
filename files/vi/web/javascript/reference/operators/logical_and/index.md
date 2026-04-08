---
title: Logical AND (&&)
slug: Web/JavaScript/Reference/Operators/Logical_AND
page-type: javascript-operator
browser-compat: javascript.operators.logical_and
sidebar: jssidebar
---

Toán tử **logical AND (`&&`)** (phép hội logic) cho một tập hợp các toán hạng boolean sẽ là `true` khi và chỉ khi tất cả các toán hạng đều là `true`. Nếu không, nó sẽ là `false`.

Nói chung hơn, toán tử trả về giá trị của toán hạng {{Glossary("falsy")}} đầu tiên gặp phải khi đánh giá từ trái sang phải, hoặc giá trị của toán hạng cuối cùng nếu tất cả đều {{Glossary("truthy")}}.

{{InteractiveExample("JavaScript Demo: Logical AND (&&) operator", "shorter")}}

```js interactive-example
const a = 3;
const b = -2;

console.log(a > 0 && b > 0);
// Expected output: false
```

## Cú pháp

```js-nolint
x && y
```

## Mô tả

Logical AND (`&&`) đánh giá các toán hạng từ trái sang phải, trả về ngay giá trị của toán hạng {{Glossary("falsy")}} đầu tiên nó gặp; nếu tất cả các giá trị đều {{Glossary("truthy")}}, giá trị của toán hạng cuối cùng được trả về.

Nếu một giá trị có thể được chuyển đổi thành `true`, giá trị đó được gọi là {{Glossary("truthy")}}. Nếu một giá trị có thể được chuyển đổi thành `false`, giá trị đó được gọi là {{Glossary("falsy")}}.

Ví dụ về các biểu thức có thể được chuyển đổi thành false là:

- `false`;
- `null`;
- `NaN`;
- `0`;
- chuỗi rỗng (`""` hoặc `''` hoặc ` `` `);
- `undefined`.

Toán tử AND bảo tồn các giá trị không phải Boolean và trả về chúng như chúng vốn có:

```js
result = "" && "foo"; // result is assigned "" (empty string)
result = 2 && 0; // result is assigned 0
result = "foo" && 4; // result is assigned 4
```

Mặc dù toán tử `&&` có thể được sử dụng với các toán hạng không phải Boolean, nó vẫn được coi là toán tử boolean vì giá trị trả về của nó luôn có thể được chuyển đổi thành [boolean primitive](/en-US/docs/Web/JavaScript/Guide/Data_structures#boolean_type). Để chuyển đổi tường minh giá trị trả về của nó (hoặc bất kỳ biểu thức nào nói chung) sang giá trị boolean tương ứng, hãy sử dụng toán tử [NOT](/en-US/docs/Web/JavaScript/Reference/Operators/Logical_NOT) kép hoặc constructor {{jsxref("Boolean/Boolean", "Boolean")}}.

### Đánh giá short-circuit

Biểu thức logical AND là toán tử short-circuit. Khi mỗi toán hạng được chuyển đổi thành boolean, nếu kết quả của một lần chuyển đổi được tìm thấy là `false`, toán tử AND dừng lại và trả về giá trị gốc của toán hạng falsy đó; nó **không** đánh giá bất kỳ toán hạng còn lại nào.

Hãy xem xét pseudocode dưới đây.

```plain
(some falsy expression) && expr
```

Phần `expr` **không bao giờ được đánh giá** vì toán hạng đầu tiên `(some falsy expression)` được đánh giá là {{Glossary("falsy")}}. Nếu `expr` là một hàm, hàm đó không bao giờ được gọi. Xem ví dụ bên dưới:

```js
function A() {
  console.log("called A");
  return false;
}
function B() {
  console.log("called B");
  return true;
}

console.log(A() && B());
// Logs "called A" to the console due to the call for function A,
// && evaluates to false (function A returns false), then false is logged to the console;
// the AND operator short-circuits here and ignores function B
```

### Độ ưu tiên toán tử

Toán tử AND có độ ưu tiên cao hơn toán tử OR, nghĩa là toán tử `&&` được thực thi trước toán tử `||` (xem [độ ưu tiên toán tử](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence)).

```js-nolint
true || false && false; // true
true && (false || false); // false
(2 === 3) || (4 < 0) && (1 === 1); // false
```

## Ví dụ

### Sử dụng AND

Đoạn code sau đây hiển thị các ví dụ về toán tử `&&` (logical AND).

```js
a1 = true && true; // t && t returns true
a2 = true && false; // t && f returns false
a3 = false && true; // f && t returns false
a4 = false && 3 === 4; // f && f returns false
a5 = "Cat" && "Dog"; // t && t returns "Dog"
a6 = false && "Cat"; // f && t returns false
a7 = "Cat" && false; // t && f returns false
a8 = "" && false; // f && f returns ""
a9 = false && ""; // f && f returns false
```

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

Vì các biểu thức logic được đánh giá từ trái sang phải, luôn có thể loại bỏ dấu ngoặc khỏi một biểu thức phức tạp miễn là tuân theo một số quy tắc nhất định.

Phép toán tổng hợp sau liên quan đến **boolean**:

```js-nolint
bCondition1 || (bCondition2 && bCondition3)
```

luôn bằng:

```js-nolint
bCondition1 || bCondition2 && bCondition3
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Boolean")}}
- {{Glossary("Truthy")}}
- {{Glossary("Falsy")}}
