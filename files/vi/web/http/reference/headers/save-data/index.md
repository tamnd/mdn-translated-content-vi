---
title: Save-Data header
short-title: Save-Data
slug: Web/HTTP/Reference/Headers/Save-Data
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Save-Data
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Save-Data`** {{Glossary("request header")}} là một [gợi ý máy khách về mạng](/en-US/docs/Web/HTTP/Guides/Client_hints#network_client_hints) cho biết sở thích của máy khách về việc giảm thiểu sử dụng dữ liệu.
Lý do có thể là chi phí truyền dữ liệu cao, tốc độ kết nối chậm, v.v.

`Save-Data` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints), do đó có thể được máy khách gửi ngay cả khi máy chủ không yêu cầu thông qua tiêu đề phản hồi {{HTTPHeader("Accept-CH")}}.
Ngoài ra, nó nên được dùng để giảm dữ liệu gửi đến máy khách bất kể các giá trị gợi ý khác cho biết khả năng mạng, như {{HTTPHeader("Downlink")}} và {{HTTPHeader("RTT")}}.

Giá trị `On` cho biết người dùng đã bật chế độ tiết kiệm dữ liệu trên máy khách.
Khi được thông báo đến các nguồn gốc, điều này cho phép họ cung cấp nội dung thay thế nhằm giảm dữ liệu tải xuống, chẳng hạn như hình ảnh và video có kích thước nhỏ hơn, đánh dấu và kiểu dáng khác, tắt tính năng polling và cập nhật tự động, v.v.

> [!NOTE]
> Vô hiệu hóa HTTP/2 Server Push ({{RFC("7540", "Server Push", "8.2")}}) có thể giảm tải dữ liệu.
> Lưu ý rằng tính năng này không còn được hỗ trợ theo mặc định trong hầu hết các trình duyệt chính.

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
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Save-Data: <sd-token>
```

## Chỉ thị

- `<sd-token>`
  - : Giá trị cho biết liệu máy khách có muốn bật chế độ tiết kiệm dữ liệu hay không.
    `on` nghĩa là có, còn `off` (mặc định) nghĩa là không.

## Ví dụ

### Sử dụng `Save-Data: on`

Yêu cầu sau đây yêu cầu một tài nguyên với tiêu đề `Save-Data` cho biết máy khách đang bật chế độ tiết kiệm dữ liệu:

```http
GET /image.jpg HTTP/1.1
Host: example.com
Save-Data: on
```

Máy chủ phản hồi với mã `200`, và tiêu đề {{HTTPHeader("Vary")}} cho biết rằng `Save-Data` có thể đã được sử dụng để tạo phản hồi, và các bộ nhớ đệm cần lưu ý tiêu đề này để phân biệt các phản hồi:

```http
HTTP/1.1 200 OK
Content-Length: 102832
Vary: Accept-Encoding, Save-Data
Cache-Control: public, max-age=31536000
Content-Type: image/jpeg

[…]
```

### Bỏ qua `Save-Data`

Trong trường hợp này, máy khách yêu cầu cùng tài nguyên mà không có tiêu đề `Save-Data`:

```http
GET /image.jpg HTTP/1.1
Host: example.com
```

Phản hồi của máy chủ cung cấp phiên bản đầy đủ của nội dung.
Tiêu đề {{HTTPHeader("Vary")}} đảm bảo rằng các phản hồi nên được lưu riêng biệt dựa trên giá trị của tiêu đề `Save-Data`.
Điều này đảm bảo rằng người dùng không nhận được hình ảnh chất lượng thấp hơn từ bộ nhớ đệm khi tiêu đề `Save-Data` không còn hiện diện (ví dụ: sau khi chuyển từ mạng di động sang Wi-Fi).

```http
HTTP/1.1 200 OK
Content-Length: 481770
Vary: Accept-Encoding, Save-Data
Cache-Control: public, max-age=31536000
Content-Type: image/jpeg

[…]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tính năng CSS `@media` {{cssxref("@media/prefers-reduced-data")}} {{experimental_inline}}
- Tiêu đề {{HTTPHeader("Vary")}} cho biết nội dung được phục vụ thay đổi tùy thuộc vào giá trị của `Save-Data` (xem [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary))
- {{domxref("NetworkInformation.saveData")}}
- [Help Your Users `Save-Data`](https://css-tricks.com/help-users-save-data/) trên css-tricks.com
- [Delivering Fast and Light Applications with Save-Data - web.dev](https://web.dev/articles/optimizing-content-efficiency-save-data) trên web.dev
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
