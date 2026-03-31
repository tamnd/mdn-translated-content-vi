---
title: "Reason: CORS request not HTTP"
slug: Web/HTTP/Guides/CORS/Errors/CORSRequestNotHttp
page-type: http-cors-error
sidebar: http
---

## Lý do

```plain
Reason: CORS request not HTTP
```

## Điều gì đã xảy ra sai?

Các yêu cầu {{Glossary("CORS")}} chỉ có thể sử dụng scheme URL HTTP hoặc HTTPS, nhưng URL được chỉ định bởi yêu cầu là loại khác. Điều này thường xảy ra nếu URL chỉ định một tệp cục bộ, sử dụng scheme `file:///`.

Để sửa vấn đề này, hãy đảm bảo bạn sử dụng URL HTTPS khi phát hành các yêu cầu liên quan đến CORS, chẳng hạn như {{domxref("Window/fetch", "fetch()")}}, {{domxref("XMLHttpRequest")}}, Web Fonts (`@font-face`) và [WebGL textures](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL), và XSL stylesheets.

### Tải tệp cục bộ

Các tệp cục bộ từ cùng thư mục và thư mục con về mặt lịch sử được coi là từ [cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy). Điều này có nghĩa là một tệp và tất cả tài nguyên của nó có thể được tải từ thư mục hoặc thư mục con cục bộ trong quá trình kiểm tra mà không kích hoạt lỗi CORS.

Tuy nhiên điều này có hàm ý bảo mật, như được ghi chú trong khuyến nghị này: [CVE-2019-11730](https://www.mozilla.org/en-US/security/advisories/mfsa2019-21/#CVE-2019-11730). Nhiều trình duyệt, bao gồm Firefox và Chrome, hiện xử lý tất cả các tệp cục bộ là có _nguồn gốc mờ_ (theo mặc định). Do đó, việc tải tệp cục bộ có tài nguyên cục bộ đi kèm hiện sẽ dẫn đến lỗi CORS.

Các nhà phát triển cần thực hiện kiểm tra cục bộ nên [thiết lập máy chủ cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server). Vì tất cả các tệp được phục vụ từ cùng scheme và domain (`localhost`), chúng đều có cùng nguồn gốc và không kích hoạt lỗi xuyên nguồn gốc.

> [!NOTE]
> Thay đổi này phù hợp với [đặc tả URL](https://url.spec.whatwg.org/#origin), để lại hành vi nguồn gốc cho các tệp theo triển khai, nhưng khuyến nghị rằng nguồn gốc tệp được coi là mờ nếu có nghi ngờ.

## Xem thêm

- [Lỗi CORS](/en-US/docs/Web/HTTP/Guides/CORS/Errors)
- [Giới thiệu về CORS](/en-US/docs/Web/HTTP/Guides/CORS)
- [What is a URL?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
