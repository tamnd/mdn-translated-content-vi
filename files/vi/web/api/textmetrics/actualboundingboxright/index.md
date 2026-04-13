---
title: "TextMetrics: actualBoundingBoxRight property"
short-title: actualBoundingBoxRight
slug: Web/API/TextMetrics/actualBoundingBoxRight
page-type: web-api-instance-property
browser-compat: api.TextMetrics.actualBoundingBoxRight
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `actualBoundingBoxRight` của giao diện {{domxref("TextMetrics")}} là một `double` cho biết khoảng cách từ điểm căn chỉnh do thuộc tính {{domxref("CanvasRenderingContext2D.textAlign")}} xác định đến cạnh phải của hình chữ nhật bao quanh văn bản đã cho, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.actualBoundingBoxRight; // 15.633333333333333;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
