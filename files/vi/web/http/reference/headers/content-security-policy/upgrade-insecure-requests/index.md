---
title: "Content-Security-Policy: upgrade-insecure-requests directive"
short-title: upgrade-insecure-requests
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.upgrade-insecure-requests
sidebar: http
---

Chỉ thị **`upgrade-insecure-requests`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) hướng dẫn các trình duyệt coi tất cả các URL không an toàn của một trang web (những URL được phục vụ qua HTTP) như thể chúng đã được thay thế bằng các URL an toàn (những URL được phục vụ qua HTTPS). Chỉ thị này được thiết kế cho các trang web có số lượng lớn URL kế thừa không an toàn cần được viết lại.

Chỉ thị `upgrade-insecure-requests` sẽ không đảm bảo rằng những người dùng truy cập trang web của bạn thông qua các liên kết trên các trang web của bên thứ ba sẽ được nâng cấp lên HTTPS cho điều hướng cấp cao nhất và do đó không thay thế tiêu đề {{HTTPHeader("Strict-Transport-Security")}} ({{Glossary("HSTS")}}), tiêu đề này vẫn nên được đặt với `max-age` phù hợp để đảm bảo người dùng không bị tấn công SSL stripping.

## Cú pháp

```http
Content-Security-Policy: upgrade-insecure-requests;
```

## Ví dụ

### Sử dụng tiêu đề HTTP

```http
Content-Security-Policy: upgrade-insecure-requests;
```

### Sử dụng phần tử meta HTML

```html
<meta
  http-equiv="Content-Security-Policy"
  content="upgrade-insecure-requests" />
```

Với tiêu đề trên được đặt trên miền example.com muốn chuyển từ HTTP sang HTTPS, các yêu cầu tài nguyên không an toàn không phải điều hướng sẽ tự động được nâng cấp (yêu cầu của cả bên thứ nhất và bên thứ ba).

```html
<img src="http://example.com/image.png" />
<img src="http://not-example.com/image.png" />
```

Các URL này sẽ được viết lại trước khi yêu cầu được thực hiện, có nghĩa là không có yêu cầu không an toàn nào sẽ đi đến mạng. Lưu ý rằng nếu tài nguyên được yêu cầu thực sự không khả dụng qua HTTPS thì yêu cầu sẽ thất bại mà không có dự phòng sang HTTP.

```html
<img src="https://example.com/image.png" />
<img src="https://not-example.com/image.png" />
```

Các nâng cấp điều hướng đến tài nguyên của bên thứ ba mang lại tiềm năng phá vỡ đáng kể hơn, những điều này không được nâng cấp:

```html
<a href="https://example.com/">Trang chủ</a>
<a href="http://not-example.com/">Trang chủ</a>
```

### Tìm kiếm các yêu cầu không an toàn

Với sự trợ giúp của tiêu đề {{HTTPHeader("Content-Security-Policy-Report-Only")}} và chỉ thị {{CSP("report-uri")}}, bạn có thể thiết lập một chính sách được thực thi và một chính sách được báo cáo như sau:

```http
Content-Security-Policy: upgrade-insecure-requests; default-src https:
Content-Security-Policy-Report-Only: default-src https:; report-uri /endpoint
```

Bằng cách đó, bạn vẫn nâng cấp các yêu cầu không an toàn trên trang an toàn của mình, nhưng chỉ chính sách giám sát bị vi phạm và báo cáo các tài nguyên không an toàn đến endpoint của bạn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- Tiêu đề {{HTTPHeader("Upgrade-Insecure-Requests")}}
- Tiêu đề {{HTTPHeader("Strict-Transport-Security")}} ({{Glossary("HSTS")}})
- [Nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content)
