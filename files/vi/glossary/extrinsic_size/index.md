---
title: Extrinsic size
slug: Glossary/Extrinsic_size
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, **kích thước ngoại sinh** (extrinsic size) của một phần tử được xác định bởi ngữ cảnh bố cục của nó, tức là bằng các ràng buộc áp đặt từ bên ngoài phần tử, không xét đến nội dung của nó. Đây là điều ngược lại với {{glossary("intrinsic size","kích thước nội sinh")}} của phần tử, dựa trên nội dung của nó.

Kích thước ngoại sinh xảy ra khi bạn đặt rõ ràng hoặc ràng buộc kích thước của phần tử bằng các thuộc tính [CSS box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model) như {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("block-size")}}, {{cssxref("inline-size")}}, {{cssxref("max-width")}}, và {{cssxref("min-height")}}. Ví dụ, khi bạn đặt `width: 200px`, bạn đang chỉ định kích thước ngoại sinh.

Giá trị phần trăm cũng là ngoại sinh; chúng được tính toán tương đối với [containing block](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của phần tử. Ví dụ, `width: 50%` có nghĩa là chiều rộng của phần tử sẽ là `50%` chiều rộng của containing block của nó, bất kể nội dung bên trong phần tử.

Các phần tử block-level được định kích thước ngoại sinh. Khi không chỉ định chiều rộng, chiều rộng mặc định của phần tử block là `auto`, giải thành chiều rộng `100%` của containing block của nó.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Intrinsic size")}}
- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
- Đặc tả [CSS Box Sizing Module Level 3](https://drafts.csswg.org/css-sizing-3/#extrinsic)
