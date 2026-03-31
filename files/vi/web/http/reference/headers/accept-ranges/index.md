---
title: Accept-Ranges header
short-title: Accept-Ranges
slug: Web/HTTP/Reference/Headers/Accept-Ranges
page-type: http-header
browser-compat: http.headers.Accept-Ranges
sidebar: http
---

Tiêu đề HTTP **`Accept-Ranges`** {{Glossary("response header", "phản hồi")}} được máy chủ sử dụng để quảng cáo hỗ trợ của nó cho [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests), cho phép máy khách yêu cầu một phần hoặc nhiều phần của tài nguyên.
Giá trị của tiêu đề này chỉ ra đơn vị có thể được sử dụng để xác định phạm vi.

Ví dụ, phản hồi có tiêu đề `Accept-Ranges` chỉ ra rằng máy chủ có khả năng _tiếp tục_ một tải xuống bị gián đoạn thay vì máy khách phải khởi động lại quá trình truyền từ đầu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Accept-Ranges: <range-unit>
Accept-Ranges: none
```

## Chỉ thị

- `<range-unit>`
  - : Đơn vị phạm vi mà máy chủ hỗ trợ, mặc dù `bytes` là đơn vị phạm vi duy nhất được {{RFC("7233")}} định nghĩa chính thức. Các đơn vị phạm vi được đăng ký trong [HTTP Range Unit Registry](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#range-units).
- `none`
  - : Không có đơn vị phạm vi nào được hỗ trợ. Điều này tương đương với việc bỏ qua tiêu đề và do đó, hiếm khi được sử dụng. Giá trị này được sử dụng trong các trình duyệt cũ để vô hiệu hóa hoặc xóa các nút tạm dừng trong trình quản lý tải xuống nếu máy chủ không hỗ trợ yêu cầu phạm vi.

## Ví dụ

```http
Accept-Ranges: bytes
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [HTTP range requests](/en-US/docs/Web/HTTP/Guides/Range_requests)
- Hướng dẫn [HTTP conditional requests](/en-US/docs/Web/HTTP/Guides/Conditional_requests)
- Các tiêu đề yêu cầu {{HTTPHeader("Range")}}, {{HTTPHeader("If-Range")}}
- [IANA HTTP Range Unit Registry](https://www.iana.org/assignments/http-parameters/http-parameters.xhtml#range-units)
