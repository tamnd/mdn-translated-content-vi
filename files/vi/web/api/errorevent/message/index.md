---
title: "ErrorEvent: message property"
short-title: message
slug: Web/API/ErrorEvent/message
page-type: web-api-instance-property
browser-compat: api.ErrorEvent.message
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`message`** của giao diện {{domxref("ErrorEvent")}} trả về một chuỗi chứa thông báo lỗi có thể đọc được mô tả sự cố.

## Giá trị

Một chuỗi.

## Ví dụ

```js
window.addEventListener("error", (ev) => {
  console.log(`The error message: ${ev.message}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
