---
title: Triển khai Chính sách Bảo mật Nội dung (CSP)
short-title: Chính sách Bảo mật Nội dung (CSP)
slug: Web/Security/Practical_implementation_guides/CSP
page-type: guide
sidebar: security
---

Tiêu đề HTTP [`Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy) cung cấp khả năng kiểm soát chi tiết đối với mã có thể được tải trên một trang web, và những gì mã đó được phép làm.

## Vấn đề

Vấn đề chính mà bài viết này tập trung vào là các cuộc tấn công cross-site scripting ({{Glossary("Cross-site_scripting", "XSS")}}). Những cuộc tấn công này thường xuất phát từ việc thiếu kiểm soát và nhận thức về các nguồn mà tài nguyên của trang web được tải từ đó. Vấn đề này càng khó quản lý hơn khi các trang web ngày càng lớn, phức tạp và phụ thuộc nhiều hơn vào tài nguyên bên thứ ba như thư viện JavaScript.

> [!NOTE]
> CSP chỉ là một phần trong chiến lược hoàn chỉnh để bảo vệ chống lại các cuộc tấn công XSS. Còn có những yếu tố khác liên quan, chẳng hạn như [mã hóa đầu ra](/en-US/docs/Web/Security/Attacks/XSS#output_encoding) và [làm sạch dữ liệu](/en-US/docs/Web/Security/Attacks/XSS#sanitization), cũng rất quan trọng.

CSP cũng có thể giúp khắc phục các vấn đề khác, được trình bày trong các bài viết khác:

- Ngăn chặn [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) bằng cách ngăn trang web của bạn được nhúng vào các phần tử {{htmlelement("iframe")}}. Việc này được thực hiện bằng directive CSP [`frame-ancestors`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors).
- Ngăn chặn các cuộc tấn công [manipulator-in-the-middle](/en-US/docs/Web/Security/Attacks/MITM) (MiTM) bằng cách nâng cấp mọi kết nối HTTP lên HTTPS. Điều này được hỗ trợ bởi directive CSP [`upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests). Xem [Nâng cấp các yêu cầu không an toàn](/en-US/docs/Web/HTTP/Guides/CSP#upgrading_insecure_requests).

## Giải pháp

Triển khai một [CSP nghiêm ngặt](/en-US/docs/Web/HTTP/Guides/CSP#strict_csp) là cách tốt nhất để giảm thiểu lỗ hổng XSS bằng CSP. Cách này dùng các directive tải dựa trên [nonce-](/en-US/docs/Web/HTTP/Guides/CSP#nonces) hoặc [hash-](/en-US/docs/Web/HTTP/Guides/CSP#hashes) để bảo đảm chỉ các script và/hoặc style chứa đúng {{Glossary("Nonce", "nonce")}} hoặc hash mới được thực thi. JavaScript do kẻ tấn công chèn vào đơn giản sẽ không chạy.

CSP nghiêm ngặt cũng:

- Vô hiệu hóa việc dùng [JavaScript nội tuyến](/en-US/docs/Web/HTTP/Guides/CSP#inline_javascript) không an toàn, nghĩa là các [thuộc tính trình xử lý sự kiện nội tuyến](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes) như `onclick`. Điều này ngăn đầu vào người dùng bị thoát ký tự không đúng cách được trình duyệt web hiểu là JavaScript.
- Vô hiệu hóa việc dùng các [lời gọi API rủi ro như `eval()`](/en-US/docs/Web/HTTP/Guides/CSP#eval_and_similar_apis), đây cũng là một tác dụng của directive `script-src`.
- Vô hiệu hóa mọi nhúng object qua `object-src 'none'`.
- Vô hiệu hóa việc dùng phần tử `<base>` để đặt base URI thông qua `base-uri 'none';`.

CSP nghiêm ngặt được ưu tiên hơn các chính sách [dựa trên vị trí](/en-US/docs/Web/HTTP/Guides/CSP#location-based_policies), còn gọi là chính sách allowlist, trong đó bạn chỉ định các miền mà script được phép chạy từ đó. Lý do là các chính sách allowlist thường cuối cùng lại cho phép các miền không an toàn, làm mất hoàn toàn mục đích của CSP, và chúng có thể trở nên rất lớn, rất khó quản lý, đặc biệt nếu bạn đang cố cho phép các dịch vụ cần nhiều script bên thứ ba để hoạt động.

### Các bước triển khai CSP

Triển khai một CSP nghiêm ngặt, rồi bắt đầu xác định các tài nguyên không tải được do chính sách, và thực hiện các bước để xử lý những vấn đề này.

> [!NOTE]
> Trước khi triển khai bất kỳ CSP thực tế nào bằng tiêu đề `Content-Security-Policy`, bạn nên thử trước bằng tiêu đề HTTP [`Content-Security-Policy-Report-Only`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy-Report-Only); xem [CSP chỉ báo cáo](#report-only_csps) bên dưới.

1. Quyết định dùng nonce hay hash. Bạn nên dùng nonce nếu có thể tạo nội dung động, hoặc dùng hash nếu cần phục vụ nội dung tĩnh.
2. Triển khai một CSP nghiêm ngặt, như mô tả trong phần [Giải pháp](#solution). Bảo đảm rằng các script bên ngoài và nội bộ (được đưa vào qua phần tử {{htmlelement("script")}}) mà bạn muốn chạy có nonce đúng được máy chủ chèn vào thuộc tính [`nonce`](/en-US/docs/Web/HTML/Reference/Elements/script#nonce). Nếu bạn đang dùng hash, các script bên ngoài phải có hash đúng được chèn vào thuộc tính [`integrity`](/en-US/docs/Web/HTML/Reference/Elements/script#integrity).
3. Nếu một script được phép sau đó tải các script bên thứ ba, các script đó sẽ không tải được vì chúng không có nonce hoặc hash cần thiết. Khắc phục vấn đề này bằng cách thêm directive [`strict-dynamic`](/en-US/docs/Web/HTTP/Guides/CSP#the_strict-dynamic_keyword), directive này trao cho các script được script đầu tiên tải cùng mức độ tin cậy mà không cần được gán nonce hoặc hash một cách tường minh.
4. Tái cấu trúc các mẫu bị CSP nghiêm ngặt cấm, chẳng hạn như trình xử lý sự kiện nội tuyến và `eval()`. Ví dụ, thay các trình xử lý sự kiện nội tuyến bằng các lệnh gọi [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) bên trong script.
5. Trừ khi trang web cần khả năng bao gồm embed, việc thực thi chúng nên bị vô hiệu hóa bằng `object-src 'none'`.
6. Nếu bạn không thể loại bỏ việc dùng `eval()`, bạn có thể thêm keyword [`unsafe-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) vào CSP nghiêm ngặt để cho phép chúng, mặc dù điều này làm CSP yếu đi đáng kể.
7. Nếu bạn không thể loại bỏ các thuộc tính trình xử lý sự kiện, bạn có thể thêm keyword [`unsafe-hashes`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes) vào CSP nghiêm ngặt để cho phép chúng. Cách này hơi không an toàn, nhưng vẫn an toàn hơn nhiều so với việc cho phép toàn bộ JavaScript nội tuyến.

Nếu bạn không thể làm cho một CSP nghiêm ngặt hoạt động, một CSP dựa trên allowlist vẫn tốt hơn là không có gì, và một CSP như `default-src https:` vẫn cung cấp một số khả năng bảo vệ, vô hiệu hóa inline/`eval()` không an toàn và chỉ cho phép tải tài nguyên (hình ảnh, phông chữ, script, v.v.) qua HTTPS.

> [!WARNING]
> Nếu có thể, hãy tránh đưa các nguồn không an toàn vào CSP của bạn. Ví dụ gồm:
>
> - `unsafe-inline`.
> - Các URI `data:` trong `script-src`, `object-src`, hoặc `default-src`.
> - Các nguồn hoặc đích gửi biểu mẫu quá rộng.

Nếu bạn không thể dùng tiêu đề `Content-Security-Policy`, các trang có thể thay vào đó bao gồm phần tử [`<meta http-equiv="Content-Security-Policy" content="…">`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv). Đây nên là phần tử {{htmlelement("meta")}} đầu tiên xuất hiện bên trong {{htmlelement("head")}} của tài liệu.

### CSP chỉ báo cáo

Trước khi triển khai bất kỳ CSP thực tế nào bằng tiêu đề `Content-Security-Policy`, bạn nên thử trước bằng tiêu đề HTTP [`Content-Security-Policy-Report-Only`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy-Report-Only). Điều này cho phép bạn xem có vi phạm nào sẽ xảy ra với chính sách đó hay không.

Các trang web nên dùng các directive báo cáo [`report-to`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-to) và [`report-uri`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/report-uri) [reporting directives](/en-US/docs/Glossary/Reporting_directive). Những directive này khiến trình duyệt [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST) các báo cáo JSON về vi phạm CSP tới các endpoint (được chỉ định trong tiêu đề {{httpheader("Reporting-Endpoints")}} trong trường hợp của `report-to`). Điều này cho phép các vi phạm CSP được phát hiện và sửa nhanh chóng.

> [!NOTE]
> Directive `report-to` được ưu tiên hơn directive `report-uri` đã lỗi thời. Tuy nhiên, cả hai vẫn cần thiết vì `report-to` هنوز chưa có đầy đủ hỗ trợ trên mọi trình duyệt.

## Xem thêm

- [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
- [Cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS)
- [CSP evaluator](https://csp-evaluator.withgoogle.com/)
