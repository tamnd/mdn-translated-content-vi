---
title: Accessibility tree
slug: Glossary/Accessibility_tree
page-type: glossary-definition
sidebar: glossarysidebar
---

**Cây khả năng tiếp cận** (accessibility tree) chứa thông tin liên quan đến {{Glossary("accessibility", "khả năng tiếp cận")}} cho hầu hết các phần tử HTML.

Trình duyệt chuyển đổi markup thành biểu diễn nội bộ gọi là _[cây DOM](/en-US/docs/Web/API/Document_Object_Model)_. Cây DOM chứa các đối tượng đại diện cho tất cả các phần tử, thuộc tính và nút văn bản trong markup. Trình duyệt sau đó tạo cây khả năng tiếp cận dựa trên cây DOM, được sử dụng bởi các API Khả năng tiếp cận dành riêng cho từng nền tảng để cung cấp biểu diễn mà các công nghệ hỗ trợ như trình đọc màn hình có thể hiểu được.

Có bốn thuộc tính trong một đối tượng của cây khả năng tiếp cận:

- **name**
  - : Chúng ta gọi điều này là gì? Ví dụ, một liên kết với văn bản "Đọc thêm" sẽ có "Đọc thêm" là tên của nó (xem thêm về cách tính tên trong [đặc tả Accessible Name and Description Computation](https://w3c.github.io/accname/)).
- **description**
  - : Chúng ta mô tả điều này như thế nào, nếu muốn cung cấp thêm mô tả ngoài tên? Mô tả của một bảng có thể giải thích loại thông tin mà bảng đó chứa.
- [**role**](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
  - : Đây là loại gì? Ví dụ, đây là nút bấm, thanh điều hướng hay danh sách mục?
- [**state**](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes)
  - : Nó có trạng thái không? Ví dụ như trạng thái đã chọn hoặc chưa chọn của checkbox, hoặc trạng thái thu gọn hoặc mở rộng cho phần tử [`<summary>`](/en-US/docs/Web/HTML/Reference/Elements/summary).

Ngoài ra, cây khả năng tiếp cận thường chứa thông tin về những gì có thể làm với một phần tử: một liên kết có thể được _theo dõi_, một trường nhập văn bản có thể được _gõ vào_, v.v.

Mặc dù vẫn đang trong giai đoạn dự thảo trong Web Incubator Community Group tính đến tháng 4 năm 2022, **[Mô hình đối tượng khả năng tiếp cận](https://wicg.github.io/aom/explainer.html) (AOM)** có mục tiêu ươm tạo các API để diễn đạt ngữ nghĩa khả năng tiếp cận và có thể cho phép đọc truy cập vào cây khả năng tiếp cận được tính toán.

## Xem thêm

- [Accessibility](/en-US/docs/Web/Accessibility)
- [Học về khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility)
- [Khả năng tiếp cận web](https://en.wikipedia.org/wiki/Web_accessibility) trên Wikipedia
- [Web Accessibility In Mind](https://webaim.org/)
- [ARIA](/en-US/docs/Web/Accessibility/ARIA)
- [W3C Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [Accessible Rich Internet Applications (WAI-ARIA)](https://w3c.github.io/aria/)
- Các thuật ngữ liên quan:
  - {{Glossary("Accessibility")}}
  - {{Glossary("Accessible description")}}
  - {{Glossary("Accessible name")}}
  - {{Glossary("ARIA")}}
