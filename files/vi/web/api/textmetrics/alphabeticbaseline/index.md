---
title: "TextMetrics: alphabeticBaseline property"
short-title: alphabeticBaseline
slug: Web/API/TextMetrics/alphabeticBaseline
page-type: web-api-instance-property
browser-compat: api.TextMetrics.alphabeticBaseline
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `alphabeticBaseline` của giao diện {{domxref("TextMetrics")}} là một `double` cho biết khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đường cơ sở chữ cái (alphabetic baseline) của hộp dòng, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.alphabeticBaseline; // -0;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
