---
title: "MIDIPort: thuộc tính state"
short-title: state
slug: Web/API/MIDIPort/state
page-type: web-api-instance-property
browser-compat: api.MIDIPort.state
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("MIDIPort")}} trả về trạng thái của cổng.

## Giá trị

Một chuỗi chứa trạng thái của cổng, một trong các giá trị:

- `"disconnected"`
  - : Thiết bị mà `MIDIPort` này biểu thị đã bị ngắt kết nối khỏi hệ thống.
- `"connected"`
  - : Thiết bị mà `MIDIPort` này biểu thị hiện đang được kết nối.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in trạng thái của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.state);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
