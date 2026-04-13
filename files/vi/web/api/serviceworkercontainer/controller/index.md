---
title: "ServiceWorkerContainer: thuộc tính controller"
short-title: controller
slug: Web/API/ServiceWorkerContainer/controller
page-type: web-api-instance-property
browser-compat: api.ServiceWorkerContainer.controller
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`controller`** của giao diện {{domxref("ServiceWorkerContainer")}} đại diện cho {{domxref("ServiceWorker","service worker","","nocode")}} đang hoạt động kiểm soát trang hiện tại (liên kết với `ServiceWorkerContainer` này), hoặc `null` nếu trang không có service worker đang hoạt động hoặc đang kích hoạt.

Đây là cùng đối tượng được trả về bởi {{domxref("ServiceWorkerRegistration.active")}}.

## Giá trị

Một đối tượng {{domxref("ServiceWorker")}} nếu trạng thái của nó là `activating` hoặc `activated`, hoặc `null` nếu không có worker đang hoạt động.

Thuộc tính cũng trả về `null` nếu yêu cầu là forced refresh (<kbd>Shift</kbd> + refresh)

## Ví dụ

### Kiểm tra xem một trang có được kiểm soát bởi service worker không

```js
if ("serviceWorker" in navigator) {
  // Do a one-off check to see if a service worker's in control.
  if (navigator.serviceWorker.controller) {
    console.log(
      `This page is currently controlled by: ${navigator.serviceWorker.controller}`,
    );
  } else {
    console.log("This page is not currently controlled by a service worker.");
  }
} else {
  console.log("Service workers are not supported.");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
