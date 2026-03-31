---
title: X-DNS-Prefetch-Control header
short-title: X-DNS-Prefetch-Control
slug: Web/HTTP/Reference/Headers/X-DNS-Prefetch-Control
page-type: http-header
status:
  - non-standard
browser-compat: http.headers.X-DNS-Prefetch-Control
sidebar: http
---

{{Non-standard_header}}

Tiêu đề HTTP **`X-DNS-Prefetch-Control`** {{Glossary("response header")}} kiểm soát DNS prefetching, một tính năng bởi đó các trình duyệt chủ động thực hiện phân giải tên miền trên các liên kết mà người dùng có thể chọn để theo dõi cũng như URL cho các mục được tham chiếu bởi tài liệu, bao gồm hình ảnh, CSS, JavaScript, v.v.

Mục đích là prefetching được thực hiện ở chạy nền để {{glossary("DNS")}} đã được phân giải xong vào thời điểm các mục được tham chiếu cần bởi trình duyệt.
Điều này giảm độ trễ khi người dùng nhấp vào liên kết, ví dụ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-DNS-Prefetch-Control: on
X-DNS-Prefetch-Control: off
```

### Chỉ thị

- `on`
  - : Bật DNS prefetching. Đây là những gì trình duyệt làm nếu chúng hỗ trợ tính năng khi tiêu đề này không có.
- `off`
  - : Tắt DNS prefetching. Điều này hữu ích nếu bạn không kiểm soát liên kết trên các trang hoặc biết rằng bạn không muốn rò rỉ thông tin đến các tên miền này.

## Mô tả

Các yêu cầu DNS rất nhỏ về băng thông, nhưng độ trễ có thể khá cao,
đặc biệt trên các mạng di động. Bằng cách suy đoán prefetch kết quả DNS, độ trễ có thể được
giảm đáng kể vào một số thời điểm nhất định, chẳng hạn như khi người dùng nhấp vào liên kết. Trong một số
trường hợp, độ trễ có thể giảm một giây.

Việc triển khai prefetching này trong một số trình duyệt cho phép phân giải tên miền
xảy ra song song với (thay vì nối tiếp với) việc tải nội dung trang thực tế. Bằng cách làm này, quá trình phân giải tên miền độ trễ cao không gây ra bất kỳ
độ trễ nào trong khi tải nội dung.

Thời gian tải trang – đặc biệt trên các mạng di động – có thể được cải thiện đáng kể theo
cách này. Nếu tên miền cho hình ảnh có thể được phân giải trước khi hình ảnh được
yêu cầu, các trang tải nhiều hình ảnh có thể thấy cải thiện 5% hoặc hơn trong thời gian
tải hình ảnh.

### Cấu hình prefetching trong trình duyệt

Nói chung, bạn không cần làm gì để quản lý prefetching. Tuy nhiên, người dùng có thể
muốn tắt prefetching. Trên Firefox, điều này có thể được thực hiện bằng cách đặt
tùy chọn `network.dns.disablePrefetch` thành `true`.

Ngoài ra, theo mặc định, prefetching tên máy chủ liên kết nhúng không được thực hiện trên tài liệu
được tải qua {{glossary("HTTPS")}}. Trên Firefox, điều này có thể được thay đổi bằng cách đặt
tùy chọn `network.dns.disablePrefetchFromHTTPS` thành `false`.

## Ví dụ

### Bật và tắt prefetching

Bạn có thể gửi tiêu đề `X-DNS-Prefetch-Control` phía máy chủ, hoặc từ
các tài liệu riêng lẻ, sử dụng thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) trên
phần tử {{HTMLElement("meta")}}, như thế này:

```html
<meta http-equiv="x-dns-prefetch-control" content="off" />
```

Bạn có thể đảo ngược cài đặt này bằng cách đặt `content` thành `"on"`.

### Buộc tra cứu tên máy chủ cụ thể

Bạn có thể buộc tra cứu tên máy chủ cụ thể mà không cung cấp neo cụ thể sử dụng
tên máy chủ đó bằng cách sử dụng thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Elements/link#rel) trên
phần tử {{HTMLElement("link")}} với [loại liên kết](/en-US/docs/Web/HTML/Reference/Attributes/rel) là `dns-prefetch`:

```html
<link rel="dns-prefetch" href="https://www.mozilla.org" />
```

Trong ví dụ này, tên miền `www.mozilla.org` sẽ được phân giải trước.

Tương tự, phần tử link có thể được sử dụng để phân giải tên máy chủ mà không cung cấp
URL hoàn chỉnh, nhưng chỉ, bằng cách đặt trước tên máy chủ với hai gạch chéo:

```html
<link rel="dns-prefetch" href="//www.mozilla.org" />
```

Prefetching được buộc của tên máy chủ có thể hữu ích, ví dụ, trên trang chủ của một trang web
để buộc phân giải trước tên miền được tham chiếu thường xuyên trong toàn bộ
trang web ngay cả khi chúng không được sử dụng trên trang chủ. Điều này sẽ cải thiện
hiệu suất tổng thể của trang web ngay cả khi hiệu suất của trang chủ không
bị ảnh hưởng.

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [DNS Prefetching for Firefox (bài đăng blog)](https://bitsup.blogspot.com/2008/11/dns-prefetching-for-firefox.html)
- [Google Chrome handles DNS prefetching control](https://www.chromium.org/developers/design-documents/dns-prefetching/)
