---
title: "ServiceWorkerRegistration: thuộc tính scope"
short-title: scope
slug: Web/API/ServiceWorkerRegistration/scope
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerRegistration.scope
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`scope`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một chuỗi đại diện cho một URL xác định phạm vi đăng ký của service worker; đó là, phạm vi URL mà service worker có thể kiểm soát. Điều này được đặt bằng tham số `scope` được chỉ định trong lệnh gọi {{domxref('ServiceWorkerContainer.register()')}} đã đăng ký service worker.

## Giá trị

Trả về một chuỗi đại diện cho một URL xác định phạm vi đăng ký của service worker.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
