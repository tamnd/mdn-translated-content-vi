---
title: "ErrorEvent: error property"
short-title: error
slug: Web/API/ErrorEvent/error
page-type: web-api-instance-property
browser-compat: api.ErrorEvent.error
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`error`** của giao diện {{domxref("ErrorEvent")}} trả về một giá trị JavaScript, chẳng hạn {{jsxref("Error")}} hoặc {{domxref("DOMException")}}, đại diện cho lỗi liên kết với sự kiện này.

## Giá trị

Bất kỳ giá trị JavaScript hợp lệ nào.

## Ví dụ

```js
window.addEventListener("error", (ev) => {
  console.log(`The error instance: ${ev.error}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
