---
title: Grid Axis
slug: Glossary/Grid_Axis
page-type: glossary-definition
sidebar: glossarysidebar
---

CSS grid layout là một phương pháp bố cục hai chiều cho phép bố trí nội dung theo _hàng_ và _cột_. Do đó trong bất kỳ grid nào, chúng ta có hai trục. _Trục block hay trục cột_, và _trục inline hay trục hàng_.

Dọc theo các trục này, các phần tử có thể được căn chỉnh và justify bằng các thuộc tính được định nghĩa trong [đặc tả Box Alignment](/en-US/docs/Web/CSS/Guides/Box_alignment).

_Trục inline_ (còn gọi là trục hàng hay trục chính) là hướng mà văn bản thông thường chảy theo. _Trục block_ (còn gọi là trục cột hay trục chéo) là trục được sử dụng khi bố trí các khối văn bản. Hướng vật lý của các trục này có thể thay đổi theo [chế độ viết](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes) của tài liệu.

Ví dụ, nếu bạn viết từ trái sang phải, từ trên xuống dưới (như văn xuôi tiếng Anh thông thường), thì các ký tự riêng lẻ được đặt dọc theo trục inline, chạy từ trái sang phải.

![Sơ đồ hiển thị trục inline trong CSS grid layout.](7_inline_axis.png)

Và, nếu văn bản chứa nhiều dòng, các dòng này được đặt dọc theo trục block, chạy từ trên xuống dưới.

![Sơ đồ hiển thị trục block trong CSS grid layout.](7_block_axis.png)

## Xem thêm

- [Khái niệm cơ bản về bố cục grid](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Grids, logical values and writing modes](/en-US/docs/Web/CSS/Guides/Grid_layout/Logical_values_and_writing_modes)
