---
title: "MediaTrackConstraints: facingMode property"
short-title: facingMode
slug: Web/API/MediaTrackConstraints/facingMode
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.applyConstraints.facingMode_constraint
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính **`facingMode`** của từ điển {{domxref("MediaTrackConstraints")}} là [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) mô tả các ràng buộc được yêu cầu hoặc bắt buộc đặt lên giá trị của thuộc tính có thể ràng buộc {{domxref("MediaTrackSettings.facingMode", "facingMode")}}.

Nếu cần, bạn có thể xác định xem ràng buộc này có được hỗ trợ hay không bằng cách kiểm tra giá trị của {{domxref("MediaTrackSupportedConstraints.facingMode")}} như được trả về bởi lệnh gọi {{domxref("MediaDevices.getSupportedConstraints()")}}. Tuy nhiên, thông thường điều này là không cần thiết vì các trình duyệt sẽ bỏ qua mọi ràng buộc mà chúng không quen.

Vì {{Glossary("RTP")}} không bao gồm thông tin này, các rãnh liên kết với [WebRTC](/en-US/docs/Web/API/WebRTC_API) {{domxref("RTCPeerConnection")}} sẽ không bao giờ bao gồm thuộc tính này.

## Giá trị

Đối tượng dựa trên [`ConstrainDOMString`](/en-US/docs/Web/API/MediaTrackConstraints#constraindomstring) chỉ định một hoặc nhiều chế độ hướng có thể chấp nhận, lý tưởng và/hoặc chính xác (bắt buộc) cho một rãnh video.

Giá trị `exact` trong trường hợp này chỉ ra rằng chế độ hướng được chỉ định là bắt buộc cụ thể; ví dụ:

```js
const constraints = {
  facingMode: { exact: "user" },
};
```

Điều này chỉ ra rằng chỉ chấp nhận camera hướng về phía người dùng; nếu không có camera nào hướng về phía người dùng, hoặc người dùng từ chối quyền sử dụng camera đó, yêu cầu phương tiện sẽ thất bại.

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
- {{domxref("MediaTrackConstraints")}}
- {{domxref("MediaDevices.getSupportedConstraints()")}}
- {{domxref("MediaTrackSupportedConstraints")}}
- {{domxref("MediaStreamTrack")}}
