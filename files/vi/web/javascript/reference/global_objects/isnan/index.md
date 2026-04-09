---
title: isNaN()
slug: Web/JavaScript/Reference/Global_Objects/isNaN
page-type: javascript-function
browser-compat: javascript.builtins.isNaN
sidebar: jssidebar
---

Hàm **`isNaN()`** xác định xem một giá trị có phải là {{jsxref("NaN")}} không, trước tiên chuyển đổi giá trị thành số nếu cần. Vì việc ép kiểu bên trong hàm `isNaN()` có thể [gây bất ngờ](#mô_tả), bạn có thể thích dùng {{jsxref("Number.isNaN()")}} hơn.

{{InteractiveExample("JavaScript Demo: isNaN()")}}

```js interactive-example
function milliseconds(x) {
  if (isNaN(x)) {
    return "Not a Number!";
  }
  return x * 1000;
}

console.log(milliseconds("100F"));
// Expected output: "Not a Number!"

console.log(milliseconds("0.0314E+2"));
// Expected output: 3140
```

## Cú pháp

```js-nolint
isNaN(value)
```

### Tham số

- `value`
  - : Giá trị cần kiểm tra.

### Giá trị trả về

`true` nếu giá trị đã cho là {{jsxref("NaN")}} sau khi [chuyển đổi thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion); nếu không, `false`.

## Mô tả

`isNaN()` là thuộc tính hàm của đối tượng toàn cục.

Đối với các giá trị số, `isNaN()` kiểm tra xem số có phải là giá trị [`NaN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) không. Khi đối số của hàm `isNaN()` không thuộc kiểu [Number](/en-US/docs/Web/JavaScript/Guide/Data_structures#number_type), giá trị trước tiên bị ép thành số, và giá trị kết quả sau đó được so sánh với {{jsxref("NaN")}}.

Hành vi của `isNaN()` đối với các đối số không phải số có thể gây nhầm lẫn! Ví dụ, chuỗi rỗng bị ép thành 0, trong khi boolean bị ép thành 0 hoặc 1; cả hai giá trị về mặt trực quan đều "không phải là số", nhưng chúng không được đánh giá là `NaN`, vì vậy `isNaN()` trả về `false`. Do đó, `isNaN()` không trả lời câu hỏi "đầu vào có phải là giá trị {{jsxref("NaN")}} dấu phẩy động không" cũng không phải câu hỏi "đầu vào có không phải là số không".

{{jsxref("Number.isNaN()")}} là cách đáng tin cậy hơn để kiểm tra xem một giá trị có phải là giá trị số `NaN` không. Ngoài ra, biểu thức `x !== x` có thể được dùng, và cả hai giải pháp đều không gặp phải các kết quả dương tính giả làm cho `isNaN()` toàn cục không đáng tin. Để kiểm tra xem một giá trị có phải là số không, hãy dùng [`typeof x === "number"`](/en-US/docs/Web/JavaScript/Reference/Operators/typeof).

Hàm `isNaN()` trả lời câu hỏi "đầu vào có tương đương về mặt chức năng với {{jsxref("NaN")}} khi dùng trong ngữ cảnh số không". Nếu `isNaN(x)` trả về `false`, bạn có thể dùng `x` trong biểu thức số học như thể nó là số hợp lệ không phải `NaN`. Nếu `isNaN(x)` trả về `true`, `x` sẽ bị ép thành `NaN` và làm cho hầu hết các biểu thức số học trả về `NaN` (vì `NaN` lan truyền). Bạn có thể dùng điều này, ví dụ, để kiểm tra xem đối số của hàm có thể xử lý theo số học không (có thể dùng "như" số), và xử lý các giá trị không giống số bằng cách ném lỗi, cung cấp giá trị mặc định, v.v. Theo cách này, bạn có thể có hàm tận dụng đầy đủ tính linh hoạt mà JavaScript cung cấp bằng cách chuyển đổi ngầm các giá trị tùy thuộc vào ngữ cảnh.

> [!NOTE]
> [Toán tử `+`](/en-US/docs/Web/JavaScript/Reference/Operators/Addition) thực hiện cả cộng số và nối chuỗi. Do đó, ngay cả khi `isNaN()` trả về `false` cho cả hai toán hạng, toán tử `+` vẫn có thể trả về chuỗi, vì nó không được dùng như toán tử số học. Ví dụ, `isNaN("1")` trả về `false`, nhưng `"1" + 1` trả về `"11"`. Để chắc chắn rằng bạn đang làm việc với các số, hãy [ép kiểu giá trị thành số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion) và dùng {{jsxref("Number.isNaN()")}} để kiểm tra kết quả.

## Ví dụ

Lưu ý cách `isNaN()` trả về `true` cho các giá trị không phải là giá trị `NaN` nhưng cũng không phải là số:

```js
isNaN(NaN); // true
isNaN(undefined); // true
isNaN({}); // true

isNaN(true); // false
isNaN(null); // false
isNaN(37); // false

// Chuỗi
isNaN("37"); // false: "37" is converted to the number 37 which is not NaN
isNaN("37.37"); // false: "37.37" is converted to the number 37.37 which is not NaN
isNaN("37,5"); // true
isNaN("123ABC"); // true: Number("123ABC") is NaN
isNaN(""); // false: the empty string is converted to 0 which is not NaN
isNaN(" "); // false: a string with spaces is converted to 0 which is not NaN

// Ngày
isNaN(new Date()); // false; Date objects can be converted to a number (timestamp)
isNaN(new Date().toString()); // true; the string representation of a Date object cannot be parsed as a number

// Mảng
isNaN([]); // false; the primitive representation is "", which coverts to the number 0
isNaN([1]); // false; the primitive representation is "1"
isNaN([1, 2]); // true; the primitive representation is "1,2", which cannot be parsed as number
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("NaN")}}
- {{jsxref("Number.isNaN()")}}
