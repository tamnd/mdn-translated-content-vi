---
title: "PaymentRequestEvent: thuộc tính paymentRequestOrigin"
short-title: paymentRequestOrigin
slug: Web/API/PaymentRequestEvent/paymentRequestOrigin
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentRequestEvent.paymentRequestOrigin
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`paymentRequestOrigin`** của giao diện {{domxref("PaymentRequestEvent")}} trả về nguồn gốc nơi đối tượng {{domxref("PaymentRequest")}} được khởi tạo.

## Giá trị

Một chuỗi.

## Ví dụ

```js
self.addEventListener("paymentrequest", (e) => {
  console.log(e.paymentRequestOrigin);
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
