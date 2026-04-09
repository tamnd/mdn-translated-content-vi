---
title: Mật khẩu
slug: Web/Security/Authentication/Passwords
page-type: guide
sidebar: security
---

Phương thức xác thực nguyên thủy trên web, và vẫn là phổ biến nhất, là mật khẩu.

Trong hướng dẫn này, chúng ta sẽ:

- Giới thiệu nhanh [tổng quan](#overview) về xác thực dựa trên mật khẩu
- Nhấn mạnh [những cuộc tấn công chính bạn sẽ đối mặt, và các biện pháp phòng vệ tương ứng](#attacks_and_defenses)
- Trình bày chi tiết hơn ba luồng chính: [đăng ký](#registration), [đăng nhập](#login), và [đặt lại mật khẩu](#password_reset), đồng thời cho thấy cách tích hợp các biện pháp phòng vệ.

Cuối cùng, chúng ta sẽ thảo luận về việc ngay cả khi áp dụng các thực hành tốt nhất, [xác thực dựa trên mật khẩu vẫn nên được xem là một hình thức xác thực tương đối yếu](#weaknesses_of_password-based_authentication), và nên được bổ sung bằng các phương thức khác hoặc thay thế hoàn toàn, nếu có thể.

## Tổng quan

Để cung cấp xác thực dựa trên mật khẩu, một website triển khai hai luồng chính: _đăng ký_ và _đăng nhập_.

Khi người dùng đăng ký:

1. Người dùng cung cấp một tên người dùng và mật khẩu mới, ví dụ bằng cách nhập chúng vào một phần tử {{htmlelement("form")}} trên website.
2. Trang web gửi tên người dùng và mật khẩu tới server, ví dụ bằng cách gửi dữ liệu form trong một yêu cầu {{httpmethod("POST")}}.
3. Server tạo một bản ghi mới cho người dùng này trong cơ sở dữ liệu của nó. Khóa là tên người dùng và mật khẩu được lưu dưới khóa đó.

![Đăng ký bằng mật khẩu.](password-basic-register.svg)

Khi người dùng đăng nhập:

1. Người dùng cung cấp tên người dùng và mật khẩu.
2. Trang web gửi tên người dùng và mật khẩu tới server.
3. Server lấy mật khẩu đã lưu cho người dùng, và so sánh mật khẩu đã lưu với mật khẩu vừa nhận.
4. Nếu mật khẩu khớp, người dùng được đăng nhập.

![Đăng nhập bằng mật khẩu.](password-basic-signin.svg)

## Các cuộc tấn công và phòng vệ

Nhìn vào tổng quan này, chúng ta có thể thấy một số cách mà kẻ tấn công có thể mạo danh người dùng.

- **Đoán**
  - : Kẻ tấn công có thể thử rất nhiều mật khẩu khác nhau cho một người dùng. Kẻ tấn công thường dùng các danh sách mật khẩu chứa nhiều mật khẩu phổ biến nhất.

- **Credential stuffing**
  - : Kẻ tấn công có thể mua một bộ cặp tên người dùng/mật khẩu từ một vụ rò rỉ dữ liệu trước đó trên một site khác, rồi thử chúng trên site mục tiêu với hy vọng người dùng đã dùng cùng mật khẩu cho cả hai site.

- **Chặn trên đường truyền**
  - : Kẻ tấn công có thể chặn tên người dùng và mật khẩu trong lúc chúng đang truyền từ trình duyệt tới server. Một cách thực tế để làm điều này là dựng các điểm Wi-Fi miễn phí ở quán cà phê hoặc sân bay, rồi chờ nạn nhân kết nối và đăng nhập vào website mục tiêu.

- **Xâm phạm cơ sở dữ liệu**
  - : Kẻ tấn công có thể đột nhập vào server và lấy cơ sở dữ liệu các bản ghi đã lưu.

- **Phishing**
  - : Kẻ tấn công có thể lừa người dùng đưa mật khẩu cho mình. Ví dụ, kẻ tấn công có thể tạo một trang giống hệt trang đăng nhập của site mục tiêu, và gửi cho người dùng mục tiêu một email chứa liên kết tới trang giả, yêu cầu họ đăng nhập để kiểm tra trạng thái đơn hàng hoặc nhận một tin nhắn.

### Phòng vệ

- **Hỗ trợ password manager**
  - : Password manager là một ứng dụng cho phép người dùng lưu mật khẩu, để họ không phải nhớ chúng. Password manager cũng có thể tự động điền mật khẩu vào form đăng nhập, và tạo mật khẩu mạnh cho người dùng. Password manager thường được triển khai như tiện ích trình duyệt, và bản thân trình duyệt cũng cung cấp password manager tích hợp sẵn.

    Password manager giúp giảm nguy cơ [đoán](#guessing) và [credential stuffing](#credential_stuffing), bằng cách giúp người dùng dễ tạo mật khẩu mạnh hơn nhiều và giảm mức độ tái sử dụng mật khẩu. Chúng cũng giúp chống lại [phishing](/en-US/docs/Web/Security/Attacks/Phishing#password_managers), vì chúng sẽ không tự động điền thông tin đăng nhập trên các trang web "na ná" được dùng trong tấn công phishing, và điều này giúp người dùng nhận ra site đó không hợp lệ.

    Trong các hướng dẫn cho luồng [đăng ký](#registration) và [đăng nhập](#login), chúng ta sẽ nêu cách bảo đảm password manager có thể hoạt động với site của bạn.

- **Chọn mật khẩu mạnh**
  - : Để giúp phòng chống [đoán](#guessing) và [credential stuffing](#credential_stuffing), khi người dùng tạo mật khẩu mới trong [đăng ký](#registration) hoặc [đặt lại mật khẩu](#password_reset), bạn có thể kiểm tra xem nó có yếu hay xuất hiện trong các danh sách mật khẩu đã biết bị lộ hay không.

- **Truyền mật khẩu an toàn**
  - : Để phòng chống các cuộc tấn công [chặn trên đường truyền](#interception), mật khẩu phải luôn được truyền qua {{glossary("HTTPS")}}. Tuy nhiên, điều này không nên chỉ là một yêu cầu riêng cho việc truyền mật khẩu: tất cả các trang của site nên luôn được truyền qua HTTPS, để giảm thiểu các cuộc tấn công [Manipulator in the Middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM).

- **Lưu trữ mật khẩu an toàn**
  - : Để phòng chống [xâm phạm cơ sở dữ liệu](#database_compromise), server phải lưu mật khẩu dưới một dạng khiến kẻ tấn công không thể dễ dàng lấy lại mật khẩu gốc, ngay cả khi chúng có quyền truy cập vào cơ sở dữ liệu của server. Chúng ta sẽ nêu các yêu cầu cho điều này trong hướng dẫn cho luồng [đăng ký](#registration).

Trong ba phần tiếp theo, chúng ta sẽ xem chi tiết hơn các luồng chính cần cho một hệ thống xác thực dựa trên mật khẩu:

- [Đăng ký](#registration)
- [Đăng nhập](#login)
- [Đặt lại mật khẩu](#password_reset)

Trong mỗi phần, chúng ta sẽ nhấn mạnh các thực hành giúp giảm thiểu mối đe dọa do các cuộc tấn công nêu trên, nhưng như sẽ thấy, không thể loại bỏ hoàn toàn chúng.

## Đăng ký

Trong đăng ký, một người dùng mới cung cấp tên người dùng và mật khẩu mới. Site gần như chắc chắn cũng sẽ yêu cầu địa chỉ email, và có thể chọn dùng địa chỉ email làm tên người dùng.

Site nên yêu cầu thông tin này bằng một {{htmlelement("form")}} HTML.

### Thiết kế form

Những form được thiết kế tốt giúp người dùng làm việc hiệu quả với mật khẩu, đồng thời giúp password manager tích hợp với site.

Thông thường, trên một form đăng ký, password manager sẽ:

- Nhận ra khi người dùng được yêu cầu tạo mật khẩu mới và đề nghị tạo một mật khẩu. Điều này giúp chống lại các cuộc tấn công [đoán](#guessing) và [credential stuffing](#credential_stuffing).
- Nhận ra khi người dùng gửi form đăng ký và đề nghị lưu tên người dùng cùng mật khẩu, gắn với site.

Tuân theo các thực hành bên dưới giúp password manager nhận ra các form mà chúng cần tương tác, các phần tử bên trong, và thời điểm chúng cần tham gia.

- Phần tử `<form>` nên dành riêng cho đăng ký.
- Form nên cho biết rõ ràng rằng nó đã được gửi. Điều này có nghĩa là либо điều hướng tới một trang khác khi gửi, либо mô phỏng điều hướng bằng `History.pushState()` hoặc `History.replaceState()`.
- Các phần tử `<input>` riêng lẻ nên dùng `type` đúng:
  - `"text"` hoặc `"email"` cho tên người dùng
  - `"password"` cho mật khẩu.
- Các phần tử `<input>` riêng lẻ nên dùng thuộc tính `autocomplete` đúng:
  - `"username"` cho tên người dùng
  - `"new-password"` để tạo mật khẩu mới, trong form đăng ký hoặc đặt lại mật khẩu
  - `"current-password"` để nhập mật khẩu hiện có, trong form đăng nhập hoặc đặt lại mật khẩu
- Form nên dùng các trường ẩn cho thông tin mà người dùng không cần nhập nhưng có thể cung cấp gợi ý cho password manager. Ví dụ, người dùng có thể không cần nhập tên người dùng trong form đổi mật khẩu, nhưng tên người dùng có thể giúp password manager biết nên nhập mật khẩu nào.

Để biết thêm, xem:

- [Sign-in form best practices](https://web.dev/articles/sign-in-form-best-practices#new-password)
- [Making password managers play ball with your login form](https://hidde.blog/making-password-managers-play-ball-with-your-login-form/)
- [Create Amazing Password Forms](https://www.chromium.org/developers/design-documents/create-amazing-password-forms/)

Form đăng ký thường yêu cầu người dùng nhập mật khẩu hai lần.

### Gửi form

Khi người dùng gửi form, front end của website gửi tên người dùng, cả hai bản sao của mật khẩu, và địa chỉ email tới server bằng một yêu cầu HTTP {{httpmethod("POST")}}. Việc này phải diễn ra qua {{glossary("HTTPS")}}, để ngăn kẻ tấn công [chặn](#interception) mật khẩu trên đường truyền.

### Xác thực tên người dùng và mật khẩu

Khi server nhận yêu cầu `POST`, nó xác thực tên người dùng và mật khẩu. Tên người dùng không được trùng với tên người dùng đã tồn tại, và hai bản sao của mật khẩu phải khớp nhau.

Nguy cơ tấn công [đoán](#guessing) có thể giảm nếu người dùng chọn mật khẩu mạnh hơn, và các chính sách mà website áp dụng có thể giúp điều này.

Khi người dùng chọn mật khẩu mới, website nên:

- Có độ dài mật khẩu tối đa thoải mái (ít nhất 64 ký tự).
- Cho phép mọi ký tự Unicode.
- Không yêu cầu các loại ký tự cụ thể (ví dụ, không yêu cầu pha trộn chữ hoa chữ thường, hay dấu câu). Những quy tắc kiểu này có thể loại bỏ nhiều lựa chọn mật khẩu mạnh (ví dụ, mật khẩu dạng cụm từ), và người dùng thường tuân theo các quy tắc như vậy theo những cách rất dễ đoán.

Ngoài ra, website có thể:

- Giảm nguy cơ tấn công [đoán](#guessing) bằng cách từ chối các mật khẩu có trong các danh sách mật khẩu phổ biến.
- Giảm nguy cơ tấn công [credential stuffing](#credential_stuffing) bằng cách từ chối các mật khẩu đã xuất hiện trong các vụ rò rỉ dữ liệu. Ví dụ, website [Have I Been Pwned](https://haveibeenpwned.com) cung cấp các danh sách mật khẩu được tìm thấy trong các vụ rò rỉ dữ liệu, và cung cấp chúng thông qua một [API](https://haveibeenpwned.com/API/v3#PwnedPasswords).

Tuy nhiên, lưu ý rằng đây далеко không phải là biện pháp phòng thủ hoàn chỉnh cho các cuộc tấn công này: ví dụ, các vụ rò rỉ dữ liệu có thể chưa công khai, hoặc có thể xảy ra sau khi mật khẩu đã được chọn.

Website cũng nên cân nhắc dùng một công cụ đánh giá độ mạnh mật khẩu như [zxcvbn](https://github.com/zxcvbn-ts/zxcvbn): lưu ý rằng công cụ này cũng kiểm tra mật khẩu với dữ liệu Have I Been Pwned.

Để biết thêm, xem:

- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html#implement-proper-password-strength-controls)
- [NIST Digital Identity Guidelines: Authentication and Lifecycle Management](https://pages.nist.gov/800-63-3/sp800-63b.html)
- [Passwords Evolved: Authentication Guidance for the Modern Era](https://www.troyhunt.com/passwords-evolved-authentication-guidance-for-the-modern-era/)

Client cũng có thể xác thực dữ liệu trước khi gửi tới server, nhưng điều này chỉ nhằm tạo thuận tiện cho người dùng: server vẫn phải tự xác thực dữ liệu.

### Lưu trữ mật khẩu

Nếu có lỗi xảy ra, server phản hồi bằng một thông báo lỗi. Ngược lại, server lưu mật khẩu như một bản ghi trong cơ sở dữ liệu của nó, được đánh chỉ mục theo tên người dùng.

#### Băm mật khẩu

Website không được lưu mật khẩu ở dạng {{glossary("plaintext")}}. Thay vào đó, khi người dùng đăng ký bằng mật khẩu mới (hoặc thay đổi mật khẩu), mật khẩu được băm và giá trị băm được lưu lại. Khi người dùng nhập mật khẩu của họ lúc đăng nhập, site:

- lấy giá trị băm từ cơ sở dữ liệu
- băm mật khẩu do người dùng cung cấp
- so sánh hai giá trị băm.

Hash là một _hàm một chiều_, nghĩa là không thể suy ra dữ liệu đầu vào ban đầu của hàm băm từ đầu ra của nó.

Điều này có nghĩa là nếu kẻ tấn công truy cập được cơ sở dữ liệu, chúng thường sẽ cố gắng trích xuất mật khẩu bằng cách băm các danh sách mật khẩu phổ biến và so sánh kết quả với các mục trong cơ sở dữ liệu. Vì lý do này, các hàm băm được chọn cho lưu trữ mật khẩu thường được cố ý làm chậm và khó tối ưu hóa.

Các hàm băm được thiết kế để băm mật khẩu thường cho phép bạn cấu hình lượng công việc cần thiết để tạo ra hash, nên chúng có thể được làm chậm hơn hoặc nhanh hơn tùy theo năng lực dự kiến của kẻ tấn công.

#### Bảng băm tính sẵn

Thay vì tự tính bảng băm, kẻ tấn công có thể tra cứu mật khẩu tương ứng với một hash trong một bảng đã tính sẵn (còn được gọi là [rainbow table](https://en.wikipedia.org/wiki/Rainbow_table)) ánh xạ các mật khẩu khả dĩ sang hash của chúng:

| Mật khẩu | Hash        |
| -------- | ----------- |
| pa55w0rd | 56965E2A... |
| abcdef   | BEF57EC7... |
| letmein  | 1C8BFE8F... |

Mặc dù các bảng này có thể rất lớn, các cuộc tấn công kiểu này vẫn có thể hiệu quả vì tra cứu bảng là một thao tác nhanh.

#### Salt và pepper

Để đánh bại các cuộc tấn công dùng bảng băm tính sẵn, _salt_ phải được thêm vào mật khẩu trước khi nó được băm. Salt là một giá trị ngẫu nhiên riêng cho từng mật khẩu. Nó không cần phải bí mật: salt được lưu cùng với mật khẩu đã băm. Tuy nhiên, nó ngăn kẻ tấn công dùng các giá trị băm đã tính sẵn, vì salt khiến cùng một mật khẩu sẽ băm ra giá trị khác.

Như một lớp phòng thủ bổ sung, website cũng có thể thêm _pepper_ vào đầu vào của hàm băm. Không giống salt, pepper là:

- Không duy nhất: cùng một giá trị được dùng cho tất cả mật khẩu trong cơ sở dữ liệu.
- Là bí mật: nó không được lưu trong chính cơ sở dữ liệu mà phải ở một vị trí riêng như hardware security module (HSM).

#### Thuật toán băm

Website nên dùng các thuật toán chuẩn để băm mật khẩu. Các thuật toán này hỗ trợ tất cả các tính năng đã bàn ở trên. [OWASP guide to password storage](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html#password-hashing-algorithms) khuyến nghị, theo thứ tự ưu tiên:

1. [Argon2id](https://en.wikipedia.org/wiki/Argon2)
2. [scrypt](https://en.wikipedia.org/wiki/Scrypt)
3. [bcrypt](https://en.wikipedia.org/wiki/Bcrypt)
4. [PBKDF2](https://en.wikipedia.org/wiki/PBKDF2)

#### Dùng web framework

Các hàm lưu trữ và xác minh mật khẩu rất khó triển khai an toàn, vì vậy bạn nên dùng các hàm do một framework uy tín cung cấp, thay vì tự viết. Ví dụ, [Django](https://docs.djangoproject.com/en/5.0/topics/auth/passwords/) dùng PBKDF2 theo mặc định nhưng cho phép bạn dùng thuật toán khác nếu muốn.

### Xác minh email

Nếu website dự định dùng email trong luồng đặt lại mật khẩu, thì server cũng phải kiểm tra rằng địa chỉ email đó thuộc về người dùng đang đăng ký. Để làm điều này, server thường tạo một token ngẫu nhiên và đặt nó làm tham số cho một URL xác minh:

```plain
https://example.org/verify?<random-token>
```

Sau đó server gửi email tới địa chỉ mà người dùng cung cấp. Email yêu cầu người dùng nhấp vào liên kết tới URL xác minh. Trang đó sau đó có thể trích xuất token và dùng nó để tìm bản ghi của người dùng trong cơ sở dữ liệu. Rồi nó có thể đánh dấu địa chỉ email là đã được xác minh.

## Đăng nhập

Để đăng nhập, người dùng nhập tên người dùng và mật khẩu của họ bằng một form HTML `<form>` dành riêng cho đăng nhập.

Giống như form đăng ký, form đăng nhập nên được thiết kế để hoạt động với (và được kiểm thử để hoạt động với) password manager. Để làm vậy, form nên tuân theo các thực hành đã mô tả trước đó trong [Thiết kế form](#form_design).

Khi người dùng gửi form, front end của website gửi tên người dùng và mật khẩu tới server bằng một yêu cầu HTTP `POST`. Một lần nữa, điều này phải diễn ra qua TLS, để ngăn kẻ tấn công chặn mật khẩu trên đường truyền.

Khi server nhận yêu cầu `POST`, server:

- Lấy bản ghi cho tên người dùng đã cung cấp.
- Nếu có bản ghi, so sánh mật khẩu đã cung cấp với giá trị trong bản ghi.

Nếu so sánh thành công, server đăng nhập người dùng và trả về kết quả thành công.

Nếu không tìm thấy bản ghi hoặc phép so sánh thất bại, server phải trả về cùng một thông báo lỗi trong cả hai trường hợp. Nếu không, kẻ tấn công có thể biết một tài khoản có tồn tại hay không và có thể dùng thông tin này để thực hiện các cuộc tấn công tiếp theo.

## Đặt lại mật khẩu

Luồng đặt lại mật khẩu cho phép người dùng đặt lại mật khẩu khi họ quên hoặc mất nó. Luồng này thường dựa vào việc người dùng đã cung cấp (và sau đó xác minh) địa chỉ email của họ khi đăng ký.

Khi người dùng yêu cầu đặt lại mật khẩu, website yêu cầu người dùng nhập địa chỉ email của họ. Tại thời điểm này, website có thể yêu cầu người dùng giải một CAPTCHA, để làm khó hơn cho một bên thứ ba độc hại spam người dùng hợp lệ bằng nhiều yêu cầu đặt lại mật khẩu.

Sau đó backend của website kiểm tra xem nó có bản ghi cho địa chỉ email này hay không. _Dù có hay không có bản ghi_, website vẫn đưa cùng một thông báo cho người dùng: rằng nó đã gửi một email tới địa chỉ đã nêu, kèm theo các hướng dẫn tiếp theo. Việc đưa cùng một thông báo trong cả hai trường hợp ngăn kẻ tấn công biết được một địa chỉ email nào đó có gắn với một tài khoản hay không: thông tin này có thể được dùng cho các cuộc tấn công tiếp theo (như [phishing](/en-US/docs/Web/Security/Attacks/Phishing) nhắm mục tiêu, hay _spearphishing_).

- Nếu website không có bản ghi, nó gửi một email tới địa chỉ đó, nói với người nhận rằng có ai đó đã nhập email này vào một form "password reset", nhưng site không có bản ghi cho địa chỉ này. Điều này giúp ích cho chủ tài khoản hợp lệ có nhiều địa chỉ email, và đã nhập nhầm địa chỉ trong form đặt lại mật khẩu.

- Nếu website có bản ghi cho email này, thì website:
  - Tạo một reset token, là một số ngẫu nhiên, và lưu token cùng với bản ghi. Token được gán một dấu thời gian hết hạn.
  - Đặt giá trị token làm tham số URL cho reset URL, như: `https://example.org/reset?<reset-token>`.
  - Gửi email tới địa chỉ người dùng đã cung cấp, chứa liên kết và yêu cầu người dùng nhấp vào.

Khi người dùng nhấp vào liên kết, trang đặt lại mật khẩu trích xuất tham số URL và tìm reset token đã lưu tương ứng. Nếu tìm thấy reset token và nó chưa hết hạn, website cho phép người dùng nhập mật khẩu mới. Luồng này theo các quy tắc tương tự như form [đăng ký](#registration), để mật khẩu mới có thể được password manager nhận ra.

Cuối cùng, website gửi email xác nhận cho người dùng rằng mật khẩu của họ đã được thay đổi.

Để biết thêm, xem:

- [Everything you ever wanted to know about building a secure password reset feature](https://www.troyhunt.com/everything-you-ever-wanted-to-know/)
- [Forgot Password Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Sheet.html)

## Điểm yếu của xác thực dựa trên mật khẩu

Các thực hành đã mô tả ở trên giúp giảm rủi ro của một hệ thống xác thực dựa trên mật khẩu, nhưng mật khẩu vẫn là một phương thức xác thực vốn dĩ dễ bị tấn công:

- Mặc dù password manager và chính sách mật khẩu tốt có thể giúp người dùng chọn mật khẩu mạnh và không tái sử dụng mật khẩu, chúng không thể bảo đảm cả hai kết quả đó, khiến người dùng vẫn dễ bị tấn công [credential stuffing](#credential_stuffing) và [đoán](#guessing).

- Ngay cả khi người dùng có mật khẩu mạnh và không tái sử dụng chúng, họ vẫn dễ bị tấn công [phishing](#phishing).

Để xử lý những điểm yếu này, hãy cân nhắc dùng các phương thức thay thế, либо thay cho mật khẩu, либо như các {{glossary("multi-factor authentication", "yếu tố xác thực bổ sung")}}. Ví dụ, website đôi khi dùng mật khẩu kèm [mật khẩu dùng một lần](/en-US/docs/Web/Security/Authentication/OTP) như yếu tố thứ hai, và một số website hỗ trợ [passkey](/en-US/docs/Web/Security/Authentication/Passkeys), vốn chống chịu tốt trước các cuộc tấn công phishing.
