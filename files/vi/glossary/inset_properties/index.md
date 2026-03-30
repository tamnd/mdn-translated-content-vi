---
title: Thuộc tính inset
slug: Glossary/Inset_properties
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, **thuộc tính inset** kiểm soát vị trí của các phần tử được định vị (positioned elements) bằng cách chỉ định độ lệch so với vị trí mặc định của chúng. Có các thuộc tính inset vật lý (physical), logic (logical), và viết tắt (shorthand).

Các thuộc tính inset bao gồm {{cssxref("top")}}, {{cssxref("left")}}, {{cssxref("bottom")}}, và {{cssxref("right")}} — là các thuộc tính vật lý, cùng với các thuộc tính tương đương theo chiều luồng nội dung là {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}}, {{cssxref("inset-inline-end")}} — là các {{glossary("logical properties", "thuộc tính logic")}}, và các thuộc tính viết tắt {{cssxref("inset-block")}}, {{cssxref("inset-inline")}}, và {{cssxref("inset")}}.

**Thuộc tính vật lý** tham chiếu đến các cạnh vật lý cụ thể của phần tử. Thuộc tính logic sử dụng các từ khóa định hướng tương đối với trục block và trục inline. **Trục block** là trục xác định thứ tự xếp chồng của các phần tử trong bố cục block. **Trục inline** là trục vuông góc với trục block, đại diện cho chiều mà nội dung inline như văn bản chảy trong một block. Ánh xạ giữa chúng phụ thuộc vào {{cssxref("writing-mode")}}, {{cssxref("direction")}}, và {{cssxref("text-orientation")}} của phần tử.

Cách hiểu các thuộc tính inset phụ thuộc vào giá trị của thuộc tính {{cssxref("position")}}. Khi đặt `position: absolute`, chúng đại diện cho độ lệch so với [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) hoặc [anchor element](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using). Với `position: relative`, chúng đại diện cho độ lệch so với vị trí lề mặc định của hộp. Với `sticky`, chúng đại diện cho độ lệch so với cạnh của {{glossary("scroll container")}}. Giá trị `fixed` tương tự `absolute`, ngoại trừ phần tử được định vị và kích thước theo containing block định vị cố định, thường là viewport.

## Xem thêm

- [Bố cục và containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
