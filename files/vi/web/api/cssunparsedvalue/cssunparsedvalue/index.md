---
title: "CSSUnparsedValue: hàm khởi tạo CSSUnparsedValue()"
short-title: CSSUnparsedValue()
slug: Web/API/CSSUnparsedValue/CSSUnparsedValue
page-type: web-api-constructor
browser-compat: api.CSSUnparsedValue.CSSUnparsedValue
---

{{APIRef("CSS Typed OM")}}

Hàm khởi tạo **`CSSUnparsedValue()`** tạo một đối tượng {{domxref("CSSUnparsedValue")}} mới đại diện cho các giá trị thuộc tính tham chiếu đến các thuộc tính tùy chỉnh.

## Cú pháp

```js-nolint
new CSSUnparsedValue(members)
```

### Tham số

- `members`
  - : Một mảng có các giá trị phải là chuỗi hoặc {{domxref('CSSVariableReferenceValue')}}.

## Ví dụ

```js
const value = new CSSUnparsedValue(["4deg"]);
const values = new CSSUnparsedValue(["1em", "#445566", "-45px"]);

console.log(value); // CSSUnparsedValue {0: "4deg", length: 1}
console.log(values); // CSSUnparsedValue {0: "1em", 1: "#445566", 2: "-45px", length: 3}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSUnparsedValue.entries")}}
- {{domxref("CSSUnparsedValue.forEach")}}
- {{domxref("CSSUnparsedValue.keys")}}
- {{domxref("CSSUnparsedValue.length")}}
- {{domxref("CSSUnparsedValue.values")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
