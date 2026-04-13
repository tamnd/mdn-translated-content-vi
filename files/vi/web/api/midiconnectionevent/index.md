---
title: MIDIConnectionEvent
slug: Web/API/MIDIConnectionEvent
page-type: web-api-interface
browser-compat: api.MIDIConnectionEvent
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Giao diện **`MIDIConnectionEvent`** của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) là sự kiện được truyền đến sự kiện {{domxref("MIDIAccess.statechange_event","statechange")}} của giao diện {{domxref("MIDIAccess")}} và sự kiện {{domxref("MIDIPort.statechange_event","statechange")}} của giao diện {{domxref("MIDIPort")}}. Điều này xảy ra bất cứ khi nào có cổng mới khả dụng hoặc cổng đã khả dụng trước đó trở nên không khả dụng. Ví dụ, sự kiện này được kích hoạt mỗi khi thiết bị MIDI được cắm vào hoặc rút ra khỏi máy tính.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MIDIConnectionEvent.MIDIConnectionEvent", "MIDIConnectionEvent()")}}
  - : Tạo một đối tượng `MIDIConnectionEvent` mới.

## Thuộc tính phiên bản

- {{domxref("MIDIConnectionEvent.port")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến phiên bản {{domxref("MIDIPort")}} cho cổng đã được kết nối hoặc ngắt kết nối.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise giải quyết với đối tượng {{domxref("MIDIAccess")}}. Khi trạng thái cổng thay đổi, một `MIDIConnectionEvent` được truyền đến sự kiện {{domxref("MIDIAccess.statechange_event", "statechange")}}. Thông tin về cổng sau đó có thể được in ra console.

```js
navigator.requestMIDIAccess().then((access) => {
  access.onstatechange = (event) => {
    console.log(event.port.name, event.port.manufacturer, event.port.state);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
