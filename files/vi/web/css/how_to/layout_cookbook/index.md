---
title: CSS layout cookbook
short-title: Layout cookbook
slug: Web/CSS/How_to/Layout_cookbook
page-type: landing-page
sidebar: cssref
---

CSS layout cookbook hướng đến việc tập hợp các công thức cho các mẫu bố cục phổ biến — những thứ bạn có thể cần triển khai trong các trang web của mình. Ngoài việc cung cấp code để bạn có thể dùng làm điểm khởi đầu trong dự án, những công thức này còn làm nổi bật các cách sử dụng khác nhau của các đặc tả layout và những lựa chọn bạn có thể thực hiện với tư cách là nhà phát triển.

> [!NOTE]
> Nếu bạn mới làm quen với CSS layout, trước tiên bạn có thể muốn xem qua [mô-đun học tập CSS layout](/en-US/docs/Learn_web_development/Core/CSS_layout), vì đây sẽ cung cấp cho bạn nền tảng cơ bản cần thiết để sử dụng các công thức ở đây.

## Các công thức

| Công thức                             | Mô tả                                                                                                 | Phương pháp layout                                                                                   |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| [Media objects][media-objects]        | Một hộp hai cột với hình ảnh ở một bên và văn bản mô tả ở bên kia, ví dụ: bài đăng mạng xã hội.       | [CSS grid][css-grid], phương án dự phòng {{cssxref("float")}}, kích thước {{cssxref("fit-content")}} |
| [Columns][columns]                    | Khi nào nên chọn multi-column layout, flexbox hoặc grid cho các cột của bạn.                          | [CSS grid][css-grid], [Multicol][multicol], [Flexbox][flexbox]                                       |
| [Center an element][center]           | Cách căn giữa một phần tử theo chiều ngang và chiều dọc.                                              | [Flexbox][flexbox], [Box Alignment][box-alignment]                                                   |
| [Sticky footers][sticky-footers]      | Tạo footer nằm ở dưới cùng của container hoặc viewport khi nội dung ngắn hơn.                         | [CSS grid][css-grid], [Flexbox][flexbox]                                                             |
| [Split navigation][split-navigation]  | Một mẫu điều hướng trong đó một số liên kết được tách biệt về mặt hiển thị với các liên kết còn lại.  | [Flexbox][flexbox], {{cssxref("margin")}}                                                            |
| [Breadcrumb navigation][breadcrumb]   | Tạo danh sách các liên kết để cho phép người dùng điều hướng trở lại trong cấu trúc phân cấp trang.   | [Flexbox][flexbox]                                                                                   |
| [List group with badges][list-badges] | Danh sách các mục có huy hiệu để hiển thị số đếm.                                                     | [Flexbox][flexbox], [Box Alignment][box-alignment]                                                   |
| [Pagination][pagination]              | Liên kết đến các trang nội dung (chẳng hạn như kết quả tìm kiếm).                                     | [Flexbox][flexbox], [Box Alignment][box-alignment]                                                   |
| [Card][card]                          | Một thành phần card, hiển thị trong lưới các card.                                                    | [Grid Layout][css-grid]                                                                              |
| [Grid wrapper][grid-wrapper]          | Để căn chỉnh nội dung grid trong một wrapper trung tâm, đồng thời cho phép các phần tử vượt ra ngoài. | [CSS grid][css-grid]                                                                                 |

[media-objects]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Media_objects
[columns]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Column_layouts
[center]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Center_an_element
[sticky-footers]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Sticky_footers
[split-navigation]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Split_navigation
[breadcrumb]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Breadcrumb_navigation
[list-badges]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/List_group_with_badges
[pagination]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Pagination
[card]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Card
[grid-wrapper]: /en-US/docs/Web/CSS/How_to/Layout_cookbook/Grid_wrapper
[css-grid]: /en-US/docs/Web/CSS/Guides/Grid_layout
[multicol]: /en-US/docs/Web/CSS/Guides/Multicol_layout
[flexbox]: /en-US/docs/Web/CSS/Guides/Flexible_box_layout
[box-alignment]: /en-US/docs/Web/CSS/Guides/Box_alignment

## Đóng góp một công thức

Cũng như với tất cả MDN, chúng tôi rất mong bạn đóng góp một công thức theo cùng định dạng như những công thức được hiển thị ở trên. Xem [hướng dẫn thêm công thức Layout Cookbook](/en-US/docs/Web/CSS/How_to/Layout_cookbook/Contribute_a_recipe) để có mẫu và hướng dẫn viết ví dụ của riêng bạn.
