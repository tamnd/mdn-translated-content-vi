---
title: "CSSNumericValue: type() method"
short-title: type()
slug: Web/API/CSSNumericValue/type
page-type: web-api-instance-method
browser-compat: api.CSSNumericValue.type
---

{{APIRef("CSS Typed OM")}}

Phương thức **`type()`** của giao diện {{domxref("CSSNumericValue")}} trả về kiểu của `CSSNumericValue`, một trong các giá trị: `angle`, `flex`, `frequency`, `length`, `resolution`, `percent`, `percentHint`, hoặc `time`.

## Cú pháp

```js-nolint
type()
```

### Tham số

Không có.

### Giá trị trả về

Một từ điển `CSSNumericType`, chứa các thuộc tính sau:

- `length`
- `angle`
- `time`
- `frequency`
- `resolution`
- `flex`
- `percent`
- `percentHint`

Với mỗi thuộc tính ngoại trừ `percentHint`, giá trị là một số nguyên biểu thị lũy thừa của đơn vị đó. Ví dụ, giá trị số `calc(1px * 1em)` sẽ trả về `{ length: 2 }`.

Thuộc tính `percentHint` là một chuỗi cho biết kiểu giá trị mà phần trăm được áp dụng vào. Giá trị chuỗi giống với các thuộc tính kiểu: `"length"`, `"angle"`, `"time"`, `"frequency"`, `"resolution"`, `"flex"`, hoặc `"percent"`. Nó cho biết kiểu thực sự chứa một phần trăm, nhưng phần trăm đó sẽ cuối cùng được phân giải về kiểu cơ sở được gợi ý, vì vậy đã được thay thế trong kiểu.

### Ngoại lệ

Không có.

## Ví dụ

```js
let mathSum = CSS.px("23")
  .sub(CSS.percent("4"))
  .sub(CSS.cm("3"))
  .sub(CSS.in("9"));
// Trả về một đối tượng có cấu trúc: {length: 1, percentHint: "length"}
let cssNumericType = mathSum.type();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
