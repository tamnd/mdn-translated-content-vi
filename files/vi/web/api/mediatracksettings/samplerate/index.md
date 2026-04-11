---
title: "MediaTrackSettings: sampleRate property"
short-title: sampleRate
slug: Web/API/MediaTrackSettings/sampleRate
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.sampleRate_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`sampleRate`** của từ điển {{domxref("MediaTrackSettings")}} là số nguyên cho biết bao nhiêu mẫu âm thanh mỗi giây mà {{domxref("MediaStreamTrack")}} hiện được cấu hình. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.sampleRate")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.sampleRate")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị số nguyên cho biết có bao nhiêu mẫu âm thanh mỗi giây. Các giá trị thông thường bao gồm 44.100 (âm thanh CD tiêu chuẩn), 48.000 (âm thanh kỹ thuật số tiêu chuẩn), 96.000 (thường được sử dụng trong mastering và hậu kỳ âm thanh), và 192.000 (được sử dụng cho âm thanh độ phân giải cao trong ghi âm và mastering chuyên nghiệp). Tuy nhiên, các giá trị thấp hơn thường được sử dụng để giảm yêu cầu băng thông; 8.000 mẫu mỗi giây là đủ cho giọng nói con người có thể hiểu được dù không hoàn hảo, và cả 11.025 FPS lẫn 22.050 FPS thường được sử dụng cho âm thanh và nhạc băng thông thấp, chất lượng giảm.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.sampleRate")}}
- {{domxref("MediaTrackSettings")}}
