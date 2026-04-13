---
title: "VideoFrame: rotation property"
short-title: rotation
slug: Web/API/VideoFrame/rotation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.VideoFrame.rotation
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}{{SeeCompatTable}}

Thuộc tính **`rotation`** của giao diện {{domxref("VideoFrame")}} trả về góc xoay của khung hình video.

## Giá trị

Một số nguyên đại diện cho góc xoay (0, 90, 180, hoặc 270) tính bằng độ theo chiều kim đồng hồ. Mặc định là `0`. Các số tùy ý (bao gồm số âm) được làm tròn đến góc phần tư tiếp theo.

## Ví dụ

### Phát hiện khi video từ camera bị xoay

Với một luồng khung hình video từ camera, được lấy bằng {{domxref("MediaStreamTrackProcessor")}}, bạn có thể kiểm tra thuộc tính `rotation` trên các đối tượng `VideoFrame` để xem liệu các khung hình có bị xoay hay không.

```js
const stream = await navigator.mediaDevices.getUserMedia({ video: true });
const track = stream.getTracks()[0];

const trackProcessor = new MediaStreamTrackProcessor(track);

const reader = trackProcessor.readable.getReader();
while (true) {
  const result = await reader.read();
  if (result.done) break;
  const frameFromCamera = result.value;
  // Returns 0, 90, 180, or 270 indicating the frame's rotation
  console.log(frameFromCamera.rotation);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
