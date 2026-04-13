---
title: "MIDIPort: sự kiện statechange"
short-title: statechange
slug: Web/API/MIDIPort/statechange_event
page-type: web-api-event
browser-compat: api.MIDIPort.statechange_event
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Sự kiện **`statechange`** của giao diện {{domxref("MIDIPort")}} được kích hoạt khi một cổng thay đổi từ mở sang đóng, hoặc từ đóng sang mở.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("MIDIConnectionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MIDIConnectionEvent")}}

## Thuộc tính sự kiện

- {{domxref("MIDIConnectionEvent.port")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến một thể hiện {{domxref("MIDIPort")}} cho một cổng đã được kết nối hoặc ngắt kết nối.

## Ví dụ

Trong ví dụ sau đây, {{domxref("MIDIPort.state")}} hiện tại được ghi lại mỗi khi nó thay đổi.

```js
port.onstatechange = (event) => {
  console.log(port.state);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
