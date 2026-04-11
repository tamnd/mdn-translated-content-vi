---
title: "TextMetrics: ideographicBaseline property"
short-title: ideographicBaseline
slug: Web/API/TextMetrics/ideographicBaseline
page-type: web-api-instance-property
browser-compat: api.TextMetrics.ideographicBaseline
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc `ideographicBaseline` của giao diện {{domxref("TextMetrics")}} là một `double` cho biết khoảng cách từ đường ngang được chỉ định bởi thuộc tính {{domxref("CanvasRenderingContext2D.textBaseline")}} đến đường cơ sở tượng hình (ideographic baseline) của hộp dòng, tính bằng pixel CSS.

## Ví dụ

```js
const canvas = document.createElement("canvas");
const ctx = canvas.getContext("2d");
const text = ctx.measureText("foo"); // trả về đối tượng TextMetrics

text.ideographicBaseline; // -1.201171875;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextMetrics")}}
