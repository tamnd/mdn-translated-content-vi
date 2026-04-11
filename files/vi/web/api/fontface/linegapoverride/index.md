---
title: "FontFace: thuộc tính lineGapOverride"
short-title: lineGapOverride
slug: Web/API/FontFace/lineGapOverride
page-type: web-api-instance-property
browser-compat: api.FontFace.lineGapOverride
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính **`lineGapOverride`** của giao diện {{domxref("FontFace")}} trả về và đặt giá trị của descriptor {{cssxref("@font-face/line-gap-override")}}. Các giá trị có thể là `normal` (lấy chỉ số từ file font) hoặc một phần trăm.

## Giá trị

Một chuỗi.

## Ví dụ

```js
let fontFace = new FontFace(
  "Roboto",
  'url("https://fonts.example.com/roboto.woff2")',
  { lineGapOverride: "90%" },
);
console.log(fontFace.lineGapOverride); // 90%
fontFace.lineGapOverride = "normal";
console.log(fontFace.lineGapOverride); // 'normal'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
