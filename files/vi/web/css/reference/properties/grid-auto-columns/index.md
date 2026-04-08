---
title: grid-auto-columns
slug: Web/CSS/Reference/Properties/grid-auto-columns
page-type: css-property
browser-compat: css.properties.grid-auto-columns
sidebar: cssref
---

Thuộc tính **`grid-auto-columns`** [CSS](/en-US/docs/Web/CSS) chỉ định kích thước của {{glossary("grid tracks", "track")}} cột lưới được tạo ngầm hoặc mẫu các track.

{{InteractiveExample("CSS Demo: grid-auto-columns")}}

```css interactive-example-choice
grid-auto-columns: auto;
```

```css interactive-example-choice
grid-auto-columns: 1fr;
```

```css interactive-example-choice
grid-auto-columns: min-content;
```

```css interactive-example-choice
grid-auto-columns: minmax(10px, auto);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
      <div>Four</div>
      <div></div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-auto-rows: 40px;
  grid-gap: 10px;
  width: 220px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}

#example-element > div:nth-child(1) {
  grid-column: 1 / 3;
}

#example-element > div:nth-child(2) {
  grid-column: 2;
}
```

Nếu một phần tử lưới được đặt vào một cột không được xác định kích thước rõ ràng bởi {{cssxref("grid-template-columns")}}, các track {{glossary("grid", "lưới")}} ẩn sẽ được tạo ra để chứa nó. Điều này có thể xảy ra do đặt vị trí rõ ràng vào một cột nằm ngoài phạm vi, hoặc do thuật toán tự động đặt vị trí tạo thêm các cột.

## Cú pháp

```css
/* Giá trị từ khóa */
grid-auto-columns: min-content;
grid-auto-columns: max-content;
grid-auto-columns: auto;

/* Giá trị <length> */
grid-auto-columns: 100px;
grid-auto-columns: 20cm;
grid-auto-columns: 50vmax;

/* Giá trị <percentage> */
grid-auto-columns: 10%;
grid-auto-columns: 33.3%;

/* Giá trị <flex> */
grid-auto-columns: 0.5fr;
grid-auto-columns: 3fr;

/* Giá trị minmax() */
grid-auto-columns: minmax(100px, auto);
grid-auto-columns: minmax(max-content, 2fr);
grid-auto-columns: minmax(20%, 80vmax);

/* Giá trị fit-content() */
grid-auto-columns: fit-content(400px);
grid-auto-columns: fit-content(5cm);
grid-auto-columns: fit-content(20%);

/* Nhiều giá trị track-size */
grid-auto-columns: min-content max-content auto;
grid-auto-columns: 100px 150px 390px;
grid-auto-columns: 10% 33.3%;
grid-auto-columns: 0.5fr 3fr 1fr;
grid-auto-columns: minmax(100px, auto) minmax(max-content, 2fr)
  minmax(20%, 80vmax);
grid-auto-columns: 100px minmax(100px, auto) 10% 0.5fr fit-content(400px);

/* Giá trị toàn cục */
grid-auto-columns: inherit;
grid-auto-columns: initial;
grid-auto-columns: revert;
grid-auto-columns: revert-layer;
grid-auto-columns: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Là một độ dài không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Là giá trị {{cssxref("percentage", "&lt;percentage&gt;")}} không âm tương đối so với kích thước khối của vùng chứa lưới. Nếu kích thước khối của vùng chứa lưới không xác định, giá trị phần trăm được xử lý như `auto`.
- {{cssxref("&lt;flex&gt;")}}
  - : Là một chiều không âm với đơn vị `fr` chỉ định hệ số linh hoạt của track. Mỗi track có kích thước `<flex>` sẽ chiếm một phần không gian còn lại theo tỷ lệ với hệ số linh hoạt của nó.

    Khi xuất hiện ngoài ký hiệu `minmax()`, nó ngụ ý một giá trị tối thiểu tự động (tức là `minmax(auto, <flex>)`).

- {{cssxref("max-content")}}
  - : Là từ khóa đại diện cho đóng góp nội dung tối đa lớn nhất của các phần tử lưới chiếm track lưới.
- {{cssxref("min-content")}}
  - : Là từ khóa đại diện cho đóng góp nội dung tối thiểu lớn nhất của các phần tử lưới chiếm track lưới.
- {{cssxref("minmax", "minmax(min, max)")}}
  - : Là ký hiệu hàm định nghĩa phạm vi kích thước lớn hơn hoặc bằng _min_ và nhỏ hơn hoặc bằng _max_. Nếu _max_ nhỏ hơn _min_, thì _max_ bị bỏ qua và hàm được xử lý như _min_. Là giá trị tối đa, một giá trị `<flex>` đặt hệ số linh hoạt của track. Là giá trị tối thiểu, nó được xử lý như không (hoặc nội dung tối thiểu, nếu vùng chứa lưới được định kích thước theo ràng buộc nội dung tối thiểu).
- {{cssxref("fit-content_function", "fit-content( [ &lt;length&gt; | &lt;percentage&gt; ] )")}}
  - : Đại diện cho công thức `min(max-content, max(auto, argument))`, được tính toán tương tự như `auto` (tức là `minmax(auto, max-content)`), ngoại trừ kích thước track bị giới hạn tại _argument_ nếu nó lớn hơn giá trị tối thiểu `auto`.
- `auto`
  - : Là giá trị tối đa đại diện cho kích thước {{cssxref("max-content")}} lớn nhất của các phần tử trong track đó.

    Là giá trị tối thiểu đại diện cho kích thước tối thiểu lớn nhất của các phần tử trong track đó (được xác định bởi {{cssxref("min-width")}}/{{cssxref("min-height")}} của các phần tử). Điều này thường, nhưng không phải lúc nào cũng vậy, là kích thước {{cssxref("min-content")}}.

    Khi được sử dụng bên ngoài ký hiệu {{cssxref("minmax()")}}, `auto` đại diện cho phạm vi giữa giá trị tối thiểu và tối đa được mô tả ở trên. Điều này hoạt động tương tự như `minmax(min-content,max-content)` trong hầu hết các trường hợp.

    > [!NOTE]
    > Kích thước track `auto` (và chỉ kích thước track `auto`) có thể được kéo giãn bởi các thuộc tính {{cssxref("align-content")}} và {{cssxref("justify-content")}}. Do đó, theo mặc định, một track được định kích thước `auto` sẽ chiếm bất kỳ không gian còn lại nào trong vùng chứa lưới.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước cột lưới

#### HTML

```html
<div id="grid">
  <div id="item1"></div>
  <div id="item2"></div>
  <div id="item3"></div>
</div>
```

#### CSS

```css
#grid {
  height: 100px;
  display: grid;
  grid-template-areas: "a a";
  gap: 10px;
  grid-auto-columns: 200px;
}

#grid > div {
  background-color: lime;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_grid_column_size", "410px", "100px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-flow")}}
- {{cssxref("grid")}}
- [Tự động đặt vị trí trong bố cục lưới: định kích thước hàng trong lưới ẩn](/en-US/docs/Web/CSS/Guides/Grid_layout/Auto-placement#sizing_rows_in_the_implicit_grid)
- Video: [Introducing grid auto-placement and order](https://gridbyexample.com/video/series-auto-placement-order/)
