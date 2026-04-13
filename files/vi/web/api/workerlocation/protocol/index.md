---
title: "WorkerLocation: thuộc tính protocol"
short-title: protocol
slug: Web/API/WorkerLocation/protocol
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.protocol
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`protocol`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.protocol", "protocol")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web
const result = location.protocol; // Trả về 'https:'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
