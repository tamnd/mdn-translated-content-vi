---
title: "WorkerLocation: thuộc tính host"
short-title: host
slug: Web/API/WorkerLocation/host
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.host
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`host`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.host", "host")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang http://localhost:8080/
const result = location.host; // Trả về 'localhost:8080'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
