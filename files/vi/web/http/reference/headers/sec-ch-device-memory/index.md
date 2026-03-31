---
title: Sec-CH-Device-Memory header
short-title: Sec-CH-Device-Memory
slug: Web/HTTP/Reference/Headers/Sec-CH-Device-Memory
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-Device-Memory
sidebar: http
---

{{SecureContext_Header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-Device-Memory`** {{Glossary("request header")}} được dùng trong [gợi ý máy khách thiết bị](/en-US/docs/Web/HTTP/Guides/Client_hints#device_client_hints) để chỉ ra lượng RAM khả dụng gần đúng trên thiết bị máy khách, tính bằng gigabyte.
Tiêu đề là một phần của {{DOMxRef("Device Memory API", "Device Memory API", "", "nocode")}}.

Gợi ý máy khách chỉ có thể truy cập từ các nguồn gốc bảo mật.
Máy chủ phải đồng ý nhận tiêu đề `Sec-CH-Device-Memory` từ máy khách, bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} trước.
Các máy chủ đồng ý nhận gợi ý máy khách `Sec-CH-Device-Memory` thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho bộ nhớ đệm rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong yêu cầu.

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
Sec-CH-Device-Memory: <number>
```

## Chỉ thị

- `<number>`
  - : Lượng RAM gần đúng của thiết bị.

    Lượng RAM của thiết bị có thể được dùng như một biến {{glossary("fingerprinting")}}, vì vậy các giá trị cho tiêu đề được cố ý làm thô để giảm khả năng lạm dụng.
    Các giá trị chỉ được báo cáo theo lũy thừa của hai, và bị giới hạn ở giá trị tối thiểu thấp hơn và giá trị tối đa cao hơn được xác định bởi việc triển khai.
    Các giới hạn này có thể thay đổi theo thời gian (xem [bảng khả năng tương thích trình duyệt](#browser_compatibility)).

    Ví dụ, nếu trình duyệt không báo cáo dưới `2` hoặc trên `32` thì giá trị là một trong số: `2`, `4`, `8`, `16`, `32`.

## Ví dụ

Máy chủ trước tiên cần đồng ý nhận tiêu đề `Sec-CH-Device-Memory` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} có chứa `Sec-CH-Device-Memory`:

```http
Accept-CH: Sec-CH-Device-Memory
```

Sau đó, trong các yêu cầu tiếp theo, máy khách có thể gửi lại tiêu đề `Sec-CH-Device-Memory`:

```http
Sec-CH-Device-Memory: 1
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- {{DOMxRef("Device Memory API", "Device Memory API", "", "nocode")}}
- {{DOMxRef("Navigator.deviceMemory")}}
- {{DOMxRef("WorkerNavigator.deviceMemory")}}
- Gợi ý máy khách thiết bị và hình ảnh phản hồi
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Device-Memory")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
