---
title: "Bị chặn: Yêu cầu truy cập lưu trữ từ trình theo dõi"
slug: Web/Privacy/Guides/Storage_Access_Policy/Errors/CookieBlockedTracker
page-type: guide
sidebar: privacy
---

Một yêu cầu truy cập cookie hoặc lưu trữ đã bị chặn vì trình duyệt xác định nó đến từ một trình theo dõi và chặn nội dung được bật.

## Thông báo

Firefox:

```plain
Request to access cookie or storage on "X" was blocked because it came from a tracker and content blocking is enabled.
```

## Có thể làm gì

Quyền có thể được thay đổi hoặc xóa bằng cách:

- Vào _Tùy chọn > Quyền riêng tư & Bảo mật > Bảo vệ theo dõi nâng cao_ và:
  - thêm ngoại lệ với nút _Quản lý ngoại lệ_…
  - chọn tùy chọn Chặn nội dung _Tùy chỉnh_ và bỏ chọn hộp kiểm _Nội dung theo dõi_

Nếu tài nguyên bị chặn không cần xác thực, bạn có thể khắc phục thông báo cảnh báo bằng cách thêm thuộc tính `crossorigin="anonymous"` vào phần tử liên quan.

## Xem thêm

- [Bảo vệ theo dõi nâng cao trong Firefox cho máy tính để bàn](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop) trên [support.mozilla.org](https://support.mozilla.org/)
- [Thuộc tính `crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
