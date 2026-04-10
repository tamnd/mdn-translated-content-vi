---
title: "URLSearchParams: thuộc tính size"
short-title: size
slug: Web/API/URLSearchParams/size
page-type: web-api-instance-property
browser-compat: api.URLSearchParams.size
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`size`** của giao diện {{domxref("URLSearchParams")}} cho biết tổng số mục tham số truy vấn.

## Giá trị

Một số.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
console.log(params.size); // 2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
