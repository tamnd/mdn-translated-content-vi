---
title: Cấu hình Cross-Origin Resource Sharing (CORS)
short-title: Cross-Origin Resource Sharing (CORS)
slug: Web/Security/Practical_implementation_guides/CORS
page-type: guide
sidebar: security
---

Cross-Origin Resource Sharing (CORS) được xử lý bằng [`Access-Control-Allow-Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin) và các header liên quan. `Access-Control-Allow-Origin` xác định các origin khác-origin được phép gửi yêu cầu tới các trang trên miền của bạn, tức là qua [`XMLHttpRequest`](/en-US/docs/Web/API/XMLHttpRequest) hoặc [`fetch()`](/en-US/docs/Web/API/Window/fetch).

## Vấn đề

Theo mặc định, [chính sách cùng nguồn gốc](/en-US/docs/Web/Security/Defenses/Same-origin_policy) chặn các yêu cầu HTTP khác origin do script khởi tạo. Có nhiều trường hợp sử dụng cần quyền truy cập script khác origin; ví dụ như các Mạng phân phối nội dung (CDN) cung cấp lưu trữ cho thư viện JavaScript/CSS và các endpoint API công khai. Tuy nhiên, quyền truy cập khác origin tạo ra rủi ro bảo mật lớn và phải được kiểm soát cẩn thận.

## Giải pháp

Sử dụng `Access-Control-Allow-Origin` để xác định các origin khác-origin được phép gửi yêu cầu tới các trang trên miền của bạn.

Nếu có mặt, `Access-Control-Allow-Origin` nên chỉ định số lượng origin và tài nguyên tối thiểu cần thiết để website của bạn hoạt động. Ví dụ, nếu máy chủ của bạn vừa cung cấp một website vừa cung cấp API dành cho quyền truy cập `XMLHttpRequest` từ xa, chỉ các tài nguyên API mới nên trả về header `Access-Control-Allow-Origin`.

Không đặt `Access-Control-Allow-Origin` đúng cách sẽ cho phép các origin trái phép đọc nội dung của bất kỳ trang nào trên website của bạn. Điều này đặc biệt nguy hiểm nếu các website đó có thể gửi thông tin xác thực, vì khi đó website của bạn có thể bị phơi bày trước các cuộc tấn công [CSRF](/en-US/docs/Web/Security/Attacks/CSRF).

Nếu cần quyền truy cập có thông tin xác thực từ các origin cụ thể, hãy đảm bảo `Access-Control-Allow-Origin` chỉ được đặt thành các origin đó, thay vì phản chiếu header [`Origin`](/en-US/docs/Web/HTTP/Reference/Headers/Origin). Nếu cần quyền truy cập công khai không có thông tin xác thực, hãy đặt `Access-Control-Allow-Origin` thành `*` và bỏ qua header `Access-Control-Allow-Credentials`. Nếu không, hãy bỏ cả hai header.

## Ví dụ

Cho phép mọi website đọc nội dung của một thư viện JavaScript:

```http
Access-Control-Allow-Origin: *
```

> [!NOTE]
> Thiết lập này là bắt buộc để [Subresource integrity](/en-US/docs/Web/Security/Practical_implementation_guides/SRI) hoạt động.

Cho phép `https://random-dashboard.example.org` đọc kết quả trả về của một API:

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
- [CORS for Developers](https://w3c.github.io/webappsec-cors-for-developers/) từ W3C (2016)
