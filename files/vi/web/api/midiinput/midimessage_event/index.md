---
title: "MIDIInput: sự kiện midimessage"
short-title: midimessage
slug: Web/API/MIDIInput/midimessage_event
page-type: web-api-event
browser-compat: api.MIDIInput.midimessage_event
---

{{APIRef("Web MIDI API")}}{{securecontext_header}}

Sự kiện `midimessage` của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) được kích hoạt khi cổng MIDI tương ứng với {{domxref("MIDIInput")}} này nhận xong một hoặc nhiều tin nhắn MIDI. Một phiên bản {{domxref("MIDIMessageEvent")}} chứa tin nhắn đã nhận được truyền vào trình xử lý sự kiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("midimessage", (event) => { })

onmidimessage = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MIDIMessageEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MIDIMessageEvent")}}

## Thuộc tính sự kiện

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("Event")}}._

- {{domxref("MIDIMessageEvent.data")}}
  - : Một {{jsxref("Uint8Array")}} chứa các byte dữ liệu của một tin nhắn MIDI. Xem [thông số kỹ thuật MIDI](https://midi.org/summary-of-midi-1-0-messages) để biết thêm thông tin về định dạng.

## Ví dụ

Trong ví dụ sau, các sự kiện `midimessage` được lắng nghe trên tất cả các cổng đầu vào. Khi nhận được tin nhắn, thuộc tính {{domxref("MIDIMessageEvent.data")}} được in ra bảng điều khiển.

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
