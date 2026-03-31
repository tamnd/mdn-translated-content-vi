---
title: "Content-Security-Policy: script-src-attr directive"
short-title: script-src-attr
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/script-src-attr
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.script-src-attr
sidebar: http
---

Chỉ thị **`script-src-attr`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các event handler script JavaScript nội tuyến.

Chỉ thị này chỉ chỉ định các nguồn hợp lệ cho các event handler script nội tuyến như `onclick`.
Nó không áp dụng cho các nguồn JavaScript khác có thể kích hoạt thực thi script, chẳng hạn như các URL được tải trực tiếp vào các phần tử {{HTMLElement("script")}} và [XSLT stylesheets](/en-US/docs/Web/XML/XSLT).
(Các nguồn hợp lệ có thể được chỉ định cho tất cả các nguồn script JavaScript bằng {{CSP("script-src")}}, hoặc chỉ cho các phần tử `<script>` bằng {{CSP("script-src-elem")}}.)

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
Content-Security-Policy: script-src-attr 'none';
Content-Security-Policy: script-src-attr <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`'unsafe-hashes'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes)
    - [`'unsafe-inline'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-inline)
    - [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample)

`script-src-attr` có thể được sử dụng kết hợp với {{CSP("script-src")}}, và sẽ ghi đè lên chỉ thị đó cho các kiểm tra trên các inline handler:

```http
Content-Security-Policy: script-src <source>;
Content-Security-Policy: script-src-attr <source>;
```

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: script-src-attr 'none'
```

…event handler nội tuyến sau bị chặn và sẽ không được tải hoặc thực thi:

```html
<button id="btn" onclick="doSomething()">Nhấp vào tôi</button>
```

Lưu ý rằng nói chung bạn nên thay thế các event handler nội tuyến bằng các lệnh gọi {{domxref("EventTarget.addEventListener", "addEventListener")}}:

```js
document.getElementById("btn").addEventListener("click", doSomething);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("script")}}
- {{CSP("script-src")}}
- {{CSP("script-src-elem")}}
