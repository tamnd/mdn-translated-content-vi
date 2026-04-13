---
title: "MIDIPort: thuộc tính connection"
short-title: connection
slug: Web/API/MIDIPort/connection
page-type: web-api-instance-property
browser-compat: api.MIDIPort.connection
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`connection`** của giao diện {{domxref("MIDIPort")}} trả về trạng thái kết nối của cổng.

## Giá trị

Trả về một chuỗi chứa trạng thái kết nối của cổng, một trong các giá trị:

- `"open"`
  - : Thiết bị mà `MIDIPort` này biểu thị đã được mở và có sẵn.
- `"closed"`
  - : Thiết bị mà `MIDIPort` này biểu thị chưa được mở, hoặc đã được đóng.
- `"pending"`
  - : Thiết bị mà `MIDIPort` này biểu thị đã được mở nhưng sau đó bị ngắt kết nối.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in trạng thái kết nối của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.connection);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
