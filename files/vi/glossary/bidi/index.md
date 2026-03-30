---
title: BiDi
slug: Glossary/BiDi
page-type: glossary-definition
sidebar: glossarysidebar
---

**BiDi** (BiDirectional - Hai chiều) mô tả một tài liệu chứa cả văn bản từ phải sang trái (RTL) và từ trái sang phải (LTR).

Giao diện người dùng nên hiển thị nội dung BiDi một cách chính xác, nhưng nhiều giao diện thất bại. Một ví dụ là bản dịch tiếng Hebrew của tên Sarah: שרה, được đánh vần (từ phải sang trái) sin (ש), resh (ר), heh (ה). Nhiều chương trình sẽ hiển thị các chữ cái theo thứ tự ngược lại.

Có thể đảo ngược thứ tự hiển thị từ trái sang phải thành từ phải sang trái, nhưng làm điều này hy sinh khả năng hiển thị chính xác các script BiDi — ít nhất một cái luôn bị hiển thị sai. Với hỗ trợ script hai chiều, có thể kết hợp các ký tự từ các script khác nhau trên cùng một trang, bất kể hướng viết.

Tiêu chuẩn Unicode cung cấp nền tảng cho hỗ trợ BiDi hoàn chỉnh, với các quy tắc chi tiết về cách các hỗn hợp script từ trái sang phải và từ phải sang trái được mã hóa và hiển thị.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Unicode")}}
- [Văn bản hai chiều](https://en.wikipedia.org/wiki/Bi-directional_text) trên Wikipedia
- [UAX#9: Unicode Bi-directional Algorithm](https://www.unicode.org/reports/tr9)
