---
title: "VideoFrame: flip property"
short-title: flip
slug: Web/API/VideoFrame/flip
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.VideoFrame.flip
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Thuộc tính **`flip`** của giao diện {{domxref("VideoFrame")}} trả về một boolean cho biết liệu `VideoFrame` có bị phản chiếu theo chiều ngang hay không.

## Giá trị

Một boolean. Nếu là `true`, phản chiếu theo chiều ngang được áp dụng. Mặc định là `false`.

## Ví dụ

### Phát hiện khi video từ camera bị phản chiếu

Với một luồng khung hình video từ camera, được lấy bằng {{domxref("MediaStreamTrackProcessor")}}, bạn có thể kiểm tra thuộc tính `flip` trên các đối tượng `VideoFrame` để xem liệu các khung hình có bị phản chiếu hay không.

```js
const stream = await navigator.mediaDevices.getUserMedia({ video: true });
const track = stream.getTracks()[0];

const trackProcessor = new MediaStreamTrackProcessor(track);

const reader = trackProcessor.readable.getReader();
while (true) {
  const result = await reader.read();
  if (result.done) break;
  const frameFromCamera = result.value;
  // Returns `true` if the frame is horizontally flipped
  console.log(frameFromCamera.flip);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
