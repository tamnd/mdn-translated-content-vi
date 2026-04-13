---
title: "MIDIPort: thuộc tính name"
short-title: name
slug: Web/API/MIDIPort/name
page-type: web-api-instance-property
browser-compat: api.MIDIPort.name
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("MIDIPort")}} trả về tên hệ thống của cổng.

## Giá trị

Một chuỗi chứa tên hệ thống của cổng.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in tên của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.name);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
