---
title: Con trỏ văn bản
slug: Glossary/Caret
page-type: glossary-definition
sidebar: glossarysidebar
---

**Con trỏ văn bản** (caret) là một chỉ báo được hiển thị trên màn hình để chỉ ra nơi văn bản nhập vào sẽ được chèn vào.

Hầu hết các giao diện người dùng biểu thị caret bằng một đường thẳng đứng mỏng hoặc một hộp có kích thước bằng ký tự nhấp nháy, nhưng điều này có thể thay đổi. Điểm trong văn bản này được gọi là **điểm chèn**. Từ "caret" phân biệt điểm chèn văn bản với con trỏ chuột.

Trên web, caret được sử dụng để biểu thị điểm chèn trong các phần tử {{HTMLElement("input")}} và {{HTMLElement("textarea")}}, cũng như bất kỳ phần tử nào có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt, cho phép người dùng chỉnh sửa nội dung của phần tử.

## Xem thêm

- [Caret navigation](https://en.wikipedia.org/wiki/Caret_navigation) trên Wikipedia

### CSS liên quan đến caret

Bạn có thể đặt màu của caret cho nội dung có thể chỉnh sửa của một phần tử bằng cách đặt thuộc tính CSS {{cssxref("caret-color")}} của phần tử thành giá trị {{cssxref("&lt;color&gt;")}} phù hợp.

### Các phần tử HTML có thể hiển thị caret

Các phần tử này cung cấp các trường hoặc hộp nhập văn bản và do đó sử dụng caret.

- [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text)
- [`<input type="password">`](/en-US/docs/Web/HTML/Reference/Elements/input/password)
- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)
- [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date), [`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time), và [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local)
- [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number), [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)
- [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email), [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), và [`<input type="url">`](/en-US/docs/Web/HTML/Reference/Elements/input/url)
- {{HTMLElement("textarea")}}
- Bất kỳ phần tử nào có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt
