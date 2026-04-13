---
title: "PaymentResponse: thuộc tính methodName"
short-title: methodName
slug: Web/API/PaymentResponse/methodName
page-type: web-api-instance-property
browser-compat: api.PaymentResponse.methodName
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Thuộc tính chỉ đọc **`methodName`** của giao diện {{domxref("PaymentResponse")}} trả về một chuỗi xác định duy nhất bộ xử lý thanh toán mà người dùng đã chọn.

Chuỗi này có thể là một trong các mã định danh phương thức thanh toán chuẩn hóa hoặc là một URL được bộ xử lý thanh toán dùng để xử lý thanh toán.

## Giá trị

Một chuỗi xác định duy nhất bộ xử lý thanh toán đang được dùng để xử lý khoản thanh toán. Đây có thể là mã định danh chuẩn hóa hoặc một URL được bộ xử lý thanh toán dùng để xử lý thanh toán. Xem cách [merchant validation](/en-US/docs/Web/API/Payment_Request_API/Concepts#merchant_validation) hoạt động.

## Ví dụ

Ví dụ sau trích xuất tên phương thức từ đối tượng {{domxref('PaymentResponse')}} của Promise do {{domxref('PaymentRequest.show()')}} trả về. Trong một triển khai thực tế, dữ liệu này sau đó sẽ được gửi đến máy chủ thanh toán.

```js
payment.show().then((paymentResponse) => {
  const paymentData = {
    // chuỗi phương thức thanh toán
    method: paymentResponse.methodName,
    // chi tiết thanh toán theo yêu cầu của bạn
    details: paymentResponse.details,
    // thông tin địa chỉ giao hàng
    address: toDict(paymentResponse.shippingAddress),
  };
  // Gửi thông tin lên máy chủ
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
