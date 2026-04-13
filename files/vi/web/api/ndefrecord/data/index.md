---
title: "NDEFRecord: thuộc tính data"
short-title: data
slug: Web/API/NDEFRecord/data
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFRecord.data
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Thuộc tính **`data`** của giao diện {{DOMxRef("NDEFRecord")}} trả về một {{jsxref("DataView")}} chứa các byte thô của tải trọng bản ghi.

## Giá trị

Một {{jsxref("DataView")}} chứa dữ liệu tải trọng được mã hóa của bản ghi.

## Ví dụ

Ví dụ sau lặp qua các bản ghi trong một đối tượng {{domxref("NDEFMessage")}} được lấy từ {{domxref("NDEFReadingEvent.message")}}. Sau khi chọn bản ghi dựa trên {{domxref("NDEFRecord.mediaType", "mediaType")}} của nó, nó giải mã nội dung được lưu trong thuộc tính `data`.

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
