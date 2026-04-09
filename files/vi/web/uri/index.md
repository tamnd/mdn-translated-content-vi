---
title: URIs
slug: Web/URI
page-type: landing-page
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html
sidebar: urlsidebar
---

**Uniform Resource Identifiers (URI)** được dùng để xác định "tài nguyên" trên web.
URI thường được dùng làm đích của các yêu cầu [HTTP](/en-US/docs/Web/HTTP), trong đó URI đại diện cho một vị trí của tài nguyên, chẳng hạn như một tài liệu, một bức ảnh, hoặc dữ liệu nhị phân.
Loại URI phổ biến nhất là Uniform Resource Locator ({{Glossary("URL")}}), còn được gọi là _địa chỉ web_.

URI có thể được dùng để kích hoạt các hành vi khác ngoài việc lấy một tài nguyên, bao gồm mở ứng dụng email, gửi tin nhắn văn bản hoặc thực thi JavaScript, khi được dùng ở những nơi khác như thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) của liên kết HTML `<a>`.

## Tham chiếu

[Tham chiếu URI](/en-US/docs/Web/URI/Reference) cung cấp chi tiết về các thành phần cấu thành một URI.

- [Schemes](/en-US/docs/Web/URI/Reference/Schemes)
  - : Phần đầu tiên của URI, trước ký tự `:`, cho biết giao thức mà trình duyệt phải dùng để lấy tài nguyên.
- [Authority](/en-US/docs/Web/URI/Reference/Authority)
  - : Phần nằm sau scheme và trước path.
    Nó có thể có tối đa ba phần: thông tin `user`, `host` và `port`.
- [Path](/en-US/docs/Web/URI/Reference/Path)
  - : Phần nằm sau authority.
    Chứa dữ liệu, thường được tổ chức theo dạng phân cấp, để xác định một tài nguyên trong phạm vi scheme và authority của URI.
- [Query](/en-US/docs/Web/URI/Reference/Query)
  - : Phần nằm sau path.
    Chứa dữ liệu không phân cấp để xác định một tài nguyên trong phạm vi scheme và naming authority của URI cùng với dữ liệu trong thành phần path.
- [Fragment](/en-US/docs/Web/URI/Reference/Fragment)
  - : Một phần tùy chọn ở cuối URI bắt đầu bằng ký tự `#`.
    Nó được dùng để xác định một phần cụ thể của tài nguyên, chẳng hạn như một mục trong tài liệu hoặc một vị trí trong video.

## Hướng dẫn

[Các hướng dẫn URI](/en-US/docs/Web/URI/Guides) giúp bạn làm việc với URI trên web.

- [Chọn giữa URL có www và không có www](/en-US/docs/Web/URI/Guides/Choosing_between_www_and_non-www_URLs)
  - : Hướng dẫn về thời điểm các trang web nên dùng tiền tố `www.` trong URL (`www.example.com` so với `example.com`).

## Đặc tả

{{Specifications}}

## Xem thêm

- [URL là gì?](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL)
