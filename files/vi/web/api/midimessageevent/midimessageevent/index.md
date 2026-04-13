---
title: "MIDIMessageEvent: hàm khởi tạo MIDIMessageEvent()"
short-title: MIDIMessageEvent()
slug: Web/API/MIDIMessageEvent/MIDIMessageEvent
page-type: web-api-constructor
browser-compat: api.MIDIMessageEvent.MIDIMessageEvent
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Hàm khởi tạo **`MIDIMessageEvent()`** tạo một đối tượng {{domxref("MIDIMessageEvent")}} mới. Thông thường hàm khởi tạo này không được dùng vì các sự kiện được tạo khi {{domxref("MIDIInput")}} hoàn thành việc nhận một hoặc nhiều tin nhắn MIDI.

## Cú pháp

```js-nolint
new MIDIMessageEvent(type)
new MIDIMessageEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt luôn đặt nó thành `MIDIMessageEvent`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `data`
      - : Một phiên bản {{jsxref("Uint8Array")}} chứa các byte dữ liệu của tin nhắn MIDI.

### Giá trị trả về

Một đối tượng {{domxref("MIDIMessageEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
