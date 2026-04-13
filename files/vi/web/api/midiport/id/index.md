---
title: "MIDIPort: thuộc tính id"
short-title: id
slug: Web/API/MIDIPort/id
page-type: web-api-instance-property
browser-compat: api.MIDIPort.id
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("MIDIPort")}} trả về ID duy nhất của cổng.

## Giá trị

Một chuỗi chứa ID của cổng.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in id của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.id);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
