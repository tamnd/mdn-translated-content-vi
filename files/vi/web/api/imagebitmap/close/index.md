---
title: "ImageBitmap: close() method"
short-title: close()
slug: Web/API/ImageBitmap/close
page-type: web-api-instance-method
browser-compat: api.ImageBitmap.close
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Phương thức **`ImageBitmap.close()`** giải phóng tất cả tài nguyên đồ họa liên kết với một `ImageBitmap`.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const offscreen = new OffscreenCanvas(256, 256);
const gl = offscreen.getContext("webgl");

// Thực hiện một số thao tác vẽ bằng ngữ cảnh gl

const bitmap = offscreen.transferToImageBitmap();
// ImageBitmap { width: 256, height: 256 }

bitmap.close();
// ImageBitmap { width: 0, height: 0 } — đã được giải phóng
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này, {{domxref("ImageBitmap")}}.
