---
title: "MerchantValidationEvent: phương thức complete()"
short-title: complete()
slug: Web/API/MerchantValidationEvent/complete
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.MerchantValidationEvent.complete
---

{{APIRef("Payment Request API")}}{{Deprecated_Header}}{{SecureContext_Header}}

Phương thức **`complete()`** của {{domxref("MerchantValidationEvent")}} nhận thông tin dành riêng cho người bán đã được truy xuất từ {{domxref("MerchantValidationEvent.validationURL", "validationURL")}} và sử dụng nó để xác thực người bán.

Bạn chỉ cần gọi `complete()` từ trình xử lý sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}}, truyền dữ liệu được tải từ `validationURL`.

## Cú pháp

```js-nolint
complete(validationData)
complete(merchantSessionPromise)
```

### Tham số

- `validationData` hoặc `merchantSessionPromise`
  - : Một đối tượng chứa dữ liệu cần thiết để hoàn tất quy trình xác thực người bán, hoặc một {{jsxref("Promise")}} phân giải thành dữ liệu xác thực.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Ngoại lệ này có thể được truyền vào trình xử lý từ chối của promise:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu sự kiện không đến trực tiếp từ tác nhân người dùng, mà thay vào đó được gửi đi bởi mã khác. Có một yêu cầu thanh toán khác đang được xử lý, yêu cầu thanh toán hiện tại không được hiển thị cho người dùng, hoặc thông tin thanh toán đang được cập nhật.

## Ví dụ

Trong ví dụ này, chúng ta thấy mã phía máy khách cần thiết để hỗ trợ xác thực người bán cho một yêu cầu thanh toán gọi là `payRequest`:

```js
payRequest.onmerchantvalidation = (event) => {
  const validationDataPromise = getValidationData(event.validationURL);
  event.complete(validationDataPromise);
};

function getValidationData(url) {
  // Retrieve the validation data from the URL
  // …
}
```

Mã này thiết lập trình xử lý sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}}. Trình xử lý sự kiện gọi hàm `getValidationData()`, hàm này truy xuất dữ liệu từ URL xác thực, sau đó truyền dữ liệu đó (hoặc promise cung cấp dữ liệu) vào `complete()`.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
