---
title: "MediaTrackSettings: volume property"
short-title: volume
slug: Web/API/MediaTrackSettings/volume
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MediaStreamTrack.applyConstraints.volume_constraint
---

{{APIRef("Media Capture and Streams")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính **`volume`** của từ điển {{domxref("MediaTrackSettings")}} là số thực dấu phẩy động độ chính xác kép cho biết âm lượng của {{domxref("MediaStreamTrack")}} theo cấu hình hiện tại, với giá trị từ 0.0 (im lặng) đến 1.0 (âm lượng tối đa được hỗ trợ cho thiết bị). Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.volume")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.volume")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Số thực dấu phẩy động độ chính xác kép cho biết âm lượng, từ 0.0 đến 1.0, của rãnh âm thanh theo cấu hình hiện tại.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.volume")}}
- {{domxref("MediaTrackSettings")}}
