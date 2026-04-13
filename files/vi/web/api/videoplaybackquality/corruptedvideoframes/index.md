---
title: "VideoPlaybackQuality: corruptedVideoFrames property"
short-title: corruptedVideoFrames
slug: Web/API/VideoPlaybackQuality/corruptedVideoFrames
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.VideoPlaybackQuality.corruptedVideoFrames
---

{{APIRef("HTML DOM")}}{{deprecated_header}}

Thuộc tính chỉ đọc **`corruptedVideoFrames`** của giao diện {{domxref("VideoPlaybackQuality")}} cho biết số khung hình video bị hỏng đã được nhận kể từ khi phần tử {{HTMLElement("video")}} được tải hoặc tải lại lần cuối.

## Giá trị

Số khung hình video bị hỏng đã được nhận kể từ khi phần tử {{HTMLElement("video")}} được tải hoặc tải lại lần cuối.

Tùy thuộc vào {{Glossary("user agent")}} để xác định xem có hiển thị khung hình video bị hỏng hay không. Nếu một khung hình bị hỏng bị bỏ, thì cả `corruptedVideoFrames` và {{domxref("VideoPlaybackQuality.droppedVideoFrames", "droppedVideoFrames")}} đều được tăng lên.

## Ví dụ

Ví dụ này xác định tỷ lệ phần trăm khung hình bị hỏng, và nếu giá trị lớn hơn 5%, sẽ gọi hàm `downgradeVideo()` để chuyển sang video ít tải mạng hơn.

```js
const videoElem = document.getElementById("my_vid");
const quality = videoElem.getVideoPlaybackQuality();

if (quality.corruptedVideoFrames / quality.totalVideoFrames > 0.05) {
  downgradeVideo(videoElem);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để xây dựng và trả về giao diện này
