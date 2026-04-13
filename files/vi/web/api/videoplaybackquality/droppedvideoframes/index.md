---
title: "VideoPlaybackQuality: droppedVideoFrames property"
short-title: droppedVideoFrames
slug: Web/API/VideoPlaybackQuality/droppedVideoFrames
page-type: web-api-instance-property
browser-compat: api.VideoPlaybackQuality.droppedVideoFrames
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`droppedVideoFrames`** của giao diện {{domxref("VideoPlaybackQuality")}} trả về số khung hình video bị bỏ thay vì được hiển thị kể từ lần cuối media được tải vào {{domxref("HTMLVideoElement")}}.

## Giá trị

Một giá trị 64-bit không dấu cho biết số khung hình bị bỏ kể từ lần cuối media trong phần tử {{HTMLElement("video")}} được tải hoặc tải lại. Thông tin này có thể được dùng để xác định có nên hạ cấp luồng video để tránh bỏ khung hình hay không.

Các khung hình thường bị bỏ trước hoặc sau khi giải mã, khi xác định rằng không thể vẽ chúng lên màn hình đúng thời điểm.

## Ví dụ

Ví dụ này gọi {{domxref("HTMLVideoElement.getVideoPlaybackQuality", "getVideoPlaybackQuality()")}} để lấy đối tượng {{domxref("VideoPlaybackQuality")}}, sau đó xác định tỷ lệ phần trăm khung hình bị bỏ. Giá trị đó được hiển thị trong một phần tử để tham khảo của người dùng.

```js
const videoElem = document.getElementById("my_vid");
const percentElem = document.getElementById("percent");
const quality = videoElem.getVideoPlaybackQuality();

const dropPercent =
  (quality.droppedVideoFrames / quality.totalVideoFrames) * 100;
percentElem.innerText = Math.trunc(dropPercent).toString(10);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("HTMLVideoElement.getVideoPlaybackQuality()")}} để tạo và trả về các đối tượng `VideoPlaybackQuality`
