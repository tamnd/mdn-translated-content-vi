---
title: "VideoFrame: clone() method"
short-title: clone()
slug: Web/API/VideoFrame/clone
page-type: web-api-instance-method
browser-compat: api.VideoFrame.clone
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`clone()`** của giao diện {{domxref("VideoFrame")}} tạo một đối tượng `VideoFrame` mới tham chiếu đến cùng tài nguyên media với bản gốc.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("VideoFrame")}} đã được nhân bản mới.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu đối tượng `VideoFrame` đã được [chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Ví dụ

Ví dụ sau nhân bản một bản sao của `VideoFrame` thành `videoFrame2`.

```js
let videoFrame2 = VideoFrame.clone();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
