---
title: MIDIAccess
slug: Web/API/MIDIAccess
page-type: web-api-interface
browser-compat: api.MIDIAccess
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Giao diện **`MIDIAccess`** của [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API) cung cấp các phương thức để liệt kê các thiết bị đầu vào và đầu ra MIDI, và truy cập các thiết bị đó.

`MIDIAccess` là một [đối tượng có thể chuyển](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("MIDIAccess.inputs")}} {{ReadOnlyInline}}
  - : Trả về một phiên bản {{domxref("MIDIInputMap")}} cung cấp quyền truy cập vào bất kỳ cổng đầu vào MIDI nào có sẵn.
- {{domxref("MIDIAccess.outputs")}} {{ReadOnlyInline}}
  - : Trả về một phiên bản {{domxref("MIDIOutputMap")}} cung cấp quyền truy cập vào bất kỳ cổng đầu ra MIDI nào có sẵn.
- {{domxref("MIDIAccess.sysexEnabled")}} {{ReadOnlyInline}}
  - : Một thuộc tính boolean cho biết liệu hỗ trợ system exclusive có được bật trên phiên bản MIDIAccess hiện tại hay không.

### Sự kiện

- {{domxref("MIDIAccess.statechange_event", "statechange")}}
  - : Được gọi bất cứ khi nào một cổng MIDI mới được thêm hoặc một cổng hiện có thay đổi trạng thái.

## Ví dụ

Phương thức {{domxref("Navigator.requestMIDIAccess()")}} trả về một promise phân giải thành đối tượng `MIDIAccess`. Thông tin về các cổng đầu vào và đầu ra được trả về.

Khi một cổng thay đổi trạng thái, thông tin về cổng đó được in ra bảng điều khiển.

```js
navigator.requestMIDIAccess().then((access) => {
  // Get lists of available MIDI controllers
  const inputs = access.inputs.values();
  const outputs = access.outputs.values();

  access.onstatechange = (event) => {
    // Print information about the (dis)connected MIDI controller
    console.log(event.port.name, event.port.manufacturer, event.port.state);
  };
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
