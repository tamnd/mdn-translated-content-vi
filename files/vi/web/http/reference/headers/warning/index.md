---
title: Warning header
short-title: Warning
slug: Web/HTTP/Reference/Headers/Warning
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Warning
sidebar: http
---

{{deprecated_header}}

> [!NOTE]
> Tiêu đề đã bị không dùng nữa vì nó không được tạo rộng rãi hoặc hiển thị cho người dùng (xem [RFC9111](https://www.rfc-editor.org/rfc/rfc9111#field.warning)).
> Một số thông tin có thể được suy ra từ các tiêu đề khác như {{httpheader("Age")}}.

Tiêu đề HTTP **`Warning`** {{glossary("request header", "request")}} và {{glossary("response header")}} chứa thông tin về các vấn đề có thể xảy ra với trạng thái của thông điệp.
Có thể có nhiều hơn một tiêu đề `Warning` trong một phản hồi.

Các trường tiêu đề `Warning` thường có thể được áp dụng cho bất kỳ thông điệp nào.
Tuy nhiên, một số mã cảnh báo dành riêng cho bộ đệm và chỉ có thể được áp dụng cho các thông điệp phản hồi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
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
Warning: <warn-code> <warn-agent> <warn-text> [<warn-date>]
```

## Chỉ thị

- `<warn-code>`
  - : Số cảnh báo ba chữ số. Chữ số đầu tiên cho biết liệu `Warning` có cần bị xóa khỏi phản hồi được lưu trữ sau khi xác thực hay không.
    - Mã cảnh báo `1xx` mô tả trạng thái mới mẻ hoặc xác thực của phản hồi và sẽ bị xóa bởi bộ đệm sau khi xác thực thành công.
    - Mã cảnh báo `2xx` mô tả một khía cạnh nào đó của biểu diễn không được khắc phục bởi việc xác thực và sẽ không bị xóa bởi bộ đệm sau khi xác thực trừ khi phản hồi đầy đủ được gửi.

- `<warn-agent>`
  - : Tên hoặc bí danh của máy chủ hoặc phần mềm thêm tiêu đề `Warning` (có thể là "-" khi tác nhân không xác định).
- `<warn-text>`
  - : Văn bản tư vấn mô tả lỗi.
- `<warn-date>` {{optional_inline}}
  - : Ngày. Nếu có nhiều hơn một tiêu đề `Warning` được gửi, bao gồm một ngày khớp với tiêu đề {{HTTPHeader("Date")}}.

## Mã cảnh báo

[Sổ đăng ký HTTP Warn Codes tại iana.org](https://www.iana.org/assignments/http-warn-codes/http-warn-codes.xhtml) định nghĩa không gian tên cho các mã cảnh báo.

| Mã  | Văn bản                          | Mô tả                                                                                                                                                                  |
| --- | -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 110 | Response is Stale                | Phản hồi được cung cấp bởi bộ đệm đã cũ (thời gian hết hạn được đặt cho phản hồi đã qua).                                                                              |
| 111 | Revalidation Failed              | Nỗ lực xác thực phản hồi cũ đã thất bại do không thể liên hệ với máy chủ.                                                                                              |
| 112 | Disconnected Operation           | Bộ đệm bị cố ý ngắt kết nối khỏi phần còn lại của mạng.                                                                                                                |
| 113 | Heuristic Expiration             | Bộ đệm theo heuristic đã chọn [thời gian mới mẻ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) lớn hơn 24 giờ và tuổi của phản hồi lớn hơn 24 giờ. |
| 199 | Miscellaneous Warning            | Thông tin tùy ý cần được hiển thị cho người dùng hoặc ghi lại.                                                                                                         |
| 214 | Transformation Applied           | Được thêm bởi proxy nếu nó áp dụng bất kỳ biến đổi nào cho biểu diễn, chẳng hạn như thay đổi mã hóa nội dung, kiểu phương tiện hoặc tương tự.                          |
| 299 | Miscellaneous Persistent Warning | Thông tin tùy ý cần được hiển thị cho người dùng hoặc ghi lại. Mã cảnh báo này tương tự như mã cảnh báo 199 và ngoài ra chỉ ra cảnh báo liên tục.                      |

## Ví dụ

```http
Warning: 110 anderson/1.3.37 "Response is stale"

Date: Wed, 21 Oct 2015 07:28:00 GMT
Warning: 112 - "cache down" "Wed, 21 Oct 2015 07:28:00 GMT"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Date")}}
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
