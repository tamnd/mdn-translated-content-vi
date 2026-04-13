---
title: "VideoPlaybackQuality: creationTime property"
short-title: creationTime
slug: Web/API/VideoPlaybackQuality/creationTime
page-type: web-api-instance-property
browser-compat: api.VideoPlaybackQuality.creationTime
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`creationTime`** của giao diện {{domxref("VideoPlaybackQuality")}} báo cáo số mili giây kể từ khi ngữ cảnh duyệt web được tạo cho đến khi mẫu chất lượng này được ghi lại.

## Giá trị

Một đối tượng {{domxref("DOMHighResTimeStamp")}} cho biết số mili giây trôi qua giữa thời điểm ngữ cảnh duyệt web được tạo và thời điểm mẫu chất lượng video này được lấy.

Để biết chi tiết về cách thời gian được xác định, xem {{domxref("Performance.now()")}}.

## Ví dụ

Ví dụ này gọi `getVideoPlaybackQuality()` để lấy đối tượng {{domxref("VideoPlaybackQuality")}}, sau đó xác định tỷ lệ phần trăm khung hình bị mất do bị hỏng hoặc bị bỏ. Nếu vượt quá 10% (0.1), hàm `lostFramesThresholdExceeded()` được gọi để cập nhật chỉ báo chất lượng.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để trả về các đối tượng `VideoPlaybackQuality`
