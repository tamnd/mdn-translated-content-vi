---
title: "TextMetrics: actualBoundingBoxDescent property"
short-title: actualBoundingBoxDescent
slug: Web/API/TextMetrics/actualBoundingBoxDescent
page-type: web-api-instance-property
browser-compat: api.TextMetrics.actualBoundingBoxDescent
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `actualBoundingBoxDescent` của giao diện {{domxref("TextMetrics")}} là một `double` cho biết khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đáy của hình chữ nhật bao quanh dùng để hiển thị văn bản, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.actualBoundingBoxDescent; // 0;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
