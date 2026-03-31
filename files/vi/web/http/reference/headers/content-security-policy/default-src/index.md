---
title: "Content-Security-Policy: default-src directive"
short-title: default-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/default-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.default-src
sidebar: http
---

Chỉ thị **`default-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) đóng vai trò dự phòng cho các {{Glossary("fetch directive", "chỉ thị fetch")}} CSP khác. Đối với mỗi chỉ thị sau đây vắng mặt, trình duyệt sẽ tìm kiếm chỉ thị `default-src` và sử dụng giá trị này cho nó:

- {{CSP("child-src")}}
- {{CSP("connect-src")}}
- {{CSP("font-src")}}
- {{CSP("frame-src")}}
- {{CSP("img-src")}}
- {{CSP("manifest-src")}}
- {{CSP("media-src")}}
- {{CSP("object-src")}}
- {{CSP("prefetch-src")}}
- {{CSP("script-src")}}
- {{CSP("script-src-elem")}}
- {{CSP("script-src-attr")}}
- {{CSP("style-src")}}
- {{CSP("style-src-elem")}}
- {{CSP("style-src-attr")}}
- {{CSP("worker-src")}}

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
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: default-src 'none';
Content-Security-Policy: default-src <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, bất kỳ giá trị biểu thức nguồn nào được liệt kê trong [cú pháp chỉ thị fetch](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#fetch_directive_syntax) đều có thể áp dụng.

## Ví dụ

### Không kế thừa với default-src

Nếu có các chỉ thị khác được chỉ định, `default-src` không ảnh hưởng đến chúng. Tiêu đề sau:

```http
Content-Security-Policy: default-src 'self'; script-src https://example.com
```

tương đương với:

```http
Content-Security-Policy: connect-src 'self';
                         font-src 'self';
                         frame-src 'self';
                         img-src 'self';
                         manifest-src 'self';
                         media-src 'self';
                         object-src 'self';
                         script-src https://example.com;
                         style-src 'self';
                         worker-src 'self'
```

### Vấn đề chặn SVG sprite với `default-src: none` trong Firefox

> [!NOTE]
> Vấn đề này đã được sửa trong Firefox 132; xem [bug 1773976](https://bugzil.la/1773976).

Khi tạo CSP, bạn có thể bắt đầu với `default-src 'none'` để khóa tất cả việc tải tài nguyên và sau đó thêm các chỉ thị tiếp theo để mở rộng chính sách, cho phép bạn chỉ tải những tài nguyên bạn cần. Ví dụ, để chỉ cho phép tải hình ảnh từ cùng một nguồn gốc:

```http
Content-Security-Policy: default-src 'none'; img-src 'self'
```

Tuy nhiên, có một vấn đề ở đây. Nếu bạn nhúng các sprite SVG được định nghĩa trong các tệp bên ngoài qua phần tử [`<use>`](/en-US/docs/Web/SVG/Reference/Element/use), ví dụ:

```svg
<svg>
  <use href="/images/icons.svg#icon"/>
</svg>
```

hình ảnh SVG của bạn sẽ bị chặn trong Firefox nếu bạn đặt chính sách `default-src 'none'`. Firefox không coi SVG là hình ảnh nhúng như các trình duyệt khác, vì vậy `img-src 'self'` sẽ không cho phép chúng được tải. Bạn cần sử dụng `default-src 'self'` nếu muốn sprite bên ngoài tải trong Firefox.

Ngoài ra, nếu chính sách `default-src 'none'` là yêu cầu bắt buộc, bạn có thể nhúng sprite SVG trực tiếp vào trang HTML:

```html
<body>
  <svg style="display: none">
    <symbol id="icon" viewBox="0 0 24 24">
      <path d="…" />
    </symbol>
  </svg>
  …
  <svg>
    <use href="#icon" />
  </svg>
</body>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- Các chỉ thị CSP (<https://w3c.github.io/webappsec-csp/#csp-directives>):
  - {{Glossary("Fetch directive")}}
  - {{Glossary("Document directive")}}
  - {{Glossary("Navigation directive")}}
  - {{Glossary("Reporting directive")}}
  - [`upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests)
  - [`block-all-mixed-content`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/block-all-mixed-content)
