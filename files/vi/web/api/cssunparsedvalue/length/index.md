---
title: "CSSUnparsedValue: thuộc tính length"
short-title: length
slug: Web/API/CSSUnparsedValue/length
page-type: web-api-instance-property
browser-compat: api.CSSUnparsedValue.length
---

{{APIRef("CSS Typed OM")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("CSSUnparsedValue")}} trả về số lượng mục trong đối tượng.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ này, chúng ta sử dụng hàm khởi tạo {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}} rồi truy vấn độ dài:

```js
const values = new CSSUnparsedValue(["1em", "#445566", "-45px"]);

console.log(values.length); // 3
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}}
- {{domxref("CSSUnparsedValue.entries")}}
- {{domxref("CSSUnparsedValue.forEach")}}
- {{domxref("CSSUnparsedValue.keys")}}
- {{domxref("CSSUnparsedValue.values")}}
- [Sử dụng CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
