---
title: Scroll snap
slug: Glossary/Scroll_snap
page-type: glossary-definition
sidebar: glossarysidebar
---

**Scroll snapping** (chốt cuộn) là khi nội dung "chốt" vào một vị trí cụ thể, thay vì dừng ở bất kỳ điểm ngẫu nhiên nào, khi thao tác cuộn kết thúc. Cuộn thông thường thiếu độ chính xác - nó không căn chỉnh với đoạn văn, câu hay ranh giới hình ảnh. Ví dụ, trong một carousel, thao tác cuộn có thể kết thúc ở giữa hình ảnh, để nó chỉ hiển thị một phần. Các nhà phát triển web từ lâu đã dựa vào các giải pháp JavaScript. Các trình duyệt gần đây đã bắt đầu hỗ trợ [tính năng CSS scroll-snapping](/en-US/docs/Web/CSS/Guides/Scroll_snap) cho phép định nghĩa các vùng chứa scroll-snap và các hành vi chốt.

Scroll snapping là trải nghiệm cuộn được kiểm soát tốt, trong đó các nhà phát triển định nghĩa một phần tử là [scroll container](/en-US/docs/Glossary/Scroll_container) với các ranh giới cho thao tác cuộn. Các thao tác cuộn sau đó kết thúc tại các ranh giới vị trí chốt này, với nội dung được cuộn đến chốt vào đúng vị trí. Trong ví dụ carousel ở trên, khi người dùng hoàn thành việc cuộn carousel, hình ảnh hiển thị sẽ chốt vào đúng vị trí.

- Scroll snap container
  - : **Scroll snap container** là scroll container có áp dụng scroll snapping. Ví dụ, nếu một hộp có nội dung tràn và {{CSSXref("scroll-snap-type")}} được đặt thành giá trị khác `none`, thì hộp đó sẽ nắm giữ các vị trí chốt. Scroll snap container của một hộp là tổ tiên scroll container gần nhất có khả năng nắm giữ vị trí chốt. Nếu một hộp không có scroll snap container, các vị trí chốt của nó sẽ không kích hoạt snapping.
- Snapport
  - : **Snapport** là vùng của [scrollport](/en-US/docs/Glossary/Scroll_container#scrollport) được sử dụng làm vùng chứa căn chỉnh cho các vùng snap khi tính toán vị trí chốt. Mặc định, nó giống với viewport trực quan của scroll container, nhưng là vùng scrollport được định nghĩa bởi thuộc tính {{CSSXref("scroll-padding")}}. Các [vùng snap](#snap_area) được căn chỉnh theo scrollport.
- Snap area (vùng snap)
  - : **Snap area** của một phần tử trong scroll container là vùng được định nghĩa bằng cách sử dụng các outset {{CSSXref("scroll-margin")}} được chỉ định trên phần tử. Snap area được dùng để chốt phần tử vào snapport của nó.
- Snap target (đích snap)
  - : Một phần tử con bên trong scroll snap container được chốt đến khi vùng chứa cuộn. Thuộc tính {{CSSXref("scroll-snap-align")}} định nghĩa vị trí snap của mỗi snap target.

## Xem thêm

- {{CSSXref("scroll-snap-type")}}
- {{CSSXref("scroll-snap-align")}}
- {{CSSXref("scroll-padding")}}
- {{CSSXref("scroll-margin")}}
- Mô-đun [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
