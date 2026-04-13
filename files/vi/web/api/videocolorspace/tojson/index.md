---
title: "VideoColorSpace: toJSON() method"
short-title: toJSON()
slug: Web/API/VideoColorSpace/toJSON
page-type: web-api-instance-method
browser-compat: api.VideoColorSpace.toJSON
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`toJSON()`** của giao diện {{domxref("VideoColorSpace")}} là _serializer_ trả về biểu diễn JSON của đối tượng `VideoColorSpace`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Đối tượng JSON.

## Ví dụ

Trong ví dụ sau, `colorSpace` là đối tượng `VideoColorSpace` được trả về từ {{domxref("VideoFrame")}}. Đối tượng này sau đó được in ra console dưới dạng JSON.

```js
let colorSpace = VideoFrame.colorSpace;
console.log(colorSpace.toJSON());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
