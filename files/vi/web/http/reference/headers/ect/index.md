---
title: ECT header
short-title: ECT
slug: Web/HTTP/Reference/Headers/ECT
page-type: http-header
status:
  - experimental
browser-compat: http.headers.ECT
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`ECT`** {{Glossary("request header")}} được sử dụng trong [Client Hints](/en-US/docs/Web/HTTP/Guides/Client_hints) để chỉ ra {{Glossary("effective connection type")}}: `slow-2g`, `2g`, `3g`, hoặc `4g`.

Giá trị đại diện cho "hồ sơ mạng" phù hợp nhất với độ trễ và băng thông của kết nối, thay vì các cơ chế thực tế được sử dụng để truyền dữ liệu.
Ví dụ, `2g` có thể được sử dụng để đại diện cho kết nối Wi-Fi chậm có độ trễ cao và băng thông thấp, trong khi `4g` có thể đại diện cho mạng băng thông rộng dựa trên cáp quang nhanh.

Gợi ý cho phép máy chủ chọn thông tin nào được gửi dựa trên các đặc điểm chung của mạng. Ví dụ, máy chủ có thể chọn gửi phiên bản nhỏ hơn của hình ảnh và các tài nguyên khác trên các kết nối kém năng lực hơn. Giá trị cũng có thể được sử dụng như điểm bắt đầu để xác định thông tin nào được gửi, được tinh chỉnh thêm bằng thông tin trong các gợi ý {{HTTPHeader("RTT")}} và {{HTTPHeader("Downlink")}}.

> [!NOTE]
> Máy chủ chỉ định `ECT` trong {{HTTPHeader("Accept-CH")}} cũng có thể chỉ định nó trong {{HTTPHeader("Vary")}} để chỉ ra rằng các phản hồi nên được cache cho các giá trị ECT khác nhau.

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
ECT: <value>
```

## Chỉ thị

- `<value>`
  - : Giá trị chỉ ra {{Glossary("effective connection type")}}. Có thể là một trong: `slow-2g`, `2g`, `3g`, hoặc `4g`.

## Ví dụ

Trước tiên máy chủ cần đăng ký nhận tiêu đề `ECT` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa `ECT`.

```http
Accept-CH: ECT
```

Sau đó trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `ECT` trở lại:

```http
ECT: 2g
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cải thiện quyền riêng tư người dùng và trải nghiệm nhà phát triển với User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- Network client hints
  - {{HTTPHeader("Downlink")}}
  - {{HTTPHeader("RTT")}}
  - {{HTTPHeader("Save-Data")}}

- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching > Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- {{domxref("NetworkInformation.effectiveType")}}
