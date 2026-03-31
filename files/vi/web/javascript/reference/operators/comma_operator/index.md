---
title: Comma operator (,)
slug: Web/JavaScript/Reference/Operators/Comma_operator
page-type: javascript-operator
browser-compat: javascript.operators.comma
sidebar: jssidebar
---

Toán tử **dấu phẩy (`,`)** đánh giá từng toán hạng của nó (từ trái sang phải) và trả về giá trị của toán hạng cuối cùng. Toán tử này thường được dùng để cung cấp nhiều bộ cập nhật cho mệnh đề afterthought của vòng lặp [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for).

{{InteractiveExample("JavaScript Demo: Comma (,) operator")}}

```js interactive-example
let x = 1;

x = (x++, x);

console.log(x);
// Expected output: 2

x = (2, 3);

console.log(x);
// Expected output: 3
```

## Cú pháp

```js-nolint
expr1, expr2, expr3/* , … */
```

### Tham số

- `expr1`, `expr2`, `expr3`, …
  - : Một hoặc nhiều biểu thức, trong đó biểu thức cuối cùng được trả về làm giá trị của biểu thức tổ hợp.

## Mô tả

Bạn có thể dùng toán tử dấu phẩy khi muốn bao gồm nhiều biểu thức ở một vị trí chỉ yêu cầu một biểu thức. Cách dùng phổ biến nhất của toán tử này là cung cấp nhiều bộ cập nhật trong vòng lặp `for`. Để có thể dùng nhiều _câu lệnh_ ở một vị trí chỉ yêu cầu một biểu thức, bạn có thể dùng [IIFE](/en-US/docs/Glossary/IIFE).

Vì tất cả các biểu thức ngoại trừ biểu thức cuối cùng được đánh giá rồi bị loại bỏ, các biểu thức này phải có tác dụng phụ mới có ý nghĩa. Các biểu thức phổ biến có tác dụng phụ là phép gán, lời gọi hàm, và các toán tử [`++`](/en-US/docs/Web/JavaScript/Reference/Operators/Increment) và [`--`](/en-US/docs/Web/JavaScript/Reference/Operators/Decrement). Những biểu thức khác cũng có thể có tác dụng phụ nếu chúng kích hoạt [getters](/en-US/docs/Web/JavaScript/Reference/Functions/get) hoặc [ép kiểu](/en-US/docs/Web/JavaScript/Guide/Data_structures#type_coercion).

Toán tử dấu phẩy có [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) thấp nhất trong tất cả các toán tử. Nếu bạn muốn kết hợp biểu thức được nối bằng dấu phẩy vào một biểu thức lớn hơn, bạn phải đặt nó trong ngoặc đơn.

Toán tử dấu phẩy hoàn toàn khác với dấu phẩy được dùng như dấu phân tách cú pháp ở các vị trí khác, bao gồm:

- Các phần tử trong bộ khởi tạo mảng (`[1, 2, 3]`)
- Các thuộc tính trong [bộ khởi tạo đối tượng](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) (`{ a: 1, b: 2 }`)
- Các tham số trong [khai báo hàm](/en-US/docs/Web/JavaScript/Reference/Statements/function)/biểu thức (`function f(a, b) { … }`)
- Các đối số trong lời gọi hàm (`f(1, 2)`)
- Danh sách {{Glossary("Binding")}} trong các khai báo [`let`](/en-US/docs/Web/JavaScript/Reference/Statements/let), [`const`](/en-US/docs/Web/JavaScript/Reference/Statements/const), hoặc [`var`](/en-US/docs/Web/JavaScript/Reference/Statements/var) (`const a = 1, b = 2;`)
- Danh sách import trong khai báo [`import`](/en-US/docs/Web/JavaScript/Reference/Statements/import) (`import { a, b } from "c";`)
- Danh sách export trong khai báo [`export`](/en-US/docs/Web/JavaScript/Reference/Statements/export) (`export { a, b };`)

Thực tế, mặc dù một số vị trí này chấp nhận hầu hết các biểu thức, chúng không chấp nhận biểu thức được nối bằng dấu phẩy vì điều đó sẽ gây nhầm lẫn với dấu phẩy phân tách cú pháp. Trong trường hợp này, bạn phải đặt biểu thức được nối bằng dấu phẩy trong ngoặc đơn. Ví dụ, sau đây là khai báo `const` khai báo hai biến, trong đó dấu phẩy không phải là toán tử dấu phẩy:

```js-nolint
const a = 1, b = 2;
```

Khác với đoạn sau, trong đó `b = 2` là [biểu thức gán](/en-US/docs/Web/JavaScript/Reference/Operators/Assignment), không phải khai báo. Giá trị của `a` là `2`, giá trị trả về của phép gán, trong khi giá trị `1` bị loại bỏ:

```js-nolint
const a = (1, b = 2);
```

Các toán tử dấu phẩy không thể xuất hiện dưới dạng [trailing commas](/en-US/docs/Web/JavaScript/Reference/Trailing_commas).

## Ví dụ

### Sử dụng toán tử dấu phẩy trong vòng lặp for

Nếu `a` là một mảng 2 chiều với 10 phần tử ở mỗi cạnh, đoạn mã sau sử dụng toán tử dấu phẩy để tăng `i` và giảm `j` cùng một lúc, do đó in ra các giá trị của các phần tử nằm trên đường chéo của mảng:

```js
const a = Array.from({ length: 10 }, () =>
  Array.from({ length: 10 }, Math.random),
); // A 10×10 array of random numbers

for (let i = 0, j = 9; i <= 9; i++, j--) {
  console.log(`a[${i}][${j}] = ${a[i][j]}`);
}
```

### Sử dụng toán tử dấu phẩy để kết hợp các phép gán

Vì dấu phẩy có [độ ưu tiên](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) thấp nhất — thậm chí thấp hơn cả phép gán — dấu phẩy có thể được dùng để kết hợp nhiều biểu thức gán. Trong ví dụ sau, `a` được gán giá trị của `b = 3` (là 3). Sau đó, biểu thức `c = 4` được đánh giá và kết quả của nó trở thành giá trị trả về của toàn bộ biểu thức dấu phẩy.

```js-nolint
let a, b, c;

a = b = 3, c = 4; // Returns 4
console.log(a); // 3 (left-most)

let x, y, z;

x = (y = 5, z = 6); // Returns 6
console.log(x); // 6 (right-most)
```

### Xử lý rồi trả về

Một ví dụ khác về toán tử dấu phẩy là xử lý trước khi trả về. Như đã nói, chỉ phần tử cuối cùng được trả về nhưng tất cả các phần tử khác cũng được đánh giá. Vì vậy, người ta có thể làm:

```js-nolint
function myFunc() {
  let x = 0;

  return (x += 1, x); // the same as return ++x;
}
```

Điều này đặc biệt hữu ích cho [arrow functions](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions) một dòng. Ví dụ sau sử dụng một lần [`map()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) để lấy cả tổng của một mảng lẫn bình phương các phần tử của nó, điều này thường đòi hỏi hai lần lặp, một với [`reduce()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce) và một với `map()`:

```js
let sum = 0;
const squares = [1, 2, 3, 4, 5].map((x) => ((sum += x), x * x));
console.log(squares); // [1, 4, 9, 16, 25]
console.log(sum); // 15
```

### Loại bỏ ràng buộc tham chiếu

Toán tử dấu phẩy luôn trả về biểu thức cuối cùng dưới dạng _giá trị_ thay vì _tham chiếu_. Điều này làm mất một số thông tin ngữ cảnh như ràng buộc [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this). Ví dụ, truy cập thuộc tính trả về một tham chiếu đến hàm, cũng nhớ đối tượng mà nó được truy cập trên, để việc gọi thuộc tính hoạt động đúng. Nếu phương thức được trả về từ biểu thức dấu phẩy, thì hàm được gọi như thể đó là giá trị hàm mới, và `this` là `undefined`.

```js-nolint
const obj = {
  value: "obj",
  method() {
    console.log(this.value);
  },
};

obj.method(); // "obj"
(obj.method)(); // "obj" (the grouping operator still returns the reference)
(0, obj.method)(); // undefined (the comma operator returns a new value)
```

Bạn có thể vào [indirect eval](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval#direct_and_indirect_eval) bằng kỹ thuật này, vì direct eval yêu cầu lời gọi hàm phải xảy ra trên tham chiếu đến hàm `eval()`.

```js-nolint
globalThis.isDirectEval = false;

{
  const isDirectEval = true;
  console.log(eval("isDirectEval")); // true
  console.log((eval)("isDirectEval")); // true (the grouping operator still returns a reference to `eval`)
  console.log((0, eval)("isDirectEval")); // false (the comma operator returns a new value)
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [`for`](/en-US/docs/Web/JavaScript/Reference/Statements/for)
- [IIFE](/en-US/docs/Glossary/IIFE)
