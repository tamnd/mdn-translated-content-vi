---
title: "MIDIPort: thuộc tính manufacturer"
short-title: manufacturer
slug: Web/API/MIDIPort/manufacturer
page-type: web-api-instance-property
browser-compat: api.MIDIPort.manufacturer
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`manufacturer`** của giao diện {{domxref("MIDIPort")}} trả về nhà sản xuất của cổng.

## Giá trị

Một chuỗi chứa nhà sản xuất của cổng.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in nhà sản xuất của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.manufacturer);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
