---
title: Downlink header
short-title: Downlink
slug: Web/HTTP/Reference/Headers/Downlink
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Downlink
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Downlink`** {{Glossary("request header")}} được sử dụng trong [Client Hints](/en-US/docs/Web/HTTP/Guides/Client_hints) để cung cấp băng thông xấp xỉ tính bằng Mbps của kết nối máy khách với máy chủ.

Gợi ý cho phép máy chủ chọn thông tin nào được gửi dựa trên băng thông mạng.
Ví dụ, máy chủ có thể chọn gửi phiên bản nhỏ hơn của hình ảnh và các tài nguyên khác trên mạng có băng thông thấp.

> [!NOTE]
> Tiêu đề {{HTTPHeader("Vary")}} được sử dụng trong phản hồi để chỉ ra rằng một tài nguyên khác được gửi cho mỗi giá trị khác nhau của tiêu đề (xem [HTTP Caching Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary)).
> Ngay cả khi `Downlink` được sử dụng để cấu hình những tài nguyên nào được gửi, hãy cân nhắc bỏ qua nó trong tiêu đề {{HTTPHeader("Vary")}} — nó có thể thay đổi thường xuyên, điều này hiệu quả làm cho tài nguyên không thể cache được.

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
  </tbody>
</table>

## Cú pháp

```http
Downlink: <number>
```

## Chỉ thị

- `<number>`
  - : Tốc độ downlink tính bằng Mbps, được làm tròn đến 25 kilobits gần nhất.
    Tốc độ downlink có thể được sử dụng như một biến {{glossary("fingerprinting")}}, vì vậy các giá trị cho tiêu đề được cố ý thô để giảm khả năng bị lạm dụng.

## Ví dụ

Trước tiên máy chủ cần đăng ký nhận tiêu đề `Downlink` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa `Downlink`.

```http
Accept-CH: Downlink
```

Sau đó trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `Downlink` trở lại:

```http
Downlink: 1.7
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cải thiện quyền riêng tư người dùng và trải nghiệm nhà phát triển với User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- Network client hints
  - {{HTTPHeader("RTT")}}
  - {{HTTPHeader("ECT")}}
  - {{HTTPHeader("Save-Data")}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- {{domxref("NetworkInformation.effectiveType")}}
