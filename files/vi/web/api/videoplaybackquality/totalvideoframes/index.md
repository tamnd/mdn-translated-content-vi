---
title: "VideoPlaybackQuality: totalVideoFrames property"
short-title: totalVideoFrames
slug: Web/API/VideoPlaybackQuality/totalVideoFrames
page-type: web-api-instance-property
browser-compat: api.VideoPlaybackQuality.totalVideoFrames
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`totalVideoFrames`** của giao diện {{domxref("VideoPlaybackQuality")}} trả về tổng số khung hình video đã được hiển thị hoặc bị bỏ kể từ khi media được tải.

## Giá trị

Tổng số khung hình mà phần tử {{HTMLElement("video")}} đã hiển thị hoặc bị bỏ kể từ khi media được tải vào nó. Về cơ bản, đây là số khung hình mà phần tử _sẽ trình chiếu_ nếu không có vấn đề gì xảy ra.

Giá trị này được đặt lại khi media được tải lại hoặc thay thế.

## Ví dụ

Ví dụ này gọi {{domxref("HTMLVideoElement.getVideoPlaybackQuality", "getVideoPlaybackQuality()")}} để lấy đối tượng {{domxref("VideoPlaybackQuality")}}, sau đó xác định tỷ lệ phần trăm khung hình bị mất do bị hỏng hoặc bị bỏ. Nếu vượt quá 10% (0.1), hàm `lostFramesThresholdExceeded()` được gọi để cập nhật chỉ báo chất lượng.

```js
const videoElem = document.getElementById("my_vid");
const quality = videoElem.getVideoPlaybackQuality();

if (
  (quality.corruptedVideoFrames + quality.droppedVideoFrames) /
    quality.totalVideoFrames >
  0.1
) {
  lostFramesThresholdExceeded();
}
```

Một thuật toán tương tự có thể được dùng để thử chuyển sang video độ phân giải thấp hơn cần ít băng thông hơn, nhằm tránh bỏ khung hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để xây dựng và trả về giao diện này.
