---
title: <box-edge>
slug: Web/CSS/Reference/Values/box-edge
page-type: css-type
spec-urls: https://drafts.csswg.org/css-box-4/#keywords
sidebar: cssref
---

Các kiểu giá trị **`<box-edge>`** đại diện cho một từ khóa [cạnh hộp](/vi/docs/Web/CSS/Guides/Box_model/Introduction), chẳng hạn như [`content-box`](#content-box) và [`border-box`](#border-box). Các từ khóa box-edge được sử dụng để định nghĩa các khía cạnh khác nhau của mô hình hộp của một phần tử cũng như cách các phần tử được định vị và hiển thị trên màn hình.

Các từ khóa box-edge là thành phần của, nhưng không giới hạn ở, các kiểu dữ liệu `<visual-box>`, `<layout-box>`, `<paint-box>`, `<coord-box>`, và `<geometry-box>`. Các kiểu này được áp dụng cho các thuộc tính như {{cssxref("transform-box")}} và {{cssxref("background-clip")}}.

## Cú pháp

```plain
<visual-box> = content-box | padding-box | border-box /* ba giá trị <box> */
<layout-box> = <visual-box> | margin-box /* các giá trị <shape-box> */
<paint-box> = <visual-box> | fill-box | stroke-box
<coord-box> = <paint-box> | fill-box | stroke-box | view-box
<geometry-box> = <shape-box> | fill-box | stroke-box | view-box
```

### Giá trị

Một `<box-edge>` có thể thuộc kiểu `<visual-box>`, `<layout-box>`, `<paint-box>`, `<coord-box>`, hoặc `<geometry-box>`.

- `<visual-box>`
  - : Đề cập đến hộp hình chữ nhật được tạo ra cho một phần tử như người dùng nhìn thấy trên trang web. Nó bao gồm nội dung, đệm và viền của phần tử. Còn được gọi là `<box>`, giá trị này loại trừ vùng lề. Kiểu giá trị này được sử dụng cho các thuộc tính {{cssxref("background-clip")}} và {{cssxref("overflow-clip-margin")}}.

- `<layout-box>`
  - : Đề cập đến không gian mà một phần tử chiếm, bao gồm nội dung, đệm, viền và lề. Kiểu giá trị này được sử dụng cho mục đích bố cục và định vị. Còn được gọi là `<shape-box>`, kiểu giá trị này được sử dụng cho thuộc tính {{cssxref("shape-outside")}}.

- `<paint-box>`
  - : Đề cập đến vùng trong hộp bố cục được sử dụng để hiển thị nội dung một cách trực quan. Điều này bao gồm vùng mà nền và viền của phần tử được vẽ. Do vùng có thể vẽ của phần tử không bao gồm lề, giá trị này loại trừ `margin-box`.

- `<coord-box>`
  - : Đề cập đến hộp tọa độ được sử dụng để định vị và định kích thước một phần tử trong vùng chứa cha. Nó được sử dụng để kiểm soát cách nội dung chảy xung quanh các cạnh của hộp. Nó loại trừ vùng lề. Kiểu giá trị này được sử dụng cho thuộc tính {{cssxref("offset-path")}}.

- `<geometry-box>`
  - : Định nghĩa hộp tham chiếu cho một [hình dạng cơ bản](/vi/docs/Web/CSS/Reference/Values/basic-shape), hoặc nếu được chỉ định một mình, sẽ làm cho các cạnh của hộp được chỉ định, bao gồm bất kỳ hình dạng góc nào (chẳng hạn như {{cssxref("border-radius")}}), trở thành đường cắt. Kiểu giá trị này được sử dụng cho các thuộc tính {{cssxref("clip-path")}}, {{cssxref("mask-clip")}}, và {{cssxref("mask-origin")}} cũng như thuộc tính SVG {{SVGAttr("clip-path")}}.

### Từ khóa

Các từ khóa `<box-edge>` được định nghĩa như sau:

- `content-box`
  - : Đề cập đến cạnh ngoài của vùng nội dung của hộp. Hộp nội dung là hộp trong cùng. Vùng nội dung chứa nội dung thực tế, chẳng hạn như văn bản, hình ảnh, hoặc các phần tử HTML khác. Trong SVG, giá trị này được xử lý như `fill-box`.

- `padding-box`
  - : Đề cập đến cạnh ngoài của đệm của hộp. Nếu không có đệm ở một phía, thì giá trị tương tự như `content-box`. Trong SVG, `padding-box` được xử lý như `fill-box`. Vùng đệm bao quanh vùng nội dung, bắt đầu từ cạnh ngoài của hộp nội dung.

- `border-box`
  - : Đề cập đến cạnh ngoài của viền của hộp. Nếu không có viền ở một phía, thì giá trị tương tự như `padding-box`. Trong SVG, `border-box` được xử lý như `stroke-box`. Vùng viền bao quanh vùng đệm, bắt đầu từ cạnh ngoài của hộp đệm.

- `margin-box`
  - : Đề cập đến cạnh ngoài của lề của hộp. Nếu không có lề ở một phía, thì giá trị tương tự như `border-box`. Trong SVG, `margin-box` được xử lý như `stroke-box`.

- `fill-box`
  - : Đề cập đến hộp bao quanh đối tượng trong SVG. Trong CSS, `fill-box` được xử lý như `content-box`. Nó được sử dụng để bọc nội dung xung quanh các cạnh được xác định bởi các giá trị `coord-box`.

- `stroke-box`
  - : Đề cập đến hộp bao quanh nét vẽ trong SVG. Trong CSS, `stroke-box` được xử lý như `border-box`. Nó được sử dụng để xác định hình dạng của phần tử khi áp dụng nét vẽ.

- `view-box`
  - : Đề cập đến hộp nguồn gốc của phần tử viewport SVG gần nhất. Hộp nguồn gốc là một hình chữ nhật có chiều rộng và chiều cao của hệ tọa độ người dùng SVG ban đầu được thiết lập bởi thuộc tính {{svgattr("viewBox")}} cho phần tử đó. Hộp nguồn gốc được định vị sao cho góc trên bên trái của nó được neo tại [nguồn gốc hệ tọa độ](/vi/docs/Web/API/CSSOM_view_API/Coordinate_systems). Trong CSS, `view-box` được xử lý như `border-box`.
    > [!NOTE]
    > Khi viewport SVG không được neo tại nguồn gốc, hộp nguồn gốc không tương ứng với viewport SVG.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Mô-đun [mô hình hộp CSS](/vi/docs/Web/CSS/Guides/Box_model)
