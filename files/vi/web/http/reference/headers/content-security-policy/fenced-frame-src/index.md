---
title: "Content-Security-Policy: fenced-frame-src directive"
short-title: fenced-frame-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/fenced-frame-src
page-type: http-csp-directive
status:
  - experimental
browser-compat: http.headers.Content-Security-Policy.fenced-frame-src
sidebar: http
---

{{SeeCompatTable}}

Chỉ thị **`fenced-frame-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các ngữ cảnh duyệt lồng nhau được tải vào các phần tử {{HTMLElement("fencedframe")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>1</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Fetch directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng</th>
      <td>
        Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
        {{CSP("frame-src")}} (chỉ thị này dự phòng sang chỉ thị
        {{CSP("child-src")}}).
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: fenced-frame-src <source-expression-list>;
```

- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - Giá trị [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source) `"https:"`
    - Giá trị [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source) `"https:"`
    - Chuỗi `"*"`

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: fenced-frame-src https://example.com/
```

Các nguồn sau sẽ không tải trong một fenced frame:

- `https://not-example.com/` (tên miền không khớp)
- `https://example.org/` (TLD không khớp)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fenced Frame API](/en-US/docs/Web/API/Fenced_frame_API)
- {{HTMLElement("fencedframe")}}
- {{HTTPHeader("Content-Security-Policy")}}
