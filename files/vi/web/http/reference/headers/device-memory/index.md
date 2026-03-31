---
title: Device-Memory header
short-title: Device-Memory
slug: Web/HTTP/Reference/Headers/Device-Memory
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Device-Memory
sidebar: http
---

{{Deprecated_Header}}{{SecureContext_Header}}{{Non-standard_Header}}

> [!WARNING]
> Tiêu đề `Device-Memory` đã được chuẩn hóa thành {{HTTPHeader("Sec-CH-Device-Memory")}} và tên mới hiện được ưu tiên.

Tiêu đề HTTP **`Device-Memory`** {{Glossary("request header")}} được sử dụng trong [gợi ý máy khách thiết bị](/en-US/docs/Web/HTTP/Guides/Client_hints#device_client_hints) để chỉ báo lượng RAM khả dụng gần đúng trên thiết bị máy khách, tính bằng gigabyte.
Tiêu đề là một phần của {{DOMxRef("Device Memory API", "Device Memory API", "", "nocode")}}.

Gợi ý máy khách chỉ có thể truy cập trên các nguồn gốc an toàn.
Máy chủ phải chọn tham gia để nhận tiêu đề `Device-Memory` từ máy khách, bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} trước.
Các máy chủ chọn tham gia gợi ý máy khách `Device-Memory` thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho bộ nhớ đệm rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong yêu cầu.

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
Device-Memory: <number>
```

## Chỉ thị

- `<number>`
  - : Lượng RAM thiết bị gần đúng.

    Lượng RAM thiết bị có thể được sử dụng như một biến {{glossary("fingerprinting")}}, vì vậy các giá trị cho tiêu đề được cố ý làm thô để giảm khả năng bị lạm dụng.
    Các giá trị chỉ được báo cáo ở dạng lũy thừa của hai, và bị giới hạn ở giá trị tối thiểu thấp hơn và giá trị tối đa trên được triển khai xác định.
    Các giới hạn này có thể thay đổi theo thời gian (xem [bảng tương thích trình duyệt](#browser_compatibility)).

    Ví dụ: nếu trình duyệt không báo cáo dưới `2` hoặc trên `32` thì giá trị là một trong: `2`, `4`, `8`, `16`, `32`.

## Ví dụ

Máy chủ trước tiên cần chọn tham gia để nhận tiêu đề `Device-Memory` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa `Device-Memory`:

```http
Accept-CH: Device-Memory
```

Sau đó trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `Device-Memory` trở lại:

```http
Device-Memory: 1
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- {{DOMxRef("Device Memory API", "Device Memory API", "", "nocode")}}
- {{DOMxRef("Navigator.deviceMemory")}}
- {{DOMxRef("WorkerNavigator.deviceMemory")}}
- Gợi ý máy khách thiết bị và hình ảnh đáp ứng
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Sec-CH-Width")}}
  - {{HTTPHeader("DPR")}} {{deprecated_inline}}
  - {{HTTPHeader("Content-DPR")}} {{deprecated_inline}}
  - {{HTTPHeader("Viewport-Width")}} {{deprecated_inline}}
  - {{HTTPHeader("Width")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
