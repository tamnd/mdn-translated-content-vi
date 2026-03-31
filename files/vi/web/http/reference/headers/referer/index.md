---
title: Referer header
short-title: Referer
slug: Web/HTTP/Reference/Headers/Referer
page-type: http-header
browser-compat: http.headers.Referer
sidebar: http
---

Tiêu đề HTTP **`Referer`** {{Glossary("request header")}} chứa địa chỉ tuyệt đối hoặc một phần từ đó tài nguyên đã được yêu cầu.
Tiêu đề `Referer` cho phép máy chủ xác định các trang giới thiệu mà mọi người đang truy cập từ đó hoặc nơi các tài nguyên được yêu cầu đang được sử dụng.
Dữ liệu này có thể được sử dụng cho phân tích, ghi nhật ký, caching tối ưu hóa và nhiều hơn nữa.

Khi bạn nhấp vào liên kết, `Referer` chứa địa chỉ của trang bao gồm liên kết.
Khi bạn thực hiện yêu cầu tài nguyên đến miền khác, `Referer` chứa địa chỉ của trang sử dụng tài nguyên được yêu cầu.

Tiêu đề `Referer` có thể chứa _nguồn gốc_, _đường dẫn_ và _chuỗi truy vấn_, và có thể không chứa [đoạn URL](/en-US/docs/Web/URI/Reference/Fragment) (tức là `#section`) hoặc thông tin `username:password`.
_Chính sách người giới thiệu_ của yêu cầu xác định dữ liệu có thể được bao gồm. Xem {{HTTPHeader("Referrer-Policy")}} để biết thêm [thông tin](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy#directives) và [ví dụ](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy#examples).

`Referer` cũng nên được gửi trong các yêu cầu theo sau phản hồi {{httpheader("Refresh")}} (hoặc tương đương [`<meta http-equiv="refresh" content="...">`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv)) gây ra điều hướng đến trang mới, nếu được chính sách người giới thiệu cho phép.

> [!NOTE]
> Tên tiêu đề "referer" thực ra là lỗi chính tả của từ "referrer".
> Xem [HTTP referer trên Wikipedia](https://en.wikipedia.org/wiki/HTTP_referer) để biết thêm chi tiết.

> [!WARNING]
> Tiêu đề này có thể có hậu quả không mong muốn đối với bảo mật và quyền riêng tư người dùng.
> Xem [Tiêu đề Referer: mối lo ngại về quyền riêng tư và bảo mật](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns) để biết thêm thông tin và gợi ý giảm thiểu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Referer: <url>
```

## Chỉ thị

- `<url>`
  - : Địa chỉ tuyệt đối hoặc một phần của trang web thực hiện yêu cầu.
    Đoạn URL (tức là `#section`) và thông tin người dùng (tức là `username:password` trong `https://username:password@example.com/foo/bar/`) không được bao gồm.
    Nguồn gốc, đường dẫn và chuỗi truy vấn có thể được bao gồm, tùy thuộc vào [chính sách người giới thiệu](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy#directives).

## Ví dụ

```http
Referer: https://developer.mozilla.org/en-US/docs/Web/JavaScript
Referer: https://example.com/page?q=123
Referer: https://example.com/
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Referrer-Policy")}}
- [Chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy)
- [Fetch](/en-US/docs/Web/API/Fetch_API): {{domxref("Request.referrerPolicy")}}
- [Tighter Control Over Your Referrers – Mozilla Security Blog](https://blog.mozilla.org/security/2015/01/21/meta-referrer/)
- [HTTP referer trên Wikipedia](https://en.wikipedia.org/wiki/HTTP_referer)
