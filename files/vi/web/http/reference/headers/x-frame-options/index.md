---
title: X-Frame-Options header
short-title: X-Frame-Options
slug: Web/HTTP/Reference/Headers/X-Frame-Options
page-type: http-header
browser-compat: http.headers.X-Frame-Options
sidebar: http
---

> [!NOTE]
> Để có nhiều tùy chọn toàn diện hơn so với tiêu đề này cung cấp, xem chỉ thị {{HTTPHeader("Content-Security-Policy/frame-ancestors", "frame-ancestors")}} trong tiêu đề {{HTTPHeader("Content-Security-Policy")}}.

Tiêu đề HTTP **`X-Frame-Options`** {{Glossary("response header")}} có thể được sử dụng để chỉ ra liệu trình duyệt có nên được phép hiển thị tài liệu trong {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("embed")}} hoặc {{HTMLElement("object")}} hay không. Các trang web có thể sử dụng điều này để tránh các cuộc tấn công [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) và một số [cross-site leaks](/en-US/docs/Web/Security/Attacks/XS-Leaks), bằng cách đảm bảo rằng nội dung của họ không được nhúng vào các trang khác.

Nếu tiêu đề này không được gửi và trang web không triển khai bất kỳ cơ chế nào khác để hạn chế nhúng (chẳng hạn như chỉ thị CSP {{HTTPHeader("Content-Security-Policy/frame-ancestors", "frame-ancestors")}}), thì trình duyệt sẽ cho phép các trang khác nhúng tài liệu này.

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
X-Frame-Options: DENY
X-Frame-Options: SAMEORIGIN
```

### Chỉ thị

- `DENY`
  - : Tài liệu không thể được tải trong bất kỳ frame nào, bất kể nguồn gốc (cả nhúng cùng nguồn gốc và cross-origin đều bị chặn).
- `SAMEORIGIN`
  - : Tài liệu chỉ có thể được nhúng nếu tất cả các frame tổ tiên có cùng {{glossary("origin")}} với chính trang đó.
- `ALLOW-FROM origin` {{deprecated_inline}}
  - : Đây là chỉ thị đã lỗi thời. Các trình duyệt hiện đại gặp tiêu đề phản hồi với chỉ thị này sẽ bỏ qua hoàn toàn tiêu đề. Tiêu đề HTTP {{HTTPHeader("Content-Security-Policy")}} có chỉ thị {{HTTPHeader("Content-Security-Policy/frame-ancestors", "frame-ancestors")}} mà bạn nên sử dụng thay thế.

## Ví dụ

> [!WARNING]
> Đặt `X-Frame-Options` bên trong phần tử {{HTMLElement("meta")}} (ví dụ, `<meta http-equiv="X-Frame-Options" content="deny">`) không có hiệu lực. `X-Frame-Options` chỉ được thực thi qua tiêu đề HTTP, như được hiển thị trong các ví dụ bên dưới.

### Cấu hình Apache

Để cấu hình Apache gửi tiêu đề `X-Frame-Options` cho tất cả các trang, thêm điều này vào cấu hình trang web:

```apacheconf
Header always set X-Frame-Options "SAMEORIGIN"
```

Để cấu hình Apache đặt `X-Frame-Options` thành `DENY`, thêm điều này vào cấu hình trang web:

```apacheconf
Header set X-Frame-Options "DENY"
```

### Cấu hình Nginx

Để cấu hình Nginx gửi tiêu đề `X-Frame-Options`, thêm điều này vào cấu hình http, server hoặc location của bạn:

```nginx
add_header X-Frame-Options SAMEORIGIN always;
```

Bạn có thể đặt tiêu đề `X-Frame-Options` thành `DENY` bằng cách sử dụng:

```nginx
add_header X-Frame-Options DENY always;
```

### Cấu hình IIS

Để cấu hình IIS gửi tiêu đề `X-Frame-Options`, thêm điều này vào tệp `Web.config` của trang web:

```xml
<system.webServer>
  …
  <httpProtocol>
    <customHeaders>
      <add name="X-Frame-Options" value="SAMEORIGIN" />
    </customHeaders>
  </httpProtocol>
  …
</system.webServer>
```

Để biết thêm thông tin, xem [bài viết hỗ trợ Microsoft về cách đặt cấu hình này bằng giao diện người dùng IIS Manager](https://support.microsoft.com/en-US/security/mitigating-framesniffing-with-the-x-frame-options-header).

### Cấu hình HAProxy

Để cấu hình HAProxy gửi tiêu đề `X-Frame-Options`, thêm điều này vào cấu hình front-end, listen hoặc backend của bạn:

```plain
rspadd X-Frame-Options:\ SAMEORIGIN
```

Ngoài ra, trong các phiên bản mới hơn:

```plain
http-response set-header X-Frame-Options SAMEORIGIN
```

### Cấu hình Express

Để đặt `X-Frame-Options` thành `SAMEORIGIN` bằng [Helmet](https://helmetjs.github.io/), thêm điều sau vào cấu hình máy chủ của bạn:

```js
import helmet from "helmet";

const app = express();
app.use(
  helmet({
    xFrameOptions: { action: "sameorigin" },
  }),
);
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Chỉ thị {{HTTPHeader("Content-Security-Policy/frame-ancestors", "frame-ancestors")}} của {{HTTPHeader("Content-Security-Policy")}}
- [ClickJacking Defenses - IEBlog](https://learn.microsoft.com/en-us/archive/blogs/ie/ie8-security-part-vii-clickjacking-defenses)
- [Combating ClickJacking with X-Frame-Options - IEInternals](https://learn.microsoft.com/en-us/archive/blogs/ieinternals/combating-clickjacking-with-x-frame-options)
