---
title: "PaymentRequestEvent: phương thức changePaymentMethod()"
short-title: changePaymentMethod()
slug: Web/API/PaymentRequestEvent/changePaymentMethod
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PaymentRequestEvent.changePaymentMethod
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Phương thức **`changePaymentMethod()`** của giao diện {{domxref("PaymentRequestEvent")}} được trình xử lý thanh toán sử dụng để lấy tổng số tiền đã cập nhật, dựa trên các chi tiết phương thức thanh toán như địa chỉ thanh toán.

Khi phương thức này được gọi, một {{domxref("PaymentMethodChangeEvent")}} được kích hoạt.

## Cú pháp

```js-nolint
changePaymentMethod(methodName)
changePaymentMethod(methodName, methodDetails)
```

### Tham số

- `methodName`
  - : Tên của phương thức thanh toán sẽ được sử dụng.
- `methodDetails` {{optional_inline}}
  - : Một đối tượng chứa các chi tiết đặc thù của phương thức đang được cập nhật.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng `PaymentRequestDetailsUpdate`. Đối tượng này chứa các thuộc tính sau:

- `error`
  - : Một chuỗi giải thích lý do tại sao phương thức thanh toán do người dùng chọn không thể được sử dụng.
- `total`
  - : Tổng số tiền đã cập nhật dựa trên phương thức thanh toán đã thay đổi. Tổng số tiền có thể thay đổi, ví dụ vì địa chỉ thanh toán của phương thức thanh toán được người dùng chọn thay đổi thuế bán hàng áp dụng.
- `modifiers`
  - : Một {{jsxref("Array")}} các đối tượng `PaymentDetailsModifier`, có thuộc tính được mô tả trong {{domxref("PaymentRequestEvent.modifiers")}}.

- `paymentMethodErrors`
  - : Một đối tượng chứa các lỗi xác thực cho phương thức thanh toán, nếu có.

## Ví dụ

Đoạn code sau đây cho thấy một đoạn code đơn giản có thể được sử dụng trong một service worker để gửi thông báo thay đổi phương thức thanh toán đến cửa sổ trình xử lý thanh toán chính. Để xem ví dụ kiểm tra đầy đủ, xem [Payment handler for testing payment method change event](https://rsolomakhin.github.io/pr/apps/pmc/).

```js
function notifyPaymentMethodChanged(e) {
  e.changePaymentMethod("someMethod")
    .then((paymentMethodChangeResponse) => {
      paymentHandlerWindow.postMessage(paymentMethodChangeResponse);
    })
    .catch((error) => {
      sendMessage({ error: error.message });
    });
}
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
