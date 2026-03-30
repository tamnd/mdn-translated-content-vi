---
title: Lớp trên cùng
slug: Glossary/Top_layer
page-type: glossary-definition
sidebar: glossarysidebar
---

**Lớp trên cùng** (top layer) là một lớp cụ thể trải dài toàn bộ chiều rộng và chiều cao của viewport và nằm trên tất cả các lớp khác được hiển thị trong tài liệu web. Nó được trình duyệt tạo ra để chứa các phần tử cần xuất hiện trên đỉnh của tất cả nội dung khác trên trang.

Các phần tử được đặt trong lớp trên cùng sẽ tạo ra một [ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) mới, cũng như các phần tử giả {{cssxref("::backdrop")}} tương ứng của chúng.

Các phần tử sẽ xuất hiện trong lớp trên cùng bao gồm:

- Các phần tử toàn màn hình, tức là các phần tử đã được hiển thị ở chế độ toàn màn hình bằng cách gọi {{domxref("Element.requestFullscreen()")}} thành công.
- Các phần tử {{htmlelement("dialog")}} được hiển thị dưới dạng modal thông qua lệnh gọi {{domxref("HTMLDialogElement.showModal()")}} thành công.
- Các phần tử Popover được hiển thị thông qua lệnh gọi {{domxref("HTMLElement.showPopover()")}} thành công.

Một số trình duyệt, chẳng hạn như Chrome, hiển thị các phần tử được đặt trong lớp trên cùng bên trong một mục cây DOM đặc biệt. Ví dụ:

![Một phần tử trong lớp trên cùng, như được hiển thị trong Chrome DevTools](top_layer_devtools.png)

Lưu ý rằng lớp trên cùng là một khái niệm nội bộ của trình duyệt và không thể được thao tác trực tiếp từ mã. Bạn có thể nhắm mục tiêu các phần tử được đặt trong lớp trên cùng bằng CSS và JavaScript, nhưng không thể nhắm mục tiêu bản thân lớp trên cùng.

## Xem thêm

- [Ngữ cảnh xếp chồng](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- Phần tử {{htmlelement("dialog")}}, giao diện {{domxref("HTMLDialogElement")}}
- [Popover API](/en-US/docs/Web/API/Popover_API)
- Lớp giả {{CSSXref(":fullscreen")}}
