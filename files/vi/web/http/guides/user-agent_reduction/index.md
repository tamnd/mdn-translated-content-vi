---
title: User-Agent reduction
slug: Web/HTTP/Guides/User-agent_reduction
page-type: guide
sidebar: http
---

**User-Agent reduction** là một sáng kiến trình duyệt được chấp nhận rộng rãi nhằm giảm lượng thông tin nhạy cảm về quyền riêng tư được cung cấp trong các chuỗi user agent (UA).

Bài viết này cho thấy sự khác biệt trong các chuỗi UA do User-Agent reduction, và giải thích cách bạn có thể truy cập cả thông tin UA đã được rút gọn lẫn thông tin bổ sung khi cần.

## Bối cảnh

Chuỗi user agent (UA) — có sẵn trong HTTP header {{httpheader("User-Agent")}} và trong các tính năng API liên quan như {{domxref("Navigator.userAgent")}}, {{domxref("Navigator.appVersion")}}, và {{domxref("Navigator.platform")}} — cho phép các máy chủ và đối tác mạng xác định ứng dụng, hệ điều hành, nhà cung cấp và/hoặc phiên bản của {{Glossary("user agent")}} đang yêu cầu.

### Phát hiện trình duyệt

Về lý thuyết, chuỗi UA hữu ích để phát hiện trình duyệt và phục vụ mã để khắc phục các lỗi dành riêng cho trình duyệt hoặc thiếu hỗ trợ tính năng. Tuy nhiên, điều này **không đáng tin cậy** và **không được khuyến nghị**:

- Các trình duyệt trong tương lai sẽ sửa lỗi và thêm hỗ trợ cho các tính năng mới, vì vậy mã phát hiện trình duyệt của bạn sẽ cần được cập nhật thường xuyên để tránh chặn các trình duyệt thực sự hỗ trợ các tính năng bạn đang kiểm tra. [Phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection) là một chiến lược đáng tin cậy hơn nhiều.
- Bạn thực sự không có gì đảm bảo rằng user agent được quảng cáo bởi thuộc tính này thực sự là user agent mà trang web của bạn được tải trong đó. Các nhà cung cấp trình duyệt về cơ bản có thể làm những gì họ muốn với chuỗi UA, và trong lịch sử sẽ trả về các giá trị giả từ các thuộc tính đó để không bị chặn khỏi một số trang web.
- Một số trình duyệt cho phép người dùng thay đổi giá trị của trường này nếu họ muốn (**UA spoofing**).

Sau đây là các chiến lược đáng tin cậy hơn nhiều để khắc phục các lỗi và hỗ trợ trình duyệt khác nhau:

- [Phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection): Phát hiện hỗ trợ cho một tính năng, thay vì phiên bản trình duyệt.
- [Progressive enhancement](/en-US/docs/Glossary/Progressive_Enhancement): Cung cấp đường cơ sở nội dung và chức năng thiết yếu cho nhiều người dùng nhất có thể, trong khi mang lại trải nghiệm tốt nhất có thể cho các trình duyệt có thể chạy tất cả mã cần thiết.

Cũng xem [Phát hiện trình duyệt bằng user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent) để biết thêm thông tin về lý do tại sao việc phục vụ nội dung khác nhau cho các trình duyệt khác nhau thường là một ý tưởng tồi.

### Mối lo ngại về quyền riêng tư

Ngoài ra, thông tin được tiết lộ trong chuỗi UA trong lịch sử đã đặt ra [mối lo ngại về quyền riêng tư](/en-US/docs/Web/Privacy) — nó có thể được sử dụng để xác định một user agent cụ thể, và do đó có thể được sử dụng cho {{glossary("fingerprinting")}}.

Để giảm thiểu các mối lo ngại đó, [các trình duyệt hỗ trợ](/en-US/docs/Web/HTTP/Reference/Headers/User-Agent#browser_compatibility) triển khai user-agent reduction, cập nhật header `User-agent` và các tính năng API liên quan để cung cấp một bộ thông tin được rút gọn.

## Các thay đổi chuỗi UA sau khi rút gọn

Trong [các trình duyệt hỗ trợ](/en-US/docs/Web/HTTP/Reference/Headers/User-Agent#browser_compatibility), User-Agent reduction loại bỏ ba thông tin từ chuỗi UA — phiên bản nền tảng/hệ điều hành chính xác, mẫu thiết bị và phiên bản trình duyệt phụ.

Hãy xem một ví dụ để bạn có thể thấy kết quả như thế nào. Trước đây, chuỗi UA cho Chrome chạy trên Android có thể trông như thế này:

```plain
Mozilla/5.0 (Linux; Android 16; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.12.45 Mobile Safari/537.36
```

Sau bản cập nhật User-Agent reduction, nó trông như thế này:

```plain
Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36
```

Các phần dưới đây cung cấp thêm chi tiết về từng thay đổi chuỗi UA.

### Phiên bản nền tảng/hệ điều hành và mẫu thiết bị

Phiên bản nền tảng và mẫu thiết bị luôn được biểu diễn bằng các giá trị cố định:

- `Android 10; K` trên Android.
- `Macintosh; Intel Mac OS X 10_15_7` trên macOS.
- `Windows NT 10.0; Win64; x64` trên Windows.
- `X11; CrOS x86_64 14541.0.0` trên ChromeOS.
- `X11; Linux x86_64` trên Linux.

### Phiên bản trình duyệt phụ

Số phiên bản trình duyệt chính được hiển thị chính xác, nhưng các số phiên bản phụ luôn được hiển thị là các số không — `0.0.0`.

## Yêu cầu thông tin UA thông qua client hints

Bạn có thể vẫn có mã dựa trên dữ liệu chuỗi UA chi tiết, không thể được chuyển đổi để sử dụng phát hiện tính năng hoặc progressive enhancement. Các ví dụ bao gồm ghi nhật ký chi tiết, các biện pháp ngăn chặn gian lận, hoặc một trang web trợ giúp phần mềm phục vụ nội dung khác nhau dựa trên loại thiết bị của người dùng.

Nếu đây là trường hợp, bạn vẫn có thể truy cập dữ liệu chuỗi UA chi tiết thông qua các header [`Sec-CH-UA-*`](/en-US/docs/Web/HTTP/Reference/Headers#user_agent_client_hints) (còn được gọi là **User-Agent client hints**). Các header cung cấp một cách an toàn hơn, bảo vệ quyền riêng tư hơn để gửi thông tin đó vì các máy chủ phải chọn tham gia các thông tin họ muốn, thay vì được gửi mọi lúc thông qua chuỗi `User-Agent`. Nó cũng cung cấp quyền truy cập vào lựa chọn thông tin rộng hơn.

Để biết thêm thông tin, hãy xem [User-Agent client hints](/en-US/docs/Web/HTTP/Guides/Client_hints).

## Truy cập client hints thông qua JavaScript

[User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API) cho phép bạn truy cập thông tin client hint thông qua JavaScript. Thuộc tính {{domxref("Navigator.userAgentData")}} cung cấp quyền truy cập vào đối tượng {{domxref("NavigatorUAData")}}, chứa các thuộc tính đại diện cho client hints có entropy thấp.

Để truy cập các hints có entropy cao như `Sec-CH-UA-Model` và `Sec-CH-UA-Form-Factors`, bạn cần sử dụng phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}}.

Để biết thêm thông tin, hãy xem [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API).

## Xem thêm

- {{httpheader("User-Agent")}}
- {{domxref("Navigator.userAgent")}}, {{domxref("Navigator.appVersion")}}, và {{domxref("Navigator.platform")}}
- [HTTP Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [Triển khai phát hiện tính năng](/en-US/docs/Learn_web_development/Extensions/Testing/Feature_detection)
- [https://developer.chrome.com/docs/privacy-security/user-agent-client-hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) trên developer.chrome.com (2020)
