---
title: Payment Request API
slug: Web/API/Payment_Request_API
page-type: web-api-overview
browser-compat: api.PaymentRequest
---

{{DefaultAPISidebar("Payment Request API")}}{{securecontext_header}}

**Payment Request API** cung cấp trải nghiệm người dùng nhất quán cho người bán và người dùng. Đây không phải là một cách mới để thanh toán cho hàng hóa; thay vào đó, nó là cách để người dùng chọn phương thức thanh toán ưa thích của họ và cung cấp thông tin đó cho người bán.

## Khái niệm và cách dùng

Nhiều vấn đề liên quan đến việc người dùng bỏ dở giỏ hàng trực tuyến có thể bắt nguồn từ các biểu mẫu thanh toán, vốn có thể khó điền và tốn thời gian, đồng thời thường yêu cầu nhiều bước để hoàn tất. **Payment Request API** nhằm giảm số bước cần thiết để hoàn tất thanh toán trực tuyến, có thể loại bỏ hẳn các biểu mẫu thanh toán. Mục tiêu của API là giúp quy trình thanh toán dễ tiếp cận hơn bằng cách để các ứng dụng thanh toán lưu trữ thông tin chi tiết của người dùng, sau đó chuyển cho người bán, lý tưởng là không cần dùng biểu mẫu HTML.

Để yêu cầu thanh toán, một trang web tạo một đối tượng {{domxref("PaymentRequest")}} để phản hồi một hành động của người dùng khởi đầu quá trình thanh toán, chẳng hạn như nhấp vào nút "Purchase". `PaymentRequest` cho phép trang web trao đổi thông tin với user agent trong khi người dùng nhập dữ liệu để hoàn tất giao dịch.

Bạn có thể xem hướng dẫn đầy đủ trong [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API).

> [!NOTE]
> API chỉ có sẵn bên trong các phần tử {{htmlelement("iframe")}} khác nguồn gốc nếu chúng được đặt thuộc tính [`allowpaymentrequest`](/en-US/docs/Web/HTML/Reference/Elements/iframe#allowpaymentrequest).

## Interfaces

- {{domxref('PaymentAddress')}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Một đối tượng chứa thông tin địa chỉ; ví dụ dùng cho địa chỉ thanh toán và giao hàng.
- {{domxref('PaymentRequest')}}
  - : Một đối tượng cung cấp API để tạo và quản lý giao diện thanh toán của {{Glossary("user agent", "user agent")}}.
- {{domxref('PaymentRequestUpdateEvent')}}
  - : Cho phép trang web cập nhật chi tiết của yêu cầu thanh toán để phản hồi hành động của người dùng.
- {{domxref('PaymentMethodChangeEvent')}}
  - : Đại diện cho việc người dùng thay đổi công cụ thanh toán, ví dụ chuyển từ một phương thức thanh toán sang phương thức khác.
- {{domxref('PaymentResponse')}}
  - : Một đối tượng được trả về sau khi người dùng chọn phương thức thanh toán và chấp thuận yêu cầu thanh toán.
- {{domxref('MerchantValidationEvent')}} {{Deprecated_Inline}}
  - : Đại diện cho việc trình duyệt yêu cầu người bán (website) tự xác thực mình là được phép dùng một payment handler cụ thể, ví dụ đã được đăng ký là được phép dùng Apple Pay.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Các khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
- [Giới thiệu Payment Request API cho Apple Pay](https://webkit.org/blog/8182/introducing-the-payment-request-api-for-apple-pay/)
- [Google Pay API PaymentRequest Tutorial](https://developers.google.com/pay/api/web/guides/paymentrequest/tutorial)
- [Samsung Pay Web Payments Integration Guide](https://developer.samsung.com/internet/android/web-payments-integration-guide.html)
- [W3C Payment Request API FAQ](https://github.com/w3c/payment-request-info/wiki/FAQ)
- Chỉ thị Permissions Policy {{httpheader("Permissions-Policy/payment", "payment")}}
