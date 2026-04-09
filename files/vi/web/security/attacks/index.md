---
title: Các cuộc tấn công
slug: Web/Security/Attacks
page-type: guide
sidebar: security
---

Trong bảo mật web, một cuộc tấn công là một phương pháp cụ thể mà kẻ tấn công dùng để đạt mục tiêu của họ. Ví dụ, nếu mục tiêu của họ là đánh cắp dữ liệu người dùng, thì một cuộc tấn công cross-site scripting (XSS) là một phương pháp họ có thể dùng. Một cuộc tấn công cụ thể có thể được ngăn chặn bằng một hay nhiều biện pháp giảm thiểu: ví dụ, XSS có thể được chặn bằng cách làm sạch dữ liệu đúng cách và triển khai [content security policy](/en-US/docs/Web/HTTP/Guides/CSP).

Trang này liên kết tới các trang giải thích cách một số cuộc tấn công phổ biến hoạt động, và chúng có thể được giảm thiểu như thế nào.

- [Clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking)
  - : Trong một cuộc tấn công clickjacking, kẻ tấn công tạo một site mồi nhử nhúng site mục tiêu bên trong một phần tử {{htmlelement("iframe")}}. Nó ẩn `<iframe>`, và phủ một số phần tử mồi nhử lên trên nó. Khi người dùng tương tác với các phần tử mồi nhử này, họ thực ra đang tương tác với site mục tiêu, và có thể bị lừa thực hiện các hành động trên site mục tiêu mà họ không hề chủ định.
- [Cross-site request forgery (CSRF)](/en-US/docs/Web/Security/Attacks/CSRF)
  - : Trong một cuộc tấn công cross-site request forgery (CSRF), kẻ tấn công lừa người dùng hoặc trình duyệt thực hiện một yêu cầu HTTP tới site mục tiêu từ một site độc hại. Yêu cầu bao gồm thông tin xác thực của người dùng và khiến máy chủ thực hiện một hành động có hại, tưởng rằng đó là điều người dùng muốn.
- [Cross-site leaks (XS-Leaks)](/en-US/docs/Web/Security/Attacks/XS-Leaks)
  - : Cross-site leaks (XS-Leaks) là một họ tấn công trong đó site của kẻ tấn công có thể suy ra thông tin về site mục tiêu, hoặc về mối quan hệ của người dùng với site mục tiêu, bằng cách dùng các API nền tảng web cho phép các site tương tác với nhau.
- [Cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS)
  - : Trong một cuộc tấn công cross-site scripting (XSS), một website chấp nhận một số đầu vào do kẻ tấn công tạo ra và nhầm lẫn đưa đầu vào đó vào trang của chính site theo cách khiến trình duyệt thực thi nó như mã. Mã độc sau đó có thể làm bất cứ điều gì mà mã front-end của chính site có thể làm.
- [Insecure Direct Object Reference (IDOR)](/en-US/docs/Web/Security/Attacks/IDOR)
  - : Trong một cuộc tấn công Insecure Direct Object Reference (IDOR), kẻ tấn công lợi dụng việc kiểm soát truy cập không đủ và việc lộ các mã định danh đối tượng không an toàn, chẳng hạn khóa cơ sở dữ liệu hoặc đường dẫn tệp.
- [Manipulator in the Middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM)
  - : Trong một cuộc tấn công Manipulator in the Middle (MITM), kẻ tấn công chèn mình giữa trình duyệt của người dùng và máy chủ, và có thể nhìn thấy và có khả năng sửa đổi bất kỳ lưu lượng nào được trao đổi qua HTTP.
- [Phishing](/en-US/docs/Web/Security/Attacks/Phishing)
  - : Phishing là một cuộc tấn công {{glossary("social engineering")}} trong đó kẻ tấn công đánh cắp {{glossary("credential", "thông tin xác thực")}} của người dùng bằng cách lừa họ tin rằng họ đang đăng nhập vào site mục tiêu, trong khi thực tế họ đang tương tác với một site giả do kẻ tấn công kiểm soát.
- [Prototype pollution](/en-US/docs/Web/Security/Attacks/Prototype_pollution)
  - : Prototype pollution của JavaScript là một lỗ hổng trong đó kẻ tấn công có thể thêm hoặc sửa đổi thuộc tính trên prototype của một đối tượng. Điều này có nghĩa là các giá trị độc hại có thể xuất hiện ngoài dự kiến trên các đối tượng trong ứng dụng của bạn, thường dẫn đến lỗi logic hoặc các cuộc tấn công bổ sung như [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
- [Server Side Request Forgery (SSRF)](/en-US/docs/Web/Security/Attacks/SSRF)
  - : Server-Side Request Forgery (SSRF) là một lỗ hổng cho phép kẻ tấn công tạo các yêu cầu HTTP (hoặc yêu cầu mạng khác) tới bất kỳ đích nào. SSRF khiến các yêu cầu này xuất phát từ bên trong chính máy chủ, vốn thường có quyền truy cập rộng hơn một client bên ngoài.
- [Subdomain takeover](/en-US/docs/Web/Security/Attacks/Subdomain_takeover)
  - : Trong một cuộc tấn công subdomain takeover, kẻ tấn công giành quyền kiểm soát một subdomain của domain mục tiêu.
- [Supply chain attacks](/en-US/docs/Web/Security/Attacks/Supply_chain_attacks)
  - : Trong một cuộc tấn công supply chain, kẻ tấn công xâm phạm một phần chuỗi cung ứng của site, chẳng hạn bất kỳ phụ thuộc bên thứ ba nào mà nó sử dụng.
