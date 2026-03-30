---
title: Cacheable
slug: Glossary/Cacheable
page-type: glossary-definition
sidebar: glossarysidebar
---

Một phản hồi **có thể cache** là một phản hồi HTTP có thể được lưu vào cache, tức là được lưu trữ để truy xuất và sử dụng sau, giúp tiết kiệm một yêu cầu mới tới máy chủ. Không phải tất cả các phản hồi HTTP đều có thể được cache; đây là các ràng buộc để một phản hồi HTTP có thể được cache:

- Phương thức được sử dụng trong yêu cầu là _có thể cache_, tức là phương thức {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}}. Một phản hồi cho yêu cầu {{HTTPMethod("POST")}} hoặc {{HTTPMethod("PATCH")}} cũng có thể được cache nếu độ mới được chỉ định và tiêu đề {{HTTPHeader("Content-Location")}} được đặt, nhưng điều này hiếm khi được triển khai. Ví dụ, Firefox không hỗ trợ điều này ([Firefox bug 109553](https://bugzil.la/109553)). Các phương thức khác, như {{HTTPMethod("PUT")}} hoặc {{HTTPMethod("DELETE")}} không thể cache và kết quả của chúng không thể được lưu vào cache.
- Mã trạng thái của phản hồi _được biết_ bởi ứng dụng caching và _có thể cache_. Các mã trạng thái sau đây có thể cache: {{HTTPStatus("200")}}, {{HTTPStatus("203")}}, {{HTTPStatus("204")}}, {{HTTPStatus("206")}}, {{HTTPStatus("300")}}, {{HTTPStatus("301")}}, {{HTTPStatus("404")}}, {{HTTPStatus("405")}}, {{HTTPStatus("410")}}, {{HTTPStatus("414")}}, và {{HTTPStatus("501")}}.
- Không có tiêu đề cụ thể nào trong phản hồi, như {{HTTPHeader("Cache-Control")}}, với các giá trị sẽ ngăn cản việc caching.

Lưu ý rằng một số yêu cầu với các phản hồi không thể cache đối với một URI cụ thể có thể làm mất hiệu lực các phản hồi đã được cache trước đó từ cùng một URI. Ví dụ, {{HTTPMethod("PUT")}} đến `/pageX.html` sẽ làm mất hiệu lực tất cả các phản hồi đã cache cho các yêu cầu {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}} đến `/pageX.html`.

Khi cả phương thức của yêu cầu và trạng thái của phản hồi đều có thể cache, phản hồi cho yêu cầu có thể được cache:

```http
GET /pageX.html HTTP/1.1
(…)

200 OK
(…)
```

Phản hồi cho một yêu cầu {{HTTPMethod("PUT")}} không thể được cache. Hơn nữa, nó làm mất hiệu lực dữ liệu đã cache cho các yêu cầu đến cùng URI sử dụng phương thức {{HTTPMethod("HEAD")}} hoặc {{HTTPMethod("GET")}}:

```http
PUT /pageX.html HTTP/1.1
(…)

200 OK
(…)
```

Sự hiện diện của tiêu đề {{HTTPHeader("Cache-Control")}} với một giá trị cụ thể trong phản hồi có thể ngăn chặn việc caching:

```http
GET /pageX.html HTTP/1.1
(…)

200 OK
Cache-Control: no-cache
(…)
```

## Xem thêm

- Chi tiết về [phương thức và caching](https://httpwg.org/specs/rfc9110.html#rfc.section.9.2.3) được cung cấp trong đặc tả HTTP.
- Mô tả về các phương thức có thể cache phổ biến: {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}
- Mô tả về các phương thức không thể cache phổ biến: {{HTTPMethod("PUT")}}, {{HTTPMethod("DELETE")}}, thường là {{HTTPMethod("POST")}}
