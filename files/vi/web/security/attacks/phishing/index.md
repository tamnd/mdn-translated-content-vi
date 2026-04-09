---
title: Phishing
slug: Web/Security/Attacks/Phishing
page-type: guide
sidebar: security
---

Phishing là một cuộc tấn công {{glossary("social engineering")}} trong đó người dùng bị lừa tin rằng họ đang tương tác với một site mà họ có tài khoản, trong khi thực tế họ đang tương tác với kẻ tấn công. Kẻ tấn công thuyết phục người dùng nhập thông tin xác thực của họ vào site giả, và nhờ đó đánh cắp thông tin xác thực của người dùng.

## Tổng quan

Phishing là một kiểu tấn công rất cũ nhưng vẫn rất phổ biến, đã có nhiều biến thể để né phòng vệ và lợi dụng các lỗ hổng mới. Tuy nhiên, ở dạng cơ bản:

1. Kẻ tấn công đăng ký một tên miền giống với site mục tiêu. Ví dụ, nếu website ngân hàng của người dùng là `my-bank.example.com`, kẻ tấn công có thể đăng ký `my-bank.examp1e.com`.
2. Kẻ tấn công tạo một site tại địa chỉ đó trông giống site thật.
3. Kẻ tấn công gửi cho người dùng một email, giả vờ đến từ `my-bank.example.com`, đưa ra một lý do nào đó để yêu cầu người dùng truy cập site, và chứa một liên kết tới site giả `my-bank.examp1e.com`.
4. Người dùng nhấp vào liên kết và được yêu cầu đăng nhập. Họ nhập tên người dùng và mật khẩu, và lúc này kẻ tấn công đã có thông tin xác thực của họ.

Tấn công phishing đôi khi dùng các kỹ thuật khác để tiếp cận nạn nhân, như tin nhắn văn bản hoặc cuộc gọi thoại, và đôi khi không liên quan tới website, mà lừa người dùng nói mật khẩu hoặc mã PIN bằng lời.

Một số cuộc tấn công phishing rất thiếu chọn lọc, gửi nhiều thông điệp tới các nạn nhân tiềm năng với hy vọng có người bị lừa. Ngược lại, trong các cuộc tấn công _spear-phishing_, kẻ tấn công nghiên cứu các nạn nhân cụ thể, thu thập thông tin cá nhân về họ để làm mồi nhử thuyết phục hơn. Ví dụ, email có thể giả vờ đến từ người mà nạn nhân quen biết, và thậm chí bao gồm thông tin riêng tư.

Tấn công phishing không phụ thuộc vào người dùng ngây thơ hay thiếu kinh nghiệm: hàng chục năm kinh nghiệm cho thấy ngay cả những người rất có kinh nghiệm và hiểu biết cũng có thể là nạn nhân của phishing, đặc biệt khi họ bận, mệt, hoặc mất tập trung.

## Phòng vệ

Một điều khiến phishing khó phòng vệ đối với website là site mục tiêu hoàn toàn không tham gia vào cuộc tấn công. Mọi thứ hoàn toàn phụ thuộc vào việc người dùng có bị kẻ tấn công lừa hay không. Trong phần này, chúng ta sẽ thảo luận một số thực hành có thể giúp, nhưng biện pháp thực sự hiệu quả nhất là dùng [passkey](#passkeys) thay cho mật khẩu.

### Cấu hình DNS

Email phishing thường giả mạo địa chỉ người gửi để khiến nạn nhân nghĩ rằng email thực sự đến từ website mục tiêu. Ba bản ghi {{glossary("DNS")}} giúp máy chủ email phát hiện các giả mạo này, từ đó giúp bảo đảm email phishing được đánh dấu là spam trong client email của nạn nhân, hoặc bị chặn hoàn toàn.

- Bản ghi [Security Policy Framework (SPF)](https://www.cloudflare.com/en-ca/learning/dns/dns-records/dns-spf-record/) liệt kê các địa chỉ được phép gửi email từ domain đó. Máy chủ email nhận sẽ trích xuất domain từ header `Return-Path` của email, và tra bản ghi SPF gắn với domain đó.
- Bản ghi [DomainKeys Identified Mail (DKIM)](https://www.cloudflare.com/en-ca/learning/dns/dns-records/dns-dkim-record/) cho phép người gửi {{glossary("digital signature", "ký số")}} email. Máy chủ nhận trích xuất domain từ chữ ký, và dùng nó để tra bản ghi DKIM gắn với domain đó. Bản ghi DKIM bao gồm khóa công khai dùng để xác minh chữ ký. Domain trong chữ ký cũng phải được căn chỉnh với domain trong header `From` của email (thực chất điều này có nghĩa là các domain phải khớp hoặc giá trị trong header `From` phải là subdomain của domain trong chữ ký).
- [Domain-based Message Authentication Reporting and Conformance (DMARC)](https://www.cloudflare.com/en-ca/learning/dns/dns-records/dns-dmarc-record/) cho người nhận biết cách xử lý các lỗi SPF và DKIM: cách ly chúng như spam, từ chối chúng, hoặc cho phép chúng.

Bạn nên đặt các bản ghi DNS này cho các domain của mình để giúp máy chủ email nhận ra các thông điệp giả mạo.

### Trình quản lý mật khẩu

Trình quản lý mật khẩu có thể cung cấp một mức độ bảo vệ nhất định chống phishing. Chúng thực hiện ba chức năng chính:

- **Tạo mật khẩu**: Tạo mật khẩu mạnh khi người dùng đăng ký.
- **Lưu trữ mật khẩu**: Lưu mật khẩu của người dùng một cách an toàn, để người dùng không phải nhớ chúng (và do đó có thể dùng mật khẩu mạnh hơn)
- **Nhập mật khẩu**: Tự động nhập mật khẩu của người dùng cho một site, khi người dùng truy cập trang đăng nhập của site đó.

Chính chức năng cuối cùng có thể giúp chống phishing. Người dùng có thể không thấy khác biệt giữa domain giả `my-bank.examp1e.com` và domain thật `my-bank.example.com`, nhưng trình quản lý mật khẩu thì sẽ thấy, và kết quả là nó sẽ không tự động nhập mật khẩu thật vào site giả. Nếu may mắn, điều này sẽ đủ là một cảnh báo để người dùng nhận ra yêu cầu đăng nhập đó không hợp lệ.

Với tư cách nhà phát triển web, bạn không thể buộc người dùng phải dùng trình quản lý mật khẩu. Nhưng nếu không cẩn thận, bạn có thể làm cho trình quản lý mật khẩu không thể tích hợp với site của mình. Bài viết [Making password managers play ball with your login form](https://hidde.blog/making-password-managers-play-ball-with-your-login-form/) là một bản tóm tắt xuất sắc về các thực hành nên theo, và các thực hành nên tránh, nếu bạn muốn người dùng có thể dùng trình quản lý mật khẩu trên site của mình. Cũng rất quan trọng là kiểm thử site của bạn với trình quản lý mật khẩu, cả những trình được tích hợp trong trình duyệt lẫn các ứng dụng độc lập phổ biến.

Rất tiếc, người dùng đã được "huấn luyện" để kỳ vọng rằng công cụ đôi khi sẽ lỗi, và phải tìm cách lách qua lỗi đó. Vì vậy, ngay cả khi người dùng có trình quản lý mật khẩu, và nó hoạt động với site của bạn, và nó không tự điền mật khẩu trong một lần phishing, bạn vẫn không có gì đảm bảo rằng người dùng sẽ không tự tay dán mật khẩu vào.

### Xác thực đa yếu tố

Dùng {{glossary("multi-factor authentication", "xác thực đa yếu tố (MFA)")}} để xác thực người dùng làm phishing khó hơn nhưng, tùy theo phương pháp cụ thể, không ngăn chặn hoàn toàn.

Đặc biệt, trong các triển khai MFA phổ biến nhất, người dùng phải nhập mật khẩu của họ và một mã khác, gọi là [one-time password (OTP)](/en-US/docs/Web/Security/Authentication/OTP), vốn là duy nhất cho lần đăng nhập này. Hai biến thể phổ biến là:

- OTP qua SMS:
  - Người dùng cung cấp số điện thoại khi đăng ký.
  - Sau khi người dùng nhập tên đăng nhập và mật khẩu, website gửi một SMS chứa OTP tới người dùng.
  - Người dùng nhập OTP.
  - Nếu giá trị OTP khớp, người dùng được đăng nhập.

- OTP theo thời gian (TOTP):
  - Người dùng đã cài ứng dụng xác thực.
  - Sau khi người dùng nhập tên đăng nhập và mật khẩu, website tính OTP bằng cách dùng thời gian hiện tại làm đầu vào.
  - Ứng dụng xác thực của người dùng thực hiện cùng phép tính đó, và người dùng nhập OTP mà ứng dụng tạo ra.
  - Nếu giá trị OTP khớp, người dùng được đăng nhập.

TOTP được xem là an toàn hơn OTP qua SMS, vì kẻ tấn công có thể chặn tin nhắn SMS. Tuy nhiên, từ góc độ phishing, cả hai phương pháp đều dễ bị tấn công.

Để phishing một người dùng dùng OTP làm yếu tố thứ hai, site giả của kẻ tấn công đóng vai trò như một manipulator in the middle đang hoạt động, nằm giữa người dùng và site thật:

1. Kẻ tấn công gửi email cho người dùng, trong đó có liên kết tới site giả.
2. Người dùng nhấp vào liên kết trong email, và nhập tên người dùng cùng mật khẩu vào site giả.
3. Site giả chuyển tiếp tên người dùng và mật khẩu tới site thật.
4. Site thật tạo một TOTP.
5. Site giả yêu cầu người dùng nhập TOTP.
6. Ứng dụng xác thực của người dùng tạo cùng TOTP đó, và người dùng nhập nó trên site giả.
7. Site giả chuyển tiếp TOTP tới site thật, và kẻ tấn công giành được quyền truy cập.

![Sơ đồ cho thấy cách một cuộc tấn công phishing có thể hoạt động chống xác thực TOTP hai yếu tố](totp-phish.svg)

Điều này khó hơn nhiều so với chỉ phishing mật khẩu, vì kẻ tấn công phải hoạt động theo thời gian thực. Tuy nhiên, các bộ công cụ phishing làm giảm đáng kể độ phức tạp để thực hiện điều đó.

### Passkey

Biện pháp kỹ thuật mạnh nhất chống phishing là xác thực người dùng bằng [passkey](/en-US/docs/Web/Security/Authentication/Passkeys).

Passkey được tạo khi người dùng đăng ký trên site, và gắn với {{glossary("origin")}} nơi nó được tạo ra ban đầu. Passkey được tạo và lưu trong một mô-đun gọi là _authenticator_, được tích hợp trong hoặc gắn với thiết bị của người dùng.

Không giống mật khẩu hay mã OTP, người dùng không bao giờ nhập thủ công passkey vào một site: trên thực tế, passkey không bao giờ được truyền tới site. Khi website yêu cầu người dùng xác thực bằng Web Authentication, trình duyệt sẽ hỏi authenticator về một passkey khớp với origin của site. Nếu tìm thấy, authenticator tạo một token mà trình duyệt gửi tới website. Website xác minh token và đăng nhập người dùng.

Vì passkey gắn với origin của site, nếu một passkey được tạo cho tài khoản người dùng tại `my-bank.example.com`, người dùng sẽ không thể dùng nó trên `my-bank.examp1e.com`. Trình duyệt sẽ không coi nó là áp dụng cho site giả.

Điều này làm cho passkey trở thành một phòng vệ hiệu quả chống phishing. Passkey là phương pháp xác thực mới hơn nhiều so với mật khẩu hay OTP, và hệ sinh thái công cụ xung quanh nó còn chưa trưởng thành bằng. Tuy nhiên, điều này đang thay đổi, và passkey cuối cùng có thể thay thế mật khẩu như phương pháp xác thực phổ biến nhất trên web.

### Chỉ báo bảo mật cá nhân hóa

Một biện pháp phòng vệ phishing khác, ngày nay không còn được dùng nhiều, là website hiển thị một thông điệp bí mật hoặc hình ảnh bí mật cho người dùng trên trang đăng nhập.

1. Sau khi người dùng đăng ký, họ được yêu cầu chọn một thông điệp bí mật hoặc hình ảnh bí mật sẽ gắn với tài khoản của họ.
2. Khi người dùng đăng nhập, trước tiên họ nhập tên người dùng.
3. Sau đó trang đăng nhập hiển thị bí mật được gắn với tài khoản đó.
4. Nếu bí mật không giống điều người dùng mong đợi, thì họ không nên nhập mật khẩu.

Ý tưởng là kẻ tấn công không biết bí mật đó là gì, nên không thể hiển thị nó trên trang đăng nhập giả.

Trong một biến thể của kỹ thuật này, website dùng một cookie bền vững để quyết định bí mật nào sẽ được hiển thị, thay vì dùng tên người dùng.

Trên thực tế, có vài khó khăn với kỹ thuật này:

- Nó phụ thuộc vào việc người dùng chú ý đến chỉ báo bảo mật: tức là phụ thuộc vào giáo dục người dùng. Kinh nghiệm cho thấy, như một nguyên tắc chung (tức là ngoài bối cảnh được kiểm soát như một công ty được quản lý an toàn), giáo dục người dùng không mấy hiệu quả trong việc ngăn phishing.
- Tùy cơ chế được dùng để quyết định bí mật nào sẽ được hiển thị, nó có thể dễ bị cùng kiểu tấn công manipulator in the middle như MFA.
- Cơ chế mà máy chủ dùng để quyết định bí mật nào sẽ hiển thị có thể dễ bị tấn công: ví dụ, kẻ tấn công có thể dễ tìm ra tên người dùng hơn mật khẩu. Với tên người dùng, kẻ tấn công có thể xác định bí mật và xây dựng một site giả rất thuyết phục.

Do các điểm yếu này, biện pháp phòng vệ này hiếm khi được dùng: MFA và passkey được xem là phòng vệ mạnh hơn.

## Danh sách kiểm tra tóm tắt phòng vệ

- Đặt các bản ghi DNS `SPF`, `DKIM`, và `DMARC` cho các domain của bạn.
- Cân nhắc dùng passkey để xác thực người dùng.
- Nếu dùng mật khẩu, hãy cân nhắc MFA, và bảo đảm trình quản lý mật khẩu có thể hoạt động với site của bạn.
