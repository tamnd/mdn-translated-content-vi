---
title: Chuỗi cuộn
slug: Glossary/Scroll_chaining
page-type: glossary-definition
sidebar: glossarysidebar
---

**Scroll chaining** (chuỗi cuộn) đề cập đến hành vi quan sát được khi người dùng cuộn vượt qua {{Glossary("Scroll_boundary", "ranh giới cuộn")}} của một phần tử có thể cuộn, làm cho phần tử tổ tiên bắt đầu cuộn.

Khi người dùng cuộn trong một phần tử có thể cuộn như `<div>` hay `<textarea>` và đạt đến ranh giới [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport) (trên, dưới, trái hoặc phải) của phần tử đó, có thể xảy ra "hiệu ứng chuỗi" trong đó hành động cuộn được truyền liền mạch sang phần tử cha. Hành vi này tạo ra trải nghiệm cuộn liên tục, cả theo chiều dọc và chiều ngang.

Một **scroll chain** (chuỗi cuộn) là thứ tự các phần tử có thể cuộn mà hành động cuộn truyền từ phần tử này sang phần tử khác. Điều này xảy ra khi phần tử bên trong được cuộn đến giới hạn của nó, và việc cuộn tiếp tục sang phần tử cha của nó, tạo ra một 'chuỗi' các hành động cuộn. Chuỗi thường đệ quy lên khối chứa.

## Xem thêm

- Thuộc tính CSS {{CSSxRef("overscroll-behavior")}}
- Mô-đun [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Mô-đun [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior)
- Mô-đun [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Mô-đun [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring)
