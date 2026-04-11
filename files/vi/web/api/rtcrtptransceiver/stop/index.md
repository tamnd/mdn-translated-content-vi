---
title: "RTCRtpTransceiver: stop() method"
short-title: stop()
slug: Web/API/RTCRtpTransceiver/stop
page-type: web-api-instance-method
browser-compat: api.RTCRtpTransceiver.stop
---

{{APIRef("WebRTC")}}

Phương thức **`stop()`** trong giao diện {{domxref("RTCRtpTransceiver")}} sẽ dừng vĩnh viễn transceiver bằng cách dừng cả {{domxref("RTCRtpSender")}} và {{domxref("RTCRtpReceiver")}} đi kèm.

## Cú pháp

```js-nolint
stop()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Bị ném nếu `RTCPeerConnection` mà transceiver là một thành viên đang đóng.

## Mô tả

Khi bạn gọi `stop()` trên một transceiver, sender sẽ dừng gửi media ngay lập tức và từng luồng RTP của nó sẽ được đóng bằng thông điệp {{Glossary("RTCP")}} `"BYE"`.
Sau đó receiver dừng nhận media; {{domxref("RTCRtpReceiver.track", "track")}} của receiver bị dừng, và {{domxref("RTCRtpTransceiver.direction", "direction")}} của transceiver được đổi thành `stopped`.
Việc thương lượng lại được kích hoạt bằng cách gửi sự kiện {{domxref("RTCPeerConnection.negotiationneeded_event", "negotiationneeded")}} đến {{domxref("RTCPeerConnection")}} của transceiver, để kết nối có thể thích ứng với thay đổi.

Phương thức này không làm gì nếu transceiver đã dừng.
Bạn có thể kiểm tra nó đã dừng hay chưa bằng cách so sánh {{domxref("RTCRtpTransceiver.currentDirection", "currentDirection")}} với `"stopped"`.

> [!NOTE]
> Các phiên bản trước của đặc tả dùng thuộc tính {{domxref("RTCRtpTransceiver.stopped", "stopped")}} {{deprecated_inline}} đã bị loại bỏ để cho biết transceiver có dừng hay không.

## Tiêu chuẩn

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về Real-time Transport Protocol (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{domxref("MediaStreamTrack")}}
