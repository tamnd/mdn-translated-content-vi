---
title: "Content-Security-Policy: block-all-mixed-content directive"
short-title: block-all-mixed-content
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/block-all-mixed-content
page-type: http-csp-directive
status:
  - deprecated
browser-compat: http.headers.Content-Security-Policy.block-all-mixed-content
sidebar: http
---

{{deprecated_header}}

> [!WARNING]
> Chỉ thị này đã được đánh dấu là lỗi thời trong thông số kỹ thuật.
> Chỉ thị này trước đây được dùng để ngăn nội dung hỗn hợp "có thể bị chặn tùy chọn" khỏi việc được tải về không an toàn và hiển thị.
> Nội dung không bị chặn hiện luôn được nâng cấp lên kết nối an toàn, vì vậy chỉ thị này không còn cần thiết.

Chỉ thị **`block-all-mixed-content`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) ngăn tải bất kỳ tài nguyên nào qua HTTP khi trang sử dụng HTTPS.

Tất cả các yêu cầu tài nguyên [nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content) đều bị chặn, bao gồm cả nội dung hỗn hợp có thể bị chặn và nâng cấp được.
Điều này cũng áp dụng cho các tài liệu {{HTMLElement("iframe")}}, đảm bảo toàn bộ trang không có nội dung hỗn hợp.

> [!NOTE]
> Chỉ thị {{CSP("upgrade-insecure-requests")}} được đánh giá trước `block-all-mixed-content`.
> Nếu cái trước được đặt thì cái sau không làm gì, vì vậy hãy đặt một trong hai chỉ thị – không phải cả hai – trừ khi bạn muốn buộc HTTPS trên các trình duyệt cũ không thực thi điều này sau khi chuyển hướng sang HTTP.

## Cú pháp

```http
Content-Security-Policy: block-all-mixed-content;
```

## Ví dụ

```http
Content-Security-Policy: block-all-mixed-content;

<meta http-equiv="Content-Security-Policy" content="block-all-mixed-content">
```

Để không cho phép tài nguyên HTTP ở mức chi tiết hơn, bạn cũng có thể đặt các chỉ thị riêng lẻ thành `https:`.
Ví dụ, để không cho phép hình ảnh HTTP không an toàn:

```http
Content-Security-Policy: img-src https:
```

## Thông số kỹ thuật

Không thuộc bất kỳ thông số kỹ thuật hiện hành nào.
Trước đây được định nghĩa trong thông số kỹ thuật lỗi thời [Mixed Content Level 1](https://www.w3.org/TR/2015/CR-mixed-content-20150317/#strict-opt-in).

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{CSP("upgrade-insecure-requests")}}
- [Nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content)
