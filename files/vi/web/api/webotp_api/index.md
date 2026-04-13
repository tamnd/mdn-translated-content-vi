---
title: WebOTP API
slug: Web/API/WebOTP_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.OTPCredential
spec-urls: https://wicg.github.io/web-otp/
---

{{DefaultAPISidebar("WebOTP API")}}{{SeeCompatTable}}{{securecontext_header}}

**WebOTP API** cung cấp trải nghiệm người dùng được tối ưu hóa cho các ứng dụng web để xác minh rằng một số điện thoại thuộc về người dùng khi sử dụng nó như một yếu tố đăng nhập. WebOTP là một phần mở rộng của [Credential Management API](/en-US/docs/Web/API/Credential_Management_API).

Việc xác minh được thực hiện qua quy trình hai bước:

1. Client ứng dụng yêu cầu mật khẩu một lần (OTP), được lấy từ tin nhắn SMS có định dạng đặc biệt được gửi bởi máy chủ ứng dụng.
2. JavaScript được sử dụng để nhập OTP vào biểu mẫu xác thực trên client ứng dụng và nó được gửi trở lại máy chủ để xác minh rằng nó khớp với nội dung được gửi ban đầu trong SMS.

## Khái niệm và cách sử dụng

Số điện thoại thường được sử dụng như một cách để xác định người dùng của một ứng dụng. SMS thường được triển khai để xác minh rằng số đó thuộc về người dùng. SMS thường chứa OTP mà người dùng phải sao chép và dán vào biểu mẫu trong ứng dụng để xác minh rằng họ sở hữu số đó. Đây là một trải nghiệm người dùng hơi cồng kềnh.

Các trường hợp sử dụng OTP bao gồm:

- Cải thiện bảo mật đăng nhập bằng cách sử dụng số điện thoại như một yếu tố bổ sung trong hệ thống {{glossary("multi-factor authentication")}}.
- Xác minh các hành động nhạy cảm như thanh toán.

WebOTP API cho phép các ứng dụng web đẩy nhanh quy trình xác thực này bằng cách sao chép OTP từ SMS và chuyển nó đến ứng dụng tự động sau khi người dùng đã cung cấp sự đồng ý.

Lưu ý rằng OTP được ràng buộc với tên miền gửi. Đây là ràng buộc bảo mật hữu ích để xác minh rằng OTP đến từ nguồn đúng, có thể giảm thiểu rủi ro tấn công phishing trong quá trình xác thực lại hàng ngày.

### Mối lo ngại bảo mật với OTP SMS

OTP SMS hữu ích để xác minh số điện thoại, và sử dụng SMS như một yếu tố thứ hai chắc chắn tốt hơn là không có yếu tố thứ hai. Tuy nhiên, SMS không an toàn lắm. Kẻ tấn công có thể giả mạo SMS và chiếm đoạt số điện thoại của người dùng. Các nhà mạng có thể tái sử dụng số điện thoại cho người dùng mới sau khi tài khoản bị đóng.

Do đó, bạn được khuyến nghị sử dụng hình thức xác thực mạnh hơn nếu có thể, chẳng hạn như giải pháp dựa trên [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API) liên quan đến mật khẩu và khóa bảo mật hoặc passkey.

## WebOTP API hoạt động như thế nào?

Quy trình hoạt động như sau:

1. Tại điểm cần xác minh số điện thoại, client ứng dụng sẽ yêu cầu người dùng nhập số điện thoại của họ vào biểu mẫu, sau đó được gửi đến máy chủ ứng dụng.
2. Client ứng dụng sau đó gọi {{domxref("CredentialsContainer.get", "navigator.credentials.get()")}} với tùy chọn `otp` chỉ định loại `transport` là `"sms"`. Điều này kích hoạt yêu cầu OTP từ hệ thống cơ bản, nguồn của nó sẽ là [tin nhắn SMS có định dạng đặc biệt](#định_dạng_tin_nhắn_sms) (chứa OTP và tên miền của ứng dụng) nhận được từ máy chủ ứng dụng. Lệnh gọi `get()` dựa trên {{jsxref("Promise")}} và chờ tin nhắn SMS được nhận.
3. Máy chủ ứng dụng gửi tin nhắn SMS đến số điện thoại được chỉ định. Điều này phải được thực hiện ngay sau khi Bước 2 xảy ra.
4. Khi SMS được nhận trên thiết bị, miễn là nó chứa tên miền của ứng dụng, trình duyệt sẽ hỏi người dùng xem họ có đồng ý để OTP được truy xuất/sử dụng không. Nếu họ đồng ý, lệnh gọi `get()` sẽ hoàn thành với đối tượng {{domxref("OTPCredential")}} chứa OTP.
5. Sau đó bạn có thể sử dụng OTP theo bất kỳ cách nào bạn muốn. Cách sử dụng điển hình là đặt nó làm giá trị của biểu mẫu xác thực trên client ứng dụng và sau đó gửi biểu mẫu, làm cho quá trình trở nên liền mạch nhất có thể.
6. Máy chủ ứng dụng sau đó sẽ xác minh rằng OTP được gửi trở lại với nó khớp với OTP nó gửi trong SMS và, nếu vậy, hoàn tất quá trình.

### Định dạng tin nhắn SMS

Một tin nhắn SMS điển hình trông như sau:

```plain
Your verification code is 123456.

@www.example.com #123456
```

- Dòng đầu tiên và dòng trống thứ hai là tùy chọn và để dễ đọc cho con người.
- Dòng cuối cùng là bắt buộc. Nó phải là dòng cuối cùng nếu có các dòng khác và phải bao gồm:
  - Phần tên miền của URL của trang web đã gọi API, đứng trước bởi `@`.
  - Tiếp theo là dấu cách.
  - Tiếp theo là OTP, đứng trước bởi ký tự thăng (`#`).

## Kiểm soát quyền truy cập vào API

Tính khả dụng của WebOTP có thể được kiểm soát bằng cách sử dụng [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) chỉ định chỉ thị {{httpheader("Permissions-Policy/otp-credentials", "otp-credentials")}}.

## Các giao diện

- {{domxref("OTPCredential")}}
  - : Được trả về khi lệnh gọi WebOTP `get()` hoàn thành; bao gồm thuộc tính `code` chứa OTP đã truy xuất.

### Mở rộng cho các giao diện khác

- {{domxref("CredentialsContainer.get()")}}, tùy chọn `otp`
  - : Gọi `get()` với tùy chọn `otp` hướng dẫn user agent cố gắng truy xuất OTP từ ứng dụng SMS của hệ thống cơ bản.

## Ví dụ

Trong ví dụ này, khi tin nhắn SMS đến và người dùng cấp quyền, một đối tượng {{domxref("OTPCredential")}} được trả về với OTP. Mật khẩu này sau đó được điền sẵn vào trường biểu mẫu xác minh và biểu mẫu được gửi.

[Thử demo này bằng điện thoại](https://chrome.dev/web-otp-demo/).

```html
<input type="text" autocomplete="one-time-code" inputmode="numeric" />
```

JavaScript như sau:

```js
// Detect feature support via OTPCredential availability
if ("OTPCredential" in window) {
  const input = document.querySelector('input[autocomplete="one-time-code"]');
  if (!input) return;
  // Set up an AbortController to use with the OTP request
  const ac = new AbortController();
  const form = input.closest("form");
  if (form) {
    // Abort the OTP request if the user attempts to submit the form manually
    form.addEventListener("submit", (e) => {
      ac.abort();
    });
  }
  // Request the OTP via get()
  navigator.credentials
    .get({
      otp: { transport: ["sms"] },
      signal: ac.signal,
    })
    .then((otp) => {
      // When the OTP is received by the app client, enter it into the form
      // input and submit the form automatically
      input.value = otp.code;
      if (form) form.submit();
    })
    .catch((err) => {
      console.error(err);
    });
}
```

Một cách sử dụng tốt khác cho {{domxref("AbortController")}} là hủy yêu cầu `get()` sau một khoảng thời gian nhất định:

```js
setTimeout(() => {
  // abort after 30 seconds
  ac.abort();
}, 30 * 1000);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác minh số điện thoại trên web với WebOTP](https://developer.chrome.com/docs/identity/web-apis/web-otp) trên developer.chrome.com (2023)
- [Điền biểu mẫu OTP trong các iframe có nguồn gốc khác với WebOTP API](https://web.dev/articles/web-otp-iframe)
