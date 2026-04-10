---
title: "ServiceWorkerGlobalScope: sự kiện cookiechange"
short-title: cookiechange
slug: Web/API/ServiceWorkerGlobalScope/cookiechange_event
page-type: web-api-event
browser-compat: api.ServiceWorkerGlobalScope.cookiechange_event
---

{{APIRef("Cookie Store API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`cookiechange`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt khi một thay đổi cookie xảy ra khớp với danh sách đăng ký thay đổi cookie của service worker.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cookiechange", (event) => { })

oncookiechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("ExtendableCookieChangeEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram("ExtendableCookieChangeEvent")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
