---
title: CSS paged media
short-title: Paged media
slug: Web/CSS/Guides/Paged_media
page-type: css-module
spec-urls: https://drafts.csswg.org/css-page/
sidebar: cssref
---

Module **CSS paged media** định nghĩa các thuộc tính kiểm soát cách trình bày nội dung để in hoặc cho bất kỳ phương tiện nào chia nội dung thành các trang rời biệt. Nó cho phép bạn đặt page break, kiểm soát vùng có thể in, và tạo kiểu khác nhau cho trang trái và trang phải.

Module CSS paged media chỉ định cách các trang được tạo ra và bố trí để chứa nội dung phân mảnh trong trình bày dạng trang, bao gồm nội dung được in hoặc biểu diễn dưới dạng xem trước khi in. Module định nghĩa chức năng kiểm soát margin trang, kích thước, hướng, và header và footer. Nó mở rộng [generated content](/en-US/docs/Web/CSS/Guides/Generated_content) để cung cấp chức năng tạo số trang và running header và footer.

Quá trình phân trang nội dung vào các trang được tạo ra và kiểm soát ngắt bên trong các phần tử được đề cập trong [module CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation).

## Tham chiếu

### Thuộc tính

- {{cssxref("page")}}

### At-rule và descriptor

- {{cssxref("@page")}}
  - Descriptor {{cssxref("@page/page-orientation", "page-orientation")}}
  - Descriptor {{cssxref("@page/size", "size")}}
  - [Margin descriptor](/en-US/docs/Web/CSS/Reference/Properties/margin)
- [Margin at-rule](/en-US/docs/Web/CSS/Reference/At-rules/@page#margin_at-rules)

Module CSS paged media cũng giới thiệu descriptor `bleeds` và `marks` của at-rule `@page`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

### Pseudo-class

- {{cssxref(":blank")}}
- {{cssxref(":first")}}
- {{cssxref(":left")}}
- {{cssxref(":right")}}

## Hướng dẫn

- [Printing](/en-US/docs/Web/CSS/Guides/Media_queries/Printing)
  - : Mẹo và kỹ thuật giúp cải thiện đầu ra máy in của nội dung web.

## Khái niệm liên quan

- Module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation)
  - Thuộc tính {{cssxref("break-after")}}
  - Thuộc tính {{cssxref("break-before")}}
  - Thuộc tính {{cssxref("break-inside")}}
  - Thuộc tính {{cssxref("orphans")}}
  - Thuộc tính {{cssxref("widows")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS fragmentation](/en-US/docs/Web/CSS/Guides/Fragmentation)
- Module [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries)
