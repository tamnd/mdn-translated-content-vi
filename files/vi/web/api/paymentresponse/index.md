---
title: PaymentResponse
slug: Web/API/PaymentResponse
page-type: web-api-interface
browser-compat: api.PaymentResponse
---

{{SecureContext_Header}}{{APIRef("Payment Request API")}}

Giao diện **`PaymentResponse`** của [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) được trả về sau khi người dùng chọn một phương thức thanh toán và chấp thuận yêu cầu thanh toán.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref('PaymentResponse.details')}} {{ReadOnlyInline}}
  - : Trả về một đối tượng có thể tuần tự hóa thành JSON, cung cấp thông điệp đặc thù cho phương thức thanh toán để người bán xử lý giao dịch và xác định việc chuyển tiền thành công. Nội dung của đối tượng phụ thuộc vào phương thức thanh toán đang dùng. Nhà phát triển cần tham khảo bên kiểm soát URL để biết cấu trúc mong đợi của đối tượng `details`.
- {{domxref('PaymentResponse.methodName')}} {{ReadOnlyInline}}
  - : Trả về mã định danh của phương thức thanh toán mà người dùng đã chọn, ví dụ Visa, Mastercard, PayPal, v.v.
- {{domxref('PaymentResponse.payerEmail')}} {{ReadOnlyInline}}
  - : Trả về địa chỉ email do người dùng cung cấp. Tùy chọn này chỉ xuất hiện khi tùy chọn `requestPayerEmail` được đặt thành `true` trong tham số `options` của hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}}.
- {{domxref('PaymentResponse.payerName')}} {{ReadOnlyInline}}
  - : Trả về tên do người dùng cung cấp. Tùy chọn này chỉ xuất hiện khi tùy chọn `requestPayerName` được đặt thành true trong tham số `options` của hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}}.
- {{domxref('PaymentResponse.payerPhone')}} {{ReadOnlyInline}}
  - : Trả về số điện thoại do người dùng cung cấp. Tùy chọn này chỉ xuất hiện khi tùy chọn `requestPayerPhone` được đặt thành `true` trong tham số `options` của hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}}.
- {{domxref('PaymentResponse.requestId')}} {{ReadOnlyInline}}
  - : Trả về mã định danh của {{domxref('PaymentRequest')}} đã tạo ra phản hồi hiện tại. Đây là cùng giá trị được cung cấp trong hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}} qua `details.id`.
- {{domxref('PaymentResponse.shippingAddress')}} {{ReadOnlyInline}}
  - : Trả về địa chỉ giao hàng do người dùng cung cấp. Tùy chọn này chỉ xuất hiện khi tùy chọn `requestShipping` được đặt thành `true` trong tham số `options` của hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}}.
- {{domxref('PaymentResponse.shippingOption')}} {{ReadOnlyInline}}
  - : Trả về thuộc tính ID của tùy chọn giao hàng mà người dùng đã chọn. Tùy chọn này chỉ xuất hiện khi tùy chọn `requestShipping` được đặt thành `true` trong tham số `options` của hàm dựng {{domxref('PaymentRequest.PaymentRequest','PaymentRequest()')}}.

## Phương thức thể hiện

- {{domxref('PaymentResponse.retry()')}}
  - : Nếu có gì đó không đúng với dữ liệu của phản hồi thanh toán (và có lỗi có thể khôi phục), phương thức này cho phép người bán yêu cầu người dùng thử lại thanh toán. Phương thức nhận một đối tượng làm đối số, đối tượng này được dùng để báo cho người dùng biết chính xác điều gì sai với phản hồi thanh toán để họ có thể sửa các vấn đề.
- {{domxref('PaymentResponse.complete()')}}
  - : Thông báo cho user agent rằng tương tác của người dùng đã kết thúc. Điều này sẽ đóng mọi giao diện người dùng còn lại. Chỉ nên gọi phương thức này sau Promise do phương thức {{domxref('PaymentRequest.show()')}} trả về.
- {{domxref("PaymentResponse.toJSON()")}}
  - : Trả về một [đối tượng JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON) đại diện cho đối tượng `PaymentResponse` này.

## Sự kiện

Nghe sự kiện này bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- [`payerdetailchange`](/en-US/docs/Web/API/PaymentResponse/payerdetailchange_event)
  - : Được phát trong quá trình thử lại khi người dùng thay đổi thông tin cá nhân của họ trong lúc điền biểu mẫu yêu cầu thanh toán. Cho phép nhà phát triển xác thực lại bất kỳ dữ liệu người dùng nào đã yêu cầu, ví dụ số điện thoại hoặc địa chỉ email, nếu chúng thay đổi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
