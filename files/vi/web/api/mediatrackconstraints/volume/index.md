---
title: "MediaTrackConstraints: volume property"
short-title: volume
slug: Web/API/MediaTrackConstraints/volume
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.MediaStreamTrack.applyConstraints.volume_constraint
---

{{APIRef("Media Capture and Streams")}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính **`volume`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.volume", "volume")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.volume")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

[`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các giá trị có thể chấp nhận hoặc bắt buộc cho âm lượng của rãnh âm thanh, trên thang đo tuyến tính trong đó 0.0 có nghĩa là im lặng và 1.0 là âm lượng cao nhất được hỗ trợ.

Nếu giá trị này là một số, user agent sẽ cố gắng lấy phương tiện có âm lượng gần nhất với số này trong khả năng của phần cứng và các ràng buộc khác được chỉ định. Nếu không, giá trị của [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) này sẽ hướng dẫn user agent trong nỗ lực cung cấp kết quả khớp chính xác với âm lượng yêu cầu (nếu `exact` được chỉ định hoặc cả `min` và `max` được cung cấp và có cùng giá trị) hoặc giá trị tốt nhất có thể.

Bất kỳ tập hợp ràng buộc nào chỉ cho phép các giá trị nằm ngoài phạm vi 0.0 đến 1.0 không thể được đáp ứng và sẽ dẫn đến thất bại.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
