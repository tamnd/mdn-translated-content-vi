---
title: Các khái niệm xử lý thanh toán
slug: Web/API/Payment_Request_API/Concepts
page-type: guide
spec-urls:
  - https://w3c.github.io/payment-request/
  - https://w3c.github.io/payment-method-id/
---

{{DefaultAPISidebar("Payment Request API")}}

[Payment Request API](/en-US/docs/Web/API/Payment_Request_API) giúp việc xử lý thanh toán trên website hoặc ứng dụng trở nên dễ dàng. Trong bài viết này, chúng ta sẽ xem API hoạt động như thế nào và từng thành phần của nó làm gì.

## Thuật ngữ

Trước khi đi vào chi tiết cách API hoạt động, có một số khái niệm bạn cần biết.

- payee (hoặc merchant)
  - : Người bán - có thể là một cá nhân hoặc một tổ chức - mà website hoặc ứng dụng của họ muốn nhận tiền thông qua Payment Request API.
- payer
  - : Cá nhân hoặc tổ chức thực hiện mua hàng bằng website hoặc ứng dụng. Payer xác thực bản thân, rồi ủy quyền thanh toán, theo yêu cầu của phương thức thanh toán.
- payment method
  - : Phương tiện dùng để gửi thanh toán, chẳng hạn thẻ tín dụng hoặc dịch vụ thanh toán trực tuyến.
- payment method provider
  - : Tổ chức cung cấp công nghệ cần thiết để gửi thanh toán bằng một phương thức thanh toán nhất định. Ví dụ, khi dùng thẻ tín dụng để thanh toán, dịch vụ xử lý thẻ tín dụng là payment method provider.
- payment handler
  - : Phần triển khai mã cần thiết để giao tiếp với một payment method provider cụ thể nhằm xử lý thanh toán.

Một số payment handler dùng **merchant validation**, tức là quá trình xác thực danh tính của người bán theo một cách nào đó, thường dùng một dạng phản hồi mật mã như public key. Người bán đã được xác thực mới được phép tương tác với payment handler.

## Định danh phương thức thanh toán

Payment handler được nhận diện bằng **payment method identifiers**, là các chuỗi định danh duy nhất cho payment handler. Chúng có thể là một trong các định danh tiêu chuẩn hoặc một URL do dịch vụ xử lý thanh toán dùng để vừa nhận diện chính nó vừa xử lý thanh toán.

### Định danh phương thức thanh toán tiêu chuẩn

Định danh phương thức thanh toán tiêu chuẩn là các mục được liệt kê trong [payment method registry](https://w3c.github.io/payment-method-id/#registry).

- `secure-payment-confirmation`
  - : Nhận diện phương thức [Secure Payment Confirmation](https://w3c.github.io/secure-payment-confirmation/). Dữ liệu yêu cầu thanh toán cho phương thức này được định nghĩa bởi dictionary {{domxref("SecurePaymentConfirmationRequest")}}. Xem thêm [Sử dụng Secure Payment Confirmation](/en-US/docs/Web/API/Payment_Request_API/Using_secure_payment_confirmation).

- `basic-card`
  - : Định danh phương thức thanh toán này được thiết kế để hỗ trợ thanh toán bằng thẻ trên Web thông qua Payment Request API. **[Web Payments Working Group](https://www.w3.org/groups/wg/payments) đã loại bỏ tính năng này.**

### Định danh phương thức thanh toán dựa trên URL

Chúng có thể khác nhau đáng kể tùy theo chi tiết của dịch vụ, và một dịch vụ xử lý nhất định có thể có nhiều URL được dùng, tùy phiên bản API, công nghệ giao tiếp của họ, v.v.

- `https://apple.com/apple-pay`
  - : Thanh toán được xử lý bằng dịch vụ [Apple Pay](https://www.apple.com/apple-pay/). Hiện tại, Apple Pay chỉ được hỗ trợ bởi Safari.
- `https://google.com/pay`
  - : Thanh toán được xử lý bởi [Google Pay](https://pay.google.com/payments/home). Hiện tại, dịch vụ này chỉ được hỗ trợ trên Chrome và các trình duyệt dựa trên Chromium.

## Chức năng của payment handler

Một {{Glossary("user agent")}} có thể hỗ trợ sẵn một số kiểu thanh toán. Ngoài ra, [Payment Handler API](https://w3c.github.io/web-based-payment-handler/) có thể được dùng để bổ sung hỗ trợ cho các payment method provider khác, trong những trình duyệt hỗ trợ nó. Dù theo cách nào, payment handler có trách nhiệm:

1. **Đảm bảo rằng thanh toán có thể được thực hiện.** Các điều kiện để thanh toán có thể diễn ra thay đổi tùy theo phương thức thanh toán và yêu cầu thanh toán của người dùng; ví dụ, nếu người dùng chọn thanh toán bằng thẻ tín dụng mà người bán không chấp nhận, thanh toán không thể thực hiện.
2. **Nếu payment handler hỗ trợ merchant validation, phản hồi các yêu cầu merchant validation từ user agent.** Xem [Merchant validation](#merchant_validation) để biết chi tiết.
3. **Xác minh rằng thông tin do người dùng cung cấp tạo ra một giao dịch hợp lệ.** Điều này tạo ra và trả về một đối tượng đặc thù theo phương thức thanh toán, chứa thông tin cần thiết để xử lý giao dịch.

## Merchant validation

Một số payment handler dùng _merchant validation_, tức là quá trình xác thực danh tính của người bán theo một cách nào đó, thường dùng một dạng thử thách mật mã. Nếu người bán không xác thực thành công, họ không được phép dùng payment handler.

Công nghệ xác thực cụ thể phụ thuộc vào payment handler, và merchant validation hoàn toàn là tùy chọn. Cuối cùng, điều duy nhất mà website hoặc ứng dụng chịu trách nhiệm là lấy khóa xác thực của người bán và truyền nó vào phương thức {{domxref("MerchantValidationEvent.complete", "complete()")}} của sự kiện.

```js
paymentRequest.onmerchantvalidation = (event) => {
  event.complete(fetchValidationData(event.validationURL));
};
```

Trong ví dụ này, `fetchValidationData()` là một hàm tải thông tin định danh dành riêng cho payment handler từ địa chỉ do `validationURL` cung cấp. Lưu ý rằng hàm này phải đi qua máy chủ của người bán, vì client thường không truy cập trực tiếp URL xác thực.

Bằng cách truyền dữ liệu này (hoặc một {{jsxref("Promise")}} sẽ giải quyết thành dữ liệu đã tải) tới payment handler thông qua `complete()`, payment handler có thể dùng dữ liệu đã nhận cùng thuật toán và dữ liệu hỗ trợ khác của nó để xác minh rằng người bán có thể dùng payment handler.

Do đó, cần lưu ý rằng {{Glossary("user agent")}} không bao giờ gửi sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}}, trừ khi chính user agent đó triển khai một payment handler. Chẳng hạn, Safari có hỗ trợ tích hợp Apple Pay, nên payment handler Apple Pay dùng cơ chế này để đảm bảo Apple Pay có thể được dùng để thanh toán cho người bán bằng cách gửi `merchantvalidation` tới client, yêu cầu client lấy dữ liệu xác thực từ server và chuyển nó cho payment handler bằng cách gọi `complete()`.

## Đặc tả

{{Specifications}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Giới thiệu Payment Request API cho Apple Pay](https://webkit.org/blog/8182/introducing-the-payment-request-api-for-apple-pay/)
- [Google Pay API PaymentRequest Tutorial](https://developers.google.com/pay/api/web/guides/paymentrequest/tutorial)
