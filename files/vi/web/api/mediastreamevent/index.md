---
title: MediaStreamEvent
slug: Web/API/MediaStreamEvent
page-type: web-api-interface
status:
  - deprecated
  - non-standard
browser-compat: api.MediaStreamEvent
---

{{APIRef("WebRTC")}}{{Deprecated_Header}}{{Non-standard_Header}}

Giao diện **`MediaStreamEvent`** đại diện cho các sự kiện xảy ra liên quan đến {{domxref("MediaStream")}}. Hai sự kiện có loại này có thể được ném ra: {{domxref("RTCPeerConnection.addstream_event", "addstream")}} và {{domxref("RTCPeerConnection.removestream_event", "removestream")}}.

## Thuộc tính phiên bản

_Vì `MediaStreamEvent` là một {{domxref("Event")}}, sự kiện này cũng triển khai các thuộc tính sau_.

- {{domxref("MediaStreamEvent.stream")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Chứa {{domxref("MediaStream")}} có luồng liên quan đến sự kiện.

## Hàm khởi tạo

- {{domxref("MediaStreamEvent.MediaStreamEvent()", "MediaStreamEvent()")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một `MediaStreamEvent` mới. Nhận hai tham số, tham số đầu tiên là chuỗi đại diện cho loại sự kiện; tham số thứ hai là từ điển chứa {{domxref("MediaStream")}} nó đề cập đến.

## Phương thức phiên bản

Vì `MediaStreamEvent` là {{domxref("Event")}}, sự kiện này cũng triển khai các thuộc tính này. Không có phương thức `MediaStreamEvent` cụ thể nào.

## Ví dụ

```js
pc.onaddstream = (ev) => {
  alert(`A stream (id: '${ev.stream.id}') has been added to this connection.`);
};
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- Mục tiêu thông thường của nó: {{domxref("RTCPeerConnection")}}.
