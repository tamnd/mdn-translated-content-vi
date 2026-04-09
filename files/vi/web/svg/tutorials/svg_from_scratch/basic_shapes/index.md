---
title: Hình cơ bản
slug: Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Positions", "Web/SVG/Tutorials/SVG_from_scratch/Paths") }}

Có một số hình cơ bản được dùng cho hầu hết việc vẽ SVG. Mục đích của những hình này khá rõ ngay từ tên gọi của chúng. Một số tham số xác định vị trí và kích thước của chúng được nêu ra, nhưng một trang tham chiếu phần tử có lẽ sẽ chứa các mô tả chính xác và đầy đủ hơn cùng các thuộc tính khác sẽ không được đề cập ở đây. Tuy nhiên, vì chúng được dùng trong hầu hết các tài liệu SVG, nên cần có một phần giới thiệu cho chúng.

Để chèn một hình, bạn tạo một phần tử trong tài liệu. Các phần tử khác nhau tương ứng với các hình khác nhau và nhận các tham số khác nhau để mô tả kích thước và vị trí của các hình đó. Một số phần hơi trùng lặp vì chúng có thể được tạo bởi các hình khác, nhưng tất cả đều có mặt để tiện cho bạn và để giữ cho tài liệu SVG của bạn ngắn gọn và dễ đọc nhất có thể. Tất cả các hình cơ bản được hiển thị trong hình sau.

![Chuỗi tám hình và bản vẽ khác nhau. Ở góc trên bên trái, một hình vuông viền đen theo sau bởi một hình vuông bo góc viền đen. Bên dưới bên trái, một hình tròn viền đỏ theo sau bởi một hình ellipse viền đỏ. Bên dưới bên trái là một đường màu vàng, theo sau bởi một đường zigzag màu vàng. Bên dưới các đường màu vàng, một ngôi sao viền xanh lá và ở cuối hình là một đường lượn sóng màu xanh dương.](shapes.png)

Mã để tạo ra hình ảnh đó trông đại khái như sau:

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="250" version="1.1" xmlns="http://www.w3.org/2000/svg">

  <rect x="10" y="10" width="30" height="30" stroke="black" fill="transparent" stroke-width="5"/>
  <rect x="60" y="10" rx="10" ry="10" width="30" height="30" stroke="black" fill="transparent" stroke-width="5"/>

  <circle cx="25" cy="75" r="20" stroke="red" fill="transparent" stroke-width="5"/>
  <ellipse cx="75" cy="75" rx="20" ry="5" stroke="red" fill="transparent" stroke-width="5"/>

  <line x1="10" x2="50" y1="110" y2="150" stroke="orange" stroke-width="5"/>
  <polyline points="60 110 65 120 70 115 75 130 80 125 85 140 90 135 95 150 100 145"
      stroke="orange" fill="transparent" stroke-width="5"/>

  <polygon points="50 160 55 180 70 180 60 190 65 205 50 195 35 205 40 190 30 180 45 180"
      stroke="green" fill="transparent" stroke-width="5"/>

  <path d="M20,230 Q40,205 50,230 T90,230" fill="none" stroke="blue" stroke-width="5"/>
</svg>
```

> [!NOTE]
> Các thuộc tính `stroke`, `stroke-width`, và `fill` sẽ được giải thích sau trong bài hướng dẫn.

## Hình chữ nhật

Phần tử {{SVGElement("rect")}} vẽ một hình chữ nhật trên màn hình. Có sáu thuộc tính cơ bản điều khiển vị trí và hình dạng của các hình chữ nhật trên màn hình. Hình bên phải có các tham số `rx` và `ry` được đặt, khiến nó có các góc bo tròn. Nếu chúng không được đặt, giá trị mặc định là `0`.

```xml
<rect x="10" y="10" width="30" height="30"/>
<rect x="60" y="10" rx="10" ry="10" width="30" height="30"/>
```

- `x`
  - : Vị trí x của góc trên bên trái của hình chữ nhật.
- `y`
  - : Vị trí y của góc trên bên trái của hình chữ nhật.
- `width`
  - : Chiều rộng của hình chữ nhật.
- `height`
  - : Chiều cao của hình chữ nhật.
- `rx`
  - : Bán kính x của các góc hình chữ nhật.
- `ry`
  - : Bán kính y của các góc hình chữ nhật.

## Hình tròn

Phần tử {{SVGElement("circle")}} vẽ một hình tròn trên màn hình. Nó nhận ba tham số cơ bản để xác định hình dạng và kích thước của phần tử.

```xml
<circle cx="25" cy="75" r="20"/>
```

- `r`
  - : Bán kính của hình tròn.
- `cx`
  - : Vị trí x của tâm hình tròn.
- `cy`
  - : Vị trí y của tâm hình tròn.

## Hình ellipse

Một {{SVGElement("ellipse")}} là một dạng tổng quát hơn của phần tử {{SVGElement("circle")}}, trong đó bạn có thể thay đổi riêng bán kính x và y của hình tròn (thường được gọi là các trục _semimajor_ và _semiminor_ trong toán học).

```xml
<ellipse cx="75" cy="75" rx="20" ry="5"/>
```

- `rx`
  - : Bán kính x của hình ellipse.
- `ry`
  - : Bán kính y của hình ellipse.
- `cx`
  - : Vị trí x của tâm hình ellipse.
- `cy`
  - : Vị trí y của tâm hình ellipse.

## Đường thẳng

Phần tử {{SVGElement("line")}} nhận vị trí của hai điểm làm tham số và vẽ một đường thẳng giữa chúng.

```xml
<line x1="10" x2="50" y1="110" y2="150" stroke="black" stroke-width="5"/>
```

- `x1`
  - : Vị trí x của điểm 1.
- `y1`
  - : Vị trí y của điểm 1.
- `x2`
  - : Vị trí x của điểm 2.
- `y2`
  - : Vị trí y của điểm 2.

## Polyline

Một {{SVGElement("polyline")}} là một nhóm các đoạn thẳng nối tiếp nhau. Vì danh sách điểm có thể rất dài, tất cả các điểm được đưa vào một thuộc tính:

```xml
<polyline points="60, 110 65, 120 70, 115 75, 130 80, 125 85, 140 90, 135 95, 150 100, 145"/>
```

- `points`
  - : Danh sách các điểm. Mỗi số phải được ngăn cách bởi khoảng trắng, dấu phẩy, EOL, hoặc ký tự xuống dòng, với khoảng trắng bổ sung được cho phép. Mỗi điểm phải chứa hai số: một tọa độ x và một tọa độ y. Vì vậy, danh sách `(0,0)`, `(1,1)`, và `(2,2)` có thể được viết là `0, 0 1, 1 2, 2`.

## Polygon

Một {{SVGElement("polygon")}} tương tự như {{SVGElement("polyline")}}, ở chỗ nó được tạo thành từ các đoạn thẳng nối một danh sách các điểm. Tuy nhiên, với polygon, đường đi tự động nối điểm cuối với điểm đầu, tạo thành một hình khép kín.

> [!NOTE]
> Hình chữ nhật là một loại polygon, nên polygon có thể được dùng để tạo phần tử `<rect/>` không có các góc bo tròn.

```xml
<polygon points="50, 160 55, 180 70, 180 60, 190 65, 205 50, 195 35, 205 40, 190 30, 180 45, 180"/>
```

- `points`
  - : Danh sách các điểm, mỗi số được ngăn cách bởi khoảng trắng, dấu phẩy, EOL, hoặc ký tự xuống dòng, với khoảng trắng bổ sung được cho phép. Mỗi điểm phải chứa hai số: một tọa độ x và một tọa độ y. Vì vậy, danh sách `(0,0)`, `(1,1)`, và `(2,2)` có thể được viết là `0, 0 1, 1 2, 2`. Đường vẽ sau đó đóng lại, nên một đoạn thẳng cuối cùng sẽ được vẽ từ `(2,2)` đến `(0,0)`.

## Path

Một {{SVGElement("path")}} là hình tổng quát nhất có thể dùng trong SVG. Bằng phần tử `path`, bạn có thể vẽ hình chữ nhật (có hoặc không có góc bo tròn), hình tròn, hình ellipse, polyline, và polygon. Về cơ bản là bất kỳ kiểu hình nào khác, đường Bézier, đường cong bậc hai, và nhiều hơn nữa.

Vì lý do này, [phần tiếp theo](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths) của bài hướng dẫn này sẽ tập trung vào path. Nhưng trước mắt, hãy lưu ý rằng chỉ có một tham số dùng để điều khiển hình dạng của nó.

```xml
<path d="M20,230 Q40,205 50,230 T90,230" fill="none" stroke="blue" stroke-width="5"/>
```

- `d`
  - : Danh sách các điểm và thông tin khác về cách vẽ path. Xem phần [Paths](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Paths) để biết thêm thông tin.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Positions", "Web/SVG/Tutorials/SVG_from_scratch/Paths") }}
