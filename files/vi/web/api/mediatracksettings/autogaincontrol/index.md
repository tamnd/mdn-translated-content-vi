---
title: "MediaTrackSettings: autoGainControl property"
short-title: autoGainControl
slug: Web/API/MediaTrackSettings/autoGainControl
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.autoGainControl_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`autoGainControl`** của từ điển {{domxref("MediaTrackSettings")}} là giá trị Boolean cho biết kiểm soát độ khuếch đại tự động (AGC) có được bật trên rãnh âm thanh hay không. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.autoGainControl")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Kiểm soát độ khuếch đại tự động là tính năng trong đó nguồn âm thanh tự động quản lý các thay đổi về âm lượng của phương tiện nguồn của nó để duy trì mức âm lượng tổng thể ổn định. Tính năng này thường được sử dụng trên micro, mặc dù nó cũng có thể được cung cấp bởi các nguồn đầu vào khác.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.autoGainControl")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

## Giá trị

Giá trị Boolean là `true` nếu rãnh có kiểm soát độ khuếch đại tự động được bật hoặc `false` nếu AGC bị tắt.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.autoGainControl")}}
- {{domxref("MediaTrackSupportedConstraints")}}
