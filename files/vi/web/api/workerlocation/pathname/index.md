---
title: "WorkerLocation: thuộc tính pathname"
short-title: pathname
slug: Web/API/WorkerLocation/pathname
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.pathname
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`pathname`** của đối tượng {{domxref("WorkerLocation")}} trả về phần {{domxref("URL.pathname", "pathname")}} trong vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web
const result = location.pathname; // Trả về '/en-US/docs/Web'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
