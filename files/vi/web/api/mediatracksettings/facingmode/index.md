---
title: "MediaTrackSettings: facingMode property"
short-title: facingMode
slug: Web/API/MediaTrackSettings/facingMode
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.facingMode_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`facingMode`** của từ điển {{domxref("MediaTrackSettings")}} là chuỗi cho biết hướng mà camera tạo ra rãnh video được đại diện bởi {{domxref("MediaStreamTrack")}} hiện đang hướng tới. Điều này cho phép bạn xác định giá trị nào đã được chọn để tuân thủ các ràng buộc bạn đã chỉ định cho giá trị của thuộc tính này như được mô tả trong thuộc tính {{domxref("MediaTrackConstraints.facingMode")}} mà bạn đã cung cấp khi gọi {{domxref("MediaDevices.getUserMedia", "getUserMedia()")}} hoặc {{domxref("MediaStreamTrack.applyConstraints()")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.facingMode")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Chuỗi có giá trị là một trong các chuỗi trong [`VideoFacingModeEnum`](#videofacingmodeenum).

### VideoFacingModeEnum

Các chuỗi sau là các giá trị được phép cho chế độ hướng. Chúng có thể đại diện cho các camera riêng biệt, hoặc chúng có thể đại diện cho các hướng mà camera có thể điều chỉnh được.

- `"user"`
  - : Nguồn video hướng về phía người dùng; ví dụ như camera mặt trước trên điện thoại thông minh.
- `"environment"`
  - : Nguồn video hướng ra xa người dùng, do đó xem môi trường của họ. Đây là camera mặt sau trên điện thoại thông minh.
- `"left"`
  - : Nguồn video hướng về phía người dùng nhưng về phía bên trái của họ, chẳng hạn như camera hướng về phía người dùng nhưng qua vai trái của họ.
- `"right"`
  - : Nguồn video hướng về phía người dùng nhưng về phía bên phải của họ, chẳng hạn như camera hướng về phía người dùng nhưng qua vai phải của họ.

## Ví dụ

Xem ví dụ [Trình thử nghiệm ràng buộc](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints#example_constraint_exerciser).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Ghi và phát Media](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Khả năng, ràng buộc và thiết lập](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
- {{domxref("MediaTrackConstraints.facingMode")}}
- {{domxref("MediaTrackSettings")}}
