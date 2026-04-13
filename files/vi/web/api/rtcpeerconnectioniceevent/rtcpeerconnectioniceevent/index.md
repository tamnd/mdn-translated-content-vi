---
title: "RTCPeerConnectionIceEvent: RTCPeerConnectionIceEvent() constructor"
short-title: RTCPeerConnectionIceEvent()
slug: Web/API/RTCPeerConnectionIceEvent/RTCPeerConnectionIceEvent
page-type: web-api-constructor
browser-compat: api.RTCPeerConnectionIceEvent.RTCPeerConnectionIceEvent
---

{{APIRef("WebRTC")}}

Hàm khởi tạo **`RTCPeerConnectionIceEvent()`** tạo một đối tượng {{domxref("RTCPeerConnectionIceEvent")}} mới.

## Cú pháp

```js-nolint
new RTCPeerConnectionIceEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt giá trị là `icecandidate`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `candidate`
      - : Một {{domxref("RTCIceCandidate")}} đại diện cho ứng viên ICE liên quan đến sự kiện. Nếu là `null`, sự kiện chỉ ra sự kết thúc của quá trình thu thập ứng viên.
    - `url`
      - : Một chuỗi chứa URL của máy chủ STUN hoặc TURN được dùng để thu thập ứng viên. Nếu ứng viên không được thu thập bởi máy chủ {{Glossary("STUN")}} hoặc {{Glossary("TURN")}}, giá trị này phải là `null`, đó cũng là giá trị mặc định.

### Giá trị trả về

Một đối tượng {{domxref("RTCPeerConnectionIceEvent")}} mới, được cấu hình theo các tùy chọn đã cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- Đối tượng đích thông thường: {{domxref("RTCPeerConnection")}}.
