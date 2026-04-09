---
title: Cấu hình Bảo mật tầng truyền tải (TLS)
short-title: Bảo mật tầng truyền tải (TLS)
slug: Web/Security/Practical_implementation_guides/TLS
page-type: guide
sidebar: security
---

[Transport Layer Security (TLS)](/en-US/docs/Glossary/TLS) cung cấp các bảo đảm về tính bảo mật, tính xác thực và tính toàn vẹn của mọi giao tiếp, và vì vậy nên được dùng cho mọi giao tiếp website đi vào và đi ra.

## Cấu hình TLS

### Vấn đề

Nếu dữ liệu được gửi qua web mà không được mã hóa, nó có thể bị bên thứ ba chặn lại, những bên này có thể truy cập và sửa đổi dữ liệu - đây thường được gọi là một cuộc tấn công [manipulator-in-the-middle](/en-US/docs/Glossary/MitM) (MiTM). Các cuộc tấn công MiTM có hậu quả nghiêm trọng đối với bảo mật của hệ thống bạn.

Do đó, mọi yêu cầu và phản hồi nên được gửi qua HTTPS, sử dụng TLS để mã hóa dữ liệu. Web hiện đại thực tế đã ép buộc điều này - tất cả các trình duyệt đang tiến tới yêu cầu [HTTPS](/en-US/docs/Glossary/HTTPS) theo mặc định, và nhiều tính năng web chỉ có thể được dùng trong [ngữ cảnh an toàn](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

### Giải pháp

Bạn nên thiết lập phần mềm máy chủ để dùng một cấu hình an toàn, thực thi việc sử dụng HTTPS với các thiết lập TLS an toàn. Có một số công cụ tạo cấu hình TLS có sẵn có thể giúp việc này, ví dụ như Mozilla [SSL Configuration Generator](https://ssl-config.mozilla.org/). Công cụ này cung cấp một số tùy chọn dựa trên [hướng dẫn TLS](/en-US/docs/Glossary/TLS) của Mozilla.

## Tải tài nguyên

### Vấn đề

Tất cả tài nguyên, bất kể nguồn gốc của chúng, nên được tải qua các kênh an toàn.

Các website an toàn (HTTPS) cố gắng tải các tài nguyên chủ động như JavaScript qua các kết nối không an toàn (HTTP) sẽ bị trình duyệt chặn. Kết quả là người dùng sẽ thấy giao diện bị suy giảm và các cảnh báo [mixed content](/en-US/docs/Web/Security/Defenses/Mixed_content). Trong đoạn mã dưới đây, ví dụ, HTTP đang bị dùng sai để tải một thư viện JavaScript:

```html example-bad
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
```

Tương tự, việc cố tải nội dung thụ động như hình ảnh một cách không an toàn, mặc dù ít rủi ro hơn, vẫn sẽ dẫn đến giao diện suy giảm và cảnh báo mixed content, đồng thời có thể cho phép kẻ tấn công chủ động làm biến dạng website hoặc lừa đảo người dùng. Ví dụ:

```html example-bad
<img src="http://very.badssl.com/image.jpg" />
```

Mặc dù các trình duyệt hiện đại làm cho việc tải tài nguyên không an toàn trở nên rõ ràng, những lỗi này vẫn xảy ra với tần suất đáng kể trên web.

### Giải pháp

Xác minh rằng tất cả tài nguyên đều được tải qua HTTPS trước khi triển khai.

### Ví dụ

Trong ví dụ này, HTTPS đang được dùng đúng cách để tải một thư viện JavaScript:

```html example-good
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
```

## Chuyển hướng HTTP

### Vấn đề

Các website có thể tiếp tục lắng nghe trên cổng 80 (HTTP) để tránh lỗi kết nối khi người dùng nhập URL vào thanh địa chỉ, vì các kết nối trình duyệt ban đầu thường được thực hiện qua HTTP. Điều này tạo ra rủi ro bảo mật ban đầu trong lần kết nối đầu tiên tới các site vì kết nối đó không được bảo vệ bởi TLS.

Ngoài ra, các site nên tránh chuyển hướng từ HTTP trên một host sang HTTPS trên một host khác, vì điều này ngăn `Strict-Transport-Security` được đặt cho host đầu tiên (xem [HTTP Strict Transport Security](#http_strict_transport_security_implementation)).

### Giải pháp

Các site lắng nghe trên cổng 80 chỉ nên chuyển hướng tới cùng một tài nguyên trên HTTPS. Sau khi việc chuyển hướng xảy ra, `Strict-Transport-Security` nên bảo đảm rằng mọi lần truy cập HTTP trong tương lai tới site sẽ tự động được chuyển hướng tới site an toàn.

Các API hoặc website không dành cho truy cập công khai nên vô hiệu hóa hoàn toàn việc dùng HTTP.

Để sửa vấn đề "different hosts":

1. Trước hết, chuyển hướng từ http\://example.com/ sang https\://example.com/.
2. Tiếp theo, chuyển hướng từ https\://example.com/ sang https\://example.org/.

### Ví dụ

Chuyển hướng tất cả các yêu cầu HTTP đến cùng site và URI trên HTTPS, dùng NGINX:

```nginx
server {
  listen 80;

  return 301 https://$host$request_uri;
}
```

Chuyển hướng `site.example.org` từ HTTP sang HTTPS, dùng Apache:

```apacheconf
<VirtualHost *:80>
  ServerName site.example.org
  Redirect permanent / https://site.example.org/
</VirtualHost>
```

## Triển khai HTTP Strict Transport Security

### Vấn đề

Để ngăn các cuộc tấn công [manipulator-in-the-middle](/en-US/docs/Glossary/MitM) (MiTM), trình duyệt chỉ nên kết nối tới các site qua HTTPS.

### Giải pháp

HTTP [`Strict-Transport-Security`](/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security) (HSTS) là một tiêu đề HTTP thông báo cho trình duyệt chỉ kết nối tới một site nhất định qua HTTPS, ngay cả khi scheme được chỉ định ban đầu là HTTP. Các trình duyệt có HSTS được đặt cho một site sẽ tự động nâng cấp mọi yêu cầu lên HTTPS cho site đó. HSTS cũng cho trình duyệt biết xử lý các lỗi liên quan đến TLS và chứng chỉ nghiêm ngặt hơn bằng cách vô hiệu hóa khả năng bỏ qua trang lỗi chứng chỉ.

`Strict-Transport-Security` hỗ trợ các directive sau:

- `max-age`
  - : Đặt khoảng thời gian, tính bằng giây, mà trong đó trình duyệt sẽ chuyển hướng sang HTTPS.
- `includeSubDomains` {{optional_inline}}
  - : Chỉ định liệu trình duyệt có nên nâng cấp các yêu cầu trên tất cả subdomain lên HTTPS hay không. Ví dụ, đặt `includeSubDomains` trên `domain.example.com` sẽ bảo đảm các yêu cầu tới `host1.domain.example.com` và `host2.domain.example.com` được nâng cấp cùng với `domain.example.com`.
- `preload` {{optional_inline}}
  - : Chỉ định liệu site có nên được preload hay không. Bao gồm directive này có nghĩa là site của bạn có thể được đưa vào [danh sách preload HSTS](https://hstspreload.org/).

Hãy làm theo các bước sau để triển khai HSTS đúng cách trên website của bạn:

1. Đặt giá trị `max-age` ít nhất sáu tháng (`15768000`). Các khoảng thời gian dài hơn, chẳng hạn hai năm (`63072000`), được khuyến nghị. Khi giá trị này đã được đặt, site phải tiếp tục hỗ trợ HTTPS cho đến khi thời gian hết hạn được đạt tới.
2. Nếu có thể, đặt `includeSubDomains` để cải thiện bảo mật trên tất cả subdomain. Cần kiểm thử cẩn thận khi đặt directive này vì nó có thể vô hiệu hóa các site trên subdomain chưa bật HTTPS.
3. Nếu có thể, đặt `preload` để cho phép đưa website của bạn vào danh sách preload HSTS. Để thêm nó vào danh sách, hãy truy cập https://hstspreload.org/ và nhập URL site của bạn vào biểu mẫu ở đầu trang, sửa mọi vấn đề mà nó nêu ra. Các trình duyệt web sẽ thực hiện nâng cấp HTTPS cho các site đã được preload trước khi nhận tiêu đề `Strict-Transport-Security` ban đầu. Điều này ngăn [downgrade attacks](https://en.wikipedia.org/wiki/Downgrade_attack) trong lần sử dụng đầu tiên và được khuyến nghị cho mọi website có rủi ro cao. Lưu ý rằng việc được đưa vào danh sách preload HSTS cũng yêu cầu `includeSubDomains` được đặt và `max-age` được đặt tối thiểu 1 năm (`31536000`).

Cùng với `Strict-Transport-Security`, bạn cũng nên đặt directive [`upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests) trong {{httpheader("Content-Security-Policy")}} của mình. Điều này hướng dẫn trình duyệt coi tất cả các URL không an toàn của site (những URL được phục vụ qua HTTP) như thể chúng đã được phục vụ qua HTTPS. `upgrade-insecure-requests` được thiết kế cho các website có nhiều URL cũ không an toàn cần được viết lại.

### Ví dụ

Khuyến nghị kết nối tới một site qua HTTPS trong hai năm:

```http
Strict-Transport-Security: max-age=63072000
```

Nếu có thể, hãy nâng cấp thêm các yêu cầu tới subdomain sang HTTPS và đưa site vào danh sách preload:

```http
Strict-Transport-Security: max-age=63072000; includeSubDomains; preload
```

Cũng đặt CSP `upgrade-insecure-requests`:

```http
Content-Security-Policy: upgrade-insecure-requests;
```

## Xem thêm

- [Transport layer security (TLS)](/en-US/docs/Web/Security/Defenses/Transport_Layer_Security)
- [Certificate Transparency](/en-US/docs/Web/Security/Defenses/Certificate_Transparency)
- [Mixed content](/en-US/docs/Web/Security/Defenses/Mixed_content)
