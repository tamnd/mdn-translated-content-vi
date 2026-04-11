---
title: "FontFace: thuộc tính family"
short-title: family
slug: Web/API/FontFace/family
page-type: web-api-instance-property
browser-compat: api.FontFace.family
---

{{APIRef("CSS Font Loading API")}}{{AvailableInWorkers}}

Thuộc tính **`FontFace.family`** cho phép lấy hoặc đặt họ font của đối tượng {{domxref("FontFace")}}.

Giá trị này được dùng để khớp tên với font face cụ thể khi áp dụng kiểu cho phần tử bằng thuộc tính {{cssxref("font-family")}}. Có thể dùng bất kỳ tên nào, tên này sẽ ghi đè lên tên được chỉ định trong dữ liệu font gốc.

Thuộc tính này tương đương với descriptor {{cssxref("@font-face/font-family", "font-family")}} của {{cssxref("@font-face")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
let fontFace = new FontFace(
  "Roboto",
  'url("https://fonts.example.com/roboto.woff2")',
);
console.log(fontFace.family); // 'Roboto'

fontFace.family = "newRoboto";
console.log(fontFace.family); // 'newRoboto'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
