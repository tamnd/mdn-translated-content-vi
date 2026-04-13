---
title: "PaymentRequestUpdateEvent: phương thức updateWith()"
short-title: updateWith()
slug: Web/API/PaymentRequestUpdateEvent/updateWith
page-type: web-api-instance-method
browser-compat: api.PaymentRequestUpdateEvent.updateWith
---

{{APIRef("Payment Request API")}}{{securecontext_header}}

Phương thức **`updateWith()`** của giao diện {{domxref("PaymentRequestUpdateEvent")}} cập nhật các chi tiết của một {{domxref("PaymentRequest")}} hiện có.

## Cú pháp

```js-nolint
updateWith(details)
```

### Tham số

- `details`
  - : Một đối tượng hoặc một {{jsxref("Promise")}} giải quyết thành một đối tượng, chỉ định các thay đổi được áp dụng cho yêu cầu thanh toán:
    - `displayItems` {{optional_inline}}
      - : Một mảng các đối tượng, mỗi đối tượng mô tả một dòng mục cho yêu cầu thanh toán.
    - `error` {{optional_inline}} {{deprecated_inline}} {{non-standard_inline}}
      - : Một chuỗi chỉ định thông báo lỗi để trình bày cho người dùng.
    - `modifiers` {{optional_inline}}
      - : Một {{jsxref("Array")}} các đối tượng `PaymentDetailsModifier`.
    - `shippingAddressErrors` {{optional_inline}} {{deprecated_inline}} {{non-standard_inline}}
      - : Một đối tượng bao gồm thông báo lỗi cho mỗi thuộc tính của địa chỉ vận chuyển không thể xác thực.
    - `shippingOptions` {{optional_inline}} {{deprecated_inline}} {{non-standard_inline}}
      - : Một mảng các đối tượng, mỗi đối tượng mô tả một tùy chọn vận chuyển có sẵn.
    - `total` {{optional_inline}}
      - : Một đối tượng có các thuộc tính giống như các đối tượng trong `displayItems` cung cấp tổng cập nhật cho thanh toán.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
