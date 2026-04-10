---
title: "PushMessageData: phương thức arrayBuffer()"
short-title: arrayBuffer()
slug: Web/API/PushMessageData/arrayBuffer
page-type: web-api-instance-method
browser-compat: api.PushMessageData.arrayBuffer
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`arrayBuffer()`** của giao diện {{domxref("PushMessageData")}} trích xuất dữ liệu push message dưới dạng đối tượng {{jsxref("ArrayBuffer")}}.

## Cú pháp

```js-nolint
arrayBuffer()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("ArrayBuffer")}}.

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const buffer = event.data.arrayBuffer();

  // làm gì đó với array buffer của bạn
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
