---
title: "RTCDataChannelEvent: hàm khởi tạo RTCDataChannelEvent()"
short-title: RTCDataChannelEvent()
slug: Web/API/RTCDataChannelEvent/RTCDataChannelEvent
page-type: web-api-constructor
browser-compat: api.RTCDataChannelEvent.RTCDataChannelEvent
---

{{APIRef("WebRTC")}}

Hàm khởi tạo **`RTCDataChannelEvent()`** tạo một đối tượng {{domxref("RTCDataChannelEvent")}} mới.

> [!NOTE]
> Bạn hiếm khi hoặc sẽ không bao giờ xây dựng một `RTCDataChannelEvent` bằng tay; các sự kiện này thường được tạo và gửi bởi lớp WebRTC.

## Cú pháp

```js-nolint
new RTCDataChannelEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt là `datachannel`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `channel`
      - : Một {{domxref("RTCDataChannel")}}, đại diện cho kênh dữ liệu được liên kết với sự kiện.

### Giá trị trả về

Một đối tượng {{domxref("RTCDataChannelEvent")}} mới được cấu hình như được chỉ định.

## Ví dụ

Trong ví dụ này, một sự kiện {{DOMxRef("RTCPeerConnection.datachannel_event", "datachannel")}} mới được tạo. `dc` là một kênh dữ liệu đã tồn tại.

```js
const event = new RTCDataChannelEvent("datachannel", { channel: dc });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection")}}
- [Mẫu RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
