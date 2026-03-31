---
title: Content-Range header
short-title: Content-Range
slug: Web/HTTP/Reference/Headers/Content-Range
page-type: http-header
browser-compat: http.headers.Content-Range
sidebar: http
---

Tiêu đề HTTP **`Content-Range`** {{Glossary("response header", "phản hồi")}} được sử dụng trong [yêu cầu phạm vi](/en-US/docs/Web/HTTP/Guides/Range_requests) để chỉ ra nơi nội dung của thân phản hồi thuộc về trong mối quan hệ với tài nguyên đầy đủ.

Nó chỉ nên được bao gồm trong các phản hồi {{HTTPStatus("206", "206 Partial Content")}} hoặc {{HTTPStatus("416", "416 Range Not Satisfiable")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header", "Tiêu đề phản hồi")}},
        {{Glossary("Content header", "Tiêu đề nội dung")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Range: <unit> <range>/<size>
Content-Range: <unit> <range>/*
Content-Range: <unit> */<size>
```

## Chỉ thị

- `<unit>`
  - : Đơn vị để chỉ định phạm vi. Hiện tại, chỉ có `bytes` được hỗ trợ.
- `<range>`
  - : Phạm vi có định dạng `<range-start>-<range-end>`, trong đó `<range-start>` và `<range-end>` là các số nguyên cho vị trí bắt đầu và kết thúc (được lập chỉ mục từ không và bao gồm) của phạm vi trong `<unit>` đã cho. `*` được sử dụng trong phản hồi {{HTTPStatus("416", "416 Range Not Satisfiable")}} để chỉ ra rằng giá trị không phải là phạm vi.
- `<size>`
  - : Tổng độ dài của tài liệu (hoặc `*` nếu không biết).

## Ví dụ

### Phản hồi nội dung một phần

Phản hồi {{HTTPStatus("206", "206 Partial Content")}} này hiển thị phản hồi một phần, với `Content-Range` chỉ ra rằng nó chứa 1024 byte đầu tiên của tệp 146515 byte.

```http
HTTP/2 206
content-type: image/jpeg
content-length: 1024
content-range: bytes 0-1023/146515
…

(binary content)
```

### Phạm vi không thể được đáp ứng

Nếu máy chủ không thể đáp ứng yêu cầu phạm vi được yêu cầu, nó nên phản hồi với trạng thái {{HTTPStatus("416", "416 Range Not Satisfiable")}}, và `Content-Range` nên chỉ định `*` cho phạm vi cùng với tổng kích thước của tài nguyên.

```http
HTTP/2 416

Content-Range: bytes */67589
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [HTTP range requests](/en-US/docs/Web/HTTP/Guides/Range_requests)
- Tiêu đề {{HTTPHeader("If-Range")}}, {{HTTPHeader("Range")}}
- {{HTTPHeader("Content-Type")}}
- Mã trạng thái {{HTTPStatus("206", "206 Partial Content")}}, {{HTTPStatus("416", "416 Range Not Satisfiable")}}
