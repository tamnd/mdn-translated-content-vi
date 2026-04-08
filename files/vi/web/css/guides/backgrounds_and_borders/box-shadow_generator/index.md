---
title: Box-shadow generator
slug: Web/CSS/Guides/Backgrounds_and_borders/Box-shadow_generator
page-type: guide
sidebar: cssref
---

Công cụ này cho phép bạn tạo hiệu ứng CSS {{cssxref("box-shadow")}}, để thêm hiệu ứng box shadow vào các đối tượng CSS của bạn.

{{EmbedGHLiveSample("css-examples/tools/box-shadow-generator/", '100%', 1000)}}

Box-shadow generator cho phép bạn thêm một hoặc nhiều box shadow vào một phần tử.

Khi mở công cụ, bạn sẽ thấy một hình chữ nhật ở phần trên bên phải của công cụ. Đó là phần tử mà bạn sẽ áp dụng shadow lên. Khi phần tử này được chọn (như khi bạn tải trang lần đầu), bạn có thể áp dụng một số kiểu dáng cơ bản cho nó:

- Đặt {{cssxref("color")}} của phần tử bằng công cụ chọn màu.
- Thêm {{cssxref("border")}} cho phần tử bằng checkbox "border".
- Sử dụng các thanh trượt để đặt các thuộc tính {{cssxref("top")}}, {{cssxref("left")}}, {{cssxref("width")}} và {{cssxref("height")}} của phần tử.

Để thêm box shadow, nhấp vào nút "+" ở góc trên bên trái. Thao tác này sẽ thêm một shadow và liệt kê nó trong cột bên trái. Bây giờ bạn có thể đặt các giá trị cho shadow mới:

- Đặt {{cssxref("color")}} của shadow bằng công cụ chọn màu.
- Đặt shadow ở dạng inset bằng checkbox "inset".
- Sử dụng các thanh trượt để đặt vị trí, độ mờ (blur) và độ lan rộng (spread) của shadow.

Để thêm shadow khác, nhấp "+" một lần nữa. Bây giờ mọi giá trị bạn đặt sẽ áp dụng cho shadow mới này. Thay đổi thứ tự áp dụng hai shadow này bằng các nút ↑ và ↓ ở góc trên bên trái. Chọn lại shadow đầu tiên bằng cách nhấp vào nó trong cột bên trái. Để cập nhật kiểu dáng của chính phần tử, hãy chọn nó bằng cách nhấp vào nút có nhãn "element" ở phía trên.

Bạn có thể thêm các pseudo-element {{cssxref("::before")}} và {{cssxref("::after")}} vào phần tử, và cũng có thể thêm box shadow cho chúng. Để chuyển đổi giữa phần tử và các pseudo-element của nó, hãy sử dụng các nút dọc theo phần trên có nhãn "element", "::before" và "::after".

Ô ở phía dưới bên phải chứa CSS cho phần tử và bất kỳ pseudo-element `::before` hoặc `::after` nào.

## Xem thêm

- Các công cụ khác:
  - [Border-image generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-image_generator)
  - [Border-radius generator](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator)
- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
