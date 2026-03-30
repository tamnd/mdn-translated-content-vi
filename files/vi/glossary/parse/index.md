---
title: Parse
slug: Glossary/Parse
page-type: glossary-definition
sidebar: glossarysidebar
---

Phân tích cú pháp (Parsing) có nghĩa là phân tích và chuyển đổi một chương trình thành định dạng nội bộ mà môi trường thực thi có thể thực sự chạy được, ví dụ engine {{glossary("JavaScript")}} bên trong các trình duyệt.

[Trình duyệt phân tích HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) thành cây {{glossary('DOM')}}. Quá trình phân tích HTML liên quan đến [token hóa](/en-US/docs/Web/API/DOMTokenList) và xây dựng cây. Các token HTML bao gồm thẻ mở, thẻ đóng, cũng như tên và giá trị thuộc tính. Nếu tài liệu có định dạng tốt, quá trình phân tích sẽ đơn giản và nhanh hơn. Trình phân tích cú pháp phân tích đầu vào đã được token hóa thành tài liệu, xây dựng cây tài liệu.

Khi trình phân tích HTML gặp các tài nguyên không chặn như hình ảnh, trình duyệt sẽ yêu cầu các tài nguyên đó và tiếp tục phân tích. Quá trình phân tích có thể tiếp tục khi gặp tệp CSS, nhưng các thẻ `<script>` — đặc biệt là những thẻ không có thuộc tính [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) hoặc `defer` — sẽ chặn kết xuất và tạm dừng phân tích HTML.

Khi trình duyệt gặp các style CSS, nó sẽ phân tích văn bản thành CSS Object Model (hay {{glossary('CSSOM')}}), một cấu trúc dữ liệu sau đó được dùng để định kiểu bố cục và vẽ. Sau đó trình duyệt tạo ra cây kết xuất (render tree) từ cả hai cấu trúc này để có thể vẽ nội dung lên màn hình. JavaScript cũng được tải xuống, phân tích, và sau đó thực thi.

Phân tích JavaScript được thực hiện trong {{glossary("compile time")}} hoặc bất cứ khi nào {{glossary("parser")}} được gọi, chẳng hạn khi gọi một phương thức.

## Xem thêm

- [Parse](https://en.wikipedia.org/wiki/Parsing) trên Wikipedia
