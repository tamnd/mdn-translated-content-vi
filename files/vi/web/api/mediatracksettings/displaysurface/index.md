---
title: "MediaTrackSettings: displaySurface property"
short-title: displaySurface
slug: Web/API/MediaTrackSettings/displaySurface
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.displaySurface_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`displaySurface`** của từ điển {{domxref("MediaTrackSettings")}} cho biết loại bề mặt hiển thị đang được chụp.

## Giá trị

Giá trị của `displaySurface` là chuỗi đến từ kiểu liệt kê `DisplayCaptureSurfaceType`, và là một trong các giá trị sau:

- `browser`
  - : Rãnh video trong luồng trình bày toàn bộ nội dung của một tab trình duyệt đơn lẻ mà người dùng đã chọn trong lệnh gọi {{domxref("MediaDevices.getDisplayMedia","getDisplayMedia()")}}.
- `monitor`
  - : Rãnh video trong luồng trình bày nội dung đầy đủ của một hoặc nhiều màn hình của người dùng. Bất kỳ khoảng trống nào (nếu các màn hình có kích thước khác nhau) được điền bằng phông nền do user agent chọn.
- `window`
  - : Rãnh video trong luồng trình bày nội dung của một cửa sổ đơn lẻ mà người dùng đã chọn. Cửa sổ có thể từ bất kỳ ứng dụng nào, không nhất thiết chỉ từ trong user agent.

Không phải tất cả user agent đều hỗ trợ tất cả các loại bề mặt này.

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
