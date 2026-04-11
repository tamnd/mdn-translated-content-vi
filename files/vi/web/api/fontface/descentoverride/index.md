---
title: "FontFace: thuộc tính descentOverride"
short-title: descentOverride
slug: Web/API/FontFace/descentOverride
page-type: web-api-instance-property
browser-compat: api.FontFace.descentOverride
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính **`descentOverride`** của giao diện {{domxref("FontFace")}} trả về và đặt giá trị của descriptor {{cssxref("@font-face/descent-override")}}. Các giá trị có thể là `normal` (lấy chỉ số từ file font) hoặc một phần trăm.

## Giá trị

Một chuỗi.

## Ví dụ

```js
let fontFace = new FontFace(
  "Roboto",
  'url("https://fonts.example.com/roboto.woff2")',
  { descentOverride: "90%" },
);
console.log(fontFace.descentOverride); // 90%
fontFace.descentOverride = "normal";
console.log(fontFace.descentOverride); // 'normal'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
