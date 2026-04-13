---
title: "HashChangeEvent: newURL property"
short-title: newURL
slug: Web/API/HashChangeEvent/newURL
page-type: web-api-instance-property
browser-compat: api.HashChangeEvent.newURL
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`newURL`** của giao diện
{{domxref("HashChangeEvent")}} trả về URL mới mà cửa sổ đang
điều hướng đến.

## Giá trị

Một chuỗi.

## Ví dụ

```js
window.addEventListener("hashchange", (event) => {
  console.log(`Hash changed to ${event.newURL}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
