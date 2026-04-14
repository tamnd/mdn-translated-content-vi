---
title: "Bị chặn: Tất cả yêu cầu truy cập lưu trữ bên thứ ba"
slug: Web/Privacy/Guides/Storage_Access_Policy/Errors/CookieBlockedForeign
page-type: guide
sidebar: privacy
---

Một yêu cầu truy cập cookie hoặc lưu trữ đã bị chặn vì nó đến từ bên thứ ba (một nguồn gốc khác) và chặn nội dung được bật.

## Thông báo

Firefox:

```plain
CookieBlockedForeign=Request to access cookies or storage on "X" was blocked because we are blocking all third-party storage access requests and content blocking is enabled.
```

## Có thể làm gì

Quyền có thể được thay đổi hoặc xóa bằng cách vào _Cài đặt > Quyền riêng tư & Bảo mật > Bảo vệ theo dõi nâng cao_ và thêm một ngoại lệ với nút _Quản lý ngoại lệ_….

Nếu tài nguyên đang bị chặn không cần xác thực, bạn có thể khắc phục thông báo cảnh báo bằng cách thêm thuộc tính `crossorigin="anonymous"` vào phần tử liên quan.

## Xem thêm

- [Bảo vệ theo dõi nâng cao trong Firefox cho máy tính để bàn](https://support.mozilla.org/en-US/kb/content-blocking) trên [support.mozilla.org](https://support.mozilla.org/)
- [Thuộc tính `crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
