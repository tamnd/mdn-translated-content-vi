---
title: Scroll boundary
slug: Glossary/Scroll_boundary
page-type: glossary-definition
sidebar: glossarysidebar
---

**Scroll boundary** (ranh giới cuộn) là điểm mà phần tử có thể cuộn không thể cuộn thêm theo một hướng cụ thể, hoặc ở đầu hoặc cuối (hay trái/phải khi cuộn ngang). Đây thường là cạnh của [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport).

Khi nội dung của {{Glossary("Scroll_container", "vùng chứa cuộn")}} không vượt quá kích thước của vùng chứa theo hướng cuộn, vùng chứa đó được coi là luôn ở ranh giới cuộn. Điều này vì không có nội dung thêm để cuộn qua. Nếu nội dung bị ngăn cuộn, chẳng hạn khi đặt {{cssxref("overflow", "overflow: hidden")}}, phần tử không phải là vùng chứa cuộn, và do đó không có ranh giới cuộn.

Khi ranh giới cuộn của scrollport được đạt đến bởi người dùng đang cuộn nội dung, một hiệu ứng hình ảnh như nảy lại hoặc hành động chức năng như kéo để làm mới trên thiết bị di động có thể xảy ra. Hành vi mặc định của trình duyệt này được gọi là **hành động mặc định tại ranh giới** (boundary default action).

Ví dụ, trên thiết bị di động, kéo trang xuống khi đã ở đầu trang sẽ gây ra hiệu ứng nảy lại và đôi khi kích hoạt làm mới trang. Hiệu ứng nảy hoặc làm mới này là hành động mặc định tại ranh giới.

Hành động mặc định tại ranh giới có thể là cục bộ hoặc không cục bộ.

- **Ranh giới mặc định cục bộ** là hành động xảy ra tại ranh giới của một vùng cuộn cụ thể, giới hạn trong phần tử đó. Hành động này được coi là _cục bộ_ vì nó không ảnh hưởng đến bất kỳ vùng chứa cha nào hoặc phần còn lại của trang web.

- **Hành động mặc định tại ranh giới không cục bộ** là khi đạt đến ranh giới cuộn của một vùng chứa cuộn có hiệu ứng vượt ra ngoài phần tử đang được cuộn. Ví dụ về điều này là {{Glossary("Scroll_chaining", "scroll chaining")}}, trong đó việc đạt đến ranh giới cuộn của một phần tử kích hoạt cuộn trong phần tử cha hoặc tổ tiên, và có thể thậm chí khởi tạo hành động toàn trang, chẳng hạn như điều hướng.

## Xem thêm

- Thuộc tính CSS {{CSSxRef("overscroll-behavior")}}
- Mô-đun [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Mô-đun [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior)
- Mô-đun [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Mô-đun [CSS scroll anchoring](/en-US/docs/Web/CSS/Guides/Scroll_anchoring)
