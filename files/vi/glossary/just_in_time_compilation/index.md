---
title: Biên dịch just-in-time (JIT)
slug: Glossary/Just_In_Time_Compilation
page-type: glossary-definition
sidebar: glossarysidebar
---

**JIT** (_Just-In-Time Compilation_ — biên dịch tức thì) là một quy trình {{glossary("compile","biên dịch")}} trong đó mã được chuyển đổi từ biểu diễn trung gian hoặc ngôn ngữ cấp cao hơn (ví dụ: {{glossary("JavaScript")}} hoặc bytecode Java) thành mã máy _trong thời gian chạy_, thay vì trước khi thực thi. Cách tiếp cận này kết hợp lợi ích của cả phiên dịch và biên dịch trước thời điểm chạy (AOT).

Các trình biên dịch JIT thường liên tục phân tích mã khi nó được thực thi, xác định những phần mã được thực thi thường xuyên (điểm nóng). Nếu lợi ích tăng tốc vượt qua chi phí biên dịch, trình biên dịch JIT sẽ biên dịch những phần đó thành mã máy. Mã được biên dịch sau đó được thực thi trực tiếp bởi bộ xử lý, có thể dẫn đến cải thiện hiệu năng đáng kể.

JIT được sử dụng phổ biến trong các {{glossary("browser","trình duyệt web")}} hiện đại để tối ưu hóa hiệu năng của mã JavaScript.

## Xem thêm

- [Just-In-Time Compilation](https://en.wikipedia.org/wiki/Just-in-time_compilation) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{glossary("compile")}}
