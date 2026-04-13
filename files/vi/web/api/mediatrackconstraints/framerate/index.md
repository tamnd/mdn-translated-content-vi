---
title: "MediaTrackConstraints: frameRate property"
short-title: frameRate
slug: Web/API/MediaTrackConstraints/frameRate
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.frameRate_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`frameRate`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.frameRate", "frameRate")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.frameRate")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

[`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) mô tả các giá trị có thể chấp nhận hoặc bắt buộc cho tốc độ khung hình của rãnh video, tính bằng khung hình mỗi giây.

Nếu giá trị này là một số, user agent sẽ cố gắng lấy phương tiện có tốc độ khung hình gần nhất với số này trong khả năng của phần cứng và các ràng buộc khác được chỉ định. Nếu không, giá trị của [`ConstrainDouble`](/en-US/docs/Web/API/MediaTrackConstraints#constraindouble) này sẽ hướng dẫn user agent trong nỗ lực cung cấp kết quả khớp chính xác với tốc độ khung hình yêu cầu (nếu `exact` được chỉ định hoặc cả `min` và `max` được cung cấp và có cùng giá trị) hoặc giá trị tốt nhất có thể.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
