---
title: "NDEFReadingEvent: serialNumber property"
short-title: serialNumber
slug: Web/API/NDEFReadingEvent/serialNumber
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFReadingEvent.serialNumber
---

{{APIRef("Web NFC API")}}{{securecontext_header}}{{SeeCompatTable}}

Thuộc tính **`serialNumber`** của giao diện {{domxref("NDEFReadingEvent")}} trả về số serial của thiết bị, được dùng để chống xung đột và nhận dạng, hoặc chuỗi rỗng nếu không có số serial nào có sẵn.

## Giá trị

Một chuỗi chứa số serial của thiết bị.

## Ví dụ

Ví dụ này cho thấy cách tạo hàm tiện ích đọc một thẻ duy nhất và sau đó dừng polling, tiết kiệm pin bằng cách cắt bỏ công việc không cần thiết.

```js
const ndefReader = new NDEFReader();

function read() {
  return new Promise((resolve, reject) => {
    const controller = new AbortController();
    controller.signal.onabort = reject;
    ndefReader.addEventListener(
      "reading",
      (event) => {
        controller.abort();
        resolve(event);
      },
      { once: true },
    );
    ndefReader.scan({ signal: controller.signal }).catch((err) => reject(err));
  });
}

read().then(({ serialNumber }) => {
  console.log(serialNumber);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
