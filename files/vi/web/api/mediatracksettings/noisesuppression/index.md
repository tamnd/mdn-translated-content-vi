---
title: "MediaTrackSettings: noiseSuppression property"
short-title: noiseSuppression
slug: Web/API/MediaTrackSettings/noiseSuppression
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.noiseSuppression_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`noiseSuppression`** của từ điển {{domxref("MediaTrackSettings")}} là giá trị Boolean cho biết công nghệ triệt tiếng ồn có được bật trên rãnh âm thanh hay không. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.noiseSuppression")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Triệt tiếng ồn tự động lọc âm thanh để loại bỏ tiếng ồn nền, tiếng vo ve do thiết bị gây ra, và tương tự từ âm thanh trước khi cung cấp cho mã của bạn. Tính năng này thường được sử dụng trên micro, mặc dù về mặt kỹ thuật nó cũng có thể được cung cấp bởi các nguồn đầu vào khác.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.noiseSuppression")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị Boolean là `true` nếu rãnh đầu vào có triệt tiếng ồn được bật hoặc `false` nếu AGC bị tắt.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.noiseSuppression")}}
- {{domxref("MediaTrackSupportedConstraints")}}
