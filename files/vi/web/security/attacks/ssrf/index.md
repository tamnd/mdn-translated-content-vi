---
title: Giả mạo yêu cầu phía máy chủ (SSRF)
slug: Web/Security/Attacks/SSRF
page-type: guide
sidebar: security
---

**Server‑Side Request Forgery (SSRF)** là một lỗ hổng cho phép kẻ tấn công tạo các yêu cầu mạng tới những đích tùy ý. SSRF khiến các yêu cầu này xuất phát từ bên trong chính máy chủ, vốn thường có quyền truy cập rộng hơn một client bên ngoài.

Điều này có thể cho phép kẻ tấn công truy cập tài nguyên nhạy cảm hoặc thực hiện các hành động trái phép khác.

## Tình huống ví dụ

Giả sử ứng dụng của bạn có một endpoint lấy hình ảnh từ một URL được cung cấp:

```http
GET /fetch-image?url=https://example.com/image.png
```

Máy chủ có quyền truy cập vào mạng nội bộ của công ty.

Nếu máy chủ không kiểm tra tham số URL được cung cấp, thì client có thể trích xuất dữ liệu nhạy cảm bằng cách truyền các URL nội bộ vào API:

```js
fetch("https://example.org/fetch-image?url=http://localhost:443/admin/org.png");
```

Mặc dù client không thể truy cập trực tiếp `http://localhost:443/`, máy chủ thì có thể, và máy chủ sẽ chuyển tiếp phản hồi đó cho client.

Client cũng không nhất thiết phải gửi yêu cầu HTTP: nó có thể dùng giao thức `file://`:

```js
fetch("https://example.org/fetch-image?url=file:///etc/passwd");
```

Trong các trường hợp này, kẻ tấn công có thể lấy được dữ liệu nhạy cảm. Đôi khi kẻ tấn công không nhận được nội dung phản hồi, nhưng ngay cả vậy thì vẫn có thể gây ra vấn đề:

- Bằng cách buộc máy chủ gửi nhiều yêu cầu, kẻ tấn công có thể thực hiện tấn công {{glossary("Denial of Service", "Denial of Service (DoS)")}}.
- Bằng cách quan sát mã trạng thái do máy chủ trả về hoặc thời gian thực thi yêu cầu, kẻ tấn công có thể suy luận thông tin nhạy cảm về mục tiêu.

Kẻ tấn công có thể dùng chuyển hướng hoặc chuỗi chuyển hướng để né xác thực. Ví dụ, họ có thể sở hữu một miền `https://evilexample.org/redirect` và máy chủ đó chỉ làm một việc là chuyển hướng tới `http://localhost:443/` hoặc các URL (nội bộ) khác, có thể vượt qua bước kiểm tra đầu vào.

```js
fetch("https://example.org/fetch-image?url=https://evilexample.org/redirect");
```

## Phòng vệ chống SSRF

Giảm thiểu lỗ hổng SSRF đòi hỏi nhiều chiến lược phòng vệ kết hợp giữa xác thực đầu vào, xử lý phản hồi cẩn thận, và kiến trúc mạng an toàn. Một số hướng tiếp cận chính bao gồm:

### Xác thực đầu vào và allow-listing

Hạn chế các URL mà API máy chủ sẽ sử dụng. Ví dụ, dịch vụ `fetch-image` được bàn ở trên có thể chỉ định một allow list chứa các miền mong đợi:

```js
const ALLOWED_DOMAINS = ["https://api.example.com", "https://cdn.example.com"];
```

### Chặn giao thức và scheme URL

Đảm bảo chỉ cho phép các scheme URL cụ thể. Nhiều khả năng chỉ cho phép `https://` là đủ cho các ứng dụng web thông thường.

### Xác thực chuyển hướng

Không tự động theo dõi chuyển hướng và cũng áp dụng xác thực đầu vào và/hoặc allow-list cho các URL được chuyển hướng tới. Giới hạn chuỗi chuyển hướng.

### Nguyên tắc đặc quyền tối thiểu và cô lập

Đảm bảo dịch vụ thực hiện các yêu cầu ra ngoài không chạy với nhiều đặc quyền hơn mức cần thiết, và tránh đặt các dịch vụ có khả năng gửi yêu cầu cùng với các dịch vụ nội bộ nhạy cảm.

## Danh sách kiểm tra tóm tắt phòng vệ

- Xem lại mọi tính năng có lấy tài nguyên và xác thực hoặc allow-list đầu vào người dùng.
- Chặn tất cả giao thức ngoại trừ HTTPS.
- Cảnh giác với các chuyển hướng URL và giới hạn chuỗi chuyển hướng.
- Áp dụng nguyên tắc đặc quyền tối thiểu cho quyền mạng của máy chủ: lý tưởng là máy chủ không có quyền truy cập không giới hạn vào mạng nội bộ trừ khi thực sự cần.
- Ghi nhật ký và giám sát các yêu cầu.

## Xem thêm

- [Server-Side Request Forgery Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Server_Side_Request_Forgery_Prevention_Cheat_Sheet.html)
