---
title: Trailing commas
slug: Web/JavaScript/Reference/Trailing_commas
page-type: javascript-language-feature
browser-compat: javascript.grammar.trailing_commas
sidebar: jssidebar
---

**Trailing commas** (đôi khi được gọi là "final commas") có thể hữu ích khi thêm phần tử, tham số hoặc thuộc tính mới vào mã JavaScript. Nếu bạn muốn thêm thuộc tính mới, bạn có thể thêm dòng mới mà không cần sửa đổi dòng cuối cùng trước đó nếu dòng đó đã có trailing comma. Điều này làm cho diff trong version control sạch hơn và chỉnh sửa mã có thể ít rắc rối hơn.

JavaScript đã cho phép trailing comma trong array literal từ đầu. Trailing comma hiện cũng được cho phép trong object literal, danh sách tham số hàm, named import, named export và nhiều hơn nữa.

[JSON](/en-US/docs/Glossary/JSON) tuy nhiên, không cho phép trailing comma.

## Mô tả

JavaScript cho phép trailing comma ở bất kỳ đâu danh sách giá trị được phân cách bằng dấu phẩy được chấp nhận và có thể có thêm giá trị sau item cuối cùng. Điều này bao gồm:

- [Array literal](#arrays)
- [Object literal](#objects)
- [Định nghĩa tham số](#parameter_definitions)
- [Lời gọi hàm](#function_calls)
- [Named import](#named_imports)
- [Named export](#named_exports)
- [Dynamic import](#trailing_commas_in_dynamic_import)
- [Array và object destructuring](#trailing_commas_in_destructuring)

Trong tất cả các trường hợp này, trailing comma hoàn toàn tùy chọn và không thay đổi ngữ nghĩa của chương trình theo bất kỳ cách nào.

Nó đặc biệt hữu ích khi thêm, xóa hoặc sắp xếp lại các item trong danh sách trải dài nhiều dòng, vì nó giảm số lượng dòng cần thay đổi, điều này giúp ích cho cả việc chỉnh sửa và xem xét diff.

```diff
  [
    "foo",
+   "baz",
    "bar",
-   "baz",
  ]
```

## Ví dụ

### Trailing comma trong literal

#### Array

JavaScript bỏ qua trailing comma trong array literal:

```js-nolint
const arr = [
  1,
  2,
  3,
];

arr; // [1, 2, 3]
arr.length; // 3
```

Nếu nhiều hơn một trailing comma được dùng, sẽ có elision (hoặc hole). Một array có hole được gọi là [_sparse_](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) (array _dense_ không có hole). Khi lặp qua array ví dụ bằng {{jsxref("Array.prototype.forEach()")}} hoặc {{jsxref("Array.prototype.map()")}}, array hole được bỏ qua. Sparse array thường không được ưa thích, vì vậy bạn nên tránh có nhiều trailing comma.

```js
const arr = [1, 2, 3, , ,];
arr.length; // 5
```

#### Object

Trailing comma trong object literal cũng hợp lệ:

```js
const object = {
  foo: "bar",
  baz: "qwerty",
  age: 42,
};
```

### Trailing comma trong hàm

Trailing comma cũng được cho phép trong danh sách tham số hàm.

#### Định nghĩa tham số

Các cặp định nghĩa hàm sau là hợp lệ và tương đương nhau. Trailing comma không ảnh hưởng đến thuộc tính [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) của khai báo hàm hoặc đối tượng [`arguments`](/en-US/docs/Web/JavaScript/Reference/Functions/arguments) của chúng.

```js-nolint
function f(p) {}
function f(p,) {}

(p) => {};
(p,) => {};
```

Trailing comma cũng hoạt động với [định nghĩa phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) cho lớp hoặc đối tượng:

```js-nolint
class C {
  one(a,) {}
  two(a, b,) {}
}

const obj = {
  one(a,) {},
  two(a, b,) {},
};
```

#### Lời gọi hàm

Các cặp lời gọi hàm sau là hợp lệ và tương đương nhau.

```js-nolint
f(p);
f(p,);

Math.max(10, 20);
Math.max(10, 20,);
```

#### Trailing comma không hợp lệ

Định nghĩa tham số hàm hoặc lời gọi hàm chỉ chứa dấu phẩy sẽ ném {{jsxref("SyntaxError")}}. Ngoài ra, khi dùng [rest parameter](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters), trailing comma không được phép:

```js-nolint example-bad
function f(,) {} // SyntaxError: missing formal parameter
(,) => {};       // SyntaxError: expected expression, got ','
f(,)             // SyntaxError: expected expression, got ','

function f(...p,) {} // SyntaxError: parameter after rest parameter
(...p,) => {}        // SyntaxError: expected closing parenthesis, got ','
```

### Trailing comma trong destructuring

Trailing comma cũng được phép trong [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) pattern:

```js-nolint
// array destructuring with trailing comma
[a, b,] = [1, 2];

// object destructuring with trailing comma
const o = {
  p: 42,
  q: true,
};
const { p, q, } = o;
```

Tuy nhiên, trailing comma không được phép sau rest element, nếu có

```js-nolint example-bad
const [a, ...b,] = [1, 2, 3];
// SyntaxError: rest element may not have a trailing comma
```

### Trailing comma trong JSON

Vì JSON dựa trên tập hợp cú pháp JavaScript rất hạn chế, **trailing comma không được phép trong JSON**.

Cả hai dòng này sẽ ném `SyntaxError`:

```js example-bad
JSON.parse("[1, 2, 3, 4, ]");
JSON.parse('{"foo" : 1, }');
// SyntaxError JSON.parse: unexpected character
// at line 1 column 14 of the JSON data
```

Bỏ trailing comma để phân tích cú pháp JSON đúng:

```js example-good
JSON.parse("[1, 2, 3, 4 ]");
JSON.parse('{"foo" : 1 }');
```

### Trailing comma trong named import và named export

Trailing comma hợp lệ trong [named import](/en-US/docs/Web/JavaScript/Reference/Statements/import#named_import) và [named export](/en-US/docs/Web/JavaScript/Reference/Statements/export).

#### Named import

```js-nolint
import {
  A,
  B,
  C,
} from "D";

import { X, Y, Z, } from "W";

import { A as B, C as D, E as F, } from "Z";
```

#### Named export

```js-nolint
export {
  A,
  B,
  C,
};

export { A, B, C, };

export { A as B, C as D, E as F, };
```

### Trailing comma trong dynamic import

Trailing comma chỉ được phép trong [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import) nếu runtime cũng triển khai tham số `options` thứ hai.

```js-nolint
import("D",);
import(
  "D",
  { with: { type: "json" } },
);
```

### Tiền tố quantifier

> [!NOTE]
> Trailing comma trong [quantifier](/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers) thực sự thay đổi ngữ nghĩa của nó từ khớp "chính xác `n`" thành khớp "ít nhất `n`".

```js
/x{2}/; // Exactly 2 occurrences of "x"; equivalent to /xx/
/x{2,}/; // At least 2 occurrences of "x"; equivalent to /xx+/
/x{2,4}/; // 2 to 4 occurrences of "x"; equivalent to /xxx?x?/
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Grammar and types](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types) guide
