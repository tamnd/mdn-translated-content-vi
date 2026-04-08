---
title: grid-template-rows
slug: Web/CSS/Reference/Properties/grid-template-rows
page-type: css-property
browser-compat: css.properties.grid-template-rows
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`grid-template-rows`** định nghĩa tên đường và hàm kích thước track của {{glossary("grid_row", "hàng lưới")}}.

{{InteractiveExample("CSS Demo: grid-template-rows")}}

```css interactive-example-choice
grid-template-rows: auto;
```

```css interactive-example-choice
grid-template-rows: 40px 4em 40px;
```

```css interactive-example-choice
grid-template-rows: 1fr 2fr 1fr;
```

```css interactive-example-choice
grid-template-rows: 3ch auto minmax(10px, 60px);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
      <div>Four</div>
      <div>Five</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 10px;
  width: 200px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
grid-template-rows: none;

/* Giá trị <track-list> */
grid-template-rows: 100px 1fr;
grid-template-rows: [line-name] 100px;
grid-template-rows: [line-name1] 100px [line-name2 line-name3];
grid-template-rows: minmax(100px, 1fr);
grid-template-rows: fit-content(40%);
grid-template-rows: repeat(3, 200px);
grid-template-rows: subgrid;
grid-template-rows: masonry;

/* Giá trị <auto-track-list> */
grid-template-rows: 200px repeat(auto-fill, 100px) 300px;
grid-template-rows:
  minmax(100px, max-content)
  repeat(auto-fill, 200px) 20%;
grid-template-rows:
  [line-name1] 100px [line-name2]
  repeat(auto-fit, [line-name3 line-name4] 300px)
  100px;
grid-template-rows:
  [line-name1 line-name2] 100px
  repeat(auto-fit, [line-name1] 300px) [line-name3];

/* Giá trị toàn cục */
grid-template-rows: inherit;
grid-template-rows: initial;
grid-template-rows: revert;
grid-template-rows: revert-layer;
grid-template-rows: unset;
```

Thuộc tính này có thể được chỉ định là:

- từ khóa `none`
- hoặc giá trị `<track-list>`
- hoặc giá trị `<auto-track-list>`.

### Giá trị

- `none`
  - : Từ khóa chỉ ra rằng không có lưới tường minh. Tất cả các hàng sẽ được tạo ẩn và kích thước của chúng sẽ được xác định bởi thuộc tính {{cssxref("grid-auto-rows")}}.
- `[line-name]`
  - : Một {{cssxref("custom-ident")}} chỉ định tên cho đường ở vị trí đó. Định danh có thể là bất kỳ chuỗi hợp lệ nào ngoài các từ dành riêng `span` và `auto`. Các đường có thể có nhiều tên cách nhau bởi dấu cách trong dấu ngoặc vuông, ví dụ `[line-name-a line-name-b]`.
- {{cssxref("&lt;length&gt;")}}
  - : Một độ dài không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Một giá trị {{cssxref("percentage", "&lt;percentage&gt;")}} không âm, tương đối so với kích thước block của vùng chứa lưới. Nếu kích thước vùng chứa lưới phụ thuộc vào kích thước của các track, trình duyệt xử lý phần trăm như `auto` cho mục đích tính kích thước nội tại của vùng chứa lưới. Phần trăm sau đó được giải quyết dựa trên kích thước vùng chứa lưới kết quả để bố cục lưới và các phần tử của nó. Trình duyệt có thể điều chỉnh đóng góp kích thước nội tại của track vào kích thước vùng chứa lưới và có thể tăng kích thước cuối cùng của track bằng lượng tối thiểu để thỏa mãn phần trăm đó.
- {{cssxref("&lt;flex_value&gt;","&lt;flex&gt;")}}
  - : Một đơn vị không âm với đơn vị `fr` chỉ định hệ số flex của track. Mỗi track có kích thước `<flex>` chiếm một phần không gian còn lại tỷ lệ với hệ số flex của nó. Khi xuất hiện ngoài ký hiệu `minmax()`, nó ngụ ý một giá trị tối thiểu tự động (tức là `minmax(auto, <flex>)`).
- {{cssxref("max-content")}}
  - : Từ khóa đại diện cho đóng góp nội dung tối đa lớn nhất của các phần tử lưới chiếm track lưới.
- {{cssxref("min-content")}}
  - : Từ khóa đại diện cho đóng góp nội dung tối thiểu lớn nhất của các phần tử lưới chiếm track lưới.
- {{cssxref("minmax", "minmax(min, max)")}}
  - : Ký hiệu hàm định nghĩa khoảng kích thước, lớn hơn hoặc bằng _min_, và nhỏ hơn hoặc bằng _max_. Nếu _max_ nhỏ hơn _min_, thì _max_ bị bỏ qua và hàm được xử lý như _min_. Là giá trị tối đa, một giá trị `<flex>` đặt hệ số flex của track. Không hợp lệ khi là giá trị tối thiểu.
- `auto`
  - : Là giá trị tối đa, đại diện cho kích thước {{cssxref("max-content")}} lớn nhất của các phần tử trong track đó.

    Là giá trị tối thiểu, đại diện cho kích thước tối thiểu lớn nhất của các phần tử trong track đó (được chỉ định bởi các thuộc tính {{cssxref("min-width")}}/{{cssxref("min-height")}} của các phần tử). Điều này thường tương ứng với kích thước {{cssxref("min-content")}}, nhưng không phải lúc nào cũng vậy.

    Nếu được dùng ngoài ký hiệu {{cssxref("minmax()")}}, `auto` đại diện cho khoảng giữa giá trị tối thiểu và tối đa được mô tả ở trên. Trong hầu hết các trường hợp, điều này hoạt động tương tự như `minmax(min-content,max-content)`.

    > [!NOTE]
    > Kích thước track `auto` (và chỉ kích thước track `auto`) có thể được kéo dãn bởi các thuộc tính {{cssxref("align-content")}} và {{cssxref("justify-content")}}. Do đó, mặc định, một track có kích thước `auto` sẽ chiếm bất kỳ không gian còn lại nào trong vùng chứa lưới.

- {{cssxref("fit-content_function", "fit-content( [ &lt;length&gt; | &lt;percentage&gt; ] )")}}
  - : Biểu diễn công thức `min(max-content, max(auto, argument))`, được tính toán tương tự như `auto` (tức là `minmax(auto, max-content)`), ngoại trừ kích thước track bị giới hạn ở _argument_ nếu nó lớn hơn giá trị tối thiểu `auto`.
- {{cssxref("repeat", "repeat( [ &lt;positive-integer&gt; | auto-fill | auto-fit ] , &lt;track-list&gt; )")}}
  - : Biểu diễn một đoạn lặp của danh sách track, cho phép viết gọn hơn một số lượng lớn các hàng có mẫu lặp lại.
- [`masonry`](/en-US/docs/Web/CSS/Guides/Grid_layout/Masonry_layout)
  - : Chỉ ra rằng trục này nên được bố cục theo thuật toán masonry.
- [`subgrid`](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid)
  - : Chỉ ra rằng lưới sẽ áp dụng phần span của lưới cha trên trục đó. Thay vì được chỉ định rõ ràng, kích thước của các hàng/cột lưới sẽ được lấy từ định nghĩa của lưới cha.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định kích thước hàng lưới

#### HTML

```html
<div id="grid">
  <div id="areaA">A</div>
  <div id="areaB">B</div>
</div>
```

#### CSS

```css
#grid {
  display: grid;
  height: 100px;
  grid-template-rows: 30px 1fr;
}

#areaA {
  background-color: lime;
}

#areaB {
  background-color: yellow;
}
```

#### Kết quả

{{EmbedLiveSample("Specifying_grid_row_sizes", "40px", "100px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-template")}}
- [Khái niệm cơ bản của bố cục lưới: track lưới](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#grid_tracks)
- Video: [Defining a grid](https://gridbyexample.com/video/series-define-a-grid/)
- [Subgrid](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid)
