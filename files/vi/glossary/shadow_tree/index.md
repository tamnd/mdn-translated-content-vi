---
title: Shadow tree
slug: Glossary/Shadow_tree
page-type: glossary-definition
sidebar: glossarysidebar
---

**Shadow tree** (cây shadow) là tập hợp các nút {{Glossary("DOM")}} ẩn mà nút trên cùng là một **shadow root**. Shadow root là nút trên cùng của **shadow DOM** và không thuộc cây DOM thông thường của tài liệu.

Shadow root được gắn vào một cây nút khác thông qua một nút DOM cụ thể gọi là **host** của nó. Host này có thể là một phần của cây shadow khác hoặc cây DOM thông thường. Cây nút của host của shadow root đôi khi được gọi là **light tree** (cây sáng).

Các nút DOM ẩn của shadow tree thường không bị ảnh hưởng bởi bất cứ điều gì áp dụng bên ngoài shadow tree, và ngược lại. **Ranh giới shadow** (shadow boundary), nơi shadow DOM kết thúc và DOM thông thường bắt đầu, có thể được đi qua, nhưng chỉ rất có chủ ý:

- Việc scripting các nút shadow tree từ bên ngoài yêu cầu sử dụng [Shadow DOM API](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) chuyên dụng để truy cập.
- Việc tạo style cho shadow tree từ bên ngoài có thể thực hiện thông qua [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) và [CSS shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts).

## Xem thêm

- [Sử dụng shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM)
- {{domxref("Element.shadowRoot")}} và {{domxref("Element.attachShadow()")}}
- {{domxref("ShadowRoot")}}
- {{HTMLElement("slot")}}
- Mô-đun [CSS shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts)
- Mô-đun [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
- Các thuật ngữ liên quan:
  - {{Glossary("Accessibility tree")}}
