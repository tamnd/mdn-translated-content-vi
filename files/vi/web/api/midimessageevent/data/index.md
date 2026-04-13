---
title: "MIDIMessageEvent: thuộc tính data"
short-title: data
slug: Web/API/MIDIMessageEvent/data
page-type: web-api-instance-property
browser-compat: api.MIDIMessageEvent.data
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`data`** của giao diện {{domxref("MIDIMessageEvent")}} trả về các byte dữ liệu MIDI của một tin nhắn MIDI.

## Giá trị

Một {{jsxref("Uint8Array")}}.

## Ví dụ

Trong ví dụ sau, các sự kiện {{domxref("MIDIInput.midimessage_event", "midimessage")}} được lắng nghe trên tất cả các cổng đầu vào. Khi nhận được tin nhắn, giá trị của `data` được in ra console.

```js
inputs.forEach((input) => {
  input.onmidimessage = (message) => {
    console.log(message.data);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
