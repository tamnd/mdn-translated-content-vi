---
title: Immutable
slug: Glossary/Immutable
page-type: glossary-definition
sidebar: glossarysidebar
---

Một giá trị **bất biến** (immutable) là giá trị mà nội dung của nó không thể thay đổi mà không tạo ra một giá trị hoàn toàn mới, trái ngược với {{Glossary("mutable", "giá trị có thể thay đổi")}}.

Trong {{glossary("JavaScript")}}, {{Glossary("primitive", "giá trị nguyên thủy")}} là bất biến — một khi giá trị nguyên thủy được tạo ra, nó không thể thay đổi, mặc dù biến chứa nó có thể được gán lại một giá trị khác.
Ngược lại, {{Glossary("Object","đối tượng")}} và {{Glossary("Array","mảng")}} mặc định là có thể thay đổi — các thuộc tính và phần tử của chúng có thể bị thay đổi mà không cần gán lại giá trị mới.

Việc sử dụng các đối tượng bất biến mang lại nhiều lợi ích:

- Cải thiện hiệu năng (không cần lập kế hoạch cho các thay đổi trong tương lai của đối tượng)
- Giảm mức sử dụng bộ nhớ (tạo {{glossary("object reference","tham chiếu đến đối tượng")}} thay vì sao chép toàn bộ đối tượng)
- An toàn với đa luồng (nhiều luồng có thể tham chiếu đến cùng một đối tượng mà không làm ảnh hưởng lẫn nhau)
- Giảm gánh nặng tư duy cho lập trình viên (trạng thái của đối tượng sẽ không thay đổi và hành vi của nó luôn nhất quán)

Lưu ý rằng bạn có thể dễ dàng chứng minh tính có thể thay đổi: một đối tượng là có thể thay đổi miễn là nó cung cấp một cách nào đó để thay đổi thuộc tính của nó. Ngược lại, _tính bất biến_ khó chứng minh hơn nếu không có ngữ nghĩa ngôn ngữ để đảm bảo — đây là vấn đề thỏa thuận của lập trình viên. Ví dụ, {{jsxref("Object.freeze()")}} là một phương thức cấp ngôn ngữ để làm cho một đối tượng trở nên bất biến trong JavaScript.

## Xem thêm

- [Immutable object](https://en.wikipedia.org/wiki/Immutable_object) trên Wikipedia
- Các thuật ngữ liên quan:
  - {{glossary("Mutable")}}
