---
title: "MediaTrackSettings: echoCancellation property"
short-title: echoCancellation
slug: Web/API/MediaTrackSettings/echoCancellation
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.echoCancellation_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`echoCancellation`** của từ điển {{domxref("MediaTrackSettings")}} là giá trị Boolean cho biết khử tiếng vọng có được bật trên rãnh âm thanh hay không. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.echoCancellation")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Khử tiếng vọng là tính năng cố gắng ngăn chặn các hiệu ứng tiếng vọng trên kết nối âm thanh hai chiều bằng cách cố gắng giảm hoặc loại bỏ tình trạng xuyên nhiễu giữa thiết bị đầu ra và thiết bị đầu vào của người dùng. Ví dụ, nó có thể áp dụng bộ lọc loại bỏ âm thanh đang phát từ loa khỏi rãnh đầu vào được tạo từ micro.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.echoCancellation")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Giá trị Boolean là `true` nếu rãnh có chức năng khử tiếng vọng được bật hoặc `false` nếu khử tiếng vọng bị tắt.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.echoCancellation")}}
- {{domxref("MediaTrackSettings")}}
