---
title: "MediaTrackConstraints: noiseSuppression property"
short-title: noiseSuppression
slug: Web/API/MediaTrackConstraints/noiseSuppression
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.noiseSuppression_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`noiseSuppression`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainBoolean`](/en-US/docs/Web/API/MediaTrackConstraints#constrainboolean) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.noiseSuppression","noiseSuppression")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.noiseSuppression")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Triệt tiếng ồn thường được cung cấp bởi micro, mặc dù nó cũng có thể được cung cấp bởi các nguồn đầu vào khác.

## Giá trị

Nếu giá trị này là `true` hoặc `false` đơn giản, user agent sẽ cố gắng lấy phương tiện với triệt tiếng ồn được bật hoặc tắt như đã chỉ định, nếu có thể, nhưng sẽ không thất bại nếu không thể thực hiện. Nếu thay vào đó, giá trị được đưa ra dưới dạng đối tượng với trường `exact`, giá trị Boolean của trường đó chỉ ra cài đặt bắt buộc cho tính năng triệt tiếng ồn; nếu không thể đáp ứng, yêu cầu sẽ dẫn đến lỗi.

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
