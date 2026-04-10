---
title: PushMessageData
slug: Web/API/PushMessageData
page-type: web-api-interface
browser-compat: api.PushMessageData
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Giao diện **`PushMessageData`** của [Push API](/en-US/docs/Web/API/Push_API) cung cấp các phương thức cho phép bạn truy xuất dữ liệu đẩy do máy chủ gửi theo nhiều định dạng khác nhau.

Không giống như các phương thức tương tự trong [Fetch API](/en-US/docs/Web/API/Fetch_API), vốn chỉ cho phép gọi phương thức một lần, các phương thức này có thể được gọi nhiều lần.

Các thông điệp nhận được qua Push API được các dịch vụ push gửi dưới dạng mã hóa, rồi được trình duyệt giải mã tự động trước khi chúng được cung cấp thông qua các phương thức của giao diện `PushMessageData`.

## Thuộc tính thể hiện

Không có.

## Phương thức thể hiện

- {{domxref("PushMessageData.arrayBuffer()")}}
  - : Trích xuất dữ liệu dưới dạng đối tượng {{jsxref("ArrayBuffer")}}.
- {{domxref("PushMessageData.blob()")}}
  - : Trích xuất dữ liệu dưới dạng đối tượng {{domxref("Blob")}}.
- {{domxref("PushMessageData.bytes()")}}
  - : Trích xuất dữ liệu dưới dạng đối tượng {{jsxref("Uint8Array")}}.
- {{domxref("PushMessageData.json()")}}
  - : Trích xuất dữ liệu dưới dạng đối tượng [JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON).
- {{domxref("PushMessageData.text()")}}
  - : Trích xuất dữ liệu dưới dạng chuỗi văn bản thuần.

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const obj = event.data.json();

  if (obj.action === "subscribe" || obj.action === "unsubscribe") {
    fireNotification(obj, event);
    port.postMessage(obj);
  } else if (obj.action === "init" || obj.action === "chatMsg") {
    port.postMessage(obj);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
