---
title: MIDIInput
slug: Web/API/MIDIInput
page-type: web-api-interface
browser-compat: api.MIDIInput
---

{{APIRef("Web MIDI API")}}{{securecontext_header}}

Giao diện **`MIDIInput`** của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) nhận các tin nhắn từ cổng đầu vào MIDI.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này không triển khai bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ {{domxref("MIDIPort")}}._

## Phương thức phiên bản

_Giao diện này không triển khai bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ {{domxref("MIDIPort")}}._

### Sự kiện

- {{domxref("MIDIInput.midimessage_event", "midimessage")}}
  - : Được kích hoạt khi cổng hiện tại nhận được tin nhắn MIDI.

## Ví dụ

Trong ví dụ sau, tên của mỗi `MIDIInput` được in ra bảng điều khiển. Sau đó, các sự kiện `midimessage` được lắng nghe trên tất cả các cổng đầu vào. Khi nhận được tin nhắn, thuộc tính {{domxref("MIDIMessageEvent.data")}} được in ra bảng điều khiển.

```js
inputs.forEach((input) => {
  console.log(input.name); /* inherited property from MIDIPort */
  input.onmidimessage = (message) => {
    console.log(message.data);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
