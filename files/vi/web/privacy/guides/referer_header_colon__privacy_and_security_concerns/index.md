---
title: "Referer header: Các vấn đề về quyền riêng tư và bảo mật"
slug: Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns
page-type: guide
sidebar: privacy
---

Có các rủi ro về quyền riêng tư và bảo mật liên quan đến [Referer HTTP header](/en-US/docs/Web/HTTP/Reference/Headers/Referer). Bài viết này mô tả chúng và đưa ra lời khuyên để giảm thiểu các rủi ro đó.

## Vấn đề referrer

Header {{httpheader("Referer")}} (sic) chứa địa chỉ của một yêu cầu (ví dụ, địa chỉ của trang web trước đó mà từ đó một liên kết tới trang hiện tại đã được theo, hoặc địa chỉ của một trang đang tải hình ảnh hay tài nguyên khác). Điều này có nhiều công dụng khá vô hại, bao gồm phân tích, ghi log, hoặc tối ưu cache. Tuy nhiên, cũng có những cách dùng gây vấn đề hơn như theo dõi hoặc đánh cắp thông tin, hoặc chỉ đơn giản là các hệ quả phụ như vô tình làm rò rỉ thông tin nhạy cảm.

Ví dụ, hãy xét một trang "đặt lại mật khẩu" có liên kết mạng xã hội trong chân trang. Nếu liên kết đó được theo, tùy cách thông tin được chia sẻ mà site mạng xã hội có thể nhận được URL đặt lại mật khẩu và vẫn có thể dùng thông tin được chia sẻ đó, có khả năng làm ảnh hưởng đến bảo mật của người dùng.

Theo logic tương tự, một ảnh từ site bên thứ ba được nhúng vào trang của bạn có thể khiến thông tin nhạy cảm bị rò rỉ cho bên thứ ba. Ngay cả khi bảo mật không bị xâm phạm, thông tin đó vẫn có thể là thứ người dùng không muốn chia sẻ.

## Làm sao khắc phục?

Phần lớn rủi ro này có thể được giảm thiểu bằng thiết kế hợp lý của ứng dụng. Một ứng dụng hợp lý sẽ loại bỏ các rủi ro như vậy bằng cách tạo URL đặt lại mật khẩu chỉ dùng một lần, hoặc kết hợp chúng với một mã người dùng duy nhất. Rủi ro cũng có thể giảm bằng cách truyền dữ liệu nhạy cảm theo những cách an toàn hơn.

Bạn nên dùng {{HTTPMethod("POST")}} thay vì {{HTTPMethod("GET")}} ở bất cứ nơi nào có thể, để tránh chuyển dữ liệu nhạy cảm sang các vị trí khác qua URL.

Bạn nên luôn dùng {{glossary("HTTPS")}} cho site của mình. Điều này có nhiều lợi thế bảo mật, bao gồm thực tế là các site HTTPS sẽ không bao giờ truyền thông tin referrer tới site không phải HTTPS. Lời khuyên này ít liên quan hơn bây giờ vì phần lớn web đã dùng HTTPS, nhưng nó vẫn là một cân nhắc đáng giá.

Ngoài ra, bạn nên cân nhắc loại bỏ mọi nội dung bên thứ ba (ví dụ widget mạng xã hội được nhúng trong {{htmlelement("iframe")}}) khỏi các khu vực nhạy cảm của website như trang đặt lại mật khẩu, form thanh toán, khu vực đăng nhập, v.v.

Bạn cũng có thể giảm thiểu các rủi ro này bằng:

- Header {{httpheader("Referrer-Policy")}} trên máy chủ của bạn để kiểm soát thông tin nào được gửi qua header {{httpheader("Referer")}}. Ví dụ, chỉ thị `no-referrer` sẽ bỏ hoàn toàn header Referer.
- Thuộc tính `referrerpolicy` trên các phần tử HTML có nguy cơ làm rò rỉ thông tin như {{HTMLElement("img")}} và {{HTMLElement("a")}}. Chẳng hạn có thể đặt thành `no-referrer` để ngăn header `Referer` được gửi đi.
- Thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) đặt thành [`noreferrer`](/en-US/docs/Web/HTML/Reference/Attributes/rel/noreferrer) trên các phần tử HTML có nguy cơ làm rò rỉ thông tin như {{HTMLElement("form")}} và {{HTMLElement("a")}}.
- Một phần tử {{HTMLElement("meta")}} có [name](/en-US/docs/Web/HTML/Reference/Elements/meta/name) là `referrer` và `content` đặt thành `no-referrer` để vô hiệu hóa header Referer cho toàn bộ tài liệu. Xem [Referrer-Policy Integration with HTML](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy#integration_with_html).
- Kỹ thuật [Exit page](https://geekthis.net/post/hide-http-referer-headers/#exit-page-redirect).

Các framework phía máy chủ chú trọng bảo mật thường có sẵn các biện pháp giảm thiểu cho những vấn đề như vậy, ví dụ:

- [Security in Django](https://docs.djangoproject.com/en/stable/topics/security/) (đặc biệt xem [Cross site request forgery (CSRF) protection](https://docs.djangoproject.com/en/stable/topics/security/#cross-site-request-forgery-csrf-protection)).
- [Helmet referrer-policy](https://github.com/helmetjs/helmet/tree/main/middlewares/referrer-policy) — middleware để đặt Referrer-Policy trong các ứng dụng Node.js/Express (xem thêm [Helmet](https://github.com/helmetjs) để biết thêm các biện pháp bảo mật).

## Chính sách và yêu cầu

Sẽ rất hợp lý nếu viết một bộ yêu cầu về bảo mật và quyền riêng tư cho nhóm dự án của bạn để quy định việc dùng các tính năng như vậy nhằm giảm thiểu các rủi ro liên quan. Bạn nên nhờ một chuyên gia bảo mật web giúp viết các yêu cầu này, và cân nhắc cả nhu cầu lẫn phúc lợi của người dùng, cũng như các vấn đề khác như chính sách và quy định được thực thi bởi luật pháp như [EU General Data Protection Regulation](https://gdpr.eu/) (GDPR).

## Xem thêm

- [Mozilla security team guidelines on Referrer-Policy](https://infosec.mozilla.org/guidelines/web_security.html#referrer-policy)
