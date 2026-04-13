---
title: "WorkerLocation: thuộc tính hostname"
short-title: hostname
slug: Web/API/WorkerLocation/hostname
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.hostname
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`hostname`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.hostname", "hostname")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang http://localhost:8080/
const result = location.hostname; // Trả về 'localhost'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
