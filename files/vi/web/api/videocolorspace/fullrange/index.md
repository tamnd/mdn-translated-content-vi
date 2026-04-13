---
title: "VideoColorSpace: fullRange property"
short-title: fullRange
slug: Web/API/VideoColorSpace/fullRange
page-type: web-api-instance-property
browser-compat: api.VideoColorSpace.fullRange
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`fullRange`** của giao diện {{domxref("VideoColorSpace")}} trả về `true` nếu các giá trị màu đầy đủ dải được sử dụng.

## Giá trị

Giá trị {{jsxref("Boolean")}}, `true` nếu các giá trị màu đầy đủ dải được sử dụng.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Giá trị của `fullRange` được in ra console.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace.fullRange);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
