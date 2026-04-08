---
title: repeat()
slug: Web/CSS/Reference/Values/repeat
page-type: css-function
browser-compat: css.properties.grid-template-columns.repeat
sidebar: cssref
---

Hàm **`repeat()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) biểu diễn một đoạn lặp lại của [danh sách track](/vi/docs/Web/CSS/Guides/Grid_layout/Basic_concepts), cho phép viết một số lượng lớn các cột hoặc hàng có cùng mẫu lặp lại theo dạng gọn hơn.

{{InteractiveExample("CSS Demo: repeat()")}}

```css interactive-example-choice
grid-template-columns: repeat(2, 60px);
```

```css interactive-example-choice
grid-template-columns: 1fr repeat(2, 60px);
```

```css interactive-example-choice
grid-template-columns: repeat(2, 20px 1fr);
```

```css interactive-example-choice
grid-template-columns: repeat(auto-fill, 40px);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div></div>
      <div></div>
      <div></div>
      <div></div>
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
```

Hàm này có thể được sử dụng trong các thuộc tính CSS grid {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}}.

## Cú pháp

```css
/* Giá trị <track-repeat> */
repeat(4, 1fr)
repeat(4, [col-start] 250px [col-end])
repeat(4, [col-start] 60% [col-end])
repeat(4, [col-start] 1fr [col-end])
repeat(4, [col-start] min-content [col-end])
repeat(4, [col-start] max-content [col-end])
repeat(4, [col-start] auto [col-end])
repeat(4, [col-start] minmax(100px, 1fr) [col-end])
repeat(4, [col-start] fit-content(200px) [col-end])
repeat(4, 10px [col-start] 30% [col-middle] auto [col-end])
repeat(4, [col-start] min-content [col-middle] max-content [col-end])

/* Giá trị <auto-repeat> */
repeat(auto-fill, 250px)
repeat(auto-fit, 250px)
repeat(auto-fill, [col-start] 250px [col-end])
repeat(auto-fit, [col-start] 250px [col-end])
repeat(auto-fill, [col-start] minmax(100px, 1fr) [col-end])
repeat(auto-fill, 10px [col-start] 30% [col-middle] 400px [col-end])

/* Giá trị <fixed-repeat> */
repeat(4, 250px)
repeat(4, [col-start] 250px [col-end])
repeat(4, [col-start] 60% [col-end])
repeat(4, [col-start] minmax(100px, 1fr) [col-end])
repeat(4, [col-start] fit-content(200px) [col-end])
repeat(4, 10px [col-start] 30% [col-middle] 400px [col-end])
```

Hàm `repeat()` nhận hai đối số:

- **số lần lặp lại**: đối số đầu tiên chỉ định số lần danh sách track sẽ được lặp lại. Nó được chỉ định bằng một giá trị số nguyên từ 1 trở lên, hoặc với các từ khóa [`auto-fill`](#auto-fill) hoặc [`auto-fit`](#auto-fit). Các từ khóa này lặp lại tập hợp các track nhiều lần nhất có thể để lấp đầy vùng chứa grid.
- **tracks**: đối số thứ hai chỉ định tập hợp các track sẽ được lặp lại. Về cơ bản, nó bao gồm một hoặc nhiều giá trị, trong đó mỗi giá trị đại diện cho kích thước của track đó. Mỗi kích thước được chỉ định bằng giá trị [`<track-size>`](#track-size) hoặc giá trị [`<fixed-size>`](#fixed-size). Bạn cũng có thể chỉ định một hoặc nhiều [tên đường kẻ](/vi/docs/Web/CSS/Guides/Grid_layout/Named_grid_lines) trước hoặc sau mỗi track, bằng cách cung cấp giá trị [`<line-names>`](#line-names) trước và/hoặc sau kích thước track.

Nếu bạn sử dụng [`auto-fill`](#auto-fill) hoặc [`auto-fit`](#auto-fit) để đặt số lần lặp lại, bạn chỉ có thể chỉ định kích thước track bằng kiểu [`<fixed-size>`](#fixed-size), không phải kiểu [`<track-size>`](#track-size). Điều này cho chúng ta ba dạng cú pháp chính cho `repeat()`:

- `<track-repeat>`, sử dụng:
  - một số nguyên để đặt số lần lặp lại
  - các giá trị [`<track-size>`](#track-size) để đặt kích thước track.
- `<auto-repeat>`, sử dụng:
  - [`auto-fill`](#auto-fill) hoặc [`auto-fit`](#auto-fit) để đặt số lần lặp lại
  - [`<fixed-size>`](#fixed-size) để đặt kích thước track.
- `<fixed-repeat>`, sử dụng:
  - một số nguyên để đặt số lần lặp lại
  - các giá trị [`<fixed-size>`](#fixed-size) để đặt kích thước track.

Nếu một khai báo thuộc tính sử dụng `<auto-repeat>`, thì nó chỉ được phép sử dụng `<fixed-repeat>` cho bất kỳ lời gọi `repeat()` bổ sung nào. Ví dụ, đây là cú pháp không hợp lệ, vì nó kết hợp dạng `<auto-repeat>` với dạng `<track-repeat>`:

```css example-bad
.wrapper {
  grid-template-columns:
    repeat(auto-fill, 10px)
    repeat(2, minmax(min-content, max-content));
}
```

Có một dạng thứ tư, `<name-repeat>`, được sử dụng để thêm tên đường kẻ vào các subgrid. Nó chỉ được dùng với từ khóa [`subgrid`](/vi/docs/Web/CSS/Guides/Grid_layout/Subgrid) và chỉ chỉ định tên đường kẻ, không phải kích thước track.

### Giá trị

- `<fixed-size>`
  - : Một trong các dạng sau:
    - một giá trị {{cssxref("&lt;length-percentage&gt;")}}
    - hàm {{cssxref("minmax()")}} với:
      - `min` là giá trị {{cssxref("&lt;length-percentage&gt;")}}
      - `max` là một trong: giá trị {{cssxref("&lt;length-percentage&gt;")}}, giá trị {{cssxref("&lt;flex&gt;")}}, hoặc một trong các từ khóa: [`min-content`](#min-content), [`max-content`](#max-content), hoặc [`auto`](#auto)
    - hàm {{cssxref("minmax()")}} với:
      - `min` là giá trị {{cssxref("&lt;length-percentage&gt;")}} hoặc một trong các từ khóa: [`min-content`](#min-content), [`max-content`](#max-content), hoặc [`auto`](#auto)
      - `max` là giá trị {{cssxref("&lt;length-percentage&gt;")}}.
- {{cssxref("&lt;flex&gt;")}}
  - : Một kích thước không âm với đơn vị `fr` chỉ định hệ số flex của track. Mỗi track có kích thước `<flex>` chiếm một phần không gian còn lại theo tỷ lệ với hệ số flex của nó.
- {{cssxref("&lt;length&gt;")}}
  - : Một độ dài số nguyên dương.
- `<line-names>`
  - : Không hoặc nhiều giá trị {{cssxref("&lt;custom-ident&gt;")}}, phân tách bằng dấu cách và được bao trong dấu ngoặc vuông, như: `[first header-start]`.
- {{cssxref("&lt;percentage&gt;")}}
  - : Một phần trăm không âm so với kích thước inline của vùng chứa grid trong các track cột, và kích thước block của vùng chứa grid trong các track hàng. Nếu kích thước của vùng chứa grid phụ thuộc vào kích thước các track, thì `<percentage>` phải được xử lý là `auto`. Tác nhân người dùng có thể điều chỉnh đóng góp kích thước nội tại của track vào kích thước vùng chứa grid và tăng kích thước cuối cùng của track lên mức tối thiểu để đáp ứng phần trăm.
- `<track-size>`
  - : Một trong các dạng sau:
    - giá trị {{cssxref("&lt;length-percentage&gt;")}}, giá trị {{cssxref("&lt;flex&gt;")}}, hoặc một trong các từ khóa: [`min-content`](#min-content), [`max-content`](#max-content), hoặc [`auto`](#auto)
    - hàm {{cssxref("minmax()")}} với:
      - `min` là giá trị {{cssxref("&lt;length-percentage&gt;")}}, hoặc một trong các từ khóa: [`min-content`](#min-content), [`max-content`](#max-content), hoặc [`auto`](#auto)
      - `max` là giá trị {{cssxref("&lt;length-percentage&gt;")}}, giá trị {{cssxref("&lt;flex&gt;")}}, hoặc một trong các từ khóa: [`min-content`](#min-content), [`max-content`](#max-content), hoặc [`auto`](#auto)
    - hàm {{cssxref("fit-content()")}}, được truyền một giá trị {{cssxref("&lt;length-percentage&gt;")}}.
- `auto`
  - : Là giá trị tối đa, giống với `max-content`. Là giá trị tối thiểu, nó biểu diễn kích thước tối thiểu lớn nhất (như được chỉ định bởi {{cssxref("min-width")}}/{{cssxref("min-height")}}) của các mục grid chiếm track grid.
- `auto-fill`
  - : Nếu vùng chứa grid có kích thước xác định hoặc tối đa trong trục liên quan, thì số lần lặp lại là số nguyên dương lớn nhất có thể mà không làm grid tràn ra ngoài vùng chứa. Xử lý mỗi track theo hàm định kích thước track tối đa (mỗi giá trị độc lập được dùng để xác định `grid-template-rows` hoặc `grid-template-columns`), nếu nó xác định. Nếu không, theo hàm định kích thước track tối thiểu, và tính đến grid-gap. Nếu bất kỳ số lần lặp nào gây tràn, thì số lần lặp là `1`. Ngược lại, nếu vùng chứa grid có kích thước tối thiểu xác định trong trục liên quan, số lần lặp là số nguyên dương nhỏ nhất đáp ứng yêu cầu tối thiểu đó. Ngược lại, danh sách track được chỉ định chỉ lặp một lần.
- `auto-fit`
  - : Hoạt động giống `auto-fill`, ngoại trừ sau khi đặt các mục grid, bất kỳ track lặp trống nào đều bị thu gọn. Một track trống là track không có mục grid trong luồng được đặt vào hoặc kéo dài qua nó. (Điều này có thể dẫn đến tất cả các track bị thu gọn, nếu tất cả đều trống.)

    Một track bị thu gọn được xử lý như có một hàm định kích thước track cố định duy nhất là `0px`, và các khoảng cách ở hai bên của nó cũng bị thu gọn.

    Để tìm số lượng track tự động lặp, tác nhân người dùng làm tròn xuống kích thước track đến giá trị do tác nhân người dùng chỉ định (ví dụ: `1px`), để tránh chia cho không.

- {{cssxref("max-content")}}
  - : Biểu diễn đóng góp max-content lớn nhất của các mục grid chiếm track grid.
- {{cssxref("min-content")}}
  - : Biểu diễn đóng góp min-content lớn nhất của các mục grid chiếm track grid.

## Cú pháp chính thức

{{CSSSyntaxRaw(`<track-repeat> <auto-repeat> <fixed-repeat> <name-repeat>`)}}

## Ví dụ

### Chỉ định các cột grid bằng repeat()

#### HTML

```html
<div id="container">
  <div>This item is 50 pixels wide.</div>
  <div>Item with flexible width.</div>
  <div>This item is 50 pixels wide.</div>
  <div>Item with flexible width.</div>
  <div>Inflexible item of 100 pixels width.</div>
</div>
```

#### CSS

```css
#container {
  display: grid;
  grid-template-columns: repeat(2, 50px 1fr) 100px;
  grid-gap: 5px;
  box-sizing: border-box;
  height: 200px;
  width: 100%;
  background-color: #8cffa0;
  padding: 10px;
}

#container > div {
  background-color: #8ca0ff;
  padding: 5px;
}
```

#### Kết quả

{{EmbedLiveSample("Specifying_grid_columns_using_repeat", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-template")}}
- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-auto-columns")}}
- {{cssxref("grid-auto-rows")}}
- {{cssxref("grid-auto-flow")}}
- [Bố cục dựa trên đường kẻ với CSS grid](/vi/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Vùng mẫu grid: các cách viết tắt định nghĩa grid](/vi/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas#grid_definition_shorthands)
