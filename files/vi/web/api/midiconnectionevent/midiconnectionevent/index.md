---
title: "MIDIConnectionEvent: hàm khởi tạo MIDIConnectionEvent()"
short-title: MIDIConnectionEvent()
slug: Web/API/MIDIConnectionEvent/MIDIConnectionEvent
page-type: web-api-constructor
browser-compat: api.MIDIConnectionEvent.MIDIConnectionEvent
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Hàm khởi tạo **`MIDIConnectionEvent()`** tạo một đối tượng {{domxref("MIDIConnectionEvent")}} mới. Thông thường hàm khởi tạo này không được dùng vì các sự kiện được tạo khi có cổng mới khả dụng và đối tượng được truyền đến sự kiện {{domxref("MIDIAccess.statechange_event", "statechange")}}.

## Cú pháp

```js-nolint
new MIDIConnectionEvent(type)
new MIDIConnectionEvent(type, midiConnectionEventInit)
```

### Tham số

- `type`
  - : Chuỗi có giá trị `"connect"` hoặc `"disconnect"`.
- `midiConnectionEventInit` {{optional_inline}}
  - : Từ điển bao gồm các trường sau:
    - `port`
      - : Phiên bản {{domxref("MIDIPort")}} đại diện cho cổng đã kết nối hoặc ngắt kết nối.
    - `bubbles` {{optional_inline}}
      - : Giá trị boolean cho biết sự kiện có nổi lên không. Mặc định là `false`.
    - `cancelable` {{optional_inline}}
      - : Giá trị boolean cho biết sự kiện có thể bị hủy không. Mặc định là `false`.
    - `composed` {{optional_inline}}
      - : Giá trị boolean cho biết sự kiện có kích hoạt trình lắng nghe bên ngoài shadow root không (xem {{domxref("Event.composed")}} để biết thêm chi tiết). Mặc định là `false`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
