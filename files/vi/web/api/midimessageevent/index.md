---
title: MIDIMessageEvent
slug: Web/API/MIDIMessageEvent
page-type: web-api-interface
browser-compat: api.MIDIMessageEvent
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Giao diện **`MIDIMessageEvent`** của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) đại diện cho sự kiện được truyền đến sự kiện {{domxref("MIDIInput.midimessage_event","midimessage")}} của giao diện {{domxref("MIDIInput")}}. Sự kiện `midimessage` được kích hoạt mỗi khi một tin nhắn MIDI được gửi từ thiết bị được đại diện bởi {{domxref("MIDIInput")}}, ví dụ khi nhấn phím bàn phím MIDI, vặn núm xoay hay di chuyển thanh trượt.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MIDIMessageEvent.MIDIMessageEvent", "MIDIMessageEvent()")}}
  - : Tạo một phiên bản đối tượng `MIDIMessageEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("MIDIMessageEvent.data")}}
  - : Một {{jsxref("Uint8Array")}} chứa các byte dữ liệu của một tin nhắn MIDI. Xem [đặc tả MIDI](https://midi.org/summary-of-midi-1-0-messages) để biết thêm thông tin về định dạng của nó.

## Phương thức phiên bản

_Giao diện này không triển khai bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ {{domxref("Event")}}._

## Ví dụ

Ví dụ sau in tất cả các tin nhắn MIDI ra console.

```js
navigator.requestMIDIAccess().then((midiAccess) => {
  Array.from(midiAccess.inputs).forEach((input) => {
    input[1].onmidimessage = (msg) => {
      console.log(msg);
    };
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
