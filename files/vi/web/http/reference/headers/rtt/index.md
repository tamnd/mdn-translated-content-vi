---
title: RTT header
short-title: RTT
slug: Web/HTTP/Reference/Headers/RTT
page-type: http-header
status:
  - experimental
browser-compat: http.headers.RTT
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`RTT`** {{Glossary("request header")}} là một [gợi ý máy khách mạng](/en-US/docs/Web/HTTP/Guides/Client_hints#network_client_hints) cung cấp thời gian khứ hồi gần đúng ở lớp ứng dụng, tính bằng mili giây.
Gợi ý RTT bao gồm thời gian xử lý của máy chủ, không giống như RTT ở lớp truyền tải.

Giá trị RTT được làm tròn đến 25 mili giây gần nhất để ngăn chặn [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), mặc dù có nhiều cơ chế khác mà kẻ tấn công có thể dùng để lấy thông tin thời gian khứ hồi tương tự.

Gợi ý cho phép máy chủ chọn thông tin nào sẽ gửi dựa trên khả năng phản hồi/độ trễ của mạng. Ví dụ, nó có thể chọn gửi ít tài nguyên hơn.

> [!NOTE]
> Tiêu đề {{HTTPHeader("Vary")}} được dùng trong phản hồi để chỉ ra rằng một tài nguyên khác được gửi cho mỗi giá trị tiêu đề khác nhau (xem [HTTP Caching Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary)). Ngay cả khi `RTT` được dùng để cấu hình những tài nguyên nào được gửi, hãy cân nhắc bỏ qua nó trong tiêu đề {{HTTPHeader("Vary")}} — nó có thể thay đổi thường xuyên, điều này thực sự làm cho tài nguyên không thể lưu vào bộ nhớ đệm.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Gợi ý máy khách</a>
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
RTT: <number>
```

## Chỉ thị

- `<number>`
  - : Thời gian khứ hồi gần đúng tính bằng mili giây, được làm tròn đến 25 mili giây gần nhất.

## Ví dụ

### Sử dụng gợi ý máy khách RTT

Máy chủ trước tiên cần đồng ý nhận tiêu đề `RTT` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} có chứa `RTT`.

```http
Accept-CH: RTT
```

Sau đó, trong các yêu cầu tiếp theo, máy khách có thể gửi lại tiêu đề `RTT`:

```http
RTT: 125
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các gợi ý máy khách mạng {{HTTPHeader("Downlink")}}, {{HTTPHeader("ECT")}}, {{HTTPHeader("Save-Data")}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- {{domxref("NetworkInformation.effectiveType")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
