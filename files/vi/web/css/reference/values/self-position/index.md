---
title: <self-position>
slug: Web/CSS/Reference/Values/self-position
page-type: css-type
spec-urls: https://drafts.csswg.org/css-align/#typedef-self-position
sidebar: cssref
---

Kiểu dữ liệu giá trị {{glossary("enumerated")}} **`<self-position>`** được sử dụng bởi các thuộc tính {{cssxref("justify-self")}} và {{cssxref("align-self")}}, và thuộc tính viết tắt {{cssxref("place-self")}}, để căn chỉnh hộp trong vùng chứa căn chỉnh của nó. Nó cũng được sử dụng bởi các thuộc tính {{cssxref("justify-items")}} và {{cssxref("align-items")}}, và thuộc tính viết tắt {{cssxref("place-items")}}, để chỉ định các giá trị mặc định cho `justify-self` và `align-self`.

## Cú pháp

```plain
<self-position> = center | start | end | self-start | self-end | flex-start | flex-end
```

## Giá trị

Các giá trị từ khóa sau được đại diện bởi thuật ngữ ngữ pháp `<self-position>`:

- `center`
  - : Căn giữa {{glossary("alignment subject", "đối tượng căn chỉnh")}} trong {{glossary("alignment container", "vùng chứa căn chỉnh")}} của nó.
- `start`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh bắt đầu của vùng chứa căn chỉnh.
- `end`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh kết thúc của vùng chứa căn chỉnh.
- `self-start`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh của vùng chứa căn chỉnh tương ứng với phía bắt đầu của đối tượng căn chỉnh.
- `self-end`
  - : Căn chỉnh đối tượng căn chỉnh sát với cạnh của vùng chứa căn chỉnh tương ứng với phía kết thúc của đối tượng căn chỉnh.
- `flex-start`
  - : Trong bố cục flex, căn chỉnh đối tượng căn chỉnh sát với cạnh của vùng chứa căn chỉnh tương ứng với phía bắt đầu chính hoặc bắt đầu chéo của vùng chứa flex, tùy theo trường hợp. Giống với `start` đối với các chế độ bố cục khác bố cục flex.
- `flex-end`
  - : Trong bố cục flex, căn chỉnh đối tượng căn chỉnh sát với cạnh của vùng chứa căn chỉnh tương ứng với phía kết thúc chính hoặc kết thúc chéo của vùng chứa flex, tùy theo trường hợp. Giống với `end` đối với các chế độ bố cục khác bố cục flex.

> [!NOTE]
> Các từ khóa `left` và `right` bị loại trừ khỏi `<self-position>`, mặc dù là các giá trị căn chỉnh vị trí hợp lệ cho các thuộc tính `justify-*` ({{cssxref("justify-content")}}, {{cssxref("justify-self")}}, và {{cssxref("justify-items")}}), vì chúng không được phép trong các thuộc tính `align-*` ({{cssxref("align-content")}}, {{cssxref("align-self")}}, và {{cssxref("align-items")}}). Thay vào đó, chúng được bao gồm rõ ràng trong ngữ pháp của các thuộc tính `justify-*`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("align-self")}}, {{cssxref("justify-self")}}, {{cssxref("place-self")}}, {{cssxref("align-items")}}, {{cssxref("justify-items")}}, {{cssxref("place-items")}}
- Các kiểu dữ liệu căn chỉnh hộp khác: {{cssxref("baseline-position")}}, {{cssxref("content-distribution")}}, {{cssxref("overflow-position")}}, và {{cssxref("content-position")}}
- Mô-đun [CSS box alignment](/vi/docs/Web/CSS/Guides/Box_alignment)
- Mô-đun [CSS flexible box layout](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
- Mô-đun [CSS grid layout](/vi/docs/Web/CSS/Guides/Grid_layout)
