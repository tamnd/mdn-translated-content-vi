---
title: Ink overflow
slug: Glossary/Ink_overflow
page-type: glossary-definition
sidebar: glossarysidebar
---

**Ink overflow** (tràn mực) của một hộp (box) là phần của hộp và nội dung của nó tạo ra hiệu ứng hiển thị bên ngoài đường viền của hộp đó. Vì chỉ mang tính chất hiển thị, ink overflow không ảnh hưởng đến bố cục vì nó không tác động đến các thuộc tính của mô hình hộp.

Ink overflow là hiện tượng tràn ra ngoài của các hiệu ứng vẽ như [box shadows](/en-US/docs/Web/CSS/Reference/Properties/box-shadow), [border images](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders), [text decoration](/en-US/docs/Web/CSS/Guides/Text_decoration), [outlines](/en-US/docs/Web/CSS/Reference/Properties/outline), v.v. — những thứ không ảnh hưởng đến bố cục hay vùng tràn có thể cuộn. Ink overflow cũng bao gồm phần nhô ra của các ký tự (glyph), chẳng hạn như các nét chân (ascender) và nét đuôi (descender) nhô ra ngoài hộp em.

Vì {{ glossary("replaced elements")}} luôn tạo ra một [ngữ cảnh định dạng](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts) độc lập, mọi nội dung tràn ra ngoài của phần tử thay thế luôn là ink overflow (khác với [tràn có thể cuộn](/en-US/docs/Learn_web_development/Core/Styling_basics/Overflow)).

## Xem thêm

- [CSS overflow module](/en-US/docs/Web/CSS/Guides/Overflow)
