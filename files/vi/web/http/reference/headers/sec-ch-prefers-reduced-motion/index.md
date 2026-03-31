---
title: Sec-CH-Prefers-Reduced-Motion header
short-title: Sec-CH-Prefers-Reduced-Motion
slug: Web/HTTP/Reference/Headers/Sec-CH-Prefers-Reduced-Motion
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-Prefers-Reduced-Motion
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-Prefers-Reduced-Motion`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_preference_media_features_client_hints) cho biết sở thích của tác nhân người dùng về việc hiển thị hoạt ảnh với chuyển động giảm thiểu.

Nếu máy chủ báo hiệu cho máy khách thông qua tiêu đề {{httpheader("Accept-CH")}} rằng nó chấp nhận `Sec-CH-Prefers-Reduced-Motion`, máy khách có thể phản hồi bằng tiêu đề này để cho biết sở thích của người dùng về chuyển động giảm thiểu. Máy chủ có thể gửi nội dung phù hợp cho máy khách, ví dụ: JavaScript hoặc CSS, để giảm chuyển động của bất kỳ hoạt ảnh nào được trình bày trong nội dung render sau đó. Điều này có thể bao gồm giảm tốc độ hoặc biên độ chuyển động để giảm sự khó chịu cho những người có rối loạn chuyển động tiền đình.

Tiêu đề này được mô phỏng theo truy vấn media CSS {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Client hint</a>
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-CH-Prefers-Reduced-Motion: <preference>
```

### Chỉ thị

- `<preference>`
  - : Sở thích của tác nhân người dùng về hoạt ảnh chuyển động giảm thiểu. Thường được lấy từ cài đặt hệ điều hành cơ bản. Giá trị của chỉ thị này có thể là `no-preference` hoặc `reduce`.

## Ví dụ

### Sử dụng Sec-CH-Prefers-Reduced-Motion

Máy khách thực hiện yêu cầu ban đầu đến máy chủ:

```http
GET / HTTP/1.1
Host: example.com
```

Máy chủ phản hồi, báo cho máy khách thông qua {{httpheader("Accept-CH")}} rằng nó chấp nhận `Sec-CH-Prefers-Reduced-Motion`. Trong ví dụ này, {{httpheader("Critical-CH")}} cũng được sử dụng, cho biết rằng `Sec-CH-Prefers-Reduced-Motion` được coi là [gợi ý máy khách quan trọng](/en-US/docs/Web/HTTP/Guides/Client_hints#critical_client_hints).

```http
HTTP/1.1 200 OK
Content-Type: text/html
Accept-CH: Sec-CH-Prefers-Reduced-Motion
Vary: Sec-CH-Prefers-Reduced-Motion
Critical-CH: Sec-CH-Prefers-Reduced-Motion
```

> [!NOTE]
> Chúng tôi cũng đã chỉ định `Sec-CH-Prefers-Reduced-Motion` trong tiêu đề {{httpheader("Vary")}} để báo cho trình duyệt biết rằng nội dung được phục vụ sẽ khác nhau dựa trên giá trị tiêu đề này, ngay cả khi URL không thay đổi, do đó trình duyệt không nên chỉ sử dụng phản hồi đã được lưu trong bộ nhớ đệm mà nên lưu phản hồi này riêng biệt. Mỗi tiêu đề được liệt kê trong tiêu đề `Critical-CH` cũng phải có trong tiêu đề `Accept-CH` và `Vary`.

Máy khách tự động thử lại yêu cầu (do `Critical-CH` được chỉ định ở trên), báo cho máy chủ thông qua `Sec-CH-Prefers-Reduced-Motion` rằng nó có sở thích của người dùng về hoạt ảnh chuyển động giảm thiểu:

```http
GET / HTTP/1.1
Host: example.com
Sec-CH-Prefers-Reduced-Motion: "reduce"
```

Máy khách sẽ bao gồm tiêu đề trong các yêu cầu tiếp theo trong phiên hiện tại, trừ khi `Accept-CH` thay đổi trong các phản hồi để cho biết rằng nó không còn được máy chủ hỗ trợ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- {{HTTPHeader("Accept-CH")}}
- Truy vấn media CSS {{cssxref("@media/prefers-reduced-motion")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
