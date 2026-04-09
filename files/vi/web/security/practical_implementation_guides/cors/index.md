---
title: Cấu hình Cross-Origin Resource Sharing (CORS)
short-title: Cross-Origin Resource Sharing (CORS)
slug: Web/Security/Practical_implementation_guides/CORS
page-type: guide
sidebar: security
---

Cross-Origin Resource Sharing (CORS) được xử lý bằng [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin) và các header liên quan. `Access-Control-Allow-Origin` xác định các origin không cùng site được phép gửi yêu cầu tới các trang trên domain của bạn (tức là, thông qua [`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest) hoặc [`fetch()`](/en-US/docs/Web/API/Window/fetch)).

## Vấn đề

Theo mặc định, [chính sách cùng origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy) chặn các yêu cầu HTTP cross-origin do script khởi tạo. Có một số trường hợp sử dụng đòi hỏi quyền truy cập cross-origin từ script; ví dụ, các Mạng phân phối nội dung (CDN) cung cấp hosting cho các thư viện JavaScript/CSS và các điểm cuối API công khai. Tuy nhiên, truy cập cross-origin mang theo rủi ro bảo mật lớn và phải được kiểm soát cẩn thận.

## Giải pháp

Dùng `Access-Control-Allow-Origin` để xác định các origin không cùng site được phép gửi yêu cầu tới các trang trên domain của bạn.

Nếu có mặt, `Access-Control-Allow-Origin` nên chỉ định số lượng origin và tài nguyên tối thiểu cần thiết để site của bạn hoạt động. Ví dụ, nếu máy chủ của bạn cung cấp cả một website lẫn một API dành cho truy cập `XMLHttpRequest` từ xa, thì chỉ các tài nguyên API mới nên trả về header `Access-Control-Allow-Origin`.

Việc không đặt `Access-Control-Allow-Origin` phù hợp sẽ cho phép các origin không được phép đọc nội dung của bất kỳ trang nào trên site của bạn. Điều này đặc biệt nguy hiểm nếu các site đó có thể gửi thông tin xác thực, có khả năng khiến site của bạn bị phơi nhiễm trước các cuộc tấn công [CSRF](/en-US/docs/Web/Security/Attacks/CSRF).

Nếu cần truy cập có thông tin xác thực từ các origin cụ thể, hãy bảo đảm `Access-Control-Allow-Origin` chỉ được đặt thành những origin đó, thay vì phản chiếu header [`Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Origin). Nếu cần truy cập công khai không có thông tin xác thực, hãy đặt `Access-Control-Allow-Origin` thành `*` và bỏ qua header `Access-Control-Allow-Credentials`. Ngược lại, hãy bỏ cả hai header.

## Ví dụ

Cho phép mọi site đọc nội dung của một thư viện JavaScript:

```http
Access-Control-Allow-Origin: *
```

> [!NOTE]
> Thiết lập này là bắt buộc để [Subresource integrity](/en-US/docs/Web/Security/Practical_implementation_guides/SRI) hoạt động.

Cho phép `https://random-dashboard.example.org` đọc các kết quả trả về từ một API:

```http
Access-Control-Allow-Origin: https://random-dashboard.example.org
```

## Xem thêm

- [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin)
- [`Access-Control-Allow-Credentials`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Credentials)
- [`Access-Control-Allow-Headers`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Headers)
- [`Access-Control-Allow-Methods`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Methods)
- [`Access-Control-Expose-Headers`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers)
- [`Access-Control-Max-Age`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Max-Age)
- [`Access-Control-Request-Headers`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Request-Headers)
- [`Access-Control-Request-Method`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Request-Method)
- [`Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Origin)
- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [CORS for Developers](https://w3c.github.io/webappsec-cors-for-developers/) from W3C (2016)
