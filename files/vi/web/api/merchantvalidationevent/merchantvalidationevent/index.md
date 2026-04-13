---
title: "MerchantValidationEvent: hàm khởi tạo MerchantValidationEvent()"
short-title: MerchantValidationEvent()
slug: Web/API/MerchantValidationEvent/MerchantValidationEvent
page-type: web-api-constructor
status:
  - deprecated
browser-compat: api.MerchantValidationEvent.MerchantValidationEvent
---

{{APIRef("Payment Request API")}}{{deprecated_header}}{{securecontext_header}}

Hàm khởi tạo **`MerchantValidationEvent()`** tạo một đối tượng {{domxref("MerchantValidationEvent")}} mới. Bạn không cần phải tự tạo các sự kiện này; thay vào đó, hãy xử lý sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}}.

## Cú pháp

```js-nolint
new MerchantValidationEvent(type)
new MerchantValidationEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện. Nó phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `merchantvalidation`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `methodName` {{optional_inline}}
      - : Một chuỗi chứa định danh phương thức thanh toán cho trình xử lý thanh toán đang được sử dụng. Mặc định là chuỗi rỗng.
    - `validationURL` {{optional_inline}}
      - : URL từ đó lấy thông tin xác minh dành riêng cho trình xử lý thanh toán dùng để xác thực người bán. Mặc định là chuỗi rỗng.

### Giá trị trả về

Một đối tượng {{domxref("MerchantValidationEvent")}} mới cung cấp thông tin cần được truyền đến mã phía máy khách để trình bày với {{Glossary("user agent")}} bằng cách gọi {{domxref("MerchantValidationEvent.complete", "complete()")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu chuỗi được chỉ định là `validationURL` không thể được phân tích thành URL.
- {{jsxref("RangeError")}}
  - : Được ném nếu `methodName` được chỉ định không tương ứng với người bán đã biết và được hỗ trợ hoặc không phải là định danh phương thức thanh toán tiêu chuẩn được định dạng tốt.

## Thông số kỹ thuật

_Tính năng này đã lỗi thời và không thuộc bất kỳ thông số kỹ thuật nào._

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
