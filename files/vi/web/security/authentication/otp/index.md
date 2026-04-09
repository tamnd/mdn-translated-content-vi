---
title: Mật khẩu dùng một lần (OTP)
slug: Web/Security/Authentication/OTP
page-type: guide
sidebar: security
---

_Mật khẩu dùng một lần_ (OTP), còn được gọi là _one-time PIN_ hoặc _one-time authorization code_ (OTAC), là một mã được tạo ra và chỉ áp dụng cho một lần đăng nhập duy nhất. Website либо gửi mã cho người dùng qua một kênh riêng, chẳng hạn email, либо thiết bị của người dùng tự tạo mã một cách độc lập. Sau đó người dùng nhập mã này trên site để đăng nhập.

## Tổng quan

Các luồng xác thực dùng mật khẩu một lần dựa trên một thứ mà người dùng có (điện thoại, địa chỉ email, bí mật được lưu trong ứng dụng xác thực) hơn là một thứ họ biết (mật khẩu) hoặc một thứ họ là (thông tin sinh trắc học, như dấu vân tay).

Mật khẩu dùng một lần có thể được dùng cùng với mật khẩu truyền thống, hoặc thay thế chúng. Thường chúng được dùng để xác nhận ý định của người dùng, ví dụ khi thực hiện thanh toán.

Nhiều OTP dài 6 chữ số, với xác suất đoán trúng là 1 trên 1 triệu. Điều này tốt hơn nhiều so với 4 chữ số chỉ có 10.000 tổ hợp khả dĩ. Cơ chế bảo mật mà OTP dựa vào là thành phần thời gian: OTP thường chỉ hợp lệ một lần trong một khoảng thời gian xác định và bị vô hiệu hóa sau khi dùng. Vì vậy OTP có thời hạn hết hạn ngắn (lý tưởng là ≤5 phút; 30-120 giây nếu muốn bảo vệ mạnh hơn).

Bài viết này bàn về ba cách triển khai phổ biến cho mật khẩu dùng một lần: email, SMS, và mật khẩu dùng một lần dựa trên thời gian (TOTP). Trong so sánh này, TOTP được xem là kênh phân phối an toàn nhất.

## OTP qua email

Với OTP dựa trên email, trong quá trình đăng ký:

- Người dùng cung cấp địa chỉ email của họ cho website.
- Website xác minh rằng họ có quyền truy cập vào địa chỉ email này.

Khi người dùng yêu cầu đăng nhập:

- Website tạo mã dùng một lần và gửi nó cho người dùng qua email.
- Người dùng nhập mã đó trên website.
- Website đăng nhập người dùng.

Có hai cách phổ biến để gửi mã:

1. Website gửi một liên kết dùng một lần được cá nhân hóa tới địa chỉ email của người dùng. Khi người dùng nhấp vào liên kết, website xác thực người dùng. Liên kết này chỉ hợp lệ trong vài phút và hết hạn ngay sau khi người dùng nhấp vào. Tùy chọn này có thể rất tiện cho người dùng. Tuy nhiên, nó yêu cầu người dùng hoàn tất quy trình trên cùng một thiết bị và trong cùng một trình duyệt, điều này có thể gây vấn đề khi đăng nhập từ trình duyệt trong ứng dụng hoặc từ một thiết bị khác. Việc yêu cầu người dùng nhấp vào liên kết trong email cũng khiến họ dễ bị tấn công [phishing](/en-US/docs/Web/Security/Attacks/Phishing) hơn.

2. Website gửi một mã dùng một lần được cá nhân hóa tới địa chỉ email của người dùng. Sau đó người dùng được yêu cầu nhập mã đó vào website trên thiết bị và trình duyệt mà họ muốn dùng. Quy trình này có thể chậm hơn và kém tiện hơn cho người dùng, nhưng nó linh hoạt hơn về nơi đăng nhập và được xem là an toàn hơn so với việc dùng liên kết trong email.

Để có trải nghiệm người dùng tốt với mọi phương thức OTP qua email, điều quan trọng là người dùng nhận được email OTP một cách tương đối nhanh chóng.

## OTP qua SMS

Với OTP qua SMS, người dùng cung cấp số điện thoại di động của họ trong quá trình đăng ký, và khi đăng nhập website sẽ gửi mã dùng một lần tới điện thoại trong một tin nhắn SMS.

Một điểm yếu của cả email và SMS là kẻ tấn công có thể chặn tin nhắn chứa mã. Tuy nhiên, SMS được xem là dễ bị tổn thương hơn:

- Mặc dù tin nhắn SMS có thể được mã hóa bằng [A5/X stream ciphers](https://en.wikipedia.org/wiki/A5/1), nhưng đã phát hiện nhiều điểm yếu trong bộ mã này và tin nhắn có thể bị giải mã trong vài phút hoặc vài giây.
- Có những lỗ hổng đã biết trong các giao thức định tuyến SMS ([SS7](https://en.wikipedia.org/wiki/Signalling_System_No._7)), khiến kẻ tấn công có thể chuyển hướng tin nhắn văn bản về phía chúng.
- Trong [SIM swap scams](https://en.wikipedia.org/wiki/SIM_swap_scam), kẻ tấn công lạm dụng tính năng chuyển số di động (thường được dùng khi đổi dịch vụ hoặc khi điện thoại bị mất hay bị đánh cắp) để mạo danh nạn nhân.
- Nhà mạng cũng có thể tái sử dụng số điện thoại cho người dùng mới sau khi một tài khoản bị đóng.

Ngoài ra, người dùng có thể đang dùng một SIM khác hoặc eSIM khi đi du lịch, và có thể đã tắt SIM hoặc dịch vụ SMS thường dùng để tiết kiệm chi phí, trong trường hợp đó họ sẽ không nhận được OTP qua SMS.

Vì vậy, bạn không nên dùng OTP qua SMS một mình để thiết lập phiên mới hoặc cho xác thực chung. Thay vào đó, nếu có dùng, hãy chỉ dùng nó như một yếu tố thứ hai hoặc để xác nhận ý định (ví dụ, thanh toán).

### Tự động điền mã SMS

Để giúp người dùng nhập mã SMS vào site dễ hơn, và giảm khả năng bị tấn công phishing, [standard for origin-bound one-time codes delivered via SMS](https://wicg.github.io/sms-one-time-codes/) cho phép website hỗ trợ tự động điền cho giá trị mã dùng một lần.

Để bật tính năng này, bạn cần định dạng tin nhắn SMS như sau:

```plain
Your verification code is 123456.

@www.example.com #123456
```

Sau đó trong form đăng nhập của site, hãy cung cấp một phần tử {{HTMLElement("input")}} với thuộc tính `autocomplete=one-time-code`.

```html
<form action="/verify-otp" method="POST">
  <input
    required
    type="text"
    autocomplete="one-time-code"
    inputmode="numeric"
    maxlength="6"
    pattern="\d{6}" />
  <input type="submit" />
</form>
```

Trình duyệt sẽ tự động trích xuất mã từ SMS, và nếu origin được nêu trong tin nhắn khớp với origin của form đăng nhập, nó sẽ tự động điền mã vào phần tử `<input>`.

### WebOTP API

[WebOTP API](/en-US/docs/Web/API/WebOTP_API) cho phép website truy cập theo chương trình vào các mã dùng một lần được gửi qua SMS. Tuy nhiên, nó không có hỗ trợ tốt xuyên trình duyệt, và trừ khi bạn cần truy cập theo chương trình vào mã, bạn không cần dùng API này. Dùng định dạng chuẩn và `autocomplete=one-time-code` là đủ để tự động điền hoạt động trên các trình duyệt.

## TOTP

Với mật khẩu dùng một lần dựa trên thời gian, website không gửi mã đăng nhập cho người dùng. Thay vào đó, website và người dùng đều có thể tự tạo cùng một mã một cách độc lập, dựa trên thời gian hiện tại và một bí mật dùng chung. Để tạo mã, người dùng phải cài một ứng dụng trên thiết bị của họ: đây được gọi là _ứng dụng xác thực_.

Khi đăng ký:

1. Người dùng cài một ứng dụng xác thực, nếu họ chưa có.
2. Website:
   - Tạo bí mật dùng chung.
   - Lưu bí mật này một cách an toàn, liên kết nó với tài khoản của người dùng.
   - Nhúng bí mật và một số siêu dữ liệu liên quan vào một URI [`otpauth`](https://www.rfc-editor.org/rfc/rfc6238).
   - Mã hóa URI thành mã QR và mời người dùng quét nó.

3. Ứng dụng xác thực trên thiết bị của người dùng giải mã URI từ mã QR và phân tích URI đó, lưu bí mật cùng siêu dữ liệu liên quan.

Khi đăng nhập, người dùng cung cấp giá trị mã hiện tại, mà ứng dụng xác thực tính ra dựa trên bí mật và thời gian hiện tại. Website có thể thực hiện cùng phép tính, và nếu các giá trị khớp nhau thì người dùng có thể được đăng nhập.

### Thuật toán TOTP

Thuật toán mật khẩu dùng một lần dựa trên thời gian (TOTP) được chỉ định trong {{rfc("6238")}}. Nó là một phần mở rộng của thuật toán HOTP (HMAC-Based One-Time Password Algorithm), được chỉ định trong {{rfc("4226")}}.

Thuật toán này tạo ra các mã dùng một lần dài 6 chữ số và chỉ hợp lệ trong một khoảng thời gian giới hạn (thường là 30 giây). Điều này có nghĩa là, khác với các hệ thống OTP khác đã mô tả, TOTP triển khai tính hợp lệ theo thời gian và tự động vô hiệu hóa ngay từ thiết kế.

Khóa bí mật là một giá trị ngẫu nhiên được khuyến nghị dài ít nhất 160 bit.

Bạn nên dùng một gói bên thứ ba uy tín để triển khai TOTP, chẳng hạn [pyotp](https://pyauth.github.io/pyotp/) cho Python, hoặc [otpauth](https://www.npmjs.com/package/otpauth) cho Node.

### Định dạng URI `otpauth`

Định dạng URI `otpauth` được định nghĩa trong bản nháp IETF này: [IETF draft](https://www.ietf.org/archive/id/draft-linuxgemini-otpauth-uri-00.html).

Với TOTP, URI được định dạng như sau:

```plain
otpauth://totp/LABEL?secret=MQCHJLS6FJXT2BGQJ6QMG3WCAVUC2HJZ&issuer=My_Website
```

Thành phần `LABEL` xác định người dùng: ví dụ, đó có thể là tên người dùng của họ.

URI bao gồm một số tham số truy vấn, trong đó quan trọng nhất là:

- `secret`
  - : Bí mật dùng chung được mã hóa theo [Base32](https://en.wikipedia.org/wiki/Base32).
- `issuer`
  - : Tên của nhà cung cấp hoặc dịch vụ mà tài khoản này thuộc về. Về mặt kỹ thuật là tùy chọn, nhưng rất được khuyến nghị.

### Ứng dụng xác thực

Rất nhiều ứng dụng xác thực, cả độc quyền lẫn mã nguồn mở, đều hỗ trợ TOTP. Ví dụ: [Ente Auth](https://ente.io/auth/), [2FAS](https://2fas.com), và [Microsoft Authenticator](https://www.microsoft.com/en-US/security/mobile-authenticator-app).

### Bảo vệ bí mật

Với TOTP, khóa bí mật phải được lưu trữ an toàn cả trên server lẫn client.

Với server, các cân nhắc tương tự như với [lưu trữ mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords#storing_passwords): server phải lưu bí mật TOTP sao cho kẻ tấn công không thể truy cập chúng, ngay cả khi có quyền truy cập vào cơ sở dữ liệu của server.

Với client, ứng dụng xác thực nên cung cấp một mức độ bảo vệ nào đó cho khóa bí mật.

## Điểm mạnh và điểm yếu

So với [mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords), điểm mạnh lớn nhất của OTP là người dùng không tham gia vào việc tạo hoặc ghi nhớ bí mật, vì vậy OTP không dễ bị tấn công [đoán](/en-US/docs/Web/Security/Authentication/Passwords#guessing) hay [nhồi thông tin xác thực](/en-US/docs/Web/Security/Authentication/Passwords#credential_stuffing).

### Điểm yếu

- OTP qua SMS và email có rủi ro là kẻ tấn công có thể chặn mã OTP được gửi từ server, và SMS yếu hơn email rất nhiều ở khía cạnh này.

- TOTP không dễ bị chặn, nhưng lại thêm rủi ro là kẻ tấn công có thể truy cập bí mật dùng chung.

- Tất cả các hình thức OTP đều dễ bị [tấn công phishing](/en-US/docs/Web/Security/Attacks/Phishing#multi-factor_authentication).

Ngoài vấn đề bảo mật, OTP còn có một số vấn đề về khả năng sử dụng:

- OTP qua SMS và email có thể khó dùng, đặc biệt nếu có độ trễ đáng kể giữa lúc server gửi mã và lúc người dùng nhận mã.
- Với TOTP, việc phải cài một ứng dụng xác thực là một rào cản đáng kể khi đăng ký: nhưng tất nhiên, nếu người dùng đã cài ứng dụng đó cho một site khác, thì họ sẽ không cần làm lại khi đăng ký site của bạn.

## Khuyến nghị về OTP

OTP, đặc biệt là TOTP, có thể hữu ích như một {{glossary("Multi-factor authentication", "yếu tố xác thực bổ sung")}} và để xác nhận ý định của người dùng, ví dụ khi thực hiện thanh toán. Với mục đích xác thực chung, tốt hơn là dùng [passkey](/en-US/docs/Web/Security/Authentication/Passkeys), vốn chống chịu tốt hơn trước các cuộc tấn công phishing.

Nếu bạn triển khai OTP, hãy cân nhắc các khuyến nghị sau:

- Ưu tiên TOTP hơn OTP qua email hoặc SMS, và đặc biệt tránh OTP qua SMS
- Nếu bạn dùng TOTP:
  - Dùng một thư viện uy tín để tạo bí mật và mã OTP
  - Lưu bí mật một cách an toàn trên server
