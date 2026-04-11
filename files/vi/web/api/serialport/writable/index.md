---
title: "SerialPort: thuộc tính writable"
short-title: writable
slug: Web/API/SerialPort/writable
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SerialPort.writable
---

{{SecureContext_Header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("SerialPort")}} trả về một {{domxref("WritableStream")}} để gửi dữ liệu tới thiết bị kết nối với cổng. Các đoạn dữ liệu ghi vào luồng này phải là các thực thể của {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}. Thuộc tính này khác null miễn là cổng đang mở và chưa gặp lỗi nghiêm trọng.

## Giá trị

Một {{domxref("WritableStream")}}

## Ví dụ

Ví dụ sau đây cho thấy cách ghi một chuỗi vào một cổng. Một {{domxref("TextEncoder")}} chuyển đổi chuỗi thành `Uint8Array` trước khi truyền.

```js
const encoder = new TextEncoder();
const writer = port.writable.getWriter();
await writer.write(encoder.encode("PING"));
writer.releaseLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
