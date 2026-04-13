---
title: "NDEFRecord: thuộc tính mediaType"
short-title: mediaType
slug: Web/API/NDEFRecord/mediaType
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFRecord.mediaType
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Thuộc tính **`mediaType`** của giao diện {{DOMxRef("NDEFRecord")}} trả về {{Glossary("MIME type")}} của bản ghi. Giá trị này sẽ là `null` nếu `recordType` không bằng `"mime"`.

## Giá trị

Một chuỗi chứa {{Glossary("MIME type")}} của tải trọng bản ghi.

## Ví dụ

Ví dụ sau lặp qua các bản ghi trong một đối tượng {{domxref("NDEFMessage")}} được lấy từ {{domxref("NDEFReadingEvent.message")}}. Nó sử dụng thuộc tính `mediaType` để xác định bản ghi nào cần phân tích.

```js
const ndef = new NDEFReader();
await ndef.scan();
ndef.onreading = (event) => {
  const decoder = new TextDecoder();
  for (const record of event.message.records) {
    if (record.mediaType === "application/json") {
      const json = JSON.parse(decoder.decode(record.data));
      const article = /^[aeio]/i.test(json.title) ? "an" : "a";
      console.log(`${json.name} is ${article} ${json.title}`);
    }
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
