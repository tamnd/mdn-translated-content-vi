---
title: "WorkerLocation: thuộc tính href"
short-title: href
slug: Web/API/WorkerLocation/href
page-type: web-api-instance-property
browser-compat: api.WorkerLocation.href
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Thuộc tính **`href`** của đối tượng {{domxref("WorkerLocation")}} trả về một chuỗi chứa {{domxref("URL")}} đã được tuần tự hóa cho vị trí của worker.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web
const result = location.href; // Trả về 'https://developer.mozilla.org/en-US/docs/Web'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà thuộc tính này thuộc về.
