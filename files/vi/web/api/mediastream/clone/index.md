---
title: "MediaStream: phương thức clone()"
short-title: clone()
slug: Web/API/MediaStream/clone
page-type: web-api-instance-method
browser-compat: api.MediaStream.clone
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`clone()`** của giao diện {{domxref("MediaStream")}} tạo một bản sao của `MediaStream`. Đối tượng `MediaStream` mới này có một {{domxref("MediaStream.id", "id")}} duy nhất mới và chứa các bản sao của mọi {{domxref("MediaStreamTrack")}} được chứa bởi `MediaStream` mà `clone()` được gọi.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Một thực thể {{domxref("MediaStream")}} mới có ID duy nhất mới và chứa các bản sao của mọi {{domxref("MediaStreamTrack")}} được chứa bởi `MediaStream` mà `clone()` được gọi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
