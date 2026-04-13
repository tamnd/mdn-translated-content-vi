---
title: "ErrorEvent: filename property"
short-title: filename
slug: Web/API/ErrorEvent/filename
page-type: web-api-instance-property
browser-compat: api.ErrorEvent.filename
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`filename`** của giao diện {{domxref("ErrorEvent")}} trả về một chuỗi chứa tên của tệp script trong đó xảy ra lỗi.

## Giá trị

Một chuỗi.

## Ví dụ

```js
window.addEventListener("error", (ev) => {
  console.log(`The error occur in file: ${ev.filename}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
