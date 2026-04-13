---
title: "NDEFReadingEvent: message property"
short-title: message
slug: Web/API/NDEFReadingEvent/message
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.NDEFReadingEvent.message
---

{{APIRef("Web NFC API")}}{{securecontext_header}}{{SeeCompatTable}}

Thuộc tính **`message`** của giao diện {{domxref("NDEFReadingEvent")}} trả về một đối tượng {{DOMxRef("NDEFMessage")}} chứa tin nhắn đã nhận.

## Giá trị

Một đối tượng {{domxref("NDEFMessage")}}.

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
