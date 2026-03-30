---
title: Largest Contentful Paint (LCP)
slug: Glossary/Largest_contentful_paint
page-type: glossary-definition
sidebar: glossarysidebar
---

Chỉ số hiệu năng **Largest Contentful Paint** (LCP) cung cấp thời gian hiển thị của hình ảnh hoặc khối văn bản lớn nhất có thể nhìn thấy trong vùng nhìn (viewport), được tính từ khi trang bắt đầu tải.

Các phần tử sau được xem xét khi xác định LCP:

- Các phần tử {{HTMLElement("img")}}.
- Các phần tử {{svgelement("image")}} bên trong SVG.
- Hình ảnh poster của các phần tử {{HTMLElement("video")}}.
- Các phần tử có {{cssxref("background-image")}}.
- Các nhóm nút văn bản, chẳng hạn {{HTMLElement("p")}}.

## Xem thêm

- [`LargestContentfulPaint`](/en-US/docs/Web/API/LargestContentfulPaint)
- Các thuật ngữ liên quan:
  - {{Glossary("First Contentful Paint")}}
  - {{Glossary("First Paint")}}
