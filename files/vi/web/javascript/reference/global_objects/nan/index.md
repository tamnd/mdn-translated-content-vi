---
title: NaN
slug: Web/JavaScript/Reference/Global_Objects/NaN
page-type: javascript-global-property
browser-compat: javascript.builtins.NaN
sidebar: jssidebar
---

Thuộc tính toàn cục **`NaN`** là một giá trị đại diện cho Not-A-Number (Không phải số).

{{InteractiveExample("JavaScript Demo: NaN")}}

```js interactive-example
function sanitize(x) {
  if (isNaN(x)) {
    return NaN;
  }
  return x;
}

console.log(sanitize("1"));
// Expected output: "1"

console.log(sanitize("NotANumber"));
// Expected output: NaN
```

## Giá trị

Cùng giá trị số với {{jsxref("Number.NaN")}}.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

`NaN` là một thuộc tính của _đối tượng toàn cục_. Nói cách khác, nó là một biến trong phạm vi toàn cục.

Trong các trình duyệt hiện đại, `NaN` là một thuộc tính không thể cấu hình và không thể ghi. Ngay cả khi điều này không phải là trường hợp, hãy tránh ghi đè lên nó.

Có năm loại thao tác khác nhau trả về `NaN`:

- Chuyển đổi số thất bại (ví dụ: chuyển đổi tường minh như `parseInt("blabla")`, `Number(undefined)`, hoặc chuyển đổi ngầm như `Math.abs(undefined)`)
- Thao tác toán học mà kết quả không phải là số thực (ví dụ: `Math.sqrt(-1)`)
- Dạng bất định (ví dụ: `0 * Infinity`, `1 ** Infinity`, `Infinity / Infinity`, `Infinity - Infinity`)
- Một phương thức hoặc biểu thức mà toán hạng của nó là hoặc bị ép kiểu thành `NaN` (ví dụ: `7 ** NaN`, `7 * "blabla"`) — điều này có nghĩa là `NaN` có tính lây lan
- Các trường hợp khác khi một giá trị không hợp lệ được biểu diễn dưới dạng số (ví dụ: một [Date](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) không hợp lệ `new Date("blabla").getTime()`, `"".charCodeAt(1)`)

`NaN` và các hành vi của nó không phải do JavaScript phát minh ra. Ngữ nghĩa của nó trong số học dấu phẩy động (bao gồm cả `NaN !== NaN`) được quy định bởi [IEEE 754](https://en.wikipedia.org/wiki/Double_precision_floating-point_format). Các hành vi của `NaN` bao gồm:

- Nếu `NaN` tham gia vào một thao tác toán học (nhưng không phải [toán tử bitwise](/en-US/docs/Web/JavaScript/Reference/Operators#bitwise_shift_operators)), kết quả thường cũng là `NaN`. (Xem [ví dụ phản chứng](#silently_escaping_nan) bên dưới.)
- Khi `NaN` là một trong các toán hạng của bất kỳ so sánh quan hệ nào (`>`, `<`, `>=`, `<=`), kết quả luôn là `false`.
- `NaN` được so sánh là không bằng (thông qua [`==`](/en-US/docs/Web/JavaScript/Reference/Operators/Equality), [`!=`](/en-US/docs/Web/JavaScript/Reference/Operators/Inequality), [`===`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality), và [`!==`](/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality)) với bất kỳ giá trị nào khác — kể cả một giá trị `NaN` khác.

`NaN` cũng là một trong các giá trị [falsy](/en-US/docs/Glossary/Falsy) trong JavaScript.

## Ví dụ

### Kiểm tra với NaN

Để xác định xem một giá trị có phải là `NaN` không, hãy dùng {{jsxref("Number.isNaN()")}} hoặc {{jsxref("isNaN()")}} để xác định rõ ràng nhất liệu một giá trị có phải là `NaN` không — hoặc, vì `NaN` là giá trị duy nhất được so sánh là không bằng chính nó, bạn có thể thực hiện so sánh với chính nó như `x !== x`.

```js
NaN === NaN; // false
Number.NaN === NaN; // false
isNaN(NaN); // true
isNaN(Number.NaN); // true
Number.isNaN(NaN); // true

function valueIsNaN(v) {
  return v !== v;
}
valueIsNaN(1); // false
valueIsNaN(NaN); // true
valueIsNaN(Number.NaN); // true
```

Tuy nhiên, hãy lưu ý sự khác biệt giữa `isNaN()` và `Number.isNaN()`: hàm trước sẽ trả về `true` nếu giá trị hiện tại là `NaN`, hoặc nếu nó sẽ trở thành `NaN` sau khi bị ép kiểu thành số, trong khi hàm sau chỉ trả về `true` nếu giá trị hiện tại là `NaN`:

```js
isNaN("hello world"); // true
Number.isNaN("hello world"); // false
```

Vì lý do tương tự, sử dụng giá trị BigInt sẽ ném ra lỗi với `isNaN()` nhưng không ném với `Number.isNaN()`:

```js
isNaN(1n); // TypeError: Conversion from 'BigInt' to 'number' is not allowed.
Number.isNaN(1n); // false
```

Ngoài ra, một số phương thức mảng không thể tìm thấy `NaN`, trong khi một số khác có thể. Cụ thể, các phương thức tìm kiếm theo chỉ mục ({{jsxref("Array/indexOf", "indexOf()")}}, {{jsxref("Array/lastIndexOf", "lastIndexOf()")}}) không thể tìm thấy `NaN`, trong khi các phương thức tìm kiếm theo giá trị ({{jsxref("Array/includes", "includes()")}}) có thể:

```js
const arr = [2, 4, NaN, 12];
arr.indexOf(NaN); // -1
arr.includes(NaN); // true

// Methods accepting a properly defined predicate can always find NaN
arr.findIndex((n) => Number.isNaN(n)); // 2
```

Để biết thêm thông tin về `NaN` và cách so sánh của nó, xem [So sánh bằng và đồng nhất](/en-US/docs/Web/JavaScript/Guide/Equality_comparisons_and_sameness).

### Các giá trị NaN có thể phân biệt được

Có thể tạo ra hai số dấu phẩy động với các biểu diễn nhị phân khác nhau nhưng cả hai đều là `NaN`, vì trong [mã hóa IEEE 754](https://en.wikipedia.org/wiki/NaN#Floating_point), bất kỳ số dấu phẩy động nào có số mũ `0x7ff` và phần định trị khác không đều là `NaN`. Trong JavaScript, bạn có thể thực hiện thao tác ở cấp bit bằng cách sử dụng [typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays).

```js
const f2b = (x) => new Uint8Array(new Float64Array([x]).buffer);
const b2f = (x) => new Float64Array(x.buffer)[0];
// Get a byte representation of NaN
const n = f2b(NaN);
const m = f2b(NaN);
// Change the sign bit, which doesn't matter for NaN
n[7] += 2 ** 7;
// n[0] += 2**7; for big endian processors
const nan2 = b2f(n);
console.log(nan2); // NaN
console.log(Object.is(nan2, NaN)); // true
console.log(f2b(NaN)); // Uint8Array(8) [0, 0, 0, 0, 0, 0, 248, 127]
console.log(f2b(nan2)); // Uint8Array(8) [0, 0, 0, 0, 0, 0, 248, 255]
// Change the first bit, which is the least significant bit of the mantissa and doesn't matter for NaN
m[0] = 1;
// m[7] = 1; for big endian processors
const nan3 = b2f(m);
console.log(nan3); // NaN
console.log(Object.is(nan3, NaN)); // true
console.log(f2b(NaN)); // Uint8Array(8) [0, 0, 0, 0, 0, 0, 248, 127]
console.log(f2b(nan3)); // Uint8Array(8) [1, 0, 0, 0, 0, 0, 248, 127]
```

### Thoát khỏi NaN một cách im lặng

`NaN` lan truyền qua các thao tác toán học, vì vậy thông thường chỉ cần kiểm tra `NaN` một lần ở cuối phép tính để phát hiện các điều kiện lỗi. Trường hợp duy nhất mà `NaN` thoát khỏi một cách im lặng là khi sử dụng [lũy thừa](/en-US/docs/Web/JavaScript/Reference/Operators/Exponentiation) với số mũ là `0`, lập tức trả về `1` mà không kiểm tra giá trị của cơ số.

```js
NaN ** 0 === 1; // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.NaN")}}
- {{jsxref("Number.isNaN()")}}
- {{jsxref("isNaN()")}}
