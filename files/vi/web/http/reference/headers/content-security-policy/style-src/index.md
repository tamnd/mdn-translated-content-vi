---
title: "Content-Security-Policy: style-src directive"
short-title: style-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/style-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.style-src
sidebar: http
---

Chỉ thị **`style-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các stylesheet.

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
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>
        Có. Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
        <code>default-src</code>.
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: style-src 'none';
Content-Security-Policy: style-src <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)
    - [`'unsafe-inline'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-inline)
    - [`'unsafe-hashes'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes)
    - [`'nonce-<nonce_value>'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#nonce-nonce_value)
    - [`'<hash_algorithm>-<hash_value>'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#hash_algorithm-hash_value)
    - [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample)

    Lưu ý rằng thông số kỹ thuật cũng bao gồm [`'unsafe-eval'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-eval) như một giá trị biểu thức nguồn hợp lệ, để cho phép các phương thức CSSOM phân tích và chèn chuỗi CSS, bao gồm các phương thức `insertRule()` và bộ thiết lập `cssText` trên các giao diện khác nhau, chẳng hạn như {{domxref("CSSStyleSheet.insertRule()")}} và {{domxref("CSSStyleDeclaration.cssText")}}. Tuy nhiên hiện nay không có trình duyệt nào chặn các phương thức này, vì vậy không cần áp dụng `unsafe-eval`.

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: style-src https://example.com/
```

các stylesheet sau bị chặn và sẽ không tải:

```html
<link href="https://not-example.com/styles/main.css" rel="stylesheet" />

<style>
  #inline-style {
    background: red;
  }
</style>

<style>
  @import "https://not-example.com/styles/print.css" print;
</style>
```

cũng như các style được tải bằng tiêu đề {{HTTPHeader("Link")}}:

```http
Link: <https://not-example.com/styles/stylesheet.css>;rel=stylesheet
```

Các thuộc tính style nội tuyến cũng bị chặn:

```html
<div style="display:none">Foo</div>
```

Cũng như các style được áp dụng trong JavaScript bằng cách đặt thuộc tính `style` trực tiếp, hoặc bằng cách đặt {{domxref("CSSStyleDeclaration.cssText", "cssText")}}:

```js
document.querySelector("div").setAttribute("style", "display:none;");
document.querySelector("div").style.cssText = "display:none;";
```

Tuy nhiên, các thuộc tính style được đặt trực tiếp trên thuộc tính {{domxref("HTMLElement/style", "style")}} của phần tử sẽ không bị chặn, cho phép người dùng an toàn thao tác style qua JavaScript:

```js
document.querySelector("div").style.display = "none";
```

Các loại thao tác này có thể được ngăn chặn bằng cách không cho phép JavaScript qua chỉ thị CSP {{CSP("script-src")}}.

### Style nội tuyến không an toàn

> [!NOTE]
> Không cho phép các style nội tuyến và script nội tuyến là một trong những lợi ích bảo mật lớn nhất mà CSP cung cấp. Tuy nhiên, nếu bạn thực sự phải sử dụng nó, có một vài cơ chế sẽ cho phép chúng.

Để cho phép các style nội tuyến, có thể chỉ định `'unsafe-inline'`, nonce-source hoặc hash-source khớp với khối nội tuyến.
Content Security Policy sau sẽ cho phép các style nội tuyến như phần tử {{HTMLElement("style")}} và thuộc tính `style` trên bất kỳ phần tử nào:

```http
Content-Security-Policy: style-src 'unsafe-inline';
```

Phần tử {{HTMLElement("style")}} và thuộc tính `style` sau sẽ được phép bởi chính sách:

```html
<style>
  #inline-style {
    background: red;
  }
</style>

<div style="display:none">Foo</div>
```

Bạn có thể sử dụng nonce-source để chỉ cho phép các khối style nội tuyến cụ thể.
Bạn cần tạo một giá trị {{Glossary("Nonce", "nonce")}} ngẫu nhiên (sử dụng bộ tạo token ngẫu nhiên bảo mật về mặt mật mã) và đưa nó vào chính sách.
Điều quan trọng cần lưu ý là giá trị nonce này cần được tạo động vì nó phải là duy nhất cho mỗi yêu cầu HTTP:

```http
Content-Security-Policy: style-src 'nonce-2726c7f26c'
```

Bạn sẽ phải đặt cùng nonce trên phần tử {{HTMLElement("style")}}:

```html
<style nonce="2726c7f26c">
  #inline-style {
    background: red;
  }
</style>
```

Ngoài ra, bạn có thể tạo hash từ các style nội tuyến. CSP hỗ trợ sha256, sha384 và sha512. Dạng **nhị phân** của hash phải được mã hóa với base64. Bạn có thể lấy hash của một chuỗi trong dòng lệnh qua chương trình `openssl`:

```bash
echo -n "#inline-style { background: red; }" | openssl dgst -sha256 -binary | openssl enc -base64
```

Bạn có thể sử dụng hash-source để chỉ cho phép các khối style nội tuyến cụ thể:

```http
Content-Security-Policy: style-src 'sha256-ozBpjL6dxO8fsS4u6fwG1dFDACYvpNxYeBA6tzR+FY8='
```

Khi tạo hash, không bao gồm các thẻ {{HTMLElement("style")}} và lưu ý rằng chữ hoa/thường và khoảng trắng có ý nghĩa, bao gồm cả khoảng trắng đầu hoặc cuối.

```html
<style>
  #inline-style {
    background: red;
  }
</style>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{CSP("style-src-elem")}}
- {{CSP("style-src-attr")}}
- Tiêu đề {{HTTPHeader("Link")}}
- {{HTMLElement("style")}}, {{HTMLElement("link")}}
- {{cssxref("@import")}}
- {{domxref("CSSStyleSheet.insertRule()")}}
- {{domxref("CSSGroupingRule.insertRule()")}}
- {{domxref("CSSStyleDeclaration.cssText")}}
