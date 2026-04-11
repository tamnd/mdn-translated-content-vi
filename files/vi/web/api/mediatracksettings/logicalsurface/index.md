---
title: "MediaTrackSettings: logicalSurface property"
short-title: logicalSurface
slug: Web/API/MediaTrackSettings/logicalSurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.logicalSurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`logicalSurface`** của từ điển {{domxref("MediaTrackSettings")}} cho biết vùng hiển thị đang được chụp có phải là bề mặt logic hay không. Các bề mặt logic là những bề mặt không nhất thiết hoàn toàn hiển thị trên màn hình, hoặc thậm chí có thể nằm ngoài màn hình, chẳng hạn như các bộ đệm hỗ trợ của cửa sổ (nơi chỉ một phần bộ đệm hiển thị mà không cần cuộn cửa sổ chứa) và các bối cảnh kết xuất ngoài màn hình.

## Giá trị

Giá trị Boolean là `true` nếu rãnh video trong luồng video được chụp lấy từ một bề mặt hiển thị logic.

Tình huống phổ biến nhất mà bề mặt hiển thị có thể là bề mặt logic là nếu bề mặt được chọn chứa toàn bộ vùng nội dung của một cửa sổ quá lớn để hiển thị toàn bộ trên màn hình cùng một lúc. Vì cửa sổ chứa bề mặt phải được cuộn để hiển thị phần còn lại của nội dung, bề mặt đó là bề mặt logic.

Bề mặt hiển thị có thể nhìn thấy (tức là bề mặt mà `logicalSurface` trả về `false`) là phần của bề mặt hiển thị logic hiện đang hiển thị trên màn hình.

Ví dụ, một user agent có thể cho phép người dùng chọn xem có chia sẻ toàn bộ tài liệu (một `browser` với giá trị `logicalSurface` là `true`) hay chỉ phần hiện đang hiển thị của tài liệu (nơi `logicalSurface` của bề mặt `browser` là `false`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API)
- [Sử dụng API Ghi màn hình](/en-US/docs/Web/API/Screen_Capture_API/Using_Screen_Capture)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaDevices.getDisplayMedia()")}}
- {{domxref("MediaStreamTrack.getConstraints()")}}
- {{domxref("MediaStreamTrack.applyConstraints()")}}
- {{domxref("MediaStreamTrack.getSettings()")}}
