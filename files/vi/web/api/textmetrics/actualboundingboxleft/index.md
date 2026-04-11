---
title: "TextMetrics: actualBoundingBoxLeft property"
short-title: actualBoundingBoxLeft
slug: Web/API/TextMetrics/actualBoundingBoxLeft
page-type: web-api-instance-property
browser-compat: api.TextMetrics.actualBoundingBoxLeft
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `actualBoundingBoxLeft` của giao diện {{domxref("TextMetrics")}} là một `double` cho biết khoảng cách song song với đường cơ sở từ điểm căn chỉnh do thuộc tính {{domxref("CanvasRenderingContext2D.textAlign")}} xác định đến cạnh trái của hình chữ nhật bao quanh văn bản đã cho, tính bằng pixel CSS; số dương cho biết khoảng cách về bên trái từ điểm căn chỉnh đã cho.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.actualBoundingBoxLeft; // 0;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
