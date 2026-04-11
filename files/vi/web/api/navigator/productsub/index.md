---
title: "Navigator: thuộc tính productSub"
short-title: productSub
slug: Web/API/Navigator/productSub
page-type: web-api-instance-property
browser-compat: api.Navigator.productSub
---

{{ ApiRef("HTML DOM") }}

Thuộc tính chỉ đọc **`Navigator.productSub`** trả về chuỗi "20030107" hoặc chuỗi "20100101".

## Giá trị

"20030107" hoặc "20100101".

## Ví dụ

```js
document.body.textContent = `productSub: ${navigator.productSub}`;
```

{{ EmbedLiveSample("Examples") }}

## Ghi chú

Trên IE, thuộc tính này trả về không xác định.

Trên Apple Safari và Google Chrome, thuộc tính này luôn trả về `20030107`.

Trên Firefox, thuộc tính này luôn trả về `20100101`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
