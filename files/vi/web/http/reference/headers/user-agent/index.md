---
title: User-Agent header
short-title: User-Agent
slug: Web/HTTP/Reference/Headers/User-Agent
page-type: http-header
browser-compat: http.headers.User-Agent
sidebar: http
---

Tiêu đề HTTP **User-Agent** {{Glossary("request header")}} là chuỗi đặc trưng cho phép máy chủ và các ngang hàng mạng xác định ứng dụng, hệ điều hành, nhà cung cấp và/hoặc phiên bản của {{Glossary("user agent")}} yêu cầu.

> [!WARNING]
> Xem [Phát hiện trình duyệt bằng user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent) để biết lý do tại sao phục vụ nội dung khác nhau cho các trình duyệt khác nhau thường là ý tưởng tồi.

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
User-Agent: <product> / <product-version> <comment>
```

Định dạng phổ biến cho trình duyệt web:

```http
User-Agent: Mozilla/5.0 (<system-information>) <platform> (<platform-details>) <extensions>
```

### Chỉ thị

- `<product>`
  - : Định danh sản phẩm — tên hoặc tên mã phát triển của nó.
- `<product-version>`
  - : Số phiên bản của sản phẩm.
- `<comment>`
  - : Không hoặc nhiều bình luận chứa chi tiết hơn. Ví dụ, thông tin sản phẩm con.

## Giảm thiểu User-Agent

Thông tin được hiển thị trong tiêu đề `User-Agent` theo lịch sử đã gây ra lo ngại về [quyền riêng tư](/en-US/docs/Web/Privacy) — nó có thể được sử dụng để xác định một tác nhân người dùng cụ thể, và do đó có thể được sử dụng cho {{glossary("fingerprinting")}}. Để giảm thiểu những lo ngại như vậy, [các trình duyệt hỗ trợ](#browser_compatibility) cung cấp bộ thông tin giảm thiểu trong tiêu đề `User-Agent` của chúng, và trong các tính năng API liên quan như {{domxref("Navigator.userAgent")}}, {{domxref("Navigator.appVersion")}}, và {{domxref("Navigator.platform")}}.

Ví dụ, trước đây chuỗi `User-Agent` cho Chrome chạy trên Android có thể trông như thế này:

```plain
Mozilla/5.0 (Linux; Android 16; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.12.45 Mobile Safari/537.36
```

Sau khi cập nhật giảm thiểu User-Agent, nó bây giờ trông như thế này:

```plain
Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36
```

- Phiên bản nền tảng luôn là giá trị cố định, trong trường hợp này, `Android 10`.
- Mô hình thiết bị luôn là giá trị cố định, trong trường hợp này, `K`.
- Số phiên bản chính của Chrome hiển thị chính xác, nhưng số phiên bản phụ luôn được hiển thị là không — `0.0.0`.

Các máy chủ cần thêm thông tin có thể yêu cầu nó qua [User-Agent client hints](/en-US/docs/Web/HTTP/Guides/Client_hints). Sau kết nối ban đầu, máy chủ có thể gửi tiêu đề phản hồi {{httpheader("Accept-CH")}} chi tiết các mục dữ liệu họ muốn, và máy khách sau đó có thể gửi lại dữ liệu qua các tiêu đề [`Sec-CH-UA-*`](/en-US/docs/Web/HTTP/Reference/Headers#user_agent_client_hints). Thông tin này cũng có thể được truy cập qua [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API).

Để biết thêm thông tin chi tiết, bao gồm hướng dẫn để lấy thêm thông tin khi cần, xem [Giảm thiểu User-Agent](/en-US/docs/Web/HTTP/Guides/User-agent_reduction). Bạn cũng có thể tìm ví dụ về chuỗi `User-Agent` giảm thiểu trong các phần sau.

## Chuỗi UA Firefox

Để biết thêm về chuỗi tác nhân người dùng dựa trên Firefox và Gecko, xem [tham chiếu chuỗi tác nhân người dùng Firefox](/en-US/docs/Web/HTTP/Reference/Headers/User-Agent/Firefox). Chuỗi UA của Firefox được chia thành 4 thành phần:

```plain
Mozilla/5.0 (platform; rv:gecko-version) Gecko/gecko-trail Firefox/firefox-version
```

1. `Mozilla/5.0` là token chung cho biết trình duyệt tương thích Mozilla. Vì lý do lịch sử, hầu hết mọi trình duyệt ngày nay đều gửi nó.
2. **_platform_** mô tả nền tảng gốc mà trình duyệt đang chạy trên (Windows, Mac, Linux, Android, v.v.) và liệu đó có phải điện thoại di động hay không. Lưu ý rằng **_platform_** có thể gồm nhiều token phân cách bằng `;`. Xem bên dưới để biết thêm chi tiết và ví dụ.
3. **rv:_gecko-version_** cho biết phiên bản phát hành của Gecko (chẳng hạn như "_17.0_"). Trong các trình duyệt gần đây, **_gecko-version_** giống như **_firefox-version_**.
4. **_Gecko/gecko-trail_** cho biết rằng trình duyệt dựa trên Gecko. (Trên máy tính, **_gecko-trail_** luôn là chuỗi cố định `20100101`.)
5. **_Firefox/firefox-version_** cho biết rằng trình duyệt là Firefox và cung cấp phiên bản (chẳng hạn như "_17.0_").

Ví dụ máy tính:

```plain
Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0

Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0
```

## Chuỗi UA Chrome

Chuỗi tác nhân người dùng Chrome (hoặc các engine dựa trên Chromium/Blink) tương tự như Firefox. Để tương thích, nó thêm các chuỗi như `KHTML, like Gecko` và `Safari`. Nó thêm `"CriOS/<version>"` trên iPhone.

Ví dụ máy tính:

```plain
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36

Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36
```

Ví dụ điện thoại Android:

```plain
Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36
```

## Chuỗi UA Opera

Trình duyệt Opera cũng dựa trên engine Blink, đó là lý do tại sao nó gần giống như chuỗi UA Chrome, nhưng thêm `"OPR/<version>"` trên máy tính và Android, và `"OPT/<version>"` trên iPhone. Đối với các phiên bản xem trước, Opera cũng bao gồm mô tả của phiên bản trình duyệt cụ thể trong dấu ngoặc đơn, ví dụ `(Edition developer)`.

Ví dụ máy tính:

```plain
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 OPR/124.0.0.0 (Edition developer)

Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 OPR/124.0.0.0 (Edition developer)
```

Ví dụ điện thoại Android:

```plain
Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Mobile Safari/537.36 OPR/92.0.0.0
```

## Chuỗi UA Microsoft Edge

Trình duyệt Edge cũng dựa trên engine Blink. Nó thêm `"Edg/<version>"` trên các nền tảng máy tính, `"EdgA/<version>"` trên Android, và `"EdgiOS/<version>"` trên iPhone.

Ví dụ máy tính:

```plain
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0

Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0
```

Ví dụ điện thoại Android:

```plain
Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36 EdgA/141.0.0.0
```

## Chuỗi UA Safari

Safari dựa trên engine WebKit, nhưng chuỗi UA của nó cũng tương tự như các trình duyệt dựa trên Blink. Nó thường bao gồm chuỗi `Version/xxx` trước phiên bản build engine thực tế để cho biết phiên bản phát hành trình duyệt, khác với các trình duyệt dựa trên Blink. Trong trường hợp iPhone (Mobile) Safari, chuỗi cũng bao gồm `Mobile`.

> [!NOTE]
> Tại thời điểm viết, các trình duyệt iPhone không phải Apple (như Firefox, Chrome và Edge) vẫn dựa trên WebKit, do đó chuỗi UA của chúng tương tự như chuỗi UA Safari.

Ví dụ máy tính:

```plain
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Safari/605.1.15
```

Ví dụ iPhone:

```plain
Mozilla/5.0 (iPhone; CPU iPhone OS 18_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.0 Mobile/15E148 Safari/604.1
```

## Ví dụ trước khi giảm thiểu user-agent

Phần này cung cấp một số ví dụ về chuỗi UA trong các phiên bản trình duyệt cũ hơn, trước khi giảm thiểu user-agent được giới thiệu:

Google Chrome:

```plain
Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36
```

Microsoft Edge:

```plain
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59
```

Opera:

```plain
Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41
```

Các phiên bản Opera cũ hơn dựa trên Presto đã sử dụng cấu trúc như thế này:

```plain
Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.2.15 Version/10.00

Opera/9.60 (Windows NT 6.0; U; en) Presto/2.1.1
```

## Chuỗi UA crawler và bot

### Ví dụ

```plain
Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
```

```plain
Mozilla/5.0 (compatible; YandexAccessibilityBot/3.0; +http://yandex.com/bots)
```

## Chuỗi UA thư viện và công cụ mạng

### Ví dụ

```plain
curl/7.64.1
```

```plain
PostmanRuntime/7.26.5
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [User-Agent detection, history and checklist](https://hacks.mozilla.org/2013/09/user-agent-detection-history-and-checklist/)
- [Tham chiếu chuỗi tác nhân người dùng Firefox](/en-US/docs/Web/HTTP/Reference/Headers/User-Agent/Firefox)
- [Phát hiện trình duyệt bằng user agent](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent)
- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
