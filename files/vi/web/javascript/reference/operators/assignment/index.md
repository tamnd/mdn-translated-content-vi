---
title: Assignment (=)
slug: Web/JavaScript/Reference/Operators/Assignment
page-type: javascript-operator
browser-compat: javascript.operators.assignment
sidebar: jssidebar
---

Operator **gán (`=`)** được dùng để gán một giá trị cho biến hoặc thuộc tính. Bản thân biểu thức gán có giá trị là giá trị được gán. Điều này cho phép nhiều phép gán được nối chuỗi với nhau để gán một giá trị cho nhiều biến.

{{InteractiveExample("JavaScript Demo: Assignment (=) operator")}}

```js interactive-example
let x = 2;
const y = 3;

console.log(x);
// Expected output: 2

console.log((x = y + 1)); // 3 + 1
// Expected output: 4

console.log((x = x * y)); // 4 * 3
// Expected output: 12
```

## Cú pháp

```js-nolint
x = y
```

### Tham số

- `x`
  - : Một assignment target hợp lệ, bao gồm một [định danh](/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#identifiers) hoặc một [property accessor](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors). Nó cũng có thể là một [destructuring pattern](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).
- `y`
  - : Một expression chỉ định giá trị được gán cho `x`.

### Giá trị trả về

Giá trị của `y`.

### Ngoại lệ

- {{jsxref("ReferenceError")}}
  - : Được ném trong strict mode nếu gán cho một định danh chưa được khai báo trong phạm vi.
- {{jsxref("TypeError")}}
  - : Được ném trong strict mode nếu gán cho một [thuộc tính không thể sửa đổi](/en-US/docs/Web/JavaScript/Reference/Strict_mode#failing_to_assign_to_object_properties).

## Mô tả

Operator assignment hoàn toàn khác với dấu bằng (`=`) được dùng như dấu phân cách cú pháp ở các vị trí khác, bao gồm:

- Các giá trị khởi tạo của khai báo [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var), [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), và [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const)
- Các giá trị mặc định của [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring#default_value)
- [Tham số mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)
- Các giá trị khởi tạo của [class fields](/en-US/docs/Web/JavaScript/Reference/Classes/Public_class_fields)

Tất cả các vị trí này đều chấp nhận một assignment expression ở phía bên phải của `=`, vì vậy nếu bạn có nhiều dấu bằng được nối chuỗi:

```js-nolint
const x = y = 5;
```

Điều này tương đương với:

```js
const x = (y = 5);
```

Nghĩa là `y` phải là một biến đã tồn tại từ trước, và `x` là một biến `const` được khai báo mới. `y` được gán giá trị `5`, và `x` được khởi tạo với giá trị của biểu thức `y = 5`, cũng là `5`. Nếu `y` không phải là một biến đã tồn tại, một biến toàn cục `y` được tạo ngầm định trong [non-strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode), hoặc một {{jsxref("ReferenceError")}} sẽ được ném trong strict mode. Để khai báo hai biến trong cùng một lần khai báo, sử dụng:

```js
const x = 5,
  y = 5;
```

## Ví dụ

### Gán cơ bản và nối chuỗi

```js
let x = 5;
let y = 10;
let z = 25;

x = y; // x là 10
x = y = z; // x, y và z đều là 25
```

### Giá trị của biểu thức gán

Bản thân biểu thức gán được ước lượng thành giá trị của vế phải, vì vậy bạn có thể ghi log giá trị và gán cho biến cùng lúc.

```js-nolint
let x;
console.log(x); // undefined
console.log(x = 2); // 2
console.log(x); // 2
```

### Gán với định danh không được khai báo

Đối tượng toàn cục nằm ở đầu chuỗi phạm vi. Khi cố gắng phân giải một tên thành một giá trị, chuỗi phạm vi được tìm kiếm. Điều này có nghĩa là các thuộc tính trên đối tượng toàn cục có thể truy cập từ mọi phạm vi, mà không cần phải đủ điều kiện tên với `globalThis.` hay `window.` hay `global.`.

Vì đối tượng toàn cục có thuộc tính `String` (`Object.hasOwn(globalThis, "String")`), bạn có thể sử dụng đoạn code sau:

```js
function foo() {
  String("s"); // Hàm `String` có thể truy cập toàn cục
}
```

Vì vậy đối tượng toàn cục cuối cùng sẽ được tìm kiếm cho các định danh không được khai báo. Bạn không cần phải gõ `globalThis.String`; bạn chỉ cần gõ `String` không được khai báo. Để làm cho tính năng này nhất quán hơn về mặt khái niệm, việc gán cho các định danh không được khai báo sẽ giả định bạn muốn tạo một thuộc tính với tên đó trên đối tượng toàn cục (bỏ qua `globalThis.`), nếu không có biến nào có cùng tên được khai báo trong chuỗi phạm vi.

```js
foo = "f"; // Trong non-strict mode, giả định bạn muốn tạo thuộc tính tên `foo` trên đối tượng toàn cục
Object.hasOwn(globalThis, "foo"); // true
```

Trong [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode#assigning_to_undeclared_variables), việc gán cho một định danh không được khai báo trong strict mode sẽ dẫn đến một `ReferenceError`, để tránh vô tình tạo các thuộc tính trên đối tượng toàn cục.

Lưu ý rằng hàm ý của điều trên là, trái với thông tin sai lầm phổ biến, JavaScript không có các biến ngầm định hay biến chưa được khai báo. Nó chỉ đơn giản là hợp nhất đối tượng toàn cục với phạm vi toàn cục và cho phép bỏ qua bộ định danh đối tượng toàn cục khi tạo thuộc tính.

### Gán với destructuring

Phía bên trái cũng có thể là một assignment pattern. Điều này cho phép gán cho nhiều biến cùng lúc.

```js
const result = /(a+)(b+)(c+)/.exec("aaabcc");
let a = "",
  b = "",
  c = "";
[, a, b, c] = result;
console.log(a, b, c); // "aaa" "b" "cc"
```

Để biết thêm thông tin, xem [Destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Assignment operators in the JS guide](/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators#assignment_operators)
- [Destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring)
