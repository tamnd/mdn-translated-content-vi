---
title: "NDEFMessage: thuộc tính records"
short-title: records
slug: Web/API/NDEFMessage/records
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFMessage.records
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Thuộc tính `records` của giao diện {{DOMxRef("NDEFMessage")}} đại diện cho danh sách các {{DOMxRef("NDEFRecord")}} có trong thông điệp NDEF.

## Giá trị

Một danh sách các đối tượng {{DOMxRef("NDEFRecord")}} đại diện cho dữ liệu được ghi lại trong thông điệp.

## Ví dụ

Ví dụ sau đây cho thấy cách đọc nội dung của một thông điệp NDEF. Đầu tiên nó thiết lập một trình xử lý sự kiện cho {{domxref("NDEFReader.reading_event", "onreading")}}, được truyền một phiên bản của {{domxref("NDEFReadingEvent")}}. Một đối tượng `NDEFMessage` được trả về từ {{domxref("NDEFReadingEvent.message")}}. Nó lặp qua `message.records` và xử lý từng bản ghi dựa trên loại thông điệp của nó. Thành viên data là một {{jsxref("DataView")}}, cho phép xử lý dữ liệu được mã hóa bằng {{glossary("UTF-16")}}.

```js
ndefReaderInst.onreading = (event) => {
  const ndefMessage = event.message;
  for (const record of ndefMessage.records) {
    console.log(`Record type:  ${record.recordType}`);
    console.log(`MIME type:    ${record.mediaType}`);
    console.log(`Record id:    ${record.id}`);
    switch (record.recordType) {
      case "text":
        // TODO: Read text record with record data, lang, and encoding.
        break;
      case "url":
        // TODO: Read URL record with record data.
        break;
      default:
      // TODO: Handle other records with record data.
    }
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
