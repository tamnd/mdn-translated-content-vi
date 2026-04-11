---
title: Sử dụng Secure Payment Confirmation
slug: Web/API/Payment_Request_API/Using_secure_payment_confirmation
page-type: guide
spec-urls:
  - https://w3c.github.io/payment-request/
  - https://w3c.github.io/payment-method-id/
  - https://w3c.github.io/webauthn/
---

{{DefaultAPISidebar("Payment Request API")}}

Secure Payment Confirmation (SPC), có sẵn thông qua Payment Request API, cung cấp cơ chế xác thực khách hàng mạnh trong quá trình thanh toán, qua đó bảo vệ chống gian lận thanh toán trực tuyến.

## Tổng quan

Để bảo vệ chống gian lận thanh toán trực tuyến, việc xác thực chủ tài khoản là điều phổ biến. Xác thực mạnh làm giảm nguy cơ gian lận, nhưng cũng làm tăng khả năng việc ma sát trong quá trình thanh toán khiến người dùng bỏ dở giỏ hàng. Vì vậy, ngân hàng, người bán, nhà cung cấp dịch vụ thanh toán và các thực thể khác trong hệ sinh thái thanh toán phải cân nhắc nhiều yếu tố khi quyết định loại và mức độ xác thực sẽ dùng cho từng giao dịch, bao gồm số tiền, mặt hàng được mua, lịch sử thanh toán của người dùng, bên nào chịu trách nhiệm trong trường hợp gian lận, và các yêu cầu pháp lý (chẳng hạn yêu cầu của [European Payment Services Directive 2](<https://en.wikipedia.org/wiki/Payment_Services_Directive#Revised_Directive_on_Payment_Services_(PSD2)>) đối với xác thực khách hàng mạnh và bằng chứng về sự đồng ý của người dùng).

Nhiều cơ chế được dùng kết hợp cho xác thực mạnh, bao gồm mật khẩu, mã SMS một lần, ứng dụng di động và Web Authentication. Mỗi cơ chế đều có ưu và nhược điểm riêng. Ví dụ, mã SMS một lần hiện đã quen thuộc với người dùng nhưng có thể gặp vấn đề về khả dụng và các lỗ hổng bảo mật. Web Authentication cung cấp bảo mật tốt hơn và có sẵn trên tất cả các trình duyệt lớn cũng như mọi thiết bị di động và máy tính hiện đại. Tuy nhiên, riêng Web Authentication không cung cấp bằng chứng về việc người dùng đồng ý thực hiện thanh toán.

SPC được thiết kế để hỗ trợ xác thực khách hàng mạnh được tinh gọn trong nhiều hệ thống thanh toán khác nhau, và để cung cấp bằng chứng mật mã rằng người dùng đã đồng ý với các điều khoản của giao dịch. Khi API được gọi, trình duyệt sẽ hiển thị các phần của giao dịch trong một hộp thoại: tên người bán, công cụ thanh toán, và số tiền cùng loại tiền của khoản thanh toán. Ví dụ, đây là hộp thoại giao dịch của Chrome (phiên bản M118) cho SPC:

![Chrome M118 transaction dialog for SPC](chrome-tx-dialog.png)

Chọn "Verify" sẽ khởi động một luồng Web Authentication. Khi người dùng xác thực thành công (ví dụ bằng xác thực sinh trắc học trên điện thoại hoặc máy tính xách tay), trình duyệt chuyển dữ liệu hiển thị trong hộp thoại cho authenticator, nơi dữ liệu được ký và trả về như một phần của assertion Web Authentication kết quả. Assertion sau đó có thể được chuyển tới Relying Party để xác thực. Vì trình duyệt chuyển trực tiếp dữ liệu hiển thị tới authenticator, mà không có mã JavaScript nào có thể thay đổi dữ liệu, Relying Party có thể tin cậy cao rằng người dùng đã đồng ý với dữ liệu giao dịch hiển thị.

Vì vậy, SPC dựa trên Web Authentication để giúp các website thực hiện xác thực mạnh tinh gọn và cung cấp bằng chứng về sự đồng ý của người dùng. SPC thường được dùng như một phần của khung xác thực của một hệ thống thanh toán cụ thể. Ví dụ, SPC được hỗ trợ bởi cả EMV® 3-D Secure (phiên bản 2.3.1) và EMV® Secure Remote Commerce (phiên bản 1.3), nhưng được thiết kế để hoạt động với rất nhiều loại thanh toán khác nhau, bao gồm cả các khoản "push payments" như chuyển khoản trực tiếp và thanh toán bằng ví.

## Phương thức payment request

Secure Payment Confirmation tận dụng các khả năng nền tảng của Payment Request API. Định danh phương thức thanh toán tiêu chuẩn cho payment handler Secure Payment Confirmation là [`"secure-payment-confirmation"`](/en-US/docs/Web/API/Payment_Request_API/Concepts#secure-payment-confirmation).

## Phần mở rộng Web authentication

Secure Payment Confirmation định nghĩa một [phần mở rộng Web Authentication](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions), [`payment`](/en-US/docs/Web/API/Web_Authentication_API/WebAuthn_extensions#payment), bổ sung ba khả năng dành riêng cho thanh toán bên trên Web Authentication truyền thống:

1. Khi Relying Party cho phép, cho phép các thực thể khác ngoài Relying Party khởi tạo một nghi thức xác thực thanh toán bằng thông tin xác thực của Relying Party. SPC tách nghi thức xác thực khỏi việc xác thực kết quả xác thực. Điều này cho phép người bán (hoặc nhà cung cấp dịch vụ thanh toán của họ trong một iframe khác nguồn gốc) giữ quyền kiểm soát trải nghiệm người dùng khi xác thực, mà không cần chuyển hướng người dùng sang một website hoặc ứng dụng di động khác. Nếu Relying Party là ngân hàng, ví dụ, điều này cho phép người bán quản lý trải nghiệm xác thực của người dùng, trong khi ngân hàng vẫn có thể xác thực kết quả xác thực. Trao đổi giữa các bên (thông tin xác thực và kết quả xác thực) thường diễn ra qua các kênh đặc thù của hệ thống thanh toán như EMV® 3-D Secure.
2. Ép user agent thông báo phù hợp cho người dùng rằng họ đang xác thực một giao dịch và các chi tiết của giao dịch đó. Sau đó, các chi tiết này được đưa vào assertion do authenticator ký.
3. Cho phép gọi `navigator.credentials.create` trong một iframe khác nguồn gốc, miễn là iframe đó được đặt chính sách quyền `payment`.
   Lưu ý: Khả năng này hiện là một phần của WebAuthn Level 3, nơi nó dùng chính sách quyền `"publickey-credential-create"` thay thế. Nhà phát triển được khuyến khích dùng cơ chế đó khi có sẵn, thay vì dựa vào quyền `"payment"` của SPC.

## Ví dụ

### Tạo thông tin xác thực

Tạo thông tin xác thực trong Secure Payment Confirmation được thực hiện bằng cùng lời gọi {{domxref("CredentialsContainer.create()", "navigator.credentials.create()")}} như với Web Authentication, nhưng có chỉ định phần mở rộng `payment`.

```js
const publicKey = {
  challenge: Uint8Array.from(randomStringFromServer, (c) => c.charCodeAt(0)),
  rp: {
    name: "Fancy Bank",
  },
  user: {
    // Giả sử userId chỉ chứa ký tự ASCII
    id: Uint8Array.from(userId, (c) => c.charCodeAt(0)),
    name: "jane.doe@example.org",
    displayName: "Jane Doe",
  },
  pubKeyCredParams: [
    {
      type: "public-key",
      alg: -7, // "ES256"
    },
    {
      type: "public-key",
      alg: -257, // "RS256"
    },
  ],
  authenticatorSelection: {
    userVerification: "required",
    residentKey: "required",
    authenticatorAttachment: "platform",
  },
  timeout: 60000, // 1 phút
  extensions: {
    payment: {
      isPayment: true,
    },
  },
};
navigator.credentials
  .create({ publicKey })
  .then((newCredentialInfo) => {
    // Gửi thông tin credential mới lên máy chủ để xác minh và đăng ký.
  })
  .catch((err) => {
    // Không có authenticator phù hợp hoặc người dùng từ chối đồng ý. Xử lý thích hợp.
  });
```

### Tạo thông tin xác thực trong iframe khác nguồn gốc

SPC cho phép tạo thông tin xác thực trong một iframe khác nguồn gốc (ví dụ `merchant.com` nhúng một iframe từ `bank.com`).

Trong luồng này, như một phần của giao dịch, Relying Party (ví dụ một ngân hàng) xác thực chủ tài khoản bằng một cơ chế khác ngoài SPC (ví dụ dùng mã một lần hoặc cơ chế khác). Sau đó Relying Party cho người dùng tùy chọn đăng ký một SPC credential để tinh gọn các giao dịch trong tương lai. Người dùng đăng ký SPC credential với Relying Party.
Để các bước này diễn ra trong ngữ cảnh của người bán (tức là không có chuyển hướng), iframe khác nguồn gốc phải được đặt chính sách quyền [`payment`](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/payment).

Ví dụ:

```html
<!-- Giả sử origin cha là merchant.com -->
<!-- Bên trong iframe khác nguồn gốc này, script sẽ được phép tạo SPC credential cho example.org -->
<iframe src="https://example.org" allow="payment"></iframe>
```

### Xác thực thanh toán

Một origin có thể gọi Payment Request API với phương thức thanh toán `"secure-payment-confirmation"` để nhắc người dùng xác minh một credential Secure Payment Confirmation được tạo bởi một origin khác. Trình duyệt sẽ hiển thị giao diện người dùng gốc ("transaction dialog") với các chi tiết giao dịch (ví dụ tiền tệ, số tiền, và origin của người nhận thanh toán).

> [!NOTE]
> Theo Payment Request API, nếu `PaymentRequest` được dùng bên trong một iframe khác nguồn gốc (ví dụ `merchant.com` nhúng một iframe từ `psp.com`, và `psp.com` muốn dùng `PaymentRequest`), thì iframe đó phải được đặt chính sách quyền `payment`.

```js
const request = new PaymentRequest(
  [
    {
      supportedMethods: "secure-payment-confirmation",
      data: {
        // Danh sách credential ID nhận được từ Account Provider.
        credentialIds,
        // Challenge cũng được lấy từ Account Provider.
        challenge: new Uint8Array(randomStringFromServer, (c) =>
          c.charCodeAt(0),
        ),
        instrument: {
          displayName: "Fancy Card ****1234",
          icon: "https://fancybank.com/card-art.png",
        },
        payeeOrigin: "https://merchant.com",
        timeout: 60000, // 1 phút
      },
    },
  ],
  {
    total: {
      label: "Total",
      amount: {
        currency: "USD",
        value: "5.00",
      },
    },
  },
);
try {
  // LƯU Ý: canMakePayment() chỉ kiểm tra thông tin công khai để xem lời gọi SPC
  // có hợp lệ không. Để bảo vệ quyền riêng tư của người dùng, nó không kiểm tra
  // liệu credential đã truyền có khớp với thiết bị hiện tại hay không.
  const canMakePayment = await request.canMakePayment();
  if (!canMakePayment) {
    throw new Error("Cannot make payment");
  }
  const response = await request.show();
  await response.complete("success");
  // response.details là một PublicKeyCredential, với clientDataJSON
  // chứa dữ liệu giao dịch để ngân hàng phát hành xác minh.
  // gửi response.details tới ngân hàng phát hành để xác minh
} catch (err) {
  // Không thể dùng SPC; người bán nên quay về các luồng truyền thống
}
```

Trước khi bắt đầu luồng thanh toán, bạn có thể xác định xem SPC có khả dụng hay không bằng cách gọi phương thức tĩnh {{domxref('PaymentRequest.securePaymentConfirmationAvailability_static', 'PaymentRequest.securePaymentConfirmationAvailability()')}}. Ví dụ:

```js
async function spcSupport() {
  const support = await PaymentRequest.securePaymentConfirmationAvailability();
  if (support === "available") {
    // Bắt đầu luồng thanh toán SPC
  } else {
    // Quay về các luồng truyền thống
  }
}
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Payment Method Identifiers](/en-US/docs/Web/API/Payment_Request_API/Concepts#payment_method_identifiers)
- [Web Authentication](/en-US/docs/Web/API/Web_Authentication_API)
- [Secure Payment Confirmation Explainer](https://github.com/w3c/secure-payment-confirmation/blob/main/explainer.md)
- [Secure Payment Confirmation Scope](https://github.com/w3c/secure-payment-confirmation/blob/main/scope.md)
- Sơ đồ luồng tổng quát [flow diagram for SPC during a payment](https://github.com/w3c/wpsig/blob/gh-pages/spc-general.png)
- [Secure Payment Confirmation Test Suite](https://wpt.fyi/results/secure-payment-confirmation?label=master&label=experimental&aligned)
- [Chrome developer documentation for SPC](https://developer.chrome.com/docs/payments/secure-payment-confirmation)
- [EMV® 3-D Secure (version 2.3)](https://www.emvco.com/emv-technologies/3-d-secure/)
- [EMV® Secure Remote Commerce (version 1.3)](https://www.emvco.com/emv-technologies/secure-remote-commerce/)
