---
title: MIDIPort
slug: Web/API/MIDIPort
page-type: web-api-interface
browser-compat: api.MIDIPort
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Giao diện **`MIDIPort`** của {{domxref('Web MIDI API','','',' ')}} biểu thị một cổng MIDI đầu vào hoặc đầu ra.

Một thể hiện `MIDIPort` được tạo khi một thiết bị MIDI mới được kết nối. Do đó nó không có hàm khởi tạo.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("MIDIPort.id")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa ID duy nhất của cổng.
- {{domxref("MIDIPort.manufacturer")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa nhà sản xuất của cổng.
- {{domxref("MIDIPort.name")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa tên hệ thống của cổng.
- {{domxref("MIDIPort.type")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa loại cổng, một trong các giá trị:
    - `"input"`
      - : `MIDIPort` là một cổng đầu vào.
    - `"output"`
      - : `MIDIPort` là một cổng đầu ra.

- {{domxref("MIDIPort.version")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa phiên bản của cổng.
- {{domxref("MIDIPort.state")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa trạng thái của cổng, một trong các giá trị:
    - `"disconnected"`
      - : Thiết bị mà `MIDIPort` này biểu thị đã bị ngắt kết nối khỏi hệ thống.
    - `"connected"`
      - : Thiết bị mà `MIDIPort` này biểu thị hiện đang được kết nối.

- {{domxref("MIDIPort.connection")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa trạng thái kết nối của cổng, một trong các giá trị:
    - `"open"`
      - : Thiết bị mà `MIDIPort` này biểu thị đã được mở và có sẵn.
    - `"closed"`
      - : Thiết bị mà `MIDIPort` này biểu thị chưa được mở, hoặc đã được đóng.
    - `"pending"`
      - : Thiết bị mà `MIDIPort` này biểu thị đã được mở nhưng sau đó bị ngắt kết nối.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("EventTarget")}}._

- {{domxref("MIDIPort.open()")}}
  - : Làm cho thiết bị MIDI được kết nối với `MIDIPort` này trở nên khả dụng rõ ràng, và trả về một {{jsxref("Promise")}} được giải quyết khi truy cập vào cổng thành công.
- {{domxref("MIDIPort.close()")}}
  - : Làm cho thiết bị MIDI được kết nối với `MIDIPort` này không khả dụng, thay đổi {{domxref("MIDIPort.state","state")}} từ `"open"` thành `"closed"`. Trả về một {{jsxref("Promise")}} được giải quyết khi cổng được đóng.

## Sự kiện

- {{domxref("MIDIPort.statechange_event", "statechange")}}
  - : Được gọi khi một cổng hiện có thay đổi trạng thái hoặc kết nối của nó.

## Ví dụ

### Liệt kê các cổng và thông tin của chúng

Ví dụ sau đây liệt kê các cổng đầu vào và đầu ra, và hiển thị thông tin về chúng sử dụng các thuộc tính của `MIDIPort`.

```js
function listInputsAndOutputs(midiAccess) {
  for (const entry of midiAccess.inputs) {
    const input = entry[1];
    console.log(
      `Input port [type:'${input.type}'] id:'${input.id}' manufacturer: '${input.manufacturer}' name: '${input.name}' version: '${input.version}'`,
    );
  }

  for (const entry of midiAccess.outputs) {
    const output = entry[1];
    console.log(
      `Output port [type:'${output.type}'] id: '${output.id}' manufacturer: '${output.manufacturer}' name: '${output.name}' version: '${output.version}'`,
    );
  }
}
```

### Thêm các cổng có sẵn vào danh sách chọn

Ví dụ sau đây lấy danh sách các cổng đầu vào và thêm chúng vào danh sách chọn, để người dùng có thể chọn thiết bị họ muốn sử dụng.

```js
inputs.forEach((port, key) => {
  const opt = document.createElement("option");
  opt.text = port.name;
  document.getElementById("port-selector").add(opt);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
