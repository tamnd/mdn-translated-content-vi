---
title: "WebSocket: thuộc tính binaryType"
short-title: binaryType
slug: Web/API/WebSocket/binaryType
page-type: web-api-instance-property
browser-compat: api.WebSocket.binaryType
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Thuộc tính **`WebSocket.binaryType`** điều khiển kiểu dữ liệu nhị phân được nhận qua kết nối WebSocket.

## Giá trị

Một chuỗi:

- `"blob"`
  - : Dùng đối tượng {{domxref("Blob")}} cho dữ liệu nhị phân. Đây là giá trị mặc định.
- `"arraybuffer"`
  - : Dùng đối tượng {{jsxref("ArrayBuffer")}} cho dữ liệu nhị phân.

## Ví dụ

```js
// Tạo kết nối WebSocket.
const socket = new WebSocket("ws://localhost:8080");

// Đổi kiểu nhị phân từ "blob" sang "arraybuffer"
socket.binaryType = "arraybuffer";

// Lắng nghe thông điệp
socket.addEventListener("message", (event) => {
  if (event.data instanceof ArrayBuffer) {
    // khung nhị phân
    const view = new DataView(event.data);
    console.log(view.getInt32(0));
  } else {
    // khung văn bản
    console.log(event.data);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
