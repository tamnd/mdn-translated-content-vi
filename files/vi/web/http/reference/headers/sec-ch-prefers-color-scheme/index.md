---
title: Sec-CH-Prefers-Color-Scheme header
short-title: Sec-CH-Prefers-Color-Scheme
slug: Web/HTTP/Reference/Headers/Sec-CH-Prefers-Color-Scheme
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-Prefers-Color-Scheme
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-Prefers-Color-Scheme`** {{Glossary("request header")}} là một [gợi ý máy khách về tính năng media](/en-US/docs/Web/HTTP/Guides/Client_hints#user_preference_media_features_client_hints) cung cấp sở thích của người dùng về chủ đề màu sáng hoặc tối.
Người dùng cho biết sở thích của họ thông qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc cài đặt tác nhân người dùng.

Nếu máy chủ báo hiệu cho máy khách thông qua tiêu đề {{httpheader("Accept-CH")}} rằng nó chấp nhận `Sec-CH-Prefers-Color-Scheme`, máy khách có thể phản hồi bằng tiêu đề này để cho biết sở thích của người dùng về một chủ đề màu cụ thể. Máy chủ có thể gửi nội dung phù hợp cho máy khách, bao gồm hình ảnh hoặc CSS để hiển thị chế độ sáng hoặc tối cho nội dung được render sau đó.

Tiêu đề này được mô phỏng theo truy vấn media CSS {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}.

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

## Ghi chú sử dụng

Tiêu đề **`Sec-CH-Prefers-Color-Scheme`** cho phép các trang web nhận sở thích về chủ đề màu của người dùng tại thời điểm yêu cầu; sau đó họ có thể chọn cung cấp CSS phù hợp cho sở thích của người dùng ngay lập tức, vì lý do hiệu suất. Nếu máy chủ nhúng CSS, nó có thể muốn bao gồm tiêu đề phản hồi {{HTTPHeader("Vary")}} chỉ định `Sec-CH-Prefers-Color-Scheme`, để cho biết rằng phản hồi được tùy chỉnh cho một chủ đề màu cụ thể.

Nếu hiệu suất không phải là yếu tố quan trọng trong ngữ cảnh này, bạn có thể thay thế bằng cách xử lý sở thích chủ đề màu của người dùng bằng truy vấn media {{cssxref("@media/prefers-color-scheme")}}, và/hoặc API {{domxref("Window.matchMedia()")}}.

`Sec-CH-Prefers-Color-Scheme` là gợi ý entropy cao nên trang web cần chọn nhận nó bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} phù hợp. Tác nhân người dùng có thể cố ý bỏ qua tiêu đề `Sec-CH-Prefers-Color-Scheme` để bảo vệ quyền riêng tư của người dùng vì sở thích của người dùng, về lý thuyết, có thể được dùng để lấy dấu vân tay.

## Cú pháp

```http
Sec-CH-Prefers-Color-Scheme: <preference>
```

### Chỉ thị

- `<preference>`
  - : Chuỗi cho biết sở thích của tác nhân người dùng về nội dung tối hoặc sáng: `"light"` hoặc `"dark"`.
    Giá trị có thể xuất phát từ cài đặt tương ứng trong hệ điều hành cơ bản.

## Ví dụ

### Sử dụng Sec-CH-Prefers-Color-Scheme

Máy khách thực hiện yêu cầu ban đầu đến máy chủ:

```http
GET / HTTP/1.1
Host: example.com
```

Máy chủ phản hồi, báo cho máy khách thông qua {{httpheader("Accept-CH")}} rằng nó chấp nhận `Sec-CH-Prefers-Color-Scheme`. Trong ví dụ này, {{httpheader("Critical-CH")}} cũng được sử dụng, cho biết rằng `Sec-CH-Prefers-Color-Scheme` được coi là [gợi ý máy khách quan trọng](/en-US/docs/Web/HTTP/Guides/Client_hints#critical_client_hints).

```http
HTTP/1.1 200 OK
Content-Type: text/html
Accept-CH: Sec-CH-Prefers-Color-Scheme
Vary: Sec-CH-Prefers-Color-Scheme
Critical-CH: Sec-CH-Prefers-Color-Scheme
```

> [!NOTE]
> Chúng tôi cũng đã chỉ định `Sec-CH-Prefers-Color-Scheme` trong tiêu đề {{httpheader("Vary")}} để cho biết rằng các phản hồi nên được lưu riêng biệt dựa trên giá trị của tiêu đề này (ngay cả khi URL không thay đổi).
> Mỗi tiêu đề được liệt kê trong tiêu đề `Critical-CH` cũng phải có trong tiêu đề `Accept-CH` và `Vary`.

Máy khách tự động thử lại yêu cầu (do `Critical-CH` được chỉ định ở trên), báo cho máy chủ thông qua `Sec-CH-Prefers-Color-Scheme` rằng nó có sở thích của người dùng về nội dung tối:

```http
GET / HTTP/1.1
Host: example.com
Sec-CH-Prefers-Color-Scheme: "dark"
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
- [HTTP Caching varying responses](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- Truy vấn media CSS {{cssxref("@media/prefers-color-scheme")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
