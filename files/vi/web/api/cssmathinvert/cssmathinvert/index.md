---
title: "CSSMathInvert: hàm khởi tạo CSSMathInvert()"
short-title: CSSMathInvert()
slug: Web/API/CSSMathInvert/CSSMathInvert
page-type: web-api-constructor
browser-compat: api.CSSMathInvert.CSSMathInvert
---

{{APIRef("CSS Typed Object Model API")}}

Hàm khởi tạo **`CSSMathInvert()`** tạo một đối tượng {{domxref("CSSMathInvert")}} mới biểu thị một CSS {{CSSXref('calc','calc()')}} được sử dụng dưới dạng `calc(1 / value)`.

## Cú pháp

```js-nolint
new CSSMathInvert(arg)
```

### Tham số

- `arg`
  - : Một {{domxref('CSSNumericValue')}}.

### Ngoại lệ

- [`RangeError`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RangeError)
  - : Được ném ra nếu arg là 0 hoặc -0.

## Ví dụ

Sẽ được thêm.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
