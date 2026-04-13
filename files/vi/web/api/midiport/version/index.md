---
title: "MIDIPort: thuộc tính version"
short-title: version
slug: Web/API/MIDIPort/version
page-type: web-api-instance-property
browser-compat: api.MIDIPort.version
---

{{securecontext_header}}{{APIRef("Web MIDI API")}}

Thuộc tính chỉ đọc **`version`** của giao diện {{domxref("MIDIPort")}} trả về phiên bản của cổng.

## Giá trị

Một chuỗi chứa phiên bản của cổng.

## Ví dụ

Ví dụ sau đây lặp qua tất cả các cổng đầu vào và in phiên bản của từng cổng ra console.

```js
for (const entry of midiAccess.inputs) {
  const input = entry[1];
  console.log(input.version);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
