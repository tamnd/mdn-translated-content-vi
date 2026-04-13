---
title: "WorkerLocation: thuộc tính origin"
short-title: origin
slug: Web/API/WorkerLocation/origin
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.origin
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`origin`** của đối tượng {{domxref("WorkerLocation")}} trả về {{domxref("URL.origin", "origin")}} của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trên trang này, trả về origin
const result = self.location.origin; // Trả về:'https://developer.mozilla.org:443'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
