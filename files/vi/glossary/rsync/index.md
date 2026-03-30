---
title: Rsync
slug: Glossary/Rsync
page-type: glossary-definition
sidebar: glossarysidebar
---

[Rsync](https://rsync.samba.org/) là công cụ đồng bộ hóa tệp mã nguồn mở cung cấp khả năng truyền tệp theo từng phần (incremental). Nó có thể được sử dụng qua các kết nối không an toàn và an toàn (như SSH). Rsync có sẵn trên hầu hết các hệ thống dựa trên Unix (như macOS và Linux) và Windows. Ngoài ra còn có các công cụ dựa trên giao diện đồ họa sử dụng rsync, ví dụ như [Acrosync](https://acrosync.com/mac.html).

Một lệnh cơ bản trông như sau:

```bash
rsync [-options] SOURCE user@x.x.x.x:DESTINATION
```

- `-options` là dấu gạch ngang theo sau là một hoặc nhiều chữ cái, ví dụ `-v` để hiển thị thông báo lỗi chi tiết và `-b` để tạo bản sao lưu. Xem danh sách đầy đủ các tùy chọn tại [trang man của rsync.](https://linux.die.net/man/1/rsync) (Tìm kiếm "Options summary".)
- `SOURCE` là đường dẫn đến tệp hoặc thư mục cục bộ mà bạn muốn sao chép hay đồng bộ hóa.
- `user@` là thông tin xác thực của người dùng trên máy chủ từ xa bạn muốn sao chép tệp đến.
- `x.x.x.x` là địa chỉ IP của máy chủ từ xa.
- `DESTINATION` là đường dẫn đến vị trí bạn muốn sao chép thư mục hay tệp đến trên máy chủ từ xa.

Bạn cũng có thể kết nối qua SSH bằng tùy chọn `-e` như sau:

```bash
rsync [-options] -e "ssh [SSH DETAILS GO HERE]" SOURCE user@x.x.x.x:DESTINATION
```

Có nhiều ví dụ trên Internet, bao gồm tại [trang web chính thức](https://rsync.samba.org/examples.html) và tại [trang Wikipedia](https://en.wikipedia.org/wiki/Rsync#Examples) về rsync.
