---
title: Manipulator in the Middle (MITM)
slug: Web/Security/Attacks/MITM
page-type: guide
sidebar: security
---

Trong một cuộc tấn công Manipulator in the Middle (MITM), kẻ tấn công chèn mình vào giữa hai thực thể đang cố giao tiếp với nhau.

Trên web, cuộc tấn công MITM thường xảy ra giữa trình duyệt của người dùng và máy chủ, và cho phép kẻ tấn công nhìn thấy cũng như có khả năng sửa đổi bất kỳ lưu lượng nào được trao đổi qua HTTP.

Một cách phổ biến để kẻ tấn công thực hiện MITM là dựng một điểm truy cập không dây ở nơi công cộng, như quán cà phê hoặc sân bay, rồi chờ một nạn nhân kết nối vào. Nếu nạn nhân kết nối, kẻ tấn công sẽ có thể đọc và sửa đổi bất kỳ dữ liệu nào được trao đổi giữa trình duyệt của người dùng và bất kỳ site nào họ kết nối tới.

## Phòng vệ chống MITM

Biện pháp phòng vệ chính chống MITM là phục vụ site của bạn qua {{glossary("HTTPS")}} (HTTP over {{glossary("TLS")}}). HTTPS ngăn kẻ tấn công đọc lưu lượng, hoặc sửa đổi nó theo cách có thể dự đoán.

Bạn nên phục vụ mọi trang qua HTTPS, không chỉ những trang mà bạn cho là đặc biệt nhạy cảm.

Hướng dẫn [TLS guide](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security) mô tả các vấn đề chính cần cân nhắc ở đây. Đặc biệt:

- Dùng [cấu hình TLS an toàn](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security#configuring_tls).

- Triển khai [xác thực máy chủ](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security#server_authentication).

- [Phục vụ tất cả tài nguyên qua TLS](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security#mixed_content): không chỉ tài liệu HTML mà mọi tài nguyên phụ như script, stylesheet, ảnh, và phông chữ.

- Nếu bạn chuyển hướng yêu cầu HTTP sang HTTPS, hãy triển khai [strict transport security (HSTS)](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security#upgrading_http_connections).

## Xem thêm

- [Let's Encrypt](https://letsencrypt.org/)
- [TLS Recommended Configurations](https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_configurations)
- [Transport Layer Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Security_Cheat_Sheet.html)
- [HTTP Strict Transport Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Strict_Transport_Security_Cheat_Sheet.html)
