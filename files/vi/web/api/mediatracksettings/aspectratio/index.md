---
title: "MediaTrackSettings: aspectRatio property"
short-title: aspectRatio
slug: Web/API/MediaTrackSettings/aspectRatio
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.aspectRatio_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`aspectRatio`** của từ điển {{domxref("MediaTrackSettings")}} là số thực dấu phẩy động độ chính xác kép cho biết {{glossary("aspect ratio")}} của {{domxref("MediaStreamTrack")}} theo cấu hình hiện tại. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.aspectRatio")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.aspectRatio")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Số thực dấu phẩy động độ chính xác kép cho biết cấu hình hiện tại của tỷ lệ khung hình của rãnh. Tỷ lệ khung hình được tính bằng cách lấy chiều rộng của rãnh chia cho chiều cao của nó, và làm tròn kết quả đến mười chữ số thập phân. Ví dụ, tỷ lệ khung hình HD 16:9 tiêu chuẩn có thể được tính là 1920/1080, tức là 1.7777777778.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.aspectRatio")}}
- {{domxref("MediaTrackSettings")}}
