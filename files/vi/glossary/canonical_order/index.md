---
title: Canonical order
slug: Glossary/Canonical_order
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, **thứ tự chuẩn tắc** được sử dụng để chỉ thứ tự mà các giá trị riêng biệt cần được chỉ định (hoặc {{Glossary("parse", "phân tích cú pháp")}}) hoặc được {{Glossary("serialization", "tuần tự hóa")}} như một phần của giá trị thuộc tính CSS. Nó được xác định bởi {{Glossary("syntax", "cú pháp")}} chính thức của thuộc tính và thường đề cập đến thứ tự mà các giá trị longhand nên được chỉ định như một phần của một giá trị shorthand duy nhất.

Ví dụ, các giá trị thuộc tính shorthand {{cssxref("background")}} được tạo thành từ một số thuộc tính longhand `background-*`. Thứ tự chuẩn tắc của các giá trị longhand đó được định nghĩa là:

1. {{cssxref("background-image")}}
2. {{cssxref("background-position")}}
3. {{cssxref("background-size")}}
4. {{cssxref("background-repeat")}}
5. {{cssxref("background-attachment")}}
6. {{cssxref("background-origin")}}
7. {{cssxref("background-clip")}}
8. {{cssxref("background-color")}}

Hơn nữa, cú pháp của nó định nghĩa rằng nếu một giá trị cho {{cssxref("background-size")}} được đưa ra, nó **phải** được chỉ định **sau** giá trị cho {{cssxref("background-position")}}, được phân tách bằng dấu gạch chéo. Các giá trị khác có thể xuất hiện theo bất kỳ thứ tự nào.

## Xem thêm

- [Cú pháp định nghĩa giá trị CSS](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
- ["Thứ tự chuẩn tắc" có nghĩa gì đối với thuộc tính CSS?](https://stackoverflow.com/questions/28963536/what-does-canonical-order-mean-with-respect-to-css-properties) trên Stack Overflow cung cấp thêm thảo luận hữu ích.
