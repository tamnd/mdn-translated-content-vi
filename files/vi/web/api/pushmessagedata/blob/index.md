---
title: "PushMessageData: phương thức blob()"
short-title: blob()
slug: Web/API/PushMessageData/blob
page-type: web-api-instance-method
browser-compat: api.PushMessageData.blob
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`blob()`** của giao diện {{domxref("PushMessageData")}} trích xuất dữ liệu push message dưới dạng đối tượng {{domxref("Blob")}}.

## Cú pháp

```js-nolint
blob()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("Blob")}}.

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const blob = event.data.blob();

  // làm gì đó với Blob của bạn
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
