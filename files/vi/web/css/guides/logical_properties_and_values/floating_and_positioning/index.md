---
title: Logical properties for floating and positioning
short-title: For floating and positioning
slug: Web/CSS/Guides/Logical_properties_and_values/Floating_and_positioning
page-type: guide
sidebar: cssref
---

Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values) chứa các ánh xạ logic cho các giá trị vật lý của {{cssxref("float")}} và {{cssxref("clear")}}, cũng như cho các thuộc tính định vị được sử dụng trong [positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout). Hướng dẫn này xem xét cách sử dụng những ánh xạ này.

## Các thuộc tính và giá trị được ánh xạ

Bảng dưới đây trình bày chi tiết về {{glossary("logical properties")}} và các giá trị được thảo luận trong hướng dẫn này cùng với các ánh xạ {{glossary("physical properties")}} và giá trị tương ứng. Chúng giả định một {{cssxref("writing-mode")}} ngang với hướng từ trái sang phải.

| Thuộc tính hoặc giá trị logic      | Thuộc tính hoặc giá trị vật lý   |
| ---------------------------------- | -------------------------------- |
| {{cssxref("float")}}: inline-start | {{cssxref("float")}}: left       |
| {{cssxref("float")}}: inline-end   | {{cssxref("float")}}: right      |
| {{cssxref("clear")}}: inline-start | {{cssxref("clear")}}: left       |
| {{cssxref("clear")}}: inline-end   | {{cssxref("clear")}}: right      |
| {{cssxref("inset-inline-start")}}  | {{cssxref("left")}}              |
| {{cssxref("inset-inline-end")}}    | {{cssxref("right")}}             |
| {{cssxref("inset-block-start")}}   | {{cssxref("top")}}               |
| {{cssxref("inset-block-end")}}     | {{cssxref("bottom")}}            |
| {{cssxref("text-align")}}: start   | {{cssxref("text-align")}}: left  |
| {{cssxref("text-align")}}: end     | {{cssxref("text-align")}}: right |

Ngoài các thuộc tính được ánh xạ này, còn có một số thuộc tính shorthand bổ sung được tạo ra nhờ khả năng xác định chiều block và inline. Những thuộc tính này không có ánh xạ tới các thuộc tính vật lý, ngoại trừ thuộc tính {{cssxref("inset")}}.

| Thuộc tính logic            | Mục đích                                                                         |
| --------------------------- | -------------------------------------------------------------------------------- |
| {{cssxref("inset-inline")}} | Đặt cả hai giá trị inset trên cho chiều inline cùng một lúc.                     |
| {{cssxref("inset-block")}}  | Đặt cả hai giá trị inset trên cho chiều block cùng một lúc.                      |
| {{cssxref("inset")}}        | Đặt cả bốn giá trị inset cùng một lúc với ánh xạ vật lý cho giá trị multi-value. |

## Ví dụ về float và clear

Các giá trị vật lý được dùng với thuộc tính {{cssxref("float")}} và {{cssxref("clear")}} là `left`, `right` và `both`. Module CSS logical properties and values định nghĩa các giá trị `inline-start` và `inline-end` là ánh xạ của `left` và `right`.

Trong ví dụ bên dưới, hộp đầu tiên được float với `float: left`, và hộp thứ hai với `float: inline-start`.
Nếu bạn áp dụng `direction: rtl` cho selector `.inner`, hộp float-left luôn nằm bên trái, trong khi item float `inline-start` sẽ đi theo `direction` của văn bản.
Bạn có thể kết hợp điều này với `writing-mode: vertical-rl` để thấy sự khác biệt của block layout kết hợp với các giá trị `direction`.

```html live-sample___float
<div class="container">
  <div class="inner">
    <div class="physical box"></div>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale.
  </div>
  <div class="inner">
    <div class="logical box"></div>
    Turnip greens yarrow ricebean rutabaga endive cauliflower sea lettuce
    kohlrabi amaranth water spinach avocado daikon napa cabbage asparagus winter
    purslane kale.
  </div>
</div>
```

```css hidden live-sample___float
body {
  font: 1.2em / 1.5 sans-serif;
}
.container {
  display: flex;
}

.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  margin: 10px;
  width: 100px;
  height: 100px;
}
```

```css live-sample___float
.inner {
  /* direction: rtl; */
  /* writing-mode: vertical-rl; */
}

.physical {
  float: left;
}

.logical {
  float: inline-start;
}
```

{{EmbedLiveSample("float", "", "220px")}}

## Ví dụ: Thuộc tính inset cho positioned layout

CSS positioning thường cho phép chúng ta định vị một phần tử theo cách tương đối so với containing block của nó — về cơ bản, chúng ta đặt item vào bên trong so với vị trí mà nó sẽ rơi vào dựa trên normal flow. Để định vị một phần tử tương đối so với viewport, hãy dùng các thuộc tính vật lý {{cssxref("top")}}, {{cssxref("right")}}, {{cssxref("bottom")}} và {{cssxref("left")}}. Khi bạn muốn định vị liên quan đến luồng văn bản trong writing mode của mình, hãy dùng {{cssxref("inset-block-start")}}, {{cssxref("inset-block-end")}}, {{cssxref("inset-inline-start")}} và {{cssxref("inset-inline-end")}} thay thế.

Những thuộc tính này nhận giá trị là độ dài hoặc phần trăm, và liên quan đến kích thước màn hình của người dùng.

Trong ví dụ bên dưới, các thuộc tính `inset-block-start` và `inset-inline-end` được dùng để định vị hộp màu xanh bằng absolute positioning bên trong vùng có đường viền chấm xám, vùng này có `position: relative`. Thay đổi thuộc tính `writing-mode` thành `vertical-rl`, hoặc thêm `direction: rtl`, và xem hộp flow relative bám theo hướng văn bản như thế nào.

```html live-sample___positioning-inset
<div class="container">
  <div class="inner">
    <div class="physical box"></div>
  </div>
  <div class="inner">
    <div class="logical box"></div>
  </div>
</div>
```

```css hidden live-sample___positioning-inset
.container {
  display: flex;
}

.inner {
  width: 200px;
  height: 200px;
  position: relative;
  border: 2px dotted grey;
}

.box {
  border: 2px solid rgb(96 139 168);
  border-radius: 5px;
  background-color: rgb(96 139 168 / 0.2);
  padding: 10px;
  width: 100px;
  height: 100px;
}
```

```css live-sample___positioning-inset
.inner {
  writing-mode: horizontal-tb;
}

.physical {
  position: absolute;
  top: 20px;
  right: 0;
}

.logical {
  position: absolute;
  inset-block-start: 20px;
  inset-inline-end: 0;
}
```

{{EmbedLiveSample("positioning-inset", "", "250px")}}

## Shorthand hai và bốn giá trị mới

Giống như các thuộc tính khác trong module, chúng ta có các thuộc tính shorthand cho phép đặt hai hoặc bốn giá trị cùng một lúc.

- {{cssxref("inset")}} — đặt cả bốn cạnh cùng nhau với ánh xạ vật lý.
- {{cssxref("inset-inline")}} — đặt cả hai inset inline logic.
- {{cssxref("inset-block")}} — đặt cả hai inset block logic.

## Ví dụ: Giá trị logic cho text-align

Thuộc tính {{cssxref("text-align")}} có các giá trị logic liên quan đến hướng văn bản — thay vì dùng `left` và `right`, bạn có thể dùng `start` và `end`. Trong ví dụ bên dưới, `text-align: right` được đặt trong khối đầu tiên và `text-align: end` trong khối thứ hai.

Nếu bạn thay đổi giá trị `direction` thành `rtl`, bạn sẽ thấy rằng căn chỉnh vẫn giữ nguyên bên phải với khối đầu tiên, nhưng chuyển sang phần cuối logic ở bên trái trong khối thứ hai.

```html live-sample___text-align
<div class="container">
  <div class="inner physical">Aligned text</div>
  <div class="inner logical">Aligned text</div>
</div>
```

```css hidden live-sample___text-align
body {
  font: 1.2em / 1.5 sans-serif;
}

.container {
  display: flex;
}

.inner {
  width: 200px;
  border: 2px dotted grey;
  padding: 10px;
}
```

```css live-sample___text-align
.inner {
  direction: ltr;
}

.physical {
  text-align: right;
}

.logical {
  text-align: end;
}
```

{{EmbedLiveSample("text-align")}}

Cách này hoạt động nhất quán hơn khi sử dụng box alignment với start và end thay vì các hướng vật lý để căn chỉnh.
