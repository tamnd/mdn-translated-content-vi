---
title: "PaymentRequestEvent: thuộc tính methodData"
short-title: methodData
slug: Web/API/PaymentRequestEvent/methodData
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentRequestEvent.methodData
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`methodData`** của giao diện {{domxref("PaymentRequestEvent")}} trả về một mảng các đối tượng `PaymentMethodData` chứa các định danh phương thức thanh toán cho các phương thức thanh toán mà trang web chấp nhận và bất kỳ dữ liệu đặc thù của phương thức thanh toán liên quan.

## Giá trị

Một mảng các đối tượng `PaymentMethodData`. Mỗi đối tượng chứa các thuộc tính sau:

- `supportedMethods`
  - : Một định danh phương thức thanh toán cho một phương thức thanh toán mà trang web của người bán chấp nhận.
- `data`
  - : Một đối tượng cung cấp thông tin tùy chọn có thể cần thiết bởi các phương thức thanh toán được hỗ trợ. Nếu được cung cấp, nó sẽ được JSON-serialize.

## Ví dụ

```js
self.addEventListener("paymentrequest", (e) => {
  console.log(e.methodData);
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
