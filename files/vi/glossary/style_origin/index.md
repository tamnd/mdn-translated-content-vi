---
title: Style origin
slug: Glossary/Style_origin
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{Glossary("CSS")}}, có ba loại nguồn gốc cho các thay đổi kiểu dáng. Các loại này được gọi là **nguồn gốc kiểu dáng** (style origins). Chúng là **nguồn gốc user agent**, **nguồn gốc người dùng** và **nguồn gốc tác giả**.

- Nguồn gốc user agent
  - : Nguồn gốc user agent là nguồn gốc kiểu dáng bao gồm các kiểu mặc định được sử dụng bởi trình duyệt web của người dùng. Nếu không có kiểu nào khác được áp dụng cho nội dung, các kiểu của nguồn gốc user agent được sử dụng khi hiển thị các phần tử.
- Nguồn gốc người dùng
  - : Nguồn gốc người dùng là nguồn gốc kiểu dáng chứa bất kỳ CSS nào mà người dùng trình duyệt web đã thêm vào. Chúng có thể từ việc thêm kiểu bằng công cụ nhà phát triển hoặc từ một tiện ích mở rộng trình duyệt tự động áp dụng kiểu tùy chỉnh cho nội dung, chẳng hạn như [Stylus](https://add0n.com/stylus.html) hoặc [Stylish](https://userstyles.org/).
- Nguồn gốc tác giả
  - : Nguồn gốc tác giả là nguồn gốc kiểu dáng chứa tất cả các kiểu là một phần của tài liệu, dù được nhúng trong {{Glossary("HTML")}} hay được tải từ tệp stylesheet bên ngoài.

Các nguồn gốc kiểu dáng được sử dụng để xác định nơi dừng lùi (hay quay ngược qua) cascade của các kiểu đã được áp dụng cho một phần tử khi xóa kiểu, chẳng hạn như khi sử dụng từ khóa {{cssxref("unset")}} hoặc {{cssxref("revert")}}.

## Xem thêm

- [CSS cascading and inheritance: Cascading Origins](https://drafts.csswg.org/css-cascade-4/#cascading-origins)
