---
title: "MIDIConnectionEvent: thuộc tính port"
short-title: port
slug: Web/API/MIDIConnectionEvent/port
page-type: web-api-instance-property
browser-compat: api.MIDIConnectionEvent.port
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("MIDIConnectionEvent")}} trả về cổng đã bị ngắt kết nối hoặc được kết nối.

## Giá trị

Một đối tượng {{domxref("MIDIPort")}}.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise giải quyết với đối tượng {{domxref("MIDIAccess")}}. Khi trạng thái cổng thay đổi, một `MIDIConnectionEvent` được truyền đến sự kiện {{domxref("MIDIAccess.statechange_event","statechange")}}. Thông tin về cổng sau đó có thể được in ra console.

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
