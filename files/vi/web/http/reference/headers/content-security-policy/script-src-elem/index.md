---
title: "Content-Security-Policy: script-src-elem directive"
short-title: script-src-elem
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/script-src-elem
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.script-src-elem
sidebar: http
---

Chỉ thị **`script-src-elem`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các phần tử JavaScript {{HTMLElement("script")}}.

Chỉ thị này chỉ chỉ định các nguồn hợp lệ trong các phần tử `<script>` (cả yêu cầu script và các khối).
Nó không áp dụng cho các nguồn JavaScript khác có thể kích hoạt thực thi script, chẳng hạn như các event handler script nội tuyến (`onclick`), các phương thức thực thi script [bị giới hạn bởi kiểm tra "unsafe-eval"](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src#unsafe_eval_expressions), và [XSLT stylesheets](/en-US/docs/Web/XML/XSLT).
(Các nguồn hợp lệ có thể được chỉ định cho tất cả các nguồn script JavaScript bằng {{CSP("script-src")}}, hoặc chỉ cho các inline script handler bằng {{CSP("script-src-attr")}}.)

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>3</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Fetch directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>
        Có.
        Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị {{CSP("script-src")}}, và nếu cả hai đều vắng mặt thì dự phòng sang chỉ thị <code>default-src</code>.
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: script-src-elem 'none';
Content-Security-Policy: script-src-elem <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, bất kỳ giá trị biểu thức nguồn nào được liệt kê trong [cú pháp chỉ thị fetch](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#fetch_directive_syntax) đều có thể áp dụng, ngoại trừ [`'unsafe-hashes'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes).

`script-src-elem` có thể được sử dụng kết hợp với {{CSP("script-src")}}:

```http
Content-Security-Policy: script-src <source>;
Content-Security-Policy: script-src-elem <source>;
```

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: script-src-elem https://example.com/
```

…script sau bị chặn và sẽ không được tải hoặc thực thi:

```html
<script src="https://not-example.com/js/library.js"></script>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("script")}}
- {{CSP("script-src")}}
- {{CSP("script-src-attr")}}
