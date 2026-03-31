---
title: Solve common CSS problems
short-title: Common CSS problems
slug: Learn_web_development/Howto/Solve_CSS_problems
page-type: landing-page
sidebar: learn-how-to
---

Trang này tổng hợp các câu hỏi và câu trả lời, cùng các tài liệu khác trên MDN có thể giúp bạn giải quyết các vấn đề CSS phổ biến.

## Định kiểu cho box

- [Làm thế nào để thêm bóng đổ cho một phần tử?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Add_a_shadow)
  - : Bóng đổ có thể được thêm vào box bằng thuộc tính {{cssxref("box-shadow")}}. Hướng dẫn này giải thích cách hoạt động của nó và hiển thị một ví dụ.
- [Làm thế nào để lấp đầy một box bằng hình ảnh mà không làm biến dạng ảnh?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Fill_a_box_with_an_image)
  - : Thuộc tính {{cssxref("object-fit")}} cung cấp nhiều cách khác nhau để vừa khít một hình ảnh vào box có {{glossary("aspect ratio")}} khác nhau, và bạn có thể tìm hiểu cách sử dụng chúng trong hướng dẫn này.
- [Những phương pháp nào có thể được sử dụng để định kiểu cho box?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Create_fancy_boxes)
  - : Tổng quan về các thuộc tính khác nhau có thể hữu ích khi định kiểu cho box bằng CSS.
- [Làm thế nào để làm cho các phần tử trở nên bán trong suốt?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Make_box_transparent)
  - : Thuộc tính {{cssxref("opacity")}} và các giá trị màu có kênh alpha có thể được sử dụng cho mục đích này; hãy tìm hiểu nên dùng cái nào trong tình huống nào.

### Bài học và hướng dẫn về định kiểu box

- [The Box Model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model)
- [Styling backgrounds and borders](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)

## CSS và văn bản

- [Làm thế nào để thêm bóng đổ cho văn bản?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Add_a_text_shadow)
  - : Bóng đổ có thể được thêm vào văn bản bằng thuộc tính {{cssxref("text-shadow")}}. Hướng dẫn này giải thích cách hoạt động của nó và hiển thị một ví dụ.
- [Làm thế nào để làm nổi bật dòng đầu tiên của đoạn văn?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Highlight_first_line)
  - : Tìm hiểu cách nhắm mục tiêu dòng văn bản đầu tiên trong đoạn văn bằng pseudo-element {{cssxref("::first-line")}}.
- [Làm thế nào để làm nổi bật đoạn văn đầu tiên trong một bài viết?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Highlight_first_para)
  - : Tìm hiểu cách nhắm mục tiêu đoạn văn đầu tiên bằng pseudo-class {{cssxref(":first-child")}}.
- [Làm thế nào để làm nổi bật một đoạn văn chỉ khi nó xuất hiện ngay sau một tiêu đề?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Highlight_para_after_h1)
  - : Combinator có thể giúp bạn nhắm mục tiêu chính xác các phần tử dựa trên vị trí của chúng trong tài liệu; hướng dẫn này giải thích cách sử dụng chúng để áp dụng CSS cho một đoạn văn chỉ khi nó đứng ngay sau một tiêu đề.

### Bài học và hướng dẫn về định kiểu văn bản

- [How to style text](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
- [How to customize a list of elements](/en-US/docs/Learn_web_development/Core/Text_styling/Styling_lists)
- [How to style links](/en-US/docs/Learn_web_development/Core/Text_styling/Styling_links)
- [CSS Selectors](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors)

## CSS Layout

- [Làm thế nào để căn giữa một phần tử?](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Center_an_item)
  - : Việc căn giữa một phần tử bên trong một box khác theo cả chiều ngang lẫn chiều dọc từng rất phức tạp, nhưng flexbox hiện nay đã làm cho việc này trở nên đơn giản.

### Hướng dẫn về layout

- [Using CSS flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Using CSS multi-column layouts](/en-US/docs/Web/CSS/Guides/Multicol_layout/Using)
- [Using CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Using CSS generated content](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Generated_content)

> [!NOTE]
> We have a cookbook dedicated to [CSS Layout solutions](/en-US/docs/Web/CSS/How_to/Layout_cookbook), with fully working examples and explanations of common layout tasks. Also check out [Practical Positioning Examples](/en-US/docs/Learn_web_development/Core/CSS_layout/Practical_positioning_examples), which shows how you can use positioning to create a tabbed info box, and a sliding hidden panel.
