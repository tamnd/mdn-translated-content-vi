---
title: "PaymentMethodChangeEvent: methodDetails property"
short-title: methodDetails
slug: Web/API/PaymentMethodChangeEvent/methodDetails
page-type: web-api-instance-property
browser-compat: api.PaymentMethodChangeEvent.methodDetails
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Thuộc tính chỉ đọc **`methodDetails`** của giao diện {{domxref("PaymentMethodChangeEvent")}} là một đối tượng chứa bất kỳ dữ liệu nào mà trình xử lý thanh toán có thể cung cấp để mô tả thay đổi người dùng đã thực hiện đối với phương thức thanh toán của họ. Giá trị là `null` nếu không có chi tiết nào có sẵn.

## Giá trị

Một đối tượng chứa bất kỳ dữ liệu nào cần thiết để mô tả các thay đổi đã thực hiện đối với phương thức thanh toán. Nội dung thay đổi tùy theo phương thức thanh toán thực tế được chọn, vì vậy bạn cần tham khảo thuộc tính {{domxref("PaymentMethodChangeEvent.methodName", "methodName")}} trước, sau đó giải thích `methodDetails` dựa trên đó.

Giá trị mặc định là `null`, cho biết không có chi tiết bổ sung nào có sẵn.

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
