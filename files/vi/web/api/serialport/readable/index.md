---
title: "SerialPort: thuộc tính readable"
short-title: readable
slug: Web/API/SerialPort/readable
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SerialPort.readable
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("SerialPort")}} trả về một {{domxref("ReadableStream")}} để nhận dữ liệu từ thiết bị kết nối với cổng. Các đoạn dữ liệu đọc từ luồng này là các thực thể của {{jsxref("Uint8Array")}}. Thuộc tính này khác null miễn là cổng đang mở và chưa gặp lỗi nghiêm trọng.

## Giá trị

Một {{domxref("ReadableStream")}}.

## Ví dụ

Ví dụ sau đây cho thấy cách đọc dữ liệu từ một cổng. Vòng lặp ngoài xử lý các lỗi không nghiêm trọng, tạo một trình đọc mới cho đến khi gặp lỗi nghiêm trọng và `readable` trở thành `null`.

```js
while (port.readable) {
  const reader = port.readable.getReader();
  try {
    while (true) {
      const { value, done } = await reader.read();
      if (done) {
        // |reader| has been canceled.
        break;
      }
      // Do something with |value|…
    }
  } catch (error) {
    // Handle |error|…
  } finally {
    reader.releaseLock();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
