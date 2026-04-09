---
title: Phòng thủ
slug: Web/Security/Defenses
page-type: guide
sidebar: security
---

Những trang này mô tả các tính năng của nền tảng web cung cấp cơ chế phòng thủ trước một hoặc nhiều kiểu tấn công bảo mật.

Theo nguyên tắc chung, giữa các kiểu tấn công và phòng thủ tồn tại quan hệ nhiều-nhiều. Trong mỗi [hướng dẫn về tấn công](/en-US/docs/Web/Security/Attacks), chúng tôi mô tả các cơ chế phòng thủ cụ thể cho kiểu tấn công đó. Ở các trang phòng thủ được liệt kê bên dưới, chúng tôi cung cấp cái nhìn tổng quan rộng hơn về các cơ chế này và cách chúng hoạt động.

- [Độ minh bạch của chứng chỉ](/en-US/docs/Web/Security/Defenses/Certificate_Transparency)
  - : Cung cấp một nhật ký công khai về các chứng chỉ {{glossary("TLS")}} đã được cấp, giúp dễ phát hiện những chứng chỉ bị cấp sai hoặc có dấu hiệu độc hại.
- [Chặn nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content)
  - : Ngăn một tài liệu được phân phối qua HTTPS tải các tài nguyên con, chẳng hạn như script, ảnh hoặc phông chữ, qua HTTP.
- [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
  - : Hạn chế cách nội dung được tải từ một {{Glossary("origin")}} có thể truy cập nội dung được tải từ một origin khác. Nó kiểm soát mức độ mà các website có thể truy cập trạng thái của nhau.
- [Ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts)
  - : Một ngữ cảnh an toàn là `Window` hoặc `Worker` đáp ứng một số tiêu chuẩn tối thiểu về xác thực và bảo mật dữ liệu. Điều này thường có nghĩa là nó được phân phối qua {{glossary("HTTPS")}}. Mã chạy trong ngữ cảnh an toàn có thể sử dụng các web API mạnh mà không có trong ngữ cảnh không an toàn.
- [Tính toàn vẹn của tài nguyên con](/en-US/docs/Web/Security/Defenses/Subresource_Integrity)
  - : Cho phép một website xác minh rằng các script và stylesheet được tải từ nguồn bên ngoài, chẳng hạn như một {{glossary("CDN")}}, có nội dung như mong đợi và chưa bị sửa đổi.
- [Bảo mật tầng truyền tải (TLS)](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
  - : Cho phép một máy khách giao tiếp an toàn với máy chủ qua mạng không đáng tin cậy. Đáng chú ý nhất là trên web, nó được dùng để bảo vệ các kết nối HTTP: giao thức thu được có tên là {{glossary("HTTPS")}}. HTTPS là lá chắn thực sự duy nhất chống lại các cuộc tấn công [Man-in-the-Middle (MITM)](/en-US/docs/Web/Security/Attacks/MITM).
- [Kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation)
  - : Để bảo vệ người dùng khỏi những website có khả năng độc hại, một số API mạnh chỉ có thể được dùng khi người dùng đang tương tác với trang web, hoặc đã tương tác với trang ít nhất một lần kể từ khi trang được tải.
