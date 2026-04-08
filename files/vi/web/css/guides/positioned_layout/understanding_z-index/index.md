---
title: Understanding z-index
slug: Web/CSS/Guides/Positioned_layout/Understanding_z-index
page-type: guide
sidebar: cssref
---

Trong các trường hợp cơ bản nhất, khi văn bản, hình ảnh và các phần tử khác được sắp xếp trên trang mà không chồng lấp, các trang [HTML](/en-US/docs/Web/HTML) có thể được xem là hai chiều. Trong những trường hợp đó, có một luồng hiển thị duy nhất, và tất cả các phần tử đều biết về không gian mà các phần tử khác chiếm. CSS không đơn giản như vậy — CSS positioning, transformation, containment và các tính năng khác có thể khiến các phần tử chồng lấp nhau. Trong hướng dẫn này, chúng ta giới thiệu thuộc tính {{cssxref("z-index")}}, cho phép bạn đặt các phần tử trước hoặc sau các phần tử khác trong cùng [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context).

## Các lớp trên trục z

Các phần tử được hiển thị trên trang bao gồm một chuỗi các hộp. Mỗi hộp có một vị trí trong ba chiều. Ngoài vị trí inline và block, các hộp nằm dọc theo chiều thứ ba gọi là _trục z_. Việc kiểm soát vị trí trên trục z của một phần tử đặc biệt quan trọng khi các hộp phần tử chồng lấp nhau về mặt trực quan. Một số giá trị thuộc tính có thể khiến các phần tử chồng lấp. Thuộc tính {{cssxref("z-index")}} cung cấp cho bạn cách kiểm soát cách chúng chồng lấp!

Theo mặc định, các hộp phần tử được hiển thị trên Layer 0. Thuộc tính `z-index` cho phép bạn định vị các phần tử trên các lớp khác nhau dọc theo trục z, ngoài lớp hiển thị mặc định. Vị trí của mỗi phần tử dọc theo trục z ảo (giá trị z-index) được biểu thị bằng một số nguyên (dương, âm hoặc không) và kiểm soát thứ tự stacking trong quá trình hiển thị. Số lớn hơn có nghĩa là phần tử gần người xem hơn.

Nếu bạn chưa quen với thuật ngữ 'trục z', hãy tưởng tượng trang như một ngăn xếp các lớp, mỗi lớp có một số được gán. Các lớp được hiển thị theo thứ tự số, với số lớn hơn xuất hiện trên số nhỏ hơn (_X_ trong bảng dưới đây đại diện cho một số nguyên dương tùy ý):

| Lớp          | Mô tả                              |
| ------------ | ---------------------------------- |
| Bottom layer | Xa người xem nhất                  |
| Layer -X     | Các lớp có giá trị `z-index` âm    |
| Layer 0      | Lớp hiển thị mặc định              |
| Layer X      | Các lớp có giá trị `z-index` dương |
| Top layer    | Gần người xem nhất                 |

## Các phần tử trong luồng bình thường

Theo mặc định, khi không có thuộc tính `z-index` nào được chỉ định, các phần tử được hiển thị trên lớp hiển thị mặc định (Layer 0).

Hãy xem xét ba phần tử sau:

```html live-sample___example1 live-sample___example2 live-sample___example3
<div id="div1">#1</div>
<div id="div2">#2</div>
<div id="div3">#3</div>
```

Không có thuộc tính positioning nào được áp dụng, các phần tử này chảy bình thường theo thứ tự trong tài liệu, lần lượt nối tiếp nhau mà không chồng lấp.

```css live-sample___example1 live-sample___example2 live-sample___example3 live-sample___example4
div {
  height: 100px;
  width: 100px;
  outline: 1px dotted;
  line-height: 100px;
  font-size: 40px;
  text-align: center;
  font-family: "Helvetica", "Arial", sans-serif;
}

#div1 {
  background-color: lightpink;
}

#div2 {
  background-color: lightyellow;
}

#div3 {
  background-color: lightgreen;
}
```

{{EmbedLiveSample("Example1", 600, 340)}}

## Hành vi xếp lớp mặc định

Để xếp chồng các phần tử, chúng ta có thể [định vị](/en-US/docs/Web/CSS/Reference/Properties/position#types_of_positioning) chúng.
Nếu chúng ta dùng absolute positioning để đặt chúng vào (gần như) cùng một chỗ, thứ tự stacking mặc định theo thứ tự nguồn: phần tử đầu tiên trong HTML xuất hiện ở lớp dưới cùng và phần tử cuối cùng xuất hiện ở lớp trên cùng.

```css live-sample___example2 live-sample___example3 live-sample___example4
div {
  position: absolute;
}

#div1 {
  top: 0;
  left: 0;
}

#div2 {
  top: 10px;
  left: 10px;
}

#div3 {
  top: 20px;
  left: 20px;
}
```

{{EmbedLiveSample("Example2", 600, 130)}}

## Sắp xếp lại các lớp

Chúng ta có thể dùng thuộc tính CSS {{cssxref("z-index")}} để định vị mỗi phần tử dọc theo trục z, sắp xếp lại thứ tự stacking một cách hiệu quả.

Bằng cách thêm các giá trị `z-index`, chúng ta thay đổi thứ tự lớp mặc định:

```css live-sample___example3 live-sample___example4
#div1 {
  z-index: 5;
}

#div2 {
  z-index: -9;
}

#div3 {
  z-index: 0;
}
```

{{EmbedLiveSample("Example3", 600, 130)}}

Phần tử có giá trị `z-index` thấp nhất xuất hiện ở lớp dưới cùng. Phần tử có giá trị `z-index` cao nhất xuất hiện ở lớp trên cùng. Trong ví dụ này, `-9` là giá trị thấp nhất, vì vậy `#div2` nằm sau tất cả các phần tử khác. Phần tử đầu tiên trong thứ tự nguồn, `#div1`, có giá trị lớn nhất, vì vậy nó xuất hiện trên tất cả các phần tử khác.

## Tác động của stacking context

Sử dụng `z-index` có vẻ khá đơn giản lúc đầu: một thuộc tính duy nhất được gán một số nguyên duy nhất với hành vi có vẻ dễ hiểu. Khi `z-index` được áp dụng cho các phân cấp phức tạp của các phần tử HTML, nhiều người thấy hành vi kết quả khó hiểu hoặc khó đoán.

Nếu các phần tử không phải là anh em, hành vi stacking có thể trở nên phức tạp hơn vì mỗi phần tử có thể thuộc về một [stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) khác nhau. Điều này được thể hiện trong ví dụ dưới đây.

```html live-sample___example4
<section>
  <div id="div1">#1</div>
  <div id="div2">#2</div>
</section>
<div id="div3">#3</div>
```

```css live-sample___example4
section {
  position: absolute;
  z-index: 2;
}
```

{{EmbedLiveSample("Example4", 600, 130)}}

Mặc dù giá trị `z-index` của `#div3` (`0`) lớn hơn giá trị của `#div2` (`-9`), `#div2` vẫn xuất hiện trên `#div3` vì `#div1` và `#div2` được lồng trong một stacking context riêng biệt được tạo bởi `<section>`. Phần tử `<section>` và `#div3` là anh em, và vì z-index của phần tử `<section>` lớn hơn z-index của `#div3` (`2` so với `0`), `#div3` được đặt sau `<section>` và tất cả nội dung của `<section>`. Để biết thêm chi tiết về chủ đề này, hãy xem hướng dẫn [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) của chúng tôi.

## Kết luận

Như chúng ta đã thấy trong hướng dẫn này, `z-index` cung cấp cách kiểm soát cách các phần tử xếp chồng dọc theo trục z. Bạn đã học cách các giá trị số nguyên của thuộc tính `z-index` có thể được dùng để thay đổi thứ tự stacking. Tuy nhiên, như đã minh họa trong ví dụ cuối, thứ tự stacking có thể phức tạp. Thứ tự stacking tuân theo một loạt các quy tắc stacking phức tạp để đảm bảo rằng tất cả các trình duyệt xếp chồng cùng nội dung theo cùng một cách, cung cấp tính nhất quán và khả năng đoán trước. Điều quan trọng là phải hiểu [các tính năng tạo stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context#features_creating_stacking_contexts) và cách [stacking context lồng nhau](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context#nested_stacking_contexts) ảnh hưởng đến thứ tự lớp.

## Xem thêm

- [Stacking without the `z-index` property](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index)
- [Stacking floating elements](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements)
- [Using `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index)
- [Stacking context](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
