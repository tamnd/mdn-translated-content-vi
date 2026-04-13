---
title: "PaymentRequestEvent: thuộc tính modifiers"
short-title: modifiers
slug: Web/API/PaymentRequestEvent/modifiers
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentRequestEvent.modifiers
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`modifiers`** của giao diện {{domxref("PaymentRequestEvent")}} trả về một {{jsxref("Array")}} các đối tượng `PaymentDetailsModifier` chứa các bộ điều chỉnh cho chi tiết thanh toán.

## Giá trị

Một mảng đối tượng chứa các bộ điều chỉnh cho chi tiết thanh toán. Các đối tượng này chứa các thuộc tính sau:

- `supportedMethods`
  - : Một định danh phương thức thanh toán. Các thành viên của đối tượng chỉ áp dụng cho thanh toán nếu người dùng chọn phương thức thanh toán này.
- `total`
  - : Một đối tượng `PaymentItem` chứa các thuộc tính sau:
    - `label`
      - : Một chuỗi chứa mô tả có thể đọc được của mặt hàng, có thể được hiển thị cho người dùng.
    - `amount`
      - : Một đối tượng `PaymentCurrencyAmount` (xem [`total` > Giá trị](/en-US/docs/Web/API/PaymentRequestEvent/total#value)).
    - `pending`
      - : Một boolean. Khi đặt thành true, có nghĩa là thành viên `amount` không phải là cuối cùng. Điều này thường được sử dụng để hiển thị các mặt hàng như phí vận chuyển hoặc thuế phụ thuộc vào việc chọn địa chỉ giao hàng hoặc tùy chọn vận chuyển.
- `additionalDisplayItems`
  - : Một mảng các đối tượng `PaymentItem` cung cấp các mặt hàng hiển thị bổ sung để đưa vào chi tiết thanh toán. Thành viên này thường được sử dụng để thêm một mục giảm giá hoặc phụ phí cho biết lý do tại sao tổng số tiền khác cho phương thức thanh toán đã chọn mà tác nhân người dùng có thể hiển thị.
- `data`
  - : Một đối tượng cung cấp thông tin tùy chọn có thể cần thiết bởi các phương thức thanh toán được hỗ trợ. Nếu được cung cấp, nó sẽ được JSON-serialize.

## Ví dụ

```js
self.addEventListener("paymentrequest", (e) => {
  console.log(e.modifiers);
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
