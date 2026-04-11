---
title: PaymentRequest
slug: Web/API/PaymentRequest
page-type: web-api-interface
browser-compat: api.PaymentRequest
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}

Giao diện **`PaymentRequest`** của [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) là điểm truy cập chính vào API, cho phép nội dung web và ứng dụng nhận thanh toán từ người dùng cuối thay mặt cho đơn vị vận hành của trang web hoặc nhà phát hành của ứng dụng.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref('PaymentRequest.PaymentRequest()','PaymentRequest()')}}
  - : Tạo một đối tượng `PaymentRequest` mới.

## Thuộc tính thể hiện

- {{domxref('PaymentRequest.id')}} {{ReadOnlyInline}}
  - : Một định danh duy nhất cho một `PaymentRequest` cụ thể, có thể được đặt thông qua `details.id`. Khi không đặt, giá trị mặc định sẽ là UUID.
- {{domxref('PaymentRequest.shippingAddress')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Nếu được yêu cầu qua tùy chọn thanh toán, trả về địa chỉ giao hàng mà người dùng đã chọn để phục vụ tính phí vận chuyển. Thuộc tính này chỉ được điền nếu hàm tạo được gọi với cờ `requestShipping` đặt thành true. Ngoài ra, trong một số trình duyệt, các phần của địa chỉ sẽ bị che bớt vì quyền riêng tư cho đến khi người dùng cho biết họ đã sẵn sàng hoàn tất giao dịch (tức là họ nhấn "Pay").
- {{domxref('PaymentRequest.shippingOption')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về mã định danh của tùy chọn giao hàng đã chọn. Thuộc tính này chỉ được điền nếu hàm tạo được gọi với cờ `requestShipping` đặt thành true.
- {{domxref('PaymentRequest.shippingType')}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về kiểu giao hàng dùng để hoàn tất giao dịch. Giá trị này sẽ là một trong `shipping`, `delivery`, `pickup`, hoặc `null` nếu không có giá trị nào được cung cấp trong hàm tạo.

## Phương thức tĩnh

- {{domxref('PaymentRequest.securePaymentConfirmationAvailability_static', 'PaymentRequest.securePaymentConfirmationAvailability()')}} {{experimental_inline}}
  - : Cho biết tính năng [Secure payment confirmation](/en-US/docs/Web/API/Payment_Request_API/Using_secure_payment_confirmation) có khả dụng hay không.

## Phương thức thể hiện

- {{domxref('PaymentRequest.canMakePayment()')}}
  - : Cho biết đối tượng `PaymentRequest` có thể thực hiện thanh toán hay không trước khi gọi `show()`.
- {{domxref('PaymentRequest.show()')}}
  - : Làm cho user agent bắt đầu tương tác người dùng cho yêu cầu thanh toán.
- {{domxref('PaymentRequest.abort()')}}
  - : Làm cho user agent kết thúc yêu cầu thanh toán và loại bỏ mọi giao diện người dùng đang hiển thị.

## Sự kiện

- {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}} {{Deprecated_Inline}}
  - : Với một số payment handler (ví dụ: Apple Pay), trình xử lý sự kiện này được gọi để xử lý sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}}, sự kiện được phát khi user agent yêu cầu merchant xác thực rằng merchant hoặc nhà cung cấp đang yêu cầu thanh toán là hợp lệ.
- {{domxref("PaymentRequest.paymentmethodchange_event", "paymentmethodchange")}}
  - : Với một số payment handler (ví dụ: Apple Pay), được phát mỗi khi người dùng thay đổi phương thức thanh toán, như chuyển từ thẻ tín dụng sang thẻ ghi nợ.
- {{domxref("PaymentRequest.shippingaddresschange_event", "shippingaddresschange")}}{{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Được phát mỗi khi người dùng thay đổi địa chỉ giao hàng.
- {{domxref("PaymentRequest.shippingoptionchange_event", "shippingoptionchange")}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Được phát mỗi khi người dùng thay đổi một tùy chọn giao hàng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
