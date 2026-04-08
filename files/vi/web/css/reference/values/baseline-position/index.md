---
title: <baseline-position>
slug: Web/CSS/Reference/Values/baseline-position
page-type: css-type
spec-urls: https://drafts.csswg.org/css-align/#typedef-baseline-position
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated")}} **`<baseline-position>`** biểu diễn các giá trị từ khóa `baseline` cùng với các bổ nghĩa `first` và `last`, được sử dụng trong các thuộc tính {{cssxref("align-content")}}, {{cssxref("align-items")}}, {{cssxref("align-self")}}, {{cssxref("justify-items")}} và {{cssxref("justify-self")}}, cũng như các thuộc tính viết tắt {{cssxref("place-content")}}, {{cssxref("place-items")}} và {{cssxref("place-self")}}.

Các giá trị `first` và `last` xác định ưu tiên căn chỉnh baseline của hộp, mặc định là `first` nếu bỏ qua bổ nghĩa.

## Cú pháp

```plain
<baseline-position> = [ first | last ]? && baseline
```

## Giá trị

Kiểu giá trị liệt kê `<baseline-position>` được chỉ định bằng bổ nghĩa tùy chọn `first` hoặc `last` kết hợp với giá trị `baseline`. Nếu một hộp không thuộc về ngữ cảnh căn chỉnh chung, thì căn chỉnh dự phòng sẽ được sử dụng. Căn chỉnh dự phòng cũng được dùng để căn chỉnh nhóm chia sẻ baseline trong {{glossary("alignment container")}} của nó.

- `baseline`
  - : Tính toán thành `first baseline`, như định nghĩa bên dưới.

- `first baseline`
  - : Căn chỉnh baseline của tập baseline đầu tiên của hộp với baseline tương ứng trong nhóm chia sẻ baseline của nó. Căn chỉnh dự phòng là `safe self-start` cho căn chỉnh bản thân hoặc `safe start` cho phân phối nội dung.

- `last baseline`
  - : Căn chỉnh baseline của tập baseline cuối cùng của hộp với baseline tương ứng trong nhóm chia sẻ baseline của nó. Căn chỉnh dự phòng là `safe self-end` cho căn chỉnh bản thân hoặc `safe end` cho phân phối nội dung.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("align-content")}}, {{cssxref("align-items")}}, {{cssxref("align-self")}}, {{cssxref("justify-items")}}, {{cssxref("justify-self")}}, {{cssxref("place-content")}}, {{cssxref("place-items")}} và {{cssxref("place-self")}}
- Các kiểu dữ liệu căn chỉnh hộp khác: {{cssxref("content-distribution")}}, {{cssxref("content-position")}}, {{cssxref("overflow-position")}} và {{cssxref("self-position")}}
- Module [CSS box alignment](/vi/docs/Web/CSS/Guides/Box_alignment)
- Module [CSS flexible box layout](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [CSS grid layout](/vi/docs/Web/CSS/Guides/Grid_layout)
