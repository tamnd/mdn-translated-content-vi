---
title: "PaymentRequestEvent: thuộc tính total"
short-title: total
slug: Web/API/PaymentRequestEvent/total
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentRequestEvent.total
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`total`** của giao diện {{domxref("PaymentRequestEvent")}} trả về một đối tượng `PaymentCurrencyAmount` chứa tổng số tiền được yêu cầu để thanh toán.

## Giá trị

Một đối tượng `PaymentCurrencyAmount`. Đối tượng này chứa các thuộc tính sau:

- `currency`
  - : Một chuỗi chứa mã tiền tệ theo chuẩn [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) gồm ba chữ cái biểu thị loại tiền tệ của khoản thanh toán. Ví dụ bao gồm `USD`, `CAN` và `GBP`.
- `value`
  - : Một chuỗi chứa giá trị tiền tệ thập phân, ví dụ: `2.55`.

## Ví dụ

```js
self.addEventListener("paymentrequest", (e) => {
  console.log(e.total);
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
