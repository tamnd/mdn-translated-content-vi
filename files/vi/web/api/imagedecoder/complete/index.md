---
title: "ImageDecoder: thuộc tính complete"
short-title: complete
slug: Web/API/ImageDecoder/complete
page-type: web-api-instance-property
browser-compat: api.ImageDecoder.complete
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`complete`** của giao diện {{domxref("ImageDecoder")}} trả về true nếu dữ liệu đã mã hóa đã hoàn thành việc lưu vào bộ đệm.

## Giá trị

Một {{jsxref("boolean")}}, `true` nếu việc lưu vào bộ đệm hoàn thành.

## Ví dụ

Ví dụ sau đây in giá trị của `complete` ra console.

```js
console.log(imageDecoder.complete);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
