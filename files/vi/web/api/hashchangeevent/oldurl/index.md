---
title: "HashChangeEvent: oldURL property"
short-title: oldURL
slug: Web/API/HashChangeEvent/oldURL
page-type: web-api-instance-property
browser-compat: api.HashChangeEvent.oldURL
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`oldURL`** của giao diện
{{domxref("HashChangeEvent")}} trả về URL trước đó mà cửa sổ
đã điều hướng từ đó.

## Giá trị

Một chuỗi.

## Ví dụ

```js
window.addEventListener("hashchange", (event) => {
  console.log(`Hash changed from ${event.oldURL}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
