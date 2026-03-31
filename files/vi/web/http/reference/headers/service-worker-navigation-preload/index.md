---
title: Service-Worker-Navigation-Preload header
short-title: Service-Worker-Navigation-Preload
slug: Web/HTTP/Reference/Headers/Service-Worker-Navigation-Preload
page-type: http-header
browser-compat: http.headers.Service-Worker-Navigation-Preload
sidebar: http
---

Tiêu đề HTTP **`Service-Worker-Navigation-Preload`** {{Glossary("request header")}} cho biết rằng yêu cầu là kết quả của thao tác {{domxref("Window/fetch", "fetch()")}} được thực hiện trong quá trình tải trước điều hướng service worker.
Nó cho phép máy chủ phản hồi với tài nguyên khác so với yêu cầu `fetch()` bình thường.

Nếu một phản hồi khác có thể xảy ra từ việc đặt tiêu đề này, máy chủ phải bao gồm tiêu đề {{HTTPHeader("Vary", "Vary: Service-Worker-Navigation-Preload")}} trong các phản hồi để đảm bảo các phản hồi khác nhau được lưu trong bộ nhớ đệm.

Để biết thêm thông tin, hãy xem {{domxref("NavigationPreloadManager.setHeaderValue()")}} (và {{domxref("NavigationPreloadManager")}}).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Service-Worker-Navigation-Preload: <value>
```

## Chỉ thị

- `<value>`
  - : Giá trị tùy ý cho biết dữ liệu nào nên được gửi trong phản hồi cho yêu cầu tải trước.
    Mặc định là `true`.
    Nó có thể được đặt thành bất kỳ giá trị chuỗi nào khác trong service worker, sử dụng {{domxref("NavigationPreloadManager.setHeaderValue()")}}.

## Ví dụ

### Tiêu đề tải trước điều hướng service worker

Tiêu đề yêu cầu sau được gửi theo mặc định trong các yêu cầu tải trước điều hướng:

```http
Service-Worker-Navigation-Preload: true
```

Service worker có thể đặt giá trị tiêu đề khác bằng cách sử dụng {{domxref("NavigationPreloadManager.setHeaderValue()")}}.
Ví dụ: để yêu cầu trả về một fragment của tài nguyên được yêu cầu ở định dạng JSON, giá trị có thể được đặt bằng chuỗi `json_fragment1`.

```http
Service-Worker-Navigation-Preload: json_fragment1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
