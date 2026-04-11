---
title: "MediaSource: removeSourceBuffer() method"
short-title: removeSourceBuffer()
slug: Web/API/MediaSource/removeSourceBuffer
page-type: web-api-instance-method
browser-compat: api.MediaSource.removeSourceBuffer
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`removeSourceBuffer()`** của giao diện {{domxref("MediaSource")}} xóa {{domxref("SourceBuffer")}} đã cho khỏi {{domxref("SourceBufferList")}} được liên kết với đối tượng `MediaSource` này.

## Cú pháp

```js-nolint
removeSourceBuffer(sourceBuffer)
```

### Tham số

- `sourceBuffer`
  - : Đối tượng {{domxref("SourceBuffer")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Ném ra nếu sourceBuffer được cung cấp không tồn tại trong {{domxref("MediaSource.sourceBuffers")}}.

## Ví dụ

```js
for (let i = 0; i < 10; i++) {
  const sourceBuffer = mediaSource.addSourceBuffer(mimeCodec);
}

mediaSource.removeSourceBuffer(mediaSource.sourceBuffers[0]);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer")}}
- {{domxref("SourceBufferList")}}
