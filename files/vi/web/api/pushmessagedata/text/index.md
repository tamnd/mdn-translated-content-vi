---
title: "PushMessageData: phương thức text()"
short-title: text()
slug: Web/API/PushMessageData/text
page-type: web-api-instance-method
browser-compat: api.PushMessageData.text
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`text()`** của giao diện {{domxref("PushMessageData")}} trích xuất dữ liệu push message dưới dạng một chuỗi văn bản thuần.

## Cú pháp

```js-nolint
text()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi.

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const textObj = event.data.text();

  // làm gì đó với văn bản của bạn
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
