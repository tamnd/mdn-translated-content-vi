---
title: <content-position>
slug: Web/CSS/Reference/Values/content-position
page-type: css-type
spec-urls: https://drafts.csswg.org/css-align/#typedef-content-position
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated", "liệt kê")}} **`<content-position>`** được sử dụng bởi các thuộc tính {{cssxref("justify-content")}} và {{cssxref("align-content")}}, và viết tắt {{cssxref("place-content")}}, để căn chỉnh nội dung của hộp bên trong chính nó.

## Cú pháp

```plain
<content-position> = center | start | end | flex-start | flex-end
```

## Giá trị

Kiểu giá trị liệt kê `<content-position>` được chỉ định bằng một trong các từ khóa sau.

- `center`
  - : Căn giữa {{glossary("alignment subject", "đối tượng căn chỉnh")}} trong {{glossary("alignment container", "container căn chỉnh")}} của nó.
- `start`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh bắt đầu của container căn chỉnh.
- `end`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh kết thúc của container căn chỉnh.
- `flex-start`
  - : Trong bố cục flex, căn chỉnh đối tượng căn chỉnh sát với cạnh của container căn chỉnh tương ứng với cạnh đầu trục chính hoặc đầu trục ngang của flex container, tùy theo trường hợp. Nó giống với `start` cho các chế độ bố cục khác ngoài bố cục flex.
- `flex-end`
  - : Trong bố cục flex, căn chỉnh đối tượng căn chỉnh sát với cạnh của container căn chỉnh tương ứng với cạnh cuối trục chính hoặc cuối trục ngang của flex container, tùy theo trường hợp. Giống với `end` cho các chế độ bố cục khác ngoài bố cục flex.

> [!NOTE]
> Các từ khóa `left` và `right` bị loại trừ khỏi `<content-position>`, dù chúng là các giá trị căn chỉnh theo vị trí hợp lệ cho các thuộc tính `justify-*` ({{cssxref("justify-content")}}, {{cssxref("justify-self")}} và {{cssxref("justify-items")}}), vì chúng không được phép trong các thuộc tính `align-*` ({{cssxref("align-content")}}, {{cssxref("align-self")}} và {{cssxref("align-items")}}). Thay vào đó chúng được bao gồm rõ ràng trong ngữ pháp của các thuộc tính `justify-*`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("align-content")}}, {{cssxref("justify-content")}}, {{cssxref("place-content")}}
- Các kiểu dữ liệu căn chỉnh hộp khác: {{cssxref("baseline-position")}}, {{cssxref("content-distribution")}}, `content-position`, {{cssxref("overflow-position")}}, và {{cssxref("self-position")}}
- Mô-đun [CSS box alignment](/vi/docs/Web/CSS/Guides/Box_alignment)
- Mô-đun [CSS flexible box layout](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
- Mô-đun [CSS grid layout](/vi/docs/Web/CSS/Guides/Grid_layout)
