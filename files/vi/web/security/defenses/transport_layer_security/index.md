---
title: Bảo mật tầng truyền tải (TLS)
short-title: Bảo mật tầng truyền tải
slug: Web/Security/Defenses/Transport_Layer_Security
page-type: guide
sidebar: security
---

Bảo mật tầng truyền tải (TLS) là một giao thức cho phép máy khách giao tiếp an toàn với máy chủ qua một mạng không đáng tin cậy. Đáng chú ý nhất, giao thức này được dùng để bảo mật các kết nối HTTP trên web: giao thức thu được gọi là {{glossary("HTTPS")}}.

TLS bảo vệ một kết nối mạng theo ba cách:

- **Mã hóa**: dữ liệu được trao đổi giữa máy khách và máy chủ được mã hóa khi đang truyền, nên không kẻ tấn công nào có thể đọc được.
- **Toàn vẹn**: kẻ tấn công không thể bí mật sửa đổi dữ liệu (mà không bị phát hiện) khi dữ liệu đang truyền giữa máy khách và máy chủ.
- **Xác thực**: máy khách và máy chủ đều có thể chứng minh với bên kia rằng họ đúng là thực thể mà họ tuyên bố. Trên web, máy chủ thường xác thực với máy khách, nhưng máy khách thường không xác thực với máy chủ.

Đặc biệt, HTTPS là biện pháp phòng vệ trước một cuộc tấn công [kẻ thao túng ở giữa (MITM)](/en-US/docs/Web/Security/Attacks/MITM), trong đó kẻ tấn công chen vào giữa trình duyệt của người dùng và máy chủ mà họ đang kết nối tới, rồi có thể đọc và sửa đổi lưu lượng được trao đổi.

Trình duyệt xem các trang được phân phối qua HTTPS là cung cấp một [ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts). Nhiều API web mạnh chỉ khả dụng cho mã chạy trong ngữ cảnh an toàn.

**Tất cả website nên phục vụ mọi trang và subresource của chúng qua HTTPS, và triển khai xác thực máy chủ.**

## Bắt tay TLS

Khi một máy khách kết nối tới một máy chủ bằng TLS, một _cuộc bắt tay_ ban đầu sẽ thiết lập các tham số bảo mật cho giao thức:

- Máy khách và máy chủ thỏa thuận về phiên bản TLS sẽ dùng. Phiên bản TLS hiện tại là 1.3 ({{RFC(8446)}}), và đây là phiên bản được dùng rộng rãi nhất. TLS 1.2 vẫn được một số website dùng, còn TLS 1.1 và 1.0 thì không nên dùng nữa.
- Máy khách và máy chủ thỏa thuận về {{glossary("cipher suite")}} sẽ dùng: điều này xác định các thuật toán mà họ sẽ dùng cho thỏa thuận khóa, xác thực, mã hóa và xác thực thông điệp.
- Tùy chọn, máy khách và máy chủ xác thực lẫn nhau. Xác thực máy khách, trong đó máy khách chứng minh danh tính với máy chủ, hiếm gặp trên web ngoài một số ứng dụng chuyên biệt. Tuy nhiên, xác thực máy chủ, trong đó máy chủ chứng minh danh tính với máy khách, là một phần nền tảng của bảo mật web.
- Máy khách và máy chủ thỏa thuận về một {{glossary("Symmetric-key cryptography", "khóa bí mật")}} sẽ dùng để mã hóa và giải mã thông điệp.

Sau khi bắt tay xong, máy khách và máy chủ dùng khóa bí mật để mã hóa và giải mã mọi thông điệp, bao gồm cả header HTTP lẫn phần thân.

## Cấu hình TLS

Chọn cấu hình máy chủ TLS phù hợp có tác động lớn đến tính an toàn của kết nối. Cụ thể, nó xác định phiên bản TLS và các thuật toán mật mã sẽ được dùng. Nếu bạn cần cấu hình máy chủ của riêng mình, hãy tham khảo tài nguyên như [TLS Recommended Configurations](https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_configurations) của Mozilla.

Mozilla cũng cung cấp một [TLS configuration generator](https://ssl-config.mozilla.org/) để tạo tệp cấu hình cho nhiều loại máy chủ web.

## Xác thực máy chủ

Để hỗ trợ xác thực máy chủ, website của bạn phải có một {{glossary("digital certificate")}}, trong đó chứa một bản {{glossary("digital signature", "được ký số")}} của khóa công khai, là cặp tương ứng với khóa riêng của website. Điều này ràng buộc các khóa của website với tên miền của nó, để trình duyệt biết rằng nó thực sự đang kết nối tới, chẳng hạn, "https://example.com".

[Let's Encrypt](https://letsencrypt.org/) là một Certificate Authority phi lợi nhuận được dùng rộng rãi, phát hành chứng chỉ TLS miễn phí.

Các dịch vụ lưu trữ web hiện đại hỗ trợ HTTPS cho bạn, hoặc theo mặc định hoặc qua một thiết lập cấu hình. Trong tình huống này, nhiều khả năng dịch vụ lưu trữ sẽ quản lý chứng chỉ của bạn và cấu hình máy chủ thay cho bạn.

## Nội dung hỗn hợp

Một website nên dùng HTTPS không chỉ cho tài liệu chính mà còn cho mọi subresource mà nó tải, như script, stylesheet, ảnh và font. Nếu website tải tài liệu chính qua HTTPS nhưng lại tải bất kỳ subresource nào qua HTTP, điều đó được gọi là [nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content).

Ví dụ, nếu một tài liệu được phục vụ từ `https://example.org` bao gồm nội dung sau, thì nó sẽ tạo thành nội dung hỗn hợp:

```html
<img src="http://example.org/my-image.png" />
```

Nội dung hỗn hợp không an toàn vì các subresource không được hưởng sự bảo vệ mà HTTPS mang lại, nên kẻ tấn công không chỉ có thể đọc chúng mà còn có thể sửa đổi chúng. Điều này có thể làm suy yếu tính toàn vẹn của toàn bộ trang! Ví dụ, ta có thể tưởng tượng một kẻ tấn công sửa script để nó hành xử có hại. Các tài nguyên khác ít nguy hiểm hơn script, nhưng vẫn có thể nguy hiểm: ví dụ, kẻ tấn công có thể sửa ảnh để gây nhầm lẫn hoặc đánh lừa người dùng.

Vì lý do này, trình duyệt không cho phép các trang an toàn tải các subresource không an toàn. Thay vào đó, tùy thuộc vào loại subresource, chúng либо nâng cấp yêu cầu tải lên dùng HTTPS, hoặc chặn yêu cầu hoàn toàn.

Nếu bạn không thể cập nhật mã của mình để tải tài nguyên từ các URL HTTPS (ví dụ, vì HTML của bạn đã được lưu trữ thành bản lưu trữ), máy chủ của bạn có thể đặt một [chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP) chứa chỉ thị [`upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Guides/CSP#upgrading_insecure_requests), và trình duyệt sẽ tự động nâng cấp các yêu cầu này lên HTTPS.

Xem [Nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content) để biết thêm chi tiết.

## Nâng cấp kết nối HTTP

Ngay cả khi một site chỉ được phục vụ qua HTTPS, người dùng vẫn có thể yêu cầu nó qua HTTP: ví dụ, bằng cách gõ `http://example.org` vào thanh địa chỉ. Để site hoạt động trong những trường hợp như vậy, hãy lắng nghe các yêu cầu HTTP và dùng phản hồi [301 Moved Permanently](/en-US/docs/Web/HTTP/Reference/Status/301) để chuyển hướng sang phiên bản HTTPS.

Tuy nhiên, điều này cho kẻ tấn công cơ hội chặn trao đổi ban đầu, rồi ngăn việc nâng cấp lên HTTPS xảy ra. Việc này đôi khi được gọi là tấn công _SSL stripping_ ({{glossary("SSL")}} là tiền thân của TLS).

Để giảm nguy cơ của cuộc tấn công này, máy chủ cũng nên gửi header phản hồi HTTP {{httpheader("Strict-Transport-Security")}} (còn gọi là HSTS): header này thông báo cho máy khách rằng site muốn họ dùng HTTPS, và sẽ khiến trình duyệt kết nối trực tiếp bằng HTTPS cho mọi lần truy cập tiếp theo, kể cả những lần được thực hiện bằng URL HTTP.

Với HSTS, SSL stripping được ngăn chặn, ngoại trừ lần đầu tiên trình duyệt cố kết nối tới site của bạn (hoặc, vì HSTS có thời hạn hết hạn, lần đầu tiên sau khi bản ghi HSTS trong trình duyệt đã hết hạn). Để bảo vệ site ngay cả ở lần kết nối đầu tiên hoặc khi bản ghi HSTS hết hạn, Chrome duy trì một danh sách các miền gọi là [HSTS preload list](https://hstspreload.org/): nếu một miền nằm trong danh sách này, Chrome sẽ luôn nâng cấp yêu cầu HTTP lên HTTPS, về cơ bản hoạt động như thể máy chủ đã gửi sẵn header HSTS. Safari và Firefox có hành vi tương tự, dùng một danh sách được suy ra từ danh sách của Chrome.

## Xem thêm

- Kiểm thử cấu hình HTTPS/TLS:
  - [Mozilla HTTP Observatory](/en-US/observatory)
  - [SSL Labs](https://www.ssllabs.com/ssltest/)
- Cấu hình TLS được khuyến nghị:
  - [Mozilla recommended configurations](https://ssl-config.mozilla.org/)
  - [Cipherlist.eu recommended TLS configurations](https://cipherlist.eu/)
