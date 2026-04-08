---
title: CSS fragmentation
short-title: Fragmentation
slug: Web/CSS/Guides/Fragmentation
page-type: css-module
spec-urls: https://drafts.csswg.org/css-break/
sidebar: cssref
---

Module **CSS fragmentation** định nghĩa cách nội dung được hiển thị khi nó bị ngắt (phân mảnh) và chảy qua nhiều [trang](/en-US/docs/Web/CSS/Guides/Paged_media), vùng, hoặc [cột](/en-US/docs/Web/CSS/Guides/Multicol_layout). Module này định nghĩa các tính năng cho phân trang, ngắt với kích thước và hướng fragment thay đổi, widows và orphans.

Module này giải thích cách nội dung ngắt qua các fragmentation container và cách các ngắt đó có thể được tác giả kiểm soát. Thuật ngữ chung cho việc ngắt nội dung qua các container là _fragmentation_. Fragmentation xảy ra khi một inline box bọc sang nhiều dòng. Điều này có thể xảy ra khi sử dụng các tính năng layout như [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout): Ví dụ, khi một block kéo dài hơn một cột bên trong column layout container, hoặc kéo dài qua page break khi in. Mỗi phần rendering của phần tử được gọi là _fragment_.

Khi nội dung được in vật lý hoặc hiển thị dưới dạng xem trước khi in, có các page break. Trong paged media này, trái ngược với continuous media, nội dung tài liệu có thể được chia giữa một hoặc nhiều trang, hoặc fragment. Để tránh các ngắt khó xử, chẳng hạn như giữa một dòng văn bản hoặc với một từ đơn lẻ trên trang riêng của nó, trình duyệt có thể di chuyển nội dung mà nếu không sẽ rơi qua page break trong một quá trình được gọi là _pagination_.

## Tham chiếu

### Thuộc tính

- {{cssxref("box-decoration-break")}}
- {{cssxref("break-after")}}
- {{cssxref("break-before")}}
- {{cssxref("break-inside")}}
- {{cssxref("orphans")}}
- {{cssxref("widows")}}

### Thuật ngữ bảng chú giải

- {{glossary("Fragmentainer")}}

## Hướng dẫn

- [Xử lý content breaks trong multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout/Handling_content_breaks)
  - : Giới thiệu về đặc tả fragmentation và cách kiểm soát nơi nội dung cột ngắt.

## Khái niệm liên quan

- {{cssxref("overflow")}}
- Thuộc tính CSS {{cssxref("height")}}, {{cssxref("max-height")}}, và {{cssxref("block-size")}}
- Thuộc tính CSS {{cssxref("width")}}, {{cssxref("max-width")}}, và {{cssxref("inline-size")}}
- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)

Module [CSS paged media](/en-US/docs/Web/CSS/Guides/Paged_media)

- {{cssxref("page")}}
- {{cssxref("@page")}}

Module [CSS display](/en-US/docs/Web/CSS/Guides/Display)

- Thuật ngữ [Principal box](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#the_principal_box)
- Hướng dẫn [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)

## Đặc tả

{{Specifications}}

## Xem thêm

- Descriptor [`horizontal-viewport-segments`](/en-US/docs/Web/CSS/Reference/At-rules/@media/horizontal-viewport-segments) và [`vertical-viewport-segments`](/en-US/docs/Web/CSS/Reference/At-rules/@media/vertical-viewport-segments) của `@media`
- [Viewport Segments API](/en-US/docs/Web/API/Viewport_segments_API)
- Module [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout)
