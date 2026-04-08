---
title: gap
slug: Web/CSS/Reference/Properties/gap
page-type: css-shorthand-property
browser-compat: css.properties.gap
sidebar: cssref
---

Thuộc tính **`gap`** [CSS](/en-US/docs/Web/CSS) [rút gọn](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) đặt khoảng cách (còn gọi là {{glossary("gutters")}}) giữa các hàng và cột. Thuộc tính này áp dụng cho các vùng chứa [multi-column](/en-US/docs/Web/CSS/Guides/Multicol_layout), [flex](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), và [grid](/en-US/docs/Web/CSS/Guides/Grid_layout).

{{InteractiveExample("CSS Demo: gap")}}

```css interactive-example-choice
gap: 0;
```

```css interactive-example-choice
gap: 10%;
```

```css interactive-example-choice
gap: 1em;
```

```css interactive-example-choice
gap: 10px 20px;
```

```css interactive-example-choice
gap: calc(20px + 10%);
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
  width: 200px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Thuộc tính cấu thành

Thuộc tính này là dạng rút gọn của các thuộc tính CSS sau:

- {{cssxref("row-gap")}}
- {{cssxref("column-gap")}}

## Cú pháp

```css
/* Một giá trị <length> */
gap: 20px;
gap: 1em;
gap: 3vmin;
gap: 0.5cm;

/* Một giá trị <percentage> */
gap: 16%;
gap: 100%;

/* Hai giá trị <length> */
gap: 20px 10px;
gap: 1em 0.5em;
gap: 3vmin 2vmax;
gap: 0.5cm 2mm;

/* Một hoặc hai giá trị <percentage> */
gap: 16% 100%;
gap: 21px 82%;

/* Giá trị calc() */
gap: calc(10% + 20px);
gap: calc(20px + 10%) calc(10% - 5px);

/* Giá trị toàn cục */
gap: inherit;
gap: initial;
gap: revert;
gap: revert-layer;
gap: unset;
```

### Giá trị

Thuộc tính này được chỉ định là một giá trị cho `<'row-gap'>`, theo sau tùy chọn là một giá trị cho `<'column-gap'>`. Nếu `<'column-gap'>` bị bỏ qua, nó được đặt bằng với giá trị `<'row-gap'>`. Cả `<'row-gap'>` và `<'column-gap'>` đều có thể được chỉ định là `<length>` hoặc `<percentage>`.

- {{CSSxRef("&lt;length&gt;")}}
  - : Chỉ định độ rộng của rãnh ngăn cách các cột, {{glossary("flex item","flex items")}}, các dòng flex, và {{glossary("grid lines")}}.
- {{CSSxRef("&lt;percentage&gt;")}}
  - : Chỉ định độ rộng của rãnh ngăn cách các cột, flex items, các dòng flex, và grid lines so với kích thước của phần tử.

## Mô tả

Thuộc tính này xác định khoảng cách giữa các cột trong [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout), giữa các flex items và dòng flex trong [bố cục hộp linh hoạt CSS](/en-US/docs/Web/CSS/Guides/Flexible_box_layout), và giữa các hàng và cột trong [bố cục lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout).

Các khoảng trống được tạo ra có chiều rộng hoặc chiều cao bằng kích thước đã chỉ định của khoảng trống, giống như một mục hoặc track trống. Khoảng cách nhìn thấy giữa các phần tử có thể khác với giá trị `gap` được cung cấp vì lề, padding và căn chỉnh phân phối có thể làm tăng khoảng cách giữa các phần tử vượt quá mức được xác định bởi `gap`.

Trong bố cục lưới, giá trị đầu tiên xác định rãnh giữa các hàng và giá trị thứ hai xác định rãnh giữa các cột. Trong cả bố cục lưới và flex, nếu chỉ có một giá trị được bao gồm, giá trị đó được sử dụng cho cả hai chiều.

Với các vùng chứa flex, giá trị đầu tiên là khoảng cách giữa các flex items hay giữa các dòng flex phụ thuộc vào hướng. Các flex items được trình bày theo hàng hoặc cột tùy thuộc vào giá trị của thuộc tính {{cssxref("flex-direction")}}. Với hàng (`row` (mặc định) hoặc `row-reverse`), giá trị đầu tiên xác định khoảng cách giữa các dòng flex, và giá trị thứ hai xác định khoảng cách giữa các items trong mỗi dòng. Với cột (`column` hoặc `column-reverse`), giá trị đầu tiên xác định khoảng cách giữa các flex items trong một dòng flex, và giá trị thứ hai xác định khoảng cách giữa mỗi dòng flex.

Trong các vùng chứa nhiều cột, giá trị đầu tiên xác định khoảng cách giữa các cột. Một đường phân chia có thể được thêm vào "khoảng trống" này bằng cách sử dụng thuộc tính {{cssxref("column-rule-style")}} hoặc rút gọn {{cssxref("column-rule")}}.

Các giá trị khoảng cách phần trăm luôn được tính dựa trên kích thước [content box](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử vùng chứa. Hành vi được xác định rõ ràng và nhất quán trên các chế độ bố cục khi kích thước vùng chứa là xác định. Vì ba chế độ bố cục này (nhiều cột, flex và lưới) xử lý kích thước phần trăm theo chu kỳ khác nhau, `gap` cũng làm vậy. Trong bố cục lưới, kích thước phần trăm theo chu kỳ được tính bằng 0 để xác định đóng góp {{glossary("intrinsic size")}} nhưng được tính theo content box của phần tử khi bố cục nội dung. Hai ví dụ bên dưới minh họa các giá trị khoảng cách phần trăm với [kích thước vùng chứa rõ ràng](#giá_trị_khoảng_cách_phần_trăm_và_kích_thước_vùng_chứa_rõ_ràng) và [kích thước vùng chứa ngầm định](#giá_trị_khoảng_cách_phần_trăm_và_kích_thước_vùng_chứa_ngầm_định) trong phần ví dụ.

Các phiên bản đầu của đặc tả gọi thuộc tính này là `grid-gap`, và để duy trì tính tương thích với các trang web cũ, các trình duyệt vẫn chấp nhận `grid-gap` như một bí danh cho `gap`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Bố cục Flex

#### HTML

```html
<div id="flexbox">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#flexbox {
  display: flex;
  flex-wrap: wrap;
  width: 300px;
  gap: 20px 5px;
}

#flexbox > div {
  border: 1px solid green;
  background-color: lime;
  flex: 1 1 auto;
  width: 100px;
  height: 50px;
}
```

#### Kết quả

{{EmbedLiveSample("Flex_layout", "auto", 250)}}

### Bố cục Grid

#### HTML

```html
<div id="grid">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#grid {
  display: grid;
  height: 200px;
  grid-template: repeat(3, 1fr) / repeat(3, 1fr);
  gap: 20px 5px;
}

#grid > div {
  border: 1px solid green;
  background-color: lime;
}
```

#### Kết quả

{{EmbedLiveSample("Grid_layout", "auto", 250)}}

### Bố cục nhiều cột

#### HTML

```html
<p class="content-box">
  This is some multi-column text with a 40px column gap created with the CSS
  <code>gap</code> property. Don't you think that's fun and exciting? I sure do!
</p>
```

#### CSS

```css
.content-box {
  column-count: 3;
  gap: 40px;
}
```

#### Kết quả

{{EmbedLiveSample("Multi-column_layout", "auto", "120px")}}

### Giá trị khoảng cách phần trăm và kích thước vùng chứa rõ ràng

Nếu vùng chứa có kích thước cố định được đặt, thì việc tính toán giá trị khoảng cách phần trăm dựa trên kích thước của vùng chứa. Vì vậy, hành vi gap nhất quán trên tất cả các bố cục. Trong ví dụ sau, có hai vùng chứa, một với bố cục lưới và một với bố cục flex. Các vùng chứa có năm phần tử con màu đỏ 20x20px. Cả hai vùng chứa được đặt rõ ràng cao 200px bằng `height: 200px` và khoảng cách được đặt với `gap: 12.5% 0`.

```html
<span>Grid</span>
<div id="grid">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
<span>Flex</span>
<div id="flex">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
```

```css hidden
body > div {
  background-color: #cccccc;
  width: 200px;
  flex-flow: column;
}
```

```css
#grid {
  display: inline-grid;
  height: 200px;
  gap: 12.5% 0;
}

#flex {
  display: inline-flex;
  height: 200px;
  gap: 12.5% 0;
}

#grid > div,
#flex > div {
  background-color: coral;
  width: 20px;
  height: 20px;
}
```

{{EmbedLiveSample("Explicit container size", "auto", "200px")}}

Bây giờ hãy kiểm tra các phần tử grid và flex bằng cách sử dụng [tab Inspector trong Web Developer Tools](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/open_the_inspector/index.html). Để xem các khoảng trống thực tế, hãy di chuột qua thẻ `<div id="grid">` và `<div id="flex">` trong inspector. Bạn sẽ nhận thấy khoảng trống giống nhau trong cả hai trường hợp, là 25px.

### Giá trị khoảng cách phần trăm và kích thước vùng chứa ngầm định

Nếu kích thước không được đặt rõ ràng trên vùng chứa, thì khoảng cách phần trăm hoạt động khác nhau trong trường hợp bố cục lưới và flex. Trong ví dụ sau, các vùng chứa không có chiều cao được đặt rõ ràng.

```html hidden
<span>Grid</span>
<div id="grid">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
<span>Flex</span>
<div id="flex">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
```

```css hidden
body > div {
  background-color: #cccccc;
  width: 200px;
}

#grid {
  display: inline-grid;
  gap: 12.5% 0;
}

#flex {
  display: inline-flex;
  gap: 12.5% 0;
  flex-flow: column;
}

#grid > div,
#flex > div {
  background-color: coral;
  width: 20px;
  height: 20px;
}
```

{{EmbedLiveSample("Implicit container size", "auto", "200px")}}

Trong trường hợp bố cục lưới, khoảng cách phần trăm không đóng góp vào chiều cao thực tế của lưới. Chiều cao của vùng chứa được tính bằng khoảng cách `0px`, vì vậy chiều cao thực tế là 100px (20px x 5). Sau đó khoảng cách phần trăm thực tế được tính dựa trên chiều cao content box, khoảng cách là `12.5px` (100px x 12.5%). Khoảng cách được áp dụng ngay trước khi hiển thị. Do đó lưới vẫn cao 100px nhưng tràn ra ngoài do khoảng cách phần trăm được thêm vào ngay trước khi hiển thị.

Trong trường hợp bố cục flex, khoảng cách phần trăm luôn cho kết quả là giá trị không.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("row-gap")}}
- {{CSSxRef("column-gap")}}
- [Basic concepts of grid layout: gutters](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#gutters)
- [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) module
- [CSS flexible box layout](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) module
- [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) module
- [CSS multi-column layout](/en-US/docs/Web/CSS/Guides/Multicol_layout) module
