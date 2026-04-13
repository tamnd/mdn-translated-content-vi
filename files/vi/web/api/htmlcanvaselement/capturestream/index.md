---
title: "HTMLCanvasElement: captureStream() method"
short-title: captureStream()
slug: Web/API/HTMLCanvasElement/captureStream
page-type: web-api-instance-method
browser-compat: api.HTMLCanvasElement.captureStream
---

{{APIRef("Media Capture and Streams")}}

**`captureStream()`** của giao diện {{domxref("HTMLCanvasElement")}} trả về một {{domxref("MediaStream")}} chứa {{domxref("CanvasCaptureMediaStreamTrack")}} ghi lại nội dung canvas theo thời gian thực.

## Cú pháp

```js-nolint
captureStream()
captureStream(frameRate)
```

### Tham số

- `frameRate` {{optional_inline}}
  - : Giá trị số thực dấu phẩy động cho biết tốc độ bắt từng khung hình. Nếu không đặt, một khung hình mới sẽ được chụp mỗi khi canvas thay đổi; nếu đặt thành `0`, khung hình sẽ không được chụp tự động mà chỉ khi gọi {{domxref("CanvasCaptureMediaStreamTrack.requestFrame", "requestFrame()")}}.

### Giá trị trả về

Một tham chiếu tới đối tượng {{domxref("MediaStream")}}, trong đó có một {{domxref("CanvasCaptureMediaStreamTrack")}}.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu giá trị `frameRate` là số âm.
