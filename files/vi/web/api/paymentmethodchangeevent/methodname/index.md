---
title: "PaymentMethodChangeEvent: methodName property"
short-title: methodName
slug: Web/API/PaymentMethodChangeEvent/methodName
page-type: web-api-instance-property
browser-compat: api.PaymentMethodChangeEvent.methodName
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Thuộc tính chỉ đọc **`methodName`** của giao diện {{domxref("PaymentMethodChangeEvent")}} là một chuỗi xác định duy nhất trình xử lý thanh toán hiện đang được người dùng chọn. Trình xử lý thanh toán có thể là công nghệ thanh toán như Apple Pay hoặc Android Pay, và mỗi trình xử lý thanh toán có thể hỗ trợ nhiều phương thức thanh toán; các thay đổi đối với phương thức thanh toán trong trình xử lý thanh toán được mô tả bởi `PaymentMethodChangeEvent`.

## Giá trị

Một chuỗi xác định duy nhất trình xử lý thanh toán hiện đang được chọn. Đây có thể là chuỗi được chọn từ danh sách định danh phương thức thanh toán được chuẩn hóa, hoặc URL được dùng bởi dịch vụ xử lý thanh toán. Xem [Định danh phương thức thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts#payment_method_identifiers) để biết thêm thông tin.

Giá trị mặc định là chuỗi rỗng, `""`.

## Ví dụ

Ví dụ này sử dụng sự kiện {{domxref("PaymentRequest.paymentmethodchange_event", "paymentmethodchange")}} để theo dõi các thay đổi đối với phương thức thanh toán được chọn cho Apple Pay, để tính toán giảm giá nếu người dùng chọn sử dụng thẻ Visa làm phương thức thanh toán của họ.

```js
request.onpaymentmethodchange = (ev) => {
  const { type: cardType } = ev.methodDetails;
  const newStuff = {};
  if (ev.methodName === "https://apple.com/apple-pay") {
    switch (cardType) {
      case "visa": {
        // do Apple Pay specific handling for Visa card…
        // methodDetails contains the card information
        const discount = calculateDiscount(ev.methodDetails);
        Object.assign(newStuff, discount);
        break;
      }
    }
  }
  // finally…
  ev.updateWith(newStuff);
};
const response = await request.show();
```

Lưu ý rằng thuộc tính `methodDetails` được sử dụng bởi hàm `calculateDiscount()` để tính toán bất kỳ giảm giá thanh toán nào, sau đó {{domxref("PaymentRequestUpdateEvent.updateWith", "updateWith()")}} được gọi để cập nhật sự kiện với bản cập nhật đã tính toán.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
