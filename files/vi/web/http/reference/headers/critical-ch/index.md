---
title: Critical-CH header
short-title: Critical-CH
slug: Web/HTTP/Reference/Headers/Critical-CH
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Critical-CH
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Critical-CH`** {{Glossary("response header")}} được sử dụng cùng với {{HTTPHeader("Accept-CH")}} để xác định các [gợi ý máy khách](/en-US/docs/Web/HTTP/Guides/Client_hints) được chấp nhận mà là [quan trọng](/en-US/docs/Web/HTTP/Guides/Client_hints#critical_client_hints).

Các tác nhân người dùng nhận được phản hồi với `Critical-CH` phải kiểm tra xem các tiêu đề quan trọng được chỉ định đã được gửi trong yêu cầu ban đầu chưa. Nếu chưa, tác nhân người dùng sẽ thử lại yêu cầu kèm theo các tiêu đề quan trọng thay vì hiển thị trang. Cách tiếp cận này đảm bảo rằng các tùy chọn của máy khách được thiết lập bằng gợi ý máy khách quan trọng luôn được sử dụng, ngay cả khi không được bao gồm trong yêu cầu đầu tiên, hoặc sau khi cấu hình máy chủ thay đổi.

Mỗi tiêu đề được liệt kê trong tiêu đề `Critical-CH` cũng phải có trong các tiêu đề `Accept-CH` và `Vary`.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header")}}
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Critical-CH: <ch-list>
```

### Chỉ thị

- `<ch-list>`
  - : Danh sách gồm một hoặc nhiều tiêu đề gợi ý máy khách phân tách bằng dấu phẩy mà máy chủ coi là gợi ý máy khách quan trọng.

## Ví dụ

Máy khách gửi yêu cầu ban đầu đến máy chủ:

```http
GET / HTTP/1.1
Host: example.com
```

Máy chủ phản hồi, chỉ báo thông qua {{HTTPHeader("Accept-CH")}} rằng nó chấp nhận {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}}. Trong ví dụ này, `Critical-CH` cũng được sử dụng để chỉ định rằng `Sec-CH-Prefers-Reduced-Motion` được coi là gợi ý máy khách quan trọng.

```http
HTTP/1.1 200 OK
Content-Type: text/html
Accept-CH: Sec-CH-Prefers-Reduced-Motion
Vary: Sec-CH-Prefers-Reduced-Motion
Critical-CH: Sec-CH-Prefers-Reduced-Motion
```

> [!NOTE]
> Chúng tôi đã chỉ định `Sec-CH-Prefers-Reduced-Motion` trong tiêu đề {{HTTPHeader("Vary")}} để chỉ báo rằng các phản hồi nên được lưu vào bộ nhớ cache riêng biệt dựa trên giá trị của tiêu đề này (ngay cả khi URL không thay đổi).
> Mỗi tiêu đề được liệt kê trong tiêu đề `Critical-CH` cũng phải có trong các tiêu đề `Accept-CH` và `Vary`.

Máy khách tự động thử lại yêu cầu (do `Critical-CH` được chỉ định ở trên), thông báo cho máy chủ thông qua `Sec-CH-Prefers-Reduced-Motion` rằng nó có tùy chọn người dùng cho hoạt ảnh chuyển động giảm:

```http
GET / HTTP/1.1
Host: example.com
Sec-CH-Prefers-Reduced-Motion: "reduce"
```

Máy khách sẽ bao gồm tiêu đề trong các yêu cầu tiếp theo trong phiên hiện tại trừ khi `Accept-CH` thay đổi trong các phản hồi để chỉ báo rằng nó không còn được máy chủ hỗ trợ.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Gợi ý máy khách](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [API Gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- {{domxref("PerformanceNavigationTiming.criticalCHRestart")}}
