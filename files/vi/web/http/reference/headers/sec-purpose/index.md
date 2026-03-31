---
title: Sec-Purpose header
short-title: Sec-Purpose
slug: Web/HTTP/Reference/Headers/Sec-Purpose
page-type: http-header
browser-compat: http.headers.Sec-Purpose
sidebar: http
---

Tiêu đề HTTP **`Sec-Purpose`** {{Glossary("fetch metadata request header")}} cho biết mục đích mà tài nguyên được yêu cầu sẽ được sử dụng, khi mục đích đó là thứ gì đó khác với việc sử dụng ngay lập tức bởi tác nhân người dùng.

Mục đích duy nhất hiện được xác định là `prefetch`, cho biết tài nguyên đang được yêu cầu với dự đoán rằng nó sẽ cần thiết bởi một trang có khả năng được điều hướng đến trong tương lai gần, chẳng hạn như trang được liên kết trong kết quả tìm kiếm hoặc liên kết mà người dùng đã di chuột qua.
Máy chủ có thể sử dụng kiến thức này để: điều chỉnh thời gian hết hạn bộ nhớ đệm cho yêu cầu, không cho phép yêu cầu, hoặc có thể xử lý nó theo cách khác khi đếm lượt truy cập trang.

Tiêu đề được gửi khi một trang được tải có phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) với thuộc tính [`rel="prefetch"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch).
Lưu ý rằng nếu tiêu đề này được đặt, tiêu đề {{HTTPHeader("Sec-Fetch-Dest")}} trong yêu cầu phải được đặt thành `empty` (bất kỳ giá trị nào trong thuộc tính [`as`](/en-US/docs/Web/HTML/Reference/Elements/link#as) của [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) đều bị bỏ qua) và tiêu đề {{HTTPHeader("Accept")}} nên khớp với giá trị được sử dụng cho các yêu cầu điều hướng bình thường.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
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
Sec-Purpose: prefetch
```

## Chỉ thị

Các token được phép là:

- `prefetch`
  - : Mục đích là prefetch một tài nguyên có thể cần thiết trong điều hướng tương lai có khả năng xảy ra.

## Ví dụ

### Yêu cầu prefetch

Xem xét trường hợp trình duyệt tải tệp có phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) với thuộc tính `rel="prefetch"` và thuộc tính `href` chứa địa chỉ của tệp hình ảnh.
`fetch()` kết quả nên dẫn đến yêu cầu HTTP có `Sec-Purpose: prefetch`, `Sec-Fetch-Dest: empty`, và giá trị `Accept` giống như trình duyệt sử dụng để điều hướng trang.

Ví dụ về tiêu đề như vậy (trên Firefox) được cung cấp bên dưới:

```http
GET /images/some_image.png HTTP/1.1
Host: example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Sec-Purpose: prefetch
Connection: keep-alive
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: no-cors
Sec-Fetch-Site: same-origin
Pragma: no-cache
Cache-Control: no-cache
```

> [!NOTE]
> Tại thời điểm viết bài, Firefox đặt tiêu đề `Accept` không đúng là `Accept: */*` cho prefetch.
> Ví dụ đã được sửa đổi để hiển thị giá trị `Accept` nên là gì.
> Vấn đề này có thể được theo dõi trong [Firefox bug 1836334](https://bugzil.la/1836334).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-Fetch-Dest")}}, {{HTTPHeader("Sec-Fetch-Mode")}}, {{HTTPHeader("Sec-Fetch-Site")}}, {{HTTPHeader("Sec-Fetch-User")}} fetch metadata request headers
- {{Glossary("Prefetch")}} (Bảng chú giải thuật ngữ)
- Phần tử [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) với thuộc tính [`rel="prefetch"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/prefetch)
