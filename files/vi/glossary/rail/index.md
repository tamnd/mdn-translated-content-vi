---
title: RAIL
slug: Glossary/RAIL
page-type: glossary-definition
sidebar: glossarysidebar
---

**RAIL**, từ viết tắt của **Response, Animation, Idle và Load** (Phản hồi, Hoạt ảnh, Rảnh rỗi và Tải), là một mô hình hiệu năng được nhóm Google Chrome khởi xướng vào năm 2015, tập trung vào trải nghiệm người dùng và hiệu năng trong trình duyệt. Phương châm hiệu năng của RAIL là "Tập trung vào người dùng; mục tiêu cuối cùng không phải là làm cho trang của bạn chạy nhanh trên bất kỳ thiết bị cụ thể nào, mà là làm cho người dùng hài lòng." Có 4 giai đoạn tương tác: tải trang, rảnh rỗi, phản hồi đầu vào, và cuộn và hoạt ảnh. Theo thứ tự từ viết tắt, các nguyên tắc chính là:

- **Response** (Phản hồi)
  - : Phản hồi người dùng ngay lập tức, xác nhận mọi đầu vào của người dùng trong **100ms** hoặc ít hơn.
- **Animation** (Hoạt ảnh)
  - : Khi tạo hoạt ảnh, render mỗi khung hình dưới **16ms**, nhắm đến sự nhất quán và tránh jank (giật lag).
- **Idle** (Rảnh rỗi)
  - : Khi sử dụng luồng JavaScript chính, làm việc theo từng đoạn dưới **50ms** để giải phóng luồng cho các tương tác của người dùng.
- **Load** (Tải)
  - : Phân phối nội dung tương tác trong dưới **5 giây**.

## Xem thêm

- [Recommended Web Performance Timings: How long is too long](/en-US/docs/Web/Performance/Guides/How_long_is_too_long)
