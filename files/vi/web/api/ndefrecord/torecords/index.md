---
title: "NDEFRecord: phương thức toRecords()"
short-title: toRecords()
slug: Web/API/NDEFRecord/toRecords
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.NDEFRecord.toRecords
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Phương thức **`toRecords()`** của giao diện {{DOMxRef("NDEFRecord")}} chuyển đổi {{DOMxRef("NDEFRecord.data")}} thành chuỗi các bản ghi dựa trên {{DOMxRef("NDEFRecord.recordType")}}, và trả về kết quả. Điều này cho phép phân tích các tải trọng của các loại bản ghi có thể chứa bản ghi lồng nhau, chẳng hạn như smart poster và bản ghi loại bên ngoài.

## Cú pháp

```js-nolint
toRecords()
```

### Tham số

Không có.

### Giá trị trả về

Danh sách các {{DOMxRef("NDEFRecord")}}.

### Ngoại lệ

- `NotSupported` {{domxref("DOMException")}}
  - : Cho biết {{Glossary("User Agent")}} không biết cách phân tích sự kết hợp này của {{DOMxRef("NDEFRecord.data")}} và {{DOMxRef("NDEFRecord.recordType")}}.

## Ví dụ

Đọc bản ghi bên ngoài với thông báo NDEF làm tải trọng

Ví dụ này sử dụng bản ghi loại bên ngoài để tạo bản ghi do ứng dụng định nghĩa. Các bản ghi này có thể chứa {{domxref("NDEFMessage")}} làm tải trọng, với các đối tượng {{domxref("NDEFRecord")}} riêng, bao gồm các loại cục bộ được dùng trong ngữ cảnh của ứng dụng. Lưu ý rằng loại bản ghi smart poster cũng chứa thông báo NDEF làm tải trọng.

Vì NDEF không đảm bảo thứ tự của các bản ghi, việc sử dụng bản ghi loại bên ngoài với thông báo NDEF làm tải trọng có thể hữu ích để đóng gói dữ liệu liên quan.

Ví dụ này cho thấy cách đọc bản ghi bên ngoài cho các bài đăng mạng xã hội, chứa {{domxref("NDEFMessage")}} với bản ghi văn bản và bản ghi có loại cục bộ "act" (hành động), với định nghĩa được mượn từ smart poster nhưng được dùng trong ngữ cảnh ứng dụng cục bộ.

```js
const ndefReader = new NDEFReader();
await ndefReader.scan();
ndefReader.onreading = (event) => {
  const externalRecord = event.message.records.find(
    (record) => record.type === "example.com:smart-poster",
  );

  let action, text;

  for (const record of externalRecord.toRecords()) {
    if (record.recordType === "text") {
      const decoder = new TextDecoder(record.encoding);
      text = decoder.decode(record.data);
    } else if (record.recordType === ":act") {
      action = record.data.getUint8(0);
    }
  }

  switch (action) {
    case 0: // do the action
      console.log(`Post "${text}" to timeline`);
      break;
    case 1: // save for later
      console.log(`Save "${text}" as a draft`);
      break;
    case 2: // open for editing
      console.log(`Show editable post with "${text}"`);
      break;
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
