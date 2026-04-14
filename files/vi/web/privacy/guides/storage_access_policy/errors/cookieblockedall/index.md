---
title: "Bị chặn: Tất cả yêu cầu truy cập lưu trữ"
slug: Web/Privacy/Guides/Storage_Access_Policy/Errors/CookieBlockedAll
page-type: guide
sidebar: privacy
---

Một yêu cầu truy cập cookie hoặc lưu trữ đã bị chặn vì trình duyệt đang chặn tất cả truy cập lưu trữ.

## Thông báo

Firefox:

```plain
CookieBlockedAll=Request to access cookies or storage on "X" was blocked because we are blocking all storage access requests.
```

## Có thể làm gì

Quyền có thể được thay đổi hoặc xóa bằng cách:

- Vào _Cài đặt > Quyền riêng tư & Bảo mật > Bảo vệ theo dõi nâng cao_.
- Trong phần _Tùy chỉnh_ Chặn nội dung, chọn giá trị khác với _Tất cả cookie_ cho mục _Cookie_

Nếu tài nguyên đang bị chặn không cần xác thực, bạn có thể khắc phục thông báo cảnh báo bằng cách thêm thuộc tính `crossorigin="anonymous"` vào phần tử của bạn.

## Xem thêm

- [Bảo vệ theo dõi nâng cao trong Firefox cho máy tính để bàn](https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop) trên [support.mozilla.org](https://support.mozilla.org/)
- [Thuộc tính `crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
