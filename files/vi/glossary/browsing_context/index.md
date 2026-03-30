---
title: Browsing context
slug: Glossary/Browsing_Context
page-type: glossary-definition
sidebar: glossarysidebar
---

**Ngữ cảnh duyệt web** (browsing context) là môi trường trong đó trình duyệt hiển thị một {{domxref("Document")}}.
Trong các trình duyệt hiện đại, ngữ cảnh duyệt web thường là một _tab_, nhưng cũng có thể là một _cửa sổ_, một _cửa sổ bật lên_ (popup), một [ứng dụng web](/en-US/docs/Web/Progressive_web_apps), hoặc thậm chí là một phần của trang như _frame_ hay _iframe_.

Mỗi ngữ cảnh duyệt web có một nguồn gốc (origin) (của tài liệu đang hoạt động) và một lịch sử có thứ tự các tài liệu đã hiển thị trước đó.
Việc giao tiếp và chia sẻ tài nguyên giữa các ngữ cảnh duyệt web bị hạn chế, đặc biệt giữa các ngữ cảnh khác nguồn gốc (cross-origin).
Ví dụ, một {{domxref("BroadcastChannel")}} chỉ có thể được mở và sử dụng để giao tiếp giữa các ngữ cảnh cùng nguồn gốc.

Một ngữ cảnh duyệt web có thể là một phần của **nhóm ngữ cảnh duyệt web**, là tập hợp các **ngữ cảnh duyệt web** chia sẻ các ngữ cảnh chung như lịch sử, cookie, cơ chế lưu trữ, v.v.
Các ngữ cảnh duyệt web trong một nhóm duy trì tham chiếu đến nhau, vì vậy có thể kiểm tra đối tượng toàn cục của nhau và gửi thông điệp cho nhau.

Theo mặc định, một tài liệu được mở trong nhóm ngữ cảnh trình duyệt sẽ được mở trong cùng một nhóm, dù là khác nguồn gốc hay cùng nguồn gốc.
{{httpheader("Cross-Origin-Opener-Policy")}} có thể được dùng để kiểm soát liệu tài liệu có được mở trong nhóm ngữ cảnh duyệt web mới của riêng nó và {{domxref("Window.crossOriginIsolated","cross-origin isolated","","no code")}} khỏi các ngữ cảnh khác (đặc biệt là ngữ cảnh khác nguồn gốc) hay không.
Điều này có thể giảm thiểu rủi ro tấn công cross-origin và các tấn công kênh bên (side-channel) được gọi là [XS-Leaks](https://xsleaks.dev/).

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Origin")}}
