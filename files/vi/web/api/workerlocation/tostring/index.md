---
title: "WorkerLocation: phương thức toString()"
short-title: toString()
slug: Web/API/WorkerLocation/toString
page-type: web-api-instance-method
browser-compat: api.WorkerLocation.toString
---

{{ApiRef("WorkerLocation")}}{{AvailableInWorkers("worker")}}

Phương thức {{Glossary("stringifier")}} **`toString()`** của đối tượng {{domxref("WorkerLocation")}} trả về một chuỗi chứa {{domxref("URL")}} đã được tuần tự hóa cho vị trí của worker. Đây là từ đồng nghĩa với {{domxref("WorkerLocation.href")}}.

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Trong một Web worker, trên trang https://developer.mozilla.org/en-US/docs/Web
const result = location.toString(); // Trả về 'https://developer.mozilla.org/en-US/docs/Web'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("WorkerLocation")}} mà phương thức này thuộc về.
