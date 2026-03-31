---
title: "Content-Security-Policy: connect-src directive"
short-title: connect-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/connect-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.connect-src
sidebar: http
---

Chỉ thị **`connect-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) giới hạn các URL có thể được tải bằng giao diện script. Các API sau được kiểm soát bởi chỉ thị này:

- Thuộc tính [`ping`](/en-US/docs/Web/HTML/Reference/Elements/a#ping) trong các phần tử {{htmlelement("a")}}
- {{domxref("Window/fetch", "fetch()")}}
- {{domxref("Window/fetchLater", "fetchLater()")}} {{experimental_inline}}
- {{domxref("XMLHttpRequest")}}
- {{domxref("WebSocket")}}
- {{domxref("EventSource")}}
- {{domxref("Navigator.sendBeacon()")}}

> [!NOTE]
> `connect-src 'self'` không phân giải thành các lược đồ websocket
> trong tất cả các trình duyệt, xem thêm trong [issue](https://github.com/w3c/webappsec-csp/issues/7) này.

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
Content-Security-Policy: connect-src 'none';
Content-Security-Policy: connect-src <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: connect-src https://example.com/
```

Các kết nối sau bị chặn và sẽ không tải:

```html
<a ping="https://not-example.com" href="/">Liên kết</a>
<script>
  const response = fetch("https://not-example.com/");

  const xhr = new XMLHttpRequest();
  xhr.open("GET", "https://not-example.com/");
  xhr.send();

  const ws = new WebSocket("wss://not-example.com/");

  const es = new EventSource("https://not-example.com/");

  navigator.sendBeacon("https://not-example.com/", {
    /* … */
  });
</script>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("a")}} [`ping`](/en-US/docs/Web/HTML/Reference/Elements/a#ping)
- {{domxref("Window/fetch", "fetch()")}}
- {{domxref("XMLHttpRequest")}}
- {{domxref("WebSocket")}}
- {{domxref("EventSource")}}
