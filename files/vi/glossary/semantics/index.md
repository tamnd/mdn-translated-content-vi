---
title: Ngữ nghĩa
slug: Glossary/Semantics
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong lập trình, **Semantics** (ngữ nghĩa) đề cập đến _ý nghĩa_ của một đoạn code — ví dụ "tác dụng của việc chạy dòng JavaScript đó là gì?", hay "mục đích hay vai trò của phần tử HTML đó là gì?" (thay vì "nó trông như thế nào?").

## Ngữ nghĩa trong JavaScript

Trong JavaScript, hãy xem xét một hàm nhận tham số chuỗi và trả về một phần tử {{htmlelement("li")}} với chuỗi đó làm `textContent`. Bạn có cần nhìn vào code để hiểu hàm làm gì nếu nó được gọi là `build('Peach')`, hay `createLiWithContent('Peach')`?

## Ngữ nghĩa trong CSS

Trong CSS, hãy xem xét việc tạo style cho danh sách với các phần tử `li` biểu diễn các loại trái cây khác nhau. Bạn có biết phần nào của DOM đang được chọn với `div > ul > li`, hay `.fruits__item`?

## Ngữ nghĩa trong HTML

Trong HTML, ví dụ, phần tử {{htmlelement("Heading_Elements", "h1")}} là một phần tử ngữ nghĩa, trao cho văn bản mà nó bao bọc vai trò (hay ý nghĩa) là "tiêu đề cấp cao nhất trên trang của bạn".

```html
<h1>This is a top level heading</h1>
```

Theo mặc định, [bảng kiểu của tác nhân người dùng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets) của hầu hết các trình duyệt sẽ tạo style cho {{htmlelement("Heading_Elements", "h1")}} với cỡ phông chữ lớn để làm nó _trông_ giống như một tiêu đề (mặc dù bạn có thể tạo style cho nó trông như bất cứ điều gì bạn muốn).

Mặt khác, bạn có thể làm cho bất kỳ phần tử nào _trông_ giống như tiêu đề cấp cao nhất. Hãy xem xét ví dụ sau:

```html
<span style="font-size: 32px; margin: 21px 0;">Not a top-level heading!</span>
```

Phần tử này sẽ được kết xuất trông giống tiêu đề cấp cao nhất, nhưng nó không có giá trị ngữ nghĩa, vì vậy nó sẽ không được hưởng bất kỳ lợi ích bổ sung nào như được mô tả ở trên. Do đó, việc sử dụng đúng phần tử HTML cho đúng công việc là ý tưởng hay.

HTML nên được viết để biểu diễn _dữ liệu_ sẽ được điền vào, chứ không phải dựa trên kiểu trình bày mặc định. Trình bày (giao diện nhìn thế nào), là trách nhiệm duy nhất của [CSS](/en-US/docs/Web/CSS).

Một số lợi ích từ việc viết markup ngữ nghĩa như sau:

- Các công cụ tìm kiếm sẽ coi nội dung của nó là các từ khóa quan trọng để ảnh hưởng đến thứ hạng tìm kiếm của trang (xem {{glossary("SEO")}})
- Screen reader có thể sử dụng nó như bảng định hướng để giúp người dùng khiếm thị điều hướng trang
- Việc tìm các khối code có ý nghĩa dễ dàng hơn nhiều so với tìm kiếm qua vô số `div` có hoặc không có class ngữ nghĩa hay namespace
- Gợi ý cho nhà phát triển loại dữ liệu sẽ được điền vào
- Đặt tên ngữ nghĩa phản ánh đúng cách đặt tên custom element/component

Khi tiếp cận markup nào cần sử dụng, hãy tự hỏi: "Phần tử nào mô tả/biểu diễn tốt nhất dữ liệu tôi sắp điền vào?" Ví dụ, đó có phải là danh sách dữ liệu không?; có thứ tự, không có thứ tự?; đó có phải là một bài báo với các phần và phần phụ thông tin liên quan không?; nó có liệt kê các định nghĩa không?; đó có phải là hình hay ảnh cần chú thích không?; nó có nên có header và footer ngoài header và footer toàn trang không?; v.v.

## Các phần tử ngữ nghĩa

Đây là _một số_ trong khoảng 100 [phần tử](/en-US/docs/Web/HTML/Reference/Elements) ngữ nghĩa có sẵn:

- {{htmlelement("article")}}
- {{htmlelement("aside")}}
- {{htmlelement("details")}}
- {{htmlelement("figcaption")}}
- {{htmlelement("figure")}}
- {{htmlelement("footer")}}
- {{htmlelement("form")}}
- {{htmlelement("header")}}
- {{htmlelement("main")}}
- {{htmlelement("mark")}}
- {{htmlelement("nav")}}
- {{htmlelement("section")}}
- {{htmlelement("summary")}}
- {{htmlelement("time")}}

## Xem thêm

- [Tham khảo phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements#inline_text_semantics) trên MDN
- [Sử dụng các phần và đề cương HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements#usage_notes) trên MDN
- [Ý nghĩa của semantics trong khoa học máy tính](https://en.wikipedia.org/wiki/Semantics#Computer_science) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{Glossary("SEO")}}
