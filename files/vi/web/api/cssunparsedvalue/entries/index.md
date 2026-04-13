---
title: "CSSUnparsedValue: phương thức entries()"
short-title: entries()
slug: Web/API/CSSUnparsedValue/entries
page-type: web-api-instance-method
browser-compat: api.CSSUnparsedValue.entries
---

{{APIRef("CSS Typed OM")}}

Phương thức **`CSSUnparsedValue.entries()`** trả về một mảng các cặp thuộc tính `[key, value]` của đối tượng theo cùng thứ tự như trong vòng lặp {{jsxref("Statements/for...in", "for...in")}} (sự khác biệt là vòng lặp for-in cũng liệt kê các thuộc tính trong chuỗi nguyên mẫu).

## Cú pháp

```js-nolint
entries(obj)
```

### Tham số

- `obj`
  - : {{domxref('CSSUnparsedValue')}} có các cặp `[key, value]` thuộc tính có thể liệt kê cần được trả về.

### Giá trị trả về

Một mảng các cặp thuộc tính `[key, value]` có thể liệt kê của đối tượng `CSSUnparsedValue` đã cho.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}}
- {{domxref("CSSUnparsedValue.forEach")}}
- {{domxref("CSSUnparsedValue.keys")}}
- {{domxref("CSSUnparsedValue.length")}}
- {{domxref("CSSUnparsedValue.values")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
