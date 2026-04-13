---
title: SecurePaymentConfirmationRequest
slug: Web/API/SecurePaymentConfirmationRequest
page-type: web-api-interface
spec-urls: https://w3c.github.io/secure-payment-confirmation/#sctn-securepaymentconfirmationrequest-dictionary
---

{{APIRef("Payment Request API")}}

Từ điển **`SecurePaymentConfirmationRequest`** mô tả đầu vào cho [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) khi được dùng để xác thực người dùng trong giao dịch thương mại điện tử [sử dụng SPC với Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_secure_payment_confirmation).

Một phiên bản của từ điển này phải được truyền vào hàm tạo {{domxref("PaymentRequest.PaymentRequest()", "PaymentRequest()")}} làm giá trị của trường [`data`](/en-US/docs/Web/API/PaymentRequest/PaymentRequest#data) tương ứng với giá trị [`supportedMethods`](/en-US/docs/Web/API/PaymentRequest/PaymentRequest#supportedmethods) là `"secure-payment-confirmation"`.

## Thuộc tính phiên bản

- `challenge`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} được cung cấp bởi server của relying party và được sử dụng như [thách thức mật mã](https://en.wikipedia.org/wiki/Challenge%E2%80%93response_authentication). Giá trị này sẽ được ký bởi authenticator và chữ ký sẽ được gửi lại như một phần của {{domxref("AuthenticatorAttestationResponse.attestationObject")}}. Điều này giúp ngăn chặn các cuộc tấn công replay.
- `credentialIds`
  - : Danh sách {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}. Các [Credential ID](https://w3c.github.io/webauthn/#credential-id) này đại diện cho thông tin xác thực Web Authentication đã được đăng ký với relying party để xác thực trong thanh toán với `instrument` liên quan.
- `extensions` {{optional_inline}}
  - : Bất kỳ [WebAuthn extension](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions) nào nên được sử dụng cho (các) thông tin xác thực được truyền. Người gọi không cần chỉ định [extension `payment`](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions#payment); nó được thêm tự động.
- `instrument`
  - : Mô tả tên công cụ thanh toán và biểu tượng để hiển thị trong quá trình đăng ký và được ký cùng với chi tiết giao dịch. Đây là đối tượng với các thuộc tính:
    - `displayName`
      - : Chuỗi chứa tên của công cụ thanh toán, sẽ được hiển thị cho người dùng.
    - `icon`
      - : Chuỗi chứa URL của biểu tượng công cụ thanh toán.
    - `iconMustBeShown` {{optional_inline}}
      - : Giá trị boolean cho biết biểu tượng có phải được tải thành công và hiển thị để yêu cầu thành công không. Mặc định là `true`.
- `locale` {{optional_inline}}
  - : Danh sách tùy chọn các [thẻ ngôn ngữ BCP 47](/en-US/docs/Glossary/BCP_47_language_tag) được định dạng tốt, theo thứ tự ưu tiên giảm dần, xác định sở thích địa phương của trang web.
- `payeeName` {{optional_inline}}
  - : Chuỗi dùng làm tên hiển thị của người nhận thanh toán mà lệnh gọi SPC này dành cho (ví dụ: nhà buôn). Tùy chọn, có thể cung cấp cùng với hoặc thay thế `payeeOrigin`.
- `payeeOrigin` {{optional_inline}}
  - : Chuỗi là nguồn gốc của người nhận thanh toán mà lệnh gọi SPC này dành cho (ví dụ: nhà buôn). Tùy chọn, có thể cung cấp cùng với hoặc thay thế `payeeName`.
- `rpId`
  - : Chuỗi chỉ định mã định danh của relying party (ví dụ: "login.example.org").
- `showOptOut` {{optional_inline}}
  - : Giá trị boolean cho biết người dùng có nên được cho cơ hội từ chối trong [giao diện hộp thoại giao dịch](/en-US/docs/Web/API/Payment_Request_API/Using_secure_payment_confirmation#authenticating_a_payment) không. Mặc định là `false`.
- `timeout` {{optional_inline}}
  - : Số mili giây trước khi yêu cầu ký chi tiết giao dịch hết thời gian. Tối đa 1 giờ.

## Thông số kỹ thuật

{{Specifications}}
