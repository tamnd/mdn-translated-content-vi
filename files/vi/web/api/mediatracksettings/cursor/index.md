---
title: "MediaTrackSettings: cursor property"
short-title: cursor
slug: Web/API/MediaTrackSettings/cursor
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.cursor_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`cursor`** của từ điển {{domxref("MediaTrackSettings")}} cho biết con trỏ chuột có nên được chụp như một phần của rãnh video trong {{domxref("MediaStream")}} được trả về bởi {{domxref("MediaDevices.getDisplayMedia", "getDisplayMedia()")}} hay không.

## Giá trị

Giá trị của `cursor` đến từ kiểu liệt kê chuỗi `CursorCaptureConstraint`, và có thể là một trong các giá trị sau:

- `always`
  - : Con trỏ chuột phải luôn hiển thị trong nội dung video của {{domxref("MediaStream")}}, trừ khi con trỏ chuột đã di chuyển ra ngoài vùng nội dung.
- `motion`
  - : Con trỏ chuột phải luôn được đưa vào video nếu nó đang di chuyển, và trong một khoảng thời gian ngắn sau khi dừng di chuyển.
- `never`
  - : Con trỏ chuột không bao giờ được đưa vào video chia sẻ.

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
