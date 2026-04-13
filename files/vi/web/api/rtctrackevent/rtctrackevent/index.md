---
title: "RTCTrackEvent: hàm khởi tạo RTCTrackEvent()"
short-title: RTCTrackEvent()
slug: Web/API/RTCTrackEvent/RTCTrackEvent
page-type: web-api-constructor
browser-compat: api.RTCTrackEvent.RTCTrackEvent
---

{{APIRef("WebRTC")}}

Hàm khởi tạo **`RTCTrackEvent()`** tạo và trả về một đối tượng {{domxref("RTCTrackEvent")}} mới, được cấu hình để mô tả track đã được thêm vào {{domxref("RTCPeerConnection")}}.

Nói chung, bạn sẽ không cần sử dụng hàm khởi tạo này, vì các đối tượng `RTCTrackEvent` được tạo bởi WebRTC và gửi đến trình xử lý sự kiện {{domxref("RTCPeerConnection.track_event", "ontrack")}} của `RTCPeerConnection` khi thích hợp.

## Cú pháp

```js-nolint
new RTCTrackEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `track`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `receiver`
      - : {{domxref("RTCRtpReceiver")}} đang được sử dụng để nhận phương tiện của track.
    - `streams` {{optional_inline}}
      - : Một mảng các đối tượng {{domxref("MediaStream")}} đại diện cho mỗi stream tạo nên track tương ứng của sự kiện.
        Mặc định là một mảng rỗng.
    - `track`
      - : {{domxref("MediaStreamTrack")}} mà sự kiện được liên kết.
    - `transceiver`
      - : {{domxref("RTCRtpTransceiver")}} được liên kết với sự kiện.

### Giá trị trả về

Một {{domxref("RTCTrackEvent")}} mới mô tả một track đã được thêm vào `RTCPeerConnection`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
