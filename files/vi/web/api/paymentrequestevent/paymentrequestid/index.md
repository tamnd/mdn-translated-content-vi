---
title: "PaymentRequestEvent: thuộc tính paymentRequestId"
short-title: paymentRequestId
slug: Web/API/PaymentRequestEvent/paymentRequestId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentRequestEvent.paymentRequestId
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`paymentRequestId`** của giao diện {{domxref("PaymentRequestEvent")}} trả về ID của đối tượng {{domxref("PaymentRequest")}}.

## Giá trị

Một chuỗi chứa ID.

## Ví dụ

```js
self.addEventListener("paymentrequest", (e) => {
  console.log(e.paymentRequestId);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Using the Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Payment processing concepts](/en-US/docs/Web/API/Payment_Request_API/Concepts)
