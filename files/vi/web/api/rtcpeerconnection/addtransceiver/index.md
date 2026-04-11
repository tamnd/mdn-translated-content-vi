---
title: "RTCPeerConnection: phương thức addTransceiver()"
short-title: addTransceiver()
slug: Web/API/RTCPeerConnection/addTransceiver
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.addTransceiver
---

{{APIRef("WebRTC")}}

Phương thức **`addTransceiver()`** của giao diện {{domxref("RTCPeerConnection")}} tạo một {{domxref("RTCRtpTransceiver")}} mới và thêm nó vào tập các transceiver gắn với `RTCPeerConnection`.
Mỗi transceiver biểu diễn một luồng hai chiều, với cả một {{domxref("RTCRtpSender")}} và một {{domxref("RTCRtpReceiver")}} gắn với nó.

## Cú pháp

```js-nolint
addTransceiver(trackOrKind)
addTransceiver(trackOrKind, init)
```

### Tham số

- `trackOrKind`
  - : Một {{domxref("MediaStreamTrack")}} để liên kết với transceiver, hoặc một chuỗi được dùng làm {{domxref("MediaStreamTrack.kind", "kind")}} của {{domxref("RTCRtpReceiver.track", "track")}} của bộ nhận, và mở rộng là của chính {{domxref("RTCRtpReceiver")}}.
- `init` {{optional_inline}}
  - : Đối tượng để chỉ định các tùy chọn khi tạo transceiver mới.
    Các giá trị có thể có là:
    - `direction` {{optional_inline}}
      - : Hướng ưu tiên của transceiver mới. Giá trị này được dùng để khởi tạo thuộc tính {{domxref("RTCRtpTransceiver.direction")}} của đối tượng {{domxref("RTCRtpTransceiver")}} mới.
    - `sendEncodings` {{optional_inline}}
      - : Mảng các encoding được phép khi gửi media RTP từ {{domxref("RTCRtpSender")}}.
        Điều này tương đương với mảng [`parameter.encodings`](/en-US/docs/Web/API/RTCRtpSender/setParameters#encodings) được truyền vào {{domxref("RTCRtpSender.setParameters()")}}.
    - `streams` {{optional_inline}}
      - : Danh sách các đối tượng {{domxref("MediaStream")}} sẽ được thêm vào {{domxref("RTCRtpReceiver")}} của transceiver; khi sự kiện {{domxref("RTCPeerConnection.track_event", "track")}} của `RTCPeerConnection` phía máy ngang hàng từ xa xảy ra, đây sẽ là các stream được chỉ định bởi sự kiện đó.

### Giá trị trả về

Đối tượng {{domxref("RTCRtpTransceiver")}} sẽ được dùng để trao đổi dữ liệu media.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra nếu `trackOrKind` không phải `"audio"` hoặc `"video"`.

    Nếu dùng đối số `sendEncodings`, lỗi này cũng có thể được ném ra nếu có một thành viên `rid` định dạng sai, một số nhưng không phải tất cả các encoding có thành viên `rid`, hoặc các encoding khác nhau có cùng giá trị `rid`.

- {{jsxref("RangeError")}}
  - : Ném ra nếu bất kỳ encoding nào trong `sendEncodings` có giá trị `maxFramerate` nhỏ hơn 0.0, hoặc giá trị `scaleResolutionDownBy` nhỏ hơn 1.0.

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu phương thức được gọi khi kết nối liên quan đã đóng.

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Ném ra nếu dùng đối số `sendEncodings`, và nó chứa một tham số chỉ đọc ngoài `rid`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- [Giới thiệu về Giao thức truyền tải thời gian thực (RTP)](/en-US/docs/Web/API/WebRTC_API/Intro_to_RTP)
- {{domxref("RTCPeerConnection.addTrack()")}} cũng tạo transceiver
- {{domxref("RTCRtpReceiver")}} và {{domxref("RTCRtpSender")}}
