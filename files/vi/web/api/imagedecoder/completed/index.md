---
title: "ImageDecoder: thuộc tính completed"
short-title: completed
slug: Web/API/ImageDecoder/completed
page-type: web-api-instance-property
browser-compat: api.ImageDecoder.completed
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`completed`** của giao diện {{domxref("ImageDecoder")}} trả về một promise được giải quyết khi dữ liệu đã mã hóa hoàn thành việc lưu vào bộ đệm.

## Giá trị

Một {{jsxref("Promise")}} được giải quyết với {{jsxref("undefined")}} khi {{domxref("ImageDecoder.complete")}} là `true`.

## Ví dụ

Trong ví dụ sau đây, giá trị của `completed` sẽ là `undefined` khi promise được giải quyết.

```js
let completed = await imageDecoder.completed;
console.log(completed);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
