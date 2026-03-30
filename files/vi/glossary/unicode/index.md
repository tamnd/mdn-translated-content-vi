---
title: Unicode
slug: Glossary/Unicode
page-type: glossary-definition
sidebar: glossarysidebar
---

Unicode là {{Glossary("Character set", "bộ ký tự")}} tiêu chuẩn đánh số và định nghĩa {{Glossary("Character", "ký tự")}} từ các ngôn ngữ, hệ thống chữ viết và ký hiệu khác nhau trên thế giới.

Bằng cách gán một số cho mỗi ký tự, các lập trình viên có thể tạo ra {{Glossary("Character encoding", "bảng mã ký tự")}}, giúp máy tính lưu trữ, xử lý và truyền tải bất kỳ sự kết hợp ngôn ngữ nào trong cùng một file hoặc chương trình.

Trước Unicode, việc trộn lẫn các ngôn ngữ trong cùng dữ liệu rất khó khăn và dễ xảy ra lỗi. Ví dụ, một bộ ký tự sẽ lưu các ký tự tiếng Nhật, và bộ khác lưu bảng chữ cái Ả Rập. Nếu không đánh dấu rõ ràng phần nào của dữ liệu thuộc bộ ký tự nào, các chương trình và máy tính khác sẽ hiển thị văn bản không chính xác, hoặc làm hỏng nó trong quá trình xử lý. Nếu bạn từng thấy văn bản trong đó các ký tự như dấu ngoặc kép cong (&ldquo;&rdquo;) bị thay thế bằng ký tự lạ như `Ã‚Â£`, thì bạn đã gặp vấn đề này, được gọi là [Mojibake](https://en.wikipedia.org/wiki/Mojibake).

Bảng mã ký tự Unicode phổ biến nhất trên Web là {{Glossary("UTF-8")}}. Các bảng mã khác cũng tồn tại, như {{glossary("UTF-16")}} hoặc UCS-2 đã lỗi thời, nhưng UTF-8 được khuyến nghị sử dụng.

## Xem thêm

- [Unicode](https://en.wikipedia.org/wiki/Unicode) trên Wikipedia
- [The Unicode Standard: A Technical Introduction](https://www.unicode.org/standard/principles.html)
