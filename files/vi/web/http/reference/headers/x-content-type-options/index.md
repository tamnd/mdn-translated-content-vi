---
title: X-Content-Type-Options header
short-title: X-Content-Type-Options
slug: Web/HTTP/Reference/Headers/X-Content-Type-Options
page-type: http-header
browser-compat: http.headers.X-Content-Type-Options
sidebar: http
---

Tiêu đề HTTP **`X-Content-Type-Options`** {{Glossary("response header")}} cho biết rằng các [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) được quảng cáo trong tiêu đề {{HTTPHeader("Content-Type")}} nên được tôn trọng và không được thay đổi.
Tiêu đề cho phép bạn tránh [MIME type sniffing](/en-US/docs/Web/HTTP/Guides/MIME_types#mime_sniffing) bằng cách chỉ định rằng các kiểu MIME được cấu hình có chủ ý.

Người kiểm tra bảo mật trang web thường kỳ vọng tiêu đề này được đặt (và tiêu đề `Content-Type` được đặt đúng cho tất cả tài nguyên).

Chỉ thị `nosniff` có hai hiệu ứng tùy thuộc vào ngữ cảnh:

- **Chặn yêu cầu**: Đối với các yêu cầu có [destination](/en-US/docs/Web/API/Request/destination) là `"script"` hoặc `"style"`, trình duyệt chặn phản hồi nếu kiểu MIME không khớp với loại dự kiến (kiểu [JavaScript MIME](https://html.spec.whatwg.org/multipage/scripting.html#javascript-mime-type) cho script, hoặc `text/css` cho stylesheet). Xem [đặc tả Fetch](https://fetch.spec.whatwg.org/#ref-for-determine-nosniff) để biết chi tiết.
- **MIME type sniffing bị vô hiệu hóa**: Đối với các loại phản hồi khác, bao gồm điều hướng đến tài liệu HTML mới, trình duyệt sử dụng {{HTTPHeader("Content-Type")}} được cung cấp như vậy thay vì kiểm tra nội dung để suy ra loại.
  Ví dụ, nếu máy chủ gửi phản hồi với `Content-Type: text/plain` và `X-Content-Type-Options: nosniff`, trình duyệt sẽ không diễn giải nó là HTML, ngay cả khi nội dung chứa đánh dấu HTML.
  Điều này ngăn chặn [các cuộc tấn công XSS](/en-US/docs/Web/Security/Attacks/XSS) trong đó nội dung do người dùng tải lên được thực thi như tài liệu HTML, ngay cả khi trình duyệt đã chỉ định rằng nó nên được coi là văn bản thuần túy (hoặc loại khác).
  Xem [đặc tả MIME Sniffing](https://mimesniff.spec.whatwg.org/#mime-type-sniffing-algorithm) để biết chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden response header name","Forbidden response header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Content-Type-Options: nosniff
```

## Chỉ thị

- `nosniff`
  - : Chặn yêu cầu nếu destination của yêu cầu là loại `style` và kiểu MIME không phải `text/css`, hoặc loại `script` và kiểu MIME không phải là [JavaScript MIME type](https://html.spec.whatwg.org/multipage/scripting.html#javascript-mime-type).

    Nó cũng ngăn chặn MIME type sniffing cho tất cả các loại phản hồi khác, khiến trình duyệt sử dụng {{HTTPHeader("Content-Type")}} đã khai báo mà không kiểm tra nội dung phản hồi.
    Đặc biệt nó ngăn trình duyệt coi phản hồi là `text/html` khi nó được tải trong ngữ cảnh duyệt và tiêu đề `Content-Type` vắng mặt hoặc chỉ ra loại không phải HTML.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Type")}}
- [Định nghĩa ban đầu](https://learn.microsoft.com/en-us/archive/blogs/ie/ie8-security-part-vi-beta-2-update) của X-Content-Type-Options bởi Microsoft.
- Sử dụng [HTTP Observatory](/en-US/observatory) để kiểm tra cấu hình bảo mật của trang web (bao gồm tiêu đề này).
- [Mitigating MIME Confusion Attacks in Firefox](https://blog.mozilla.org/security/2016/08/26/mitigating-mime-confusion-attacks-in-firefox/)
