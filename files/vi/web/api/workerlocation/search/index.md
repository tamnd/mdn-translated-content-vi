---
title: "WorkerLocation: thuộc tính search"
short-title: search
slug: Web/API/WorkerLocation/search
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.search
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`search`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.search", "search")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web?t=67
const result = location.search; // Trả về:'?t=67'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
