---
title: "MediaTrackSettings: channelCount property"
short-title: channelCount
slug: Web/API/MediaTrackSettings/channelCount
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.channelCount_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`channelCount`** của từ điển {{domxref("MediaTrackSettings")}} là số nguyên cho biết có bao nhiêu kênh âm thanh mà {{domxref("MediaStreamTrack")}} hiện được cấu hình để có. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.channelCount")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.channelCount")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị số nguyên cho biết số kênh âm thanh trên rãnh. Giá trị 1 cho biết âm thanh mono, 2 là stereo, v.v.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.channelCount")}}
- {{domxref("MediaTrackSettings")}}
