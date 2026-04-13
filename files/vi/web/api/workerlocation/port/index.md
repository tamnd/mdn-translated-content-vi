---
title: "WorkerLocation: thuộc tính port"
short-title: port
slug: Web/API/WorkerLocation/port
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.port
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`port`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.port", "port")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang http://localhost:8080/
const result = location.port; // Trả về '8080'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
