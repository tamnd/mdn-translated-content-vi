---
title: Xác thực
slug: Web/Security/Authentication
page-type: guide
sidebar: security
---

Xác thực là quá trình kiểm tra xem một thực thể - chẳng hạn người dùng của một trang web - có đúng là người mà họ nói mình là hay không. Nếu muốn người dùng đăng nhập vào trang web của bạn, rất có thể bạn sẽ cần nghĩ về xác thực.

Nếu người dùng có thể đăng nhập vào trang web của bạn, thường sẽ có những việc mà người dùng đã đăng nhập có thể làm, hoặc dữ liệu họ có thể truy cập, mà bạn không muốn công khai rộng rãi. Ví dụ, người dùng đã đăng nhập có thể:

- Sử dụng một dịch vụ mà họ đã trả tiền
- Chi tiền
- Truy cập thông tin cá nhân hoặc doanh nghiệp riêng tư
- Tương tác xã hội với người khác trong persona gắn với tài khoản

Tất cả các khả năng này, và nhiều hơn nữa, khiến quyền truy cập tài khoản người dùng trở thành một mục tiêu quan trọng đối với kẻ tấn công. Nếu kẻ tấn công có thể đăng nhập vào site của bạn bằng cách giả làm người dùng hợp lệ, họ có thể truy cập và khai thác, chẳng hạn, dữ liệu riêng tư của người dùng, thông tin xác thực tài chính, hoặc bí mật doanh nghiệp mật. Họ cũng có thể mạo danh người dùng trên site của bạn, gây tổn hại danh tiếng và có thể cả tài chính.

Trong bộ hướng dẫn này, chúng ta sẽ xem xét các kỹ thuật chính hiện có để xác thực người dùng trên web, cùng những thực hành tốt cho chúng.

## Các phương thức xác thực

Trong bộ hướng dẫn này, chúng ta sẽ mô tả các hệ thống xác thực sau. Mỗi hệ thống có thể được triển khai riêng lẻ hoặc kết hợp với các hệ thống khác, либо để cho người dùng có lựa chọn về hệ thống họ muốn dùng, либо để triển khai một hệ thống {{glossary("multi-factor authentication")}}.

- [Mật khẩu](/en-US/docs/Web/Security/Authentication/Passwords)
  - : Mật khẩu là một bí mật có thời hạn tương đối dài mà người dùng trình bày cho website khi họ cần đăng nhập. Website so sánh mật khẩu với một phép biến đổi của nó được lưu trữ an toàn, và sẽ đăng nhập người dùng nếu chúng khớp. Mật khẩu có nhiều điểm yếu bảo mật đã biết, và trong bài viết này chúng ta sẽ giải thích các thực hành tốt nhất để giảm thiểu chúng.
- [Mật khẩu dùng một lần (OTP)](/en-US/docs/Web/Security/Authentication/OTP)
  - : Mật khẩu dùng một lần là một mã được tạo ra, chỉ dành riêng cho một lần đăng nhập. Website hoặc gửi mã cho người dùng qua một kênh riêng, chẳng hạn email, hoặc thiết bị của người dùng tự tạo mã một cách độc lập. Sau đó người dùng nhập mã trên site để đăng nhập.
- [Danh tính liên kết](/en-US/docs/Web/Security/Authentication/Federated_identity)
  - : Trong hầu hết các hệ thống xác thực có hai bên: người dùng và website mà họ đang cố đăng nhập. Trong một hệ thống liên kết, có thêm một bên thứ ba, được gọi là _nhà cung cấp danh tính_. Khi người dùng muốn đăng nhập vào website, website sẽ yêu cầu nhà cung cấp danh tính xác nhận người dùng, và nếu việc xác nhận thành công, sẽ đăng nhập người dùng.
- [Passkey](/en-US/docs/Web/Security/Authentication/Passkeys)
  - : Passkey cho phép website xác thực người dùng mà không cần người dùng nhập mật khẩu hay bất kỳ mã bí mật nào khác ngay trên site đó.

    Trong một hệ thống dùng passkey, thiết bị của người dùng lưu trữ một {{glossary("Public-key cryptography", "cặp khóa mật mã")}} đại diện cho việc đăng ký của người dùng trên một site cụ thể. Khi người dùng cố gắng đăng nhập vào site, site sẽ gửi một thử thách đến thiết bị. Thiết bị {{glossary("digital signature", "ký")}} thử thách bằng khóa riêng tư và gửi kết quả về website, nơi có thể xác minh chữ ký và đăng nhập người dùng.

    Passkey được triển khai bằng [Web Authentication API](/en-US/docs/Web/API/Web_Authentication_API).

## Quản lý phiên

Sau khi một website đã xác thực người dùng, website thường sẽ muốn giữ người dùng đó đăng nhập mà không cần xác thực lại, либо trong một khoảng thời gian giới hạn, либо thậm chí vô thời hạn cho đến khi người dùng đăng xuất. Website thường thực hiện điều này bằng cách đặt một cookie chứa mã định danh phiên bí mật, hoặc dùng một đối tượng {{glossary("digital signature", "được ký bằng mật mã")}} chẳng hạn như {{glossary("JWT", JSON Web Token(JWT)"")}}.

Trong hướng dẫn [quản lý phiên](/en-US/docs/Web/Security/Authentication/Session_management) của chúng ta, chúng ta phác thảo các thực hành tốt nhất về quản lý phiên.
