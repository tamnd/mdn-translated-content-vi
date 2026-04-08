---
title: <content-distribution>
slug: Web/CSS/Reference/Values/content-distribution
page-type: css-type
spec-urls: https://drafts.csswg.org/css-align/#typedef-content-distribution
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated", "liệt kê")}} **`<content-distribution>`** được sử dụng bởi các thuộc tính {{cssxref("justify-content")}} và {{cssxref("align-content")}}, và viết tắt {{cssxref("place-content")}}, để phân phối không gian thừa của container giữa các {{glossary("alignment subject", "đối tượng căn chỉnh")}} của nó.

## Cú pháp

```plain
<content-distribution> = space-between | space-around | space-evenly | stretch
```

## Giá trị

Các giá trị từ khóa sau được biểu diễn bởi thuật ngữ ngữ pháp `<content-distribution>`:

- `space-between`
  - : Phân phối đều {{glossary("alignment subject", "đối tượng căn chỉnh")}} bên trong {{glossary("alignment container", "container căn chỉnh")}}. Mục đầu tiên được đặt sát với cạnh bắt đầu của container căn chỉnh, mục cuối cùng được đặt sát với cạnh kết thúc của container căn chỉnh, và các mục còn lại được phân phối đều sao cho khoảng cách giữa bất kỳ hai mục liền kề nào là bằng nhau. Căn chỉnh dự phòng mặc định cho `space-between` là `safe flex-start` cho bố cục flex, và `start` trong các trường hợp khác. Nếu chỉ có một mục, mục đó sẽ sát với cạnh bắt đầu.

- `space-around`
  - : Các mục được phân phối đều trong container, với một khoảng cách nửa kích thước ở mỗi đầu. Khoảng cách giữa bất kỳ hai mục liền kề nào là bằng nhau, và khoảng cách trước mục đầu tiên và sau mục cuối cùng bằng một nửa kích thước các khoảng cách khác. Căn chỉnh dự phòng mặc định cho `space-around` là `safe center`. Nếu container chỉ có một phần tử con, mục đó sẽ được căn giữa.

- `space-evenly`
  - : Các mục được phân phối đều trong container, với một khoảng cách đầy đủ ở mỗi đầu. Khoảng cách giữa bất kỳ hai mục liền kề nào, trước mục đầu tiên, và sau mục cuối cùng đều bằng nhau. Căn chỉnh dự phòng mặc định cho `space-evenly` là `safe center`. Nếu container chỉ có một phần tử con, mục đó sẽ được căn giữa.

- `stretch`
  - : Nếu kích thước kết hợp của các mục nhỏ hơn kích thước container, bất kỳ mục nào có thể tăng kích thước sẽ được tăng kích thước bằng nhau (không theo tỷ lệ), trong khi vẫn tôn trọng các ràng buộc đặt ra bởi {{cssxref("max-height")}}, {{cssxref("max-width")}}, hoặc chức năng tương đương, sao cho kích thước kết hợp của các mục lấp đầy chính xác container. Căn chỉnh dự phòng mặc định cho `stretch` là `flex-start` trong flexbox, và `start` trong các chế độ bố cục khác. Nếu chỉ có một mục, và mục đó có thể tăng kích thước, nó sẽ tăng để lấp đầy container.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("align-content")}}, {{cssxref("justify-content")}}, {{cssxref("place-content")}}
- Các kiểu dữ liệu căn chỉnh hộp khác: {{cssxref("baseline-position")}}, {{cssxref("content-position")}}, {{cssxref("overflow-position")}}, và {{cssxref("self-position")}}
- Mô-đun [CSS box alignment](/vi/docs/Web/CSS/Guides/Box_alignment)
- Mô-đun [CSS flexible box layout](/vi/docs/Web/CSS/Guides/Flexible_box_layout)
- Mô-đun [CSS grid layout](/vi/docs/Web/CSS/Guides/Grid_layout)
