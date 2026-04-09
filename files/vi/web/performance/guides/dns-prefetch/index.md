---
title: Sử dụng dns-prefetch
slug: Web/Performance/Guides/dns-prefetch
page-type: guide
sidebar: performancesidebar
---

**`DNS-prefetch`** là một nỗ lực để phân giải tên miền trước khi tài nguyên được yêu cầu. Đây có thể là một tệp được tải sau đó hoặc đích liên kết mà người dùng cố gắng truy cập.

## Tại sao nên dùng dns-prefetch?

Khi trình duyệt yêu cầu một tài nguyên từ một máy chủ (bên thứ ba), tên miền của [cross-origin](/en-US/docs/Web/HTTP/Guides/CORS) đó phải được phân giải thành địa chỉ IP trước khi trình duyệt có thể gửi yêu cầu. Quá trình này được gọi là phân giải DNS. Mặc dù bộ nhớ đệm DNS có thể giúp giảm độ trễ này, việc phân giải DNS vẫn có thể thêm độ trễ đáng kể vào các yêu cầu. Với các trang web mở kết nối đến nhiều bên thứ ba, độ trễ này có thể làm giảm đáng kể hiệu năng tải.

`dns-prefetch` giúp nhà phát triển che giấu độ trễ phân giải DNS. [Phần tử HTML `<link>`](/en-US/docs/Web/HTML/Reference/Elements/link) cung cấp chức năng này thông qua giá trị `dns-prefetch` của [thuộc tính `rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel). Khi đó, tên miền [cross-origin](/en-US/docs/Web/HTTP/Guides/CORS) sẽ được chỉ định trong [thuộc tính href](/en-US/docs/Web/HTML/Reference/Attributes):

## Cú pháp

```html
<link rel="dns-prefetch" href="https://fonts.googleapis.com/" />
```

## Ví dụ

```html
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="dns-prefetch" href="https://fonts.googleapis.com/" />
    <!-- and all other head elements -->
  </head>
  <body>
    <!-- your page content -->
  </body>
</html>
```

Bất cứ khi nào trang web của bạn tham chiếu đến tài nguyên trên các miền cross-origin, bạn nên đặt gợi ý `dns-prefetch` trong [phần tử `<head>`](/en-US/docs/Web/HTML/Reference/Elements/head), nhưng có một số điều cần lưu ý.

## Thực hành tốt nhất

Có 3 điều chính cần nhớ:

**Thứ nhất**, `dns-prefetch` chỉ có hiệu quả với các tra cứu DNS trên miền [cross-origin](/en-US/docs/Web/HTTP/Guides/CORS), vì vậy đừng dùng nó để trỏ đến trang web hoặc tên miền của bạn. Điều này là do IP phía sau tên miền của bạn sẽ đã được phân giải trước khi trình duyệt nhìn thấy gợi ý này.

**Thứ hai**, cũng có thể chỉ định `dns-prefetch` (và các gợi ý tài nguyên khác) dưới dạng [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) bằng cách dùng [trường HTTP Link](/en-US/docs/Web/HTTP/Reference/Headers/Link):

```http
Link: <https://fonts.googleapis.com/>; rel=dns-prefetch
```

**Thứ ba**, trong khi `dns-prefetch` chỉ thực hiện một truy vấn DNS, [`preconnect`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) sẽ thiết lập một kết nối tới máy chủ. Quá trình này bao gồm phân giải DNS, thiết lập kết nối TCP và thực hiện bắt tay [TLS](/en-US/docs/Glossary/TLS) nếu trang web được phục vụ qua HTTPS. Dùng `preconnect` mang lại cơ hội giảm thêm độ trễ cảm nhận của [các yêu cầu cross-origin](/en-US/docs/Web/HTTP/Guides/CORS). Bạn có thể dùng nó dưới dạng [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) bằng [trường HTTP Link](/en-US/docs/Web/HTTP/Reference/Headers/Link):

```http
Link: <https://fonts.googleapis.com/>; rel=preconnect
```

hoặc qua [phần tử HTML `<link>`](/en-US/docs/Web/HTML/Reference/Elements/link):

```html
<link rel="preconnect" href="https://fonts.googleapis.com/" crossorigin />
```

> [!NOTE]
> Nếu một trang cần tạo kết nối đến nhiều miền bên thứ ba, việc preconnect tất cả chúng là phản tác dụng. Gợi ý `preconnect` nên chỉ được dùng cho những kết nối quan trọng nhất. Với các kết nối còn lại, chỉ cần dùng `<link rel="dns-prefetch">` để tiết kiệm thời gian ở bước đầu tiên - tra cứu DNS.

Logic đằng sau việc ghép các gợi ý này là vì khả năng hỗ trợ `dns-prefetch` tốt hơn `preconnect`. Các trình duyệt không hỗ trợ `preconnect` vẫn sẽ nhận được một phần lợi ích bằng cách quay về `dns-prefetch`. Vì đây là một tính năng HTML, nó có khả năng chịu lỗi rất cao. Nếu trình duyệt không hỗ trợ gặp một gợi ý `dns-prefetch` - hoặc bất kỳ gợi ý tài nguyên nào khác - trang web của bạn sẽ không bị hỏng. Bạn chỉ sẽ không nhận được lợi ích mà nó mang lại.

Một số tài nguyên như phông chữ được tải ở chế độ ẩn danh. Trong những trường hợp đó, bạn nên đặt thuộc tính [crossorigin](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) với gợi ý preconnect. Nếu bỏ qua nó, trình duyệt sẽ chỉ thực hiện tra cứu DNS.

## Xem thêm

- [`<link>`](/en-US/docs/Web/HTML/Reference/Elements/link)
- [Thuộc tính HTML: rel](/en-US/docs/Web/HTML/Reference/Attributes/rel)
- [Thuộc tính HTML rel: preconnect](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect)
- [crossorigin](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
- [Chia sẻ tài nguyên cross-origin (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [Các tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- [Tiêu đề HTTP Link](/en-US/docs/Web/HTTP/Reference/Headers/Link)
