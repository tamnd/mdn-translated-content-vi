---
title: "ServiceWorkerRegistration: thuộc tính waiting"
short-title: waiting
slug: Web/API/ServiceWorkerRegistration/waiting
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerRegistration.waiting
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`waiting`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một service worker có {{domxref("ServiceWorker.state")}} là `installed`. Thuộc tính này ban đầu được đặt thành `null`.

## Giá trị

Một đối tượng {{domxref("ServiceWorker")}}, nếu nó hiện đang ở trạng thái `installed`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
