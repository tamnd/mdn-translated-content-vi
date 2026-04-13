---
title: "MIDIAccess: sự kiện statechange"
short-title: statechange
slug: Web/API/MIDIAccess/statechange_event
page-type: web-api-event
browser-compat: api.MIDIAccess.statechange_event
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Sự kiện **`statechange`** của giao diện {{domxref("MIDIAccess")}} được kích hoạt khi một cổng MIDI mới được thêm hoặc khi một cổng hiện có thay đổi trạng thái.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("MIDIConnectionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MIDIConnectionEvent")}}

## Thuộc tính sự kiện

- {{domxref("MIDIConnectionEvent.port")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến một phiên bản {{domxref("MIDIPort")}} cho cổng đã được kết nối hoặc ngắt kết nối.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise phân giải thành đối tượng {{domxref("MIDIAccess")}}. Khi một cổng thay đổi trạng thái, thông tin về cổng đó được in ra bảng điều khiển.

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
