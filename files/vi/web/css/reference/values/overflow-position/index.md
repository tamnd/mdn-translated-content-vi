---
title: <overflow-position>
slug: Web/CSS/Reference/Values/overflow-position
page-type: css-type
spec-urls: https://drafts.csswg.org/css-align/#typedef-overflow-position
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated")}} **`<overflow-position>`** xác định cách một đối tượng căn chỉnh lớn hơn vùng chứa của nó sẽ tràn ra khỏi vùng chứa đó. Ví dụ, nếu các mục được căn giữa rộng hơn vùng chứa của chúng, phần tràn có thể được hiển thị vượt ra ngoài cạnh bắt đầu của viewport và không thể cuộn đến. Giá trị `<overflow-position>` xác định liệu chế độ căn chỉnh có nên được ghi đè để đảm bảo nội dung hiển thị (`safe`) hay phải tuân theo chế độ căn chỉnh (`unsafe`).

Kiểu dữ liệu này hợp lệ cho các thuộc tính {{cssxref("align-content")}}, {{cssxref("align-items")}}, {{cssxref("align-self")}}, {{cssxref("justify-items")}} và {{cssxref("justify-self")}}, cũng như các thuộc tính viết tắt {{cssxref("place-content")}}, {{cssxref("place-items")}}, và {{cssxref("place-self")}}.
Nếu bị bỏ qua, căn chỉnh tràn mặc định là sự kết hợp của `safe` và `unsafe`.

## Cú pháp

```plain
<overflow-position> = unsafe | safe
```

## Giá trị

Các giá trị từ khóa sau đây được biểu diễn bởi thuật ngữ ngữ pháp `<overflow-position>`:

- `safe`
  - : Nếu kích thước của {{glossary("alignment subject")}} tràn ra khỏi {{glossary("alignment container")}}, đối tượng căn chỉnh thay vào đó được căn chỉnh như thể chế độ căn chỉnh là `start`.

- `unsafe`
  - : Bất kể kích thước tương đối của đối tượng căn chỉnh và vùng chứa căn chỉnh, giá trị căn chỉnh được chỉ định sẽ được tuân theo.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("align-content")}}, {{cssxref("align-items")}}, {{cssxref("align-self")}}, {{cssxref("justify-content")}} {{cssxref("justify-items")}}, {{cssxref("justify-self")}}, {{cssxref("place-content")}}, {{cssxref("place-items")}}, và {{cssxref("place-self")}}
- Các kiểu dữ liệu căn chỉnh hộp khác: {{cssxref("content-distribution")}}, {{cssxref("content-position")}}, {{cssxref("baseline-position")}}, và {{cssxref("self-position")}}
- Module [căn chỉnh hộp CSS](/vi/docs/Web/CSS/Guides/Box_alignment)
- Module [bố cục hộp linh hoạt CSS](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
- Module [bố cục lưới CSS](/vi/docs/Web/CSS/Guides/Grid_layout)
