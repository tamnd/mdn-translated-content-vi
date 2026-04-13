---
title: PaymentManager
slug: Web/API/PaymentManager
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PaymentManager
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`PaymentManager`** của {{domxref("Web-based Payment Handler API", "", "", "nocode")}} được sử dụng để quản lý các khía cạnh khác nhau của chức năng ứng dụng thanh toán.

Nó được truy cập thông qua thuộc tính {{domxref("ServiceWorkerRegistration.paymentManager")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PaymentManager.userHint", "userHint")}} {{Experimental_Inline}}
  - : Cung cấp gợi ý cho trình duyệt hiển thị cùng với tên và biểu tượng của ứng dụng thanh toán trong giao diện Web-based Payment Handler.

## Phương thức phiên bản

- {{domxref("PaymentManager.enableDelegations", "enableDelegations()")}} {{Experimental_Inline}}
  - : Ủy thác trách nhiệm cung cấp các phần khác nhau của thông tin thanh toán cần thiết cho ứng dụng thanh toán thay vì thu thập từ trình duyệt (ví dụ: qua tự động điền).

## Ví dụ

```js
navigator.serviceWorker.register("serviceworker.js").then((registration) => {
  registration.paymentManager.userHint = "Card number should be 16 digits";

  registration.paymentManager
    .enableDelegations(["shippingAddress", "payerName"])
    .then(() => {
      // …
    });

  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Các khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
