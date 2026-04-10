---
title: "ServiceWorkerContainer: sự kiện controllerchange"
short-title: controllerchange
slug: Web/API/ServiceWorkerContainer/controllerchange_event
page-type: web-api-event
browser-compat: api.ServiceWorkerContainer.controllerchange_event
---

{{APIRef("Service Workers API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện **`controllerchange`** của giao diện {{domxref("ServiceWorkerContainer")}} được kích hoạt khi {{domxref("ServiceWorkerRegistration")}} được liên kết với tài liệu có được một worker {{domxref("ServiceWorkerRegistration.active","đang hoạt động")}} mới.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("controllerchange", (event) => { })

oncontrollerchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
navigator.serviceWorker.addEventListener("controllerchange", () => {
  console.log("The controller of current browsing context has changed.");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
