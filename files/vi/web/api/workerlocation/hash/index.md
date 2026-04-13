---
title: "WorkerLocation: thuộc tính hash"
short-title: hash
slug: Web/API/WorkerLocation/hash
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.hash
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`hash`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.hash", "hash")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web/API/WorkerLocation/hash#examples
const result = location.hash; // Trả về '#examples'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
