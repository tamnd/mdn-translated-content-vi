---
title: Network Error Logging (NEL)
short-title: Network Error Logging
slug: Web/HTTP/Guides/Network_Error_Logging
page-type: guide
status:
  - experimental
browser-compat: http.headers.NEL
sidebar: http
---

{{SeeCompatTable}}

Network Error Logging là cơ chế có thể được cấu hình qua _[response header](/en-US/docs/Glossary/Response_header)_ HTTP {{HTTPHeader("NEL")}}. Header thử nghiệm này cho phép các trang web và ứng dụng chọn tham gia để nhận báo cáo về các lần tải mạng thất bại (và nếu muốn, thành công) từ các trình duyệt hỗ trợ.

Báo cáo được gửi đến nhóm báo cáo được định nghĩa trong header {{HTTPHeader("Report-To")}}.

## Cách sử dụng

Các ứng dụng web chọn tham gia hành vi này với header NEL, là một đối tượng được _[mã hóa JSON](/en-US/docs/Glossary/Response_header)_:

```http
NEL: { "report_to": "nel",
       "max_age": 31556952 }
```

Một nguồn gốc được trình duyệt coi là an toàn là bắt buộc.

Các khóa đối tượng sau đây có thể được chỉ định trong header NEL:

- report_to
  - : Nhóm [reporting API](/en-US/docs/Web/API/Reporting_API) để gửi báo cáo lỗi mạng đến (xem bên dưới).
- max_age
  - : Chỉ định thời gian sống của chính sách, tính bằng giây (theo cách tương tự như chính sách HSTS bị giới hạn thời gian). Nhóm báo cáo được tham chiếu nên có thời gian sống ít nhất bằng chính sách NEL.
- include_subdomains
  - : Nếu true, chính sách áp dụng cho tất cả các tên miền con dưới nguồn gốc mà header chính sách được đặt. Nhóm báo cáo cũng nên được đặt để bao gồm các tên miền con, nếu tùy chọn này được kích hoạt.
- success_fraction
  - : Giá trị dấu phẩy động từ 0 đến 1 chỉ định tỷ lệ yêu cầu mạng **thành công** cần báo cáo. Mặc định là 0, vì vậy không có yêu cầu mạng thành công nào sẽ được báo cáo nếu khóa không có trong payload JSON.
- failure_fraction
  - : Giá trị dấu phẩy động từ 0 đến 1 chỉ định tỷ lệ yêu cầu mạng **thất bại** cần báo cáo. Mặc định là 1, vì vậy tất cả các yêu cầu mạng thất bại sẽ được báo cáo nếu khóa không có trong payload JSON.

Nhóm báo cáo được tham chiếu ở trên được định nghĩa theo cách thông thường trong header {{HTTPHeader("Report-To")}}, ví dụ:

```http
Report-To: { "group": "nel",
             "max_age": 31556952,
             "endpoints": [
              { "url": "https://example.com/csp-reports" }
             ]
           }
```

## Báo cáo lỗi

Trong các ví dụ này, nội dung phản hồi Reporting API được hiển thị. Khóa **`"body"`** cấp cao nhất chứa báo cáo lỗi mạng.

### Phản hồi HTTP 400 (Bad Request)

```json
{
  "age": 20,
  "type": "network-error",
  "url": "https://example.com/previous-page",
  "body": {
    "elapsed_time": 338,
    "method": "POST",
    "phase": "application",
    "protocol": "http/1.1",
    "referrer": "https://example.com/previous-page",
    "sampling_fraction": 1,
    "server_ip": "192.0.2.172",
    "status_code": 400,
    "type": "http.error",
    "url": "https://example.com/bad-request"
  }
}
```

### Tên DNS không được phân giải

Lưu ý rằng phase được đặt thành `dns` trong báo cáo này và không có `server_ip` nào có thể bao gồm.

```json
{
  "age": 20,
  "type": "network-error",
  "url": "https://example.com/previous-page",
  "body": {
    "elapsed_time": 18,
    "method": "POST",
    "phase": "dns",
    "protocol": "http/1.1",
    "referrer": "https://example.com/previous-page",
    "sampling_fraction": 1,
    "server_ip": "",
    "status_code": 0,
    "type": "dns.name_not_resolved",
    "url": "https://example-host.com/"
  }
}
```

Loại lỗi mạng có thể là một trong các giá trị được xác định trước sau đây từ đặc tả, nhưng các trình duyệt có thể thêm và gửi các loại lỗi riêng của họ:

- `dns.unreachable`
  - : Máy chủ DNS của người dùng không thể truy cập
- `dns.name_not_resolved`
  - : Máy chủ DNS của người dùng đã phản hồi nhưng không thể phân giải địa chỉ IP cho URI được yêu cầu.
- `dns.failed`
  - : Yêu cầu đến máy chủ DNS thất bại vì lý do không được đề cập trong các lỗi trước (ví dụ: SERVFAIL)
- `dns.address_changed`
  - : Vì lý do bảo mật, nếu địa chỉ IP máy chủ đã gửi báo cáo ban đầu khác với địa chỉ IP máy chủ hiện tại vào thời điểm tạo lỗi, dữ liệu báo cáo sẽ bị hạ cấp để chỉ bao gồm thông tin về vấn đề này và loại được đặt thành `dns.address_changed`.
- `tcp.timed_out`
  - : Kết nối TCP đến máy chủ đã hết thời gian chờ
- `tcp.closed`
  - : Kết nối TCP đã bị đóng bởi máy chủ
- `tcp.reset`
  - : Kết nối TCP đã bị đặt lại
- `tcp.refused`
  - : Kết nối TCP đã bị từ chối bởi máy chủ
- `tcp.aborted`
  - : Kết nối TCP đã bị hủy bỏ
- `tcp.address_invalid`
  - : Địa chỉ IP không hợp lệ
- `tcp.address_unreachable`
  - : Địa chỉ IP không thể truy cập
- `tcp.failed`
  - : Kết nối TCP thất bại vì lý do không được đề cập trong các lỗi trước
- `http.error`
  - : User agent đã nhận phản hồi thành công, nhưng nó có mã trạng thái [4xx](https://httpwg.org/specs/rfc9110.html#status.4xx) hoặc [5xx](https://httpwg.org/specs/rfc9110.html#status.5xx)
- `http.protocol.error`
  - : Kết nối đã bị hủy bỏ do lỗi giao thức HTTP
- `http.response.invalid`
  - : Phản hồi trống, có sự không khớp content-length, có mã hóa không đúng và/hoặc các điều kiện khác ngăn user agent xử lý phản hồi
- `http.response.redirect_loop`
  - : Yêu cầu đã bị hủy bỏ do phát hiện vòng lặp chuyển hướng
- `http.failed`
  - : Kết nối thất bại do lỗi trong giao thức HTTP không được đề cập trong các lỗi trước

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
