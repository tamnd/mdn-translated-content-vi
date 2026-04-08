---
title: Intl.NumberFormat.prototype.formatRange()
short-title: formatRange()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/formatRange
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.NumberFormat.formatRange
sidebar: jsref
---

Phương thức **`formatRange()`** của các instance {{jsxref("Intl.NumberFormat")}} định dạng một khoảng số theo locale và tùy chọn định dạng của đối tượng `Intl.NumberFormat` này.

## Cú pháp

```js-nolint
formatRange(startRange, endRange)
```

### Tham số

- `startRange`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng. Chuỗi được phân tích cú pháp theo cách tương tự như trong [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), ngoại trừ `formatRange()` sẽ dùng giá trị chính xác mà chuỗi đại diện, tránh mất độ chính xác trong quá trình chuyển đổi ngầm định thành số.
- `endRange`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng.

### Giá trị trả về

Chuỗi đại diện cho khoảng số đã cho được định dạng theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.NumberFormat")}} này. Nếu giá trị đầu và cuối được định dạng thành cùng một chuỗi, đầu ra sẽ chỉ chứa một giá trị duy nhất, có thể được thêm tiền tố ký hiệu "xấp xỉ bằng" (ví dụ: "~$3"). Việc chèn ký hiệu này chỉ phụ thuộc vào cài đặt locale và được chèn ngay cả khi `startRange === endRange`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `startRange` hoặc `endRange` là `NaN` hoặc chuỗi không thể chuyển đổi.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `startRange` hoặc `endRange` là undefined.

## Mô tả

Hàm getter `formatRange` định dạng một khoảng số thành chuỗi theo locale và tùy chọn định dạng của đối tượng {{jsxref("Intl.NumberFormat")}} mà nó được gọi từ đó.

## Ví dụ

### Sử dụng formatRange

Dùng hàm getter `formatRange` để định dạng một khoảng giá trị tiền tệ:

```js
const nf = new Intl.NumberFormat("en-US", {
  style: "currency",
  currency: "USD",
  maximumFractionDigits: 0,
});

console.log(nf.formatRange(3, 5)); // "$3 – $5"

// Note: the "approximately equals" symbol is added if
// startRange and endRange round to the same values.
console.log(nf.formatRange(2.9, 3.1)); // "~$3"
```

```js
const nf = new Intl.NumberFormat("es-ES", {
  style: "currency",
  currency: "EUR",
  maximumFractionDigits: 0,
});

console.log(nf.formatRange(3, 5)); // "3-5 €"
console.log(nf.formatRange(2.9, 3.1)); // "~3 €"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Number.prototype.toLocaleString()")}}
