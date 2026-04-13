---
title: "ErrorEvent: colno property"
short-title: colno
slug: Web/API/ErrorEvent/colno
page-type: web-api-instance-property
browser-compat: api.ErrorEvent.colno
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`colno`** của giao diện {{domxref("ErrorEvent")}} trả về một số nguyên chứa số cột của tệp script nơi xảy ra lỗi.

## Giá trị

Một số nguyên.

## Ví dụ

```js
window.addEventListener("error", (ev) => {
  console.log(`The error occur in column: ${ev.colno}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
