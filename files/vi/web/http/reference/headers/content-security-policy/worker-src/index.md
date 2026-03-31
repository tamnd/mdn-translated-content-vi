---
title: "Content-Security-Policy: worker-src directive"
short-title: worker-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/worker-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.worker-src
sidebar: http
---

Chỉ thị **`worker-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các script {{domxref("Worker")}}, {{domxref("SharedWorker")}}, hoặc {{domxref("ServiceWorker")}}.

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
      <th scope="row">Dự phòng</th>
      <td>
        <p>
          Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
          {{CSP("child-src")}} trước, sau đó chỉ thị
          {{CSP("script-src")}}, cuối cùng là chỉ thị
          {{CSP("default-src")}}, khi quản lý thực thi worker.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: worker-src 'none';
Content-Security-Policy: worker-src <source-expression-list>;
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
Content-Security-Policy: worker-src https://example.com/
```

{{domxref("Worker")}}, {{domxref("SharedWorker")}}, {{domxref("ServiceWorker")}} bị chặn và sẽ không tải:

```html
<script>
  let blockedWorker = new Worker("data:text/javascript,…");
  blockedWorker = new SharedWorker("https://not-example.com/");
  navigator.serviceWorker.register("https://not-example.com/sw.js");
</script>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- [CSP cho Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers#content_security_policy)
- {{domxref("Worker")}}, {{domxref("SharedWorker")}}, {{domxref("ServiceWorker")}}
