---
title: Doctype
slug: Glossary/Doctype
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong {{Glossary("HTML")}}, **doctype** là khai báo bắt buộc `<!doctype html>` ở đầu tất cả các tài liệu. Mục đích duy nhất của nó là ngăn {{Glossary("browser","trình duyệt")}} chuyển sang cái gọi là ["chế độ quirks"](/en-US/docs/Web/HTML/Guides/Quirks_mode_and_standards_mode) khi kết xuất tài liệu; tức là, `<!doctype html>` đảm bảo rằng trình duyệt nỗ lực hết sức để tuân theo các đặc tả liên quan, thay vì sử dụng chế độ kết xuất khác không tương thích với một số đặc tả.

Doctype không phân biệt chữ hoa/thường. Quy ước của các ví dụ mã MDN là sử dụng chữ thường, nhưng cũng thường thấy viết là `<!DOCTYPE html>`.

## Xem thêm

- [Định nghĩa DOCTYPE trong đặc tả HTML](https://html.spec.whatwg.org/multipage/syntax.html#the-doctype)
- [Chế độ Quirks và Chế độ tiêu chuẩn](/en-US/docs/Web/HTML/Guides/Quirks_mode_and_standards_mode)
- [Document.doctype](/en-US/docs/Web/API/Document/doctype), phương thức JavaScript trả về doctype
