---
title: MIDIOutput
slug: Web/API/MIDIOutput
page-type: web-api-interface
browser-compat: api.MIDIOutput
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Giao diện **`MIDIOutput`** của {{domxref('Web MIDI API','','',' ')}} cung cấp các phương thức để thêm tin nhắn vào hàng đợi của thiết bị đầu ra và xóa hàng đợi tin nhắn.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này không triển khai bất kỳ thuộc tính cụ thể nào, nhưng kế thừa các thuộc tính từ {{domxref("MIDIPort")}}._

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("MIDIPort")}}._

- {{domxref("MIDIOutput.send()")}}
  - : Xếp hàng một tin nhắn để gửi đến cổng MIDI.
- {{domxref("MIDIOutput.clear()")}}
  - : Xóa mọi dữ liệu gửi đang chờ khỏi hàng đợi.

## Ví dụ

Ví dụ sau gửi nốt C giữa ngay lập tức trên kênh MIDI 1.

```js
function sendMiddleC(midiAccess, portID) {
  const noteOnMessage = [0x90, 60, 0x7f]; // note on, middle C, full velocity
  const output = midiAccess.outputs.get(portID);
  output.send(noteOnMessage); // sends the message.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
