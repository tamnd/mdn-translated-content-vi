---
title: "ServiceWorker: thuộc tính scriptURL"
short-title: scriptURL
slug: Web/API/ServiceWorker/scriptURL
page-type: web-api-instance-property
browser-compat: api.ServiceWorker.scriptURL
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Trả về URL tập lệnh đã tuần tự hóa của `ServiceWorker` được định nghĩa là một phần của [`ServiceWorkerRegistration`](/en-US/docs/Web/API/ServiceWorkerRegistration).
Phải có cùng nguồn gốc với tài liệu đăng ký
`ServiceWorker`.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const sw = navigator.serviceWorker.controller;
console.log(sw.scriptURL);
// https://example.com/scripts/service-worker.js
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
