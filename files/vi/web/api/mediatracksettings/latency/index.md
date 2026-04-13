---
title: "MediaTrackSettings: latency property"
short-title: latency
slug: Web/API/MediaTrackSettings/latency
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.latency_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`latency`** của từ điển {{domxref("MediaTrackSettings")}} là số thực dấu phẩy động độ chính xác kép cho biết độ trễ ước tính (tính bằng giây) của {{domxref("MediaStreamTrack")}} theo cấu hình hiện tại. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.latency")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Tất nhiên, đây là một giá trị xấp xỉ, vì độ trễ có thể thay đổi vì nhiều lý do bao gồm chi phí CPU, truyền dữ liệu và lưu trữ.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.latency")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Số thực dấu phẩy động độ chính xác kép cho biết độ trễ ước tính, tính bằng giây, của rãnh âm thanh theo cấu hình hiện tại.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.latency")}}
- {{domxref("MediaTrackSettings")}}
