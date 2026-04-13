---
title: "MIDIPort: thuộc tính type"
short-title: type
slug: Web/API/MIDIPort/type
page-type: web-api-instance-property
browser-compat: api.MIDIPort.type
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("MIDIPort")}} trả về loại của cổng, cho biết đây là cổng MIDI đầu vào hay đầu ra.

## Giá trị

Một chuỗi chứa loại của cổng, một trong các giá trị:

- `"input"`
  - : `MIDIPort` là một cổng đầu vào.
- `"output"`
  - : `MIDIPort` là một cổng đầu ra.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in `type` của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.type); // should always be input
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
