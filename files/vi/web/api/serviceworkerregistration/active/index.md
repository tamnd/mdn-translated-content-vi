---
title: "ServiceWorkerRegistration: thuộc tính active"
short-title: active
slug: Web/API/ServiceWorkerRegistration/active
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerRegistration.active
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`active`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một service worker có {{domxref("ServiceWorker.state")}} là `activating` hoặc `activated`. Thuộc tính này ban đầu được đặt thành `null`.

Một worker đang hoạt động kiểm soát một {{domxref("Client")}} nếu URL của client nằm trong phạm vi của đăng ký (tùy chọn `scope` được đặt khi {{domxref("ServiceWorkerContainer.register")}} được gọi lần đầu tiên.)

> [!NOTE]
> Khi một worker đang hoạt động ở trạng thái `activating`, không một lỗi runtime tập lệnh nào hoặc việc chấm dứt bắt buộc worker đang hoạt động ngăn worker đang hoạt động khỏi việc được `activated`.

## Giá trị

Thuộc tính của một đối tượng {{domxref("ServiceWorker")}}, nếu nó hiện đang ở trạng thái `activating` hoặc `activated`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Service Workers](/en-US/docs/Web/API/Service_Worker_API/Using_Service_Workers)
- [Ví dụ mã cơ bản về service workers](https://github.com/mdn/dom-examples/tree/main/service-worker/simple-service-worker)
- [Sử dụng web workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers)
