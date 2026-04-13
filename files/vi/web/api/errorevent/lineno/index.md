---
title: "ErrorEvent: lineno property"
short-title: lineno
slug: Web/API/ErrorEvent/lineno
page-type: web-api-instance-property
browser-compat: api.ErrorEvent.lineno
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lineno`** của giao diện {{domxref("ErrorEvent")}} trả về một số nguyên chứa số dòng của tệp script nơi xảy ra lỗi.

## Giá trị

Một số nguyên.

## Ví dụ

```js
window.addEventListener("error", (ev) => {
  console.log(`The error occur in line: ${ev.lineno}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
