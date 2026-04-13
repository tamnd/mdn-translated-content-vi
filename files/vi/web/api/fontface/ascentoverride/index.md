---
title: "FontFace: thuộc tính ascentOverride"
short-title: ascentOverride
slug: Web/API/FontFace/ascentOverride
page-type: web-api-instance-property
browser-compat: api.FontFace.ascentOverride
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính **`ascentOverride`** của giao diện {{domxref("FontFace")}} trả về và đặt chỉ số ascent của font, tức chiều cao phía trên đường cơ sở mà CSS dùng để dàn xếp các line box trong ngữ cảnh định dạng inline.

Thuộc tính này tương đương với descriptor {{cssxref("@font-face/ascent-override")}} của {{cssxref("@font-face")}}.

## Giá trị

Một chuỗi. Các giá trị có thể là `normal` (nghĩa là lấy chỉ số từ file font) hoặc một phần trăm.

Thuộc tính này chấp nhận cùng giá trị với descriptor {{cssxref("@font-face/ascent-override")}}.

## Ví dụ

```js
let fontFace = new FontFace(
  "Roboto",
  'url("https://fonts.example.com/roboto.woff2")',
  { ascentOverride: "90%" },
);
console.log(fontFace.ascentOverride); // 90%
fontFace.ascentOverride = "normal";
console.log(fontFace.ascentOverride); // 'normal'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
