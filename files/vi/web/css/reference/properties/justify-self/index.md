---
title: justify-self
slug: Web/CSS/Reference/Properties/justify-self
page-type: css-property
browser-compat: css.properties.justify-self
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`justify-self`** đặt cách một hộp được căn chỉnh bên trong alignment container của nó dọc theo trục thích hợp.

{{InteractiveExample("CSS Demo: justify-self")}}

```css interactive-example-choice
justify-self: stretch;
```

```css interactive-example-choice
justify-self: center;
```

```css interactive-example-choice
justify-self: start;
```

```css interactive-example-choice
justify-self: end;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">One</div>
    <div>Two</div>
    <div>Three</div>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  display: grid;
  width: 220px;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 40px;
  grid-gap: 10px;
}

.example-container > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

Hiệu ứng của thuộc tính này phụ thuộc vào chế độ layout chúng ta đang sử dụng:

- Trong block-level layout, nó căn chỉnh một mục bên trong containing block của nó trên trục inline.
- Đối với các phần tử được định vị tuyệt đối, nó căn chỉnh một mục bên trong containing block của nó trên trục inline, tính đến các giá trị offset của top, left, bottom và right.
- Trong table cell layout, thuộc tính này _bị bỏ qua_. Đọc thêm về [alignment in block, absolute positioned and table layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables).
- Trong flexbox layout, thuộc tính này _bị bỏ qua_. Đọc thêm về [alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox).
- Trong grid layout, nó căn chỉnh một mục bên trong grid area của nó trên trục inline. Đọc thêm về [alignment in grid layouts](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout).

## Cú pháp

```css
/* Từ khóa cơ bản */
justify-self: auto;
justify-self: normal;
justify-self: stretch;

/* Căn chỉnh theo vị trí */
justify-self: center; /* Đóng gói mục quanh trung tâm */
justify-self: start; /* Đóng gói mục từ điểm bắt đầu */
justify-self: end; /* Đóng gói mục từ điểm kết thúc */
justify-self: flex-start; /* Tương đương với 'start'. Lưu ý rằng justify-self bị bỏ qua trong flexbox layout. */
justify-self: flex-end; /* Tương đương với 'end'. Lưu ý rằng justify-self bị bỏ qua trong flexbox layout. */
justify-self: self-start;
justify-self: self-end;
justify-self: left; /* Đóng gói mục từ bên trái */
justify-self: right; /* Đóng gói mục từ bên phải */
justify-self: anchor-center;

/* Căn chỉnh baseline */
justify-self: baseline;
justify-self: first baseline;
justify-self: last baseline;

/* Căn chỉnh tràn (chỉ dành cho căn chỉnh theo vị trí) */
justify-self: safe center;
justify-self: unsafe center;

/* Giá trị toàn cục */
justify-self: inherit;
justify-self: initial;
justify-self: revert;
justify-self: revert-layer;
justify-self: unset;
```

Thuộc tính này có thể nhận một trong ba dạng khác nhau:

- Từ khóa cơ bản: một trong các giá trị từ khóa `normal`, `auto`, hoặc `stretch`.
- Căn chỉnh baseline: từ khóa `baseline`, cộng thêm tùy chọn một trong `first` hoặc `last`.
- Căn chỉnh theo vị trí:
  - một trong: `center`, `start`, `end`, `flex-start`, `flex-end`, `self-start`, `self-end`, `left`, hoặc `right`.
  - Cộng thêm tùy chọn `safe` hoặc `unsafe`.

### Giá trị

- `auto`
  - : Giá trị được dùng là giá trị của thuộc tính `justify-items` của hộp cha, trừ khi hộp không có cha, hoặc được định vị tuyệt đối, trong những trường hợp này `auto` đại diện cho `normal`.
- `normal`
  - : Hiệu ứng của từ khóa này phụ thuộc vào chế độ layout chúng ta đang sử dụng:
    - Trong block-level layout, từ khóa là từ đồng nghĩa của `start`.
    - Trong absolutely-positioned layout, từ khóa hoạt động như `start` trên các hộp absolutely-positioned _replaced_, và như `stretch` trên _tất cả các_ hộp absolutely-positioned khác.
    - Trong table cell layout, từ khóa này không có nghĩa vì thuộc tính này _bị bỏ qua_.
    - Trong flexbox layout, từ khóa này không có nghĩa vì thuộc tính này _bị bỏ qua_.
    - Trong grid layout, từ khóa này dẫn đến hành vi tương tự như `stretch`, ngoại trừ các hộp có tỷ lệ khung hình hoặc kích thước nội tại, ở đó nó hoạt động như `start`.

- `start`
  - : Mục được đặt sát nhau về phía cạnh bắt đầu của alignment container trên trục thích hợp.
- `end`
  - : Mục được đặt sát nhau về phía cạnh kết thúc của alignment container trên trục thích hợp.
- `flex-start`
  - : Đối với các mục không phải con của flex container, giá trị này được xử lý như `start`.
- `flex-end`
  - : Đối với các mục không phải con của flex container, giá trị này được xử lý như `end`.
- `self-start`
  - : Mục được đặt sát với cạnh của alignment container ở phía bắt đầu của mục, trên trục thích hợp.
- `self-end`
  - : Mục được đặt sát với cạnh của alignment container ở phía kết thúc của mục, trên trục thích hợp.
- `center`
  - : Các mục được đặt sát nhau về phía trung tâm của alignment container.
- `left`
  - : Các mục được đặt sát nhau về phía cạnh trái của alignment container. Nếu trục của thuộc tính không song song với trục inline, giá trị này hoạt động như `start`.
- `right`
  - : Các mục được đặt sát nhau về phía cạnh phải của alignment container trên trục thích hợp. Nếu trục của thuộc tính không song song với trục inline, giá trị này hoạt động như `start`.
- `baseline`, `first baseline`, `last baseline`
  - : Chỉ định sự tham gia vào căn chỉnh baseline đầu tiên hoặc cuối cùng: căn chỉnh baseline căn chỉnh của tập baseline đầu tiên hoặc cuối cùng của hộp với baseline tương ứng trong tập baseline đầu tiên hoặc cuối cùng được chia sẻ của tất cả các hộp trong nhóm chia sẻ baseline.
    Căn chỉnh dự phòng cho `first baseline` là `start`, căn chỉnh cho `last baseline` là `end`.
- `stretch`
  - : Nếu kích thước kết hợp của các mục nhỏ hơn kích thước của alignment container, bất kỳ mục kích thước `auto` nào cũng có kích thước được tăng lên đều nhau (không theo tỷ lệ), trong khi vẫn tôn trọng các ràng buộc do {{CSSxRef("max-height")}}/{{CSSxRef("max-width")}} (hoặc chức năng tương đương) áp đặt, sao cho kích thước kết hợp lấp đầy chính xác alignment container.
- `anchor-center`
  - : Trong trường hợp các phần tử [anchor-positioned](/en-US/docs/Web/CSS/Guides/Anchor_positioning), căn chỉnh mục vào trung tâm của phần tử anchor liên kết theo hướng inline. Xem [Centering on the anchor using `anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center).
- `safe`
  - : Nếu kích thước của mục tràn alignment container, mục thay vào đó được căn chỉnh như thể chế độ căn chỉnh là `start`.
- `unsafe`
  - : Bất kể kích thước tương đối của mục và alignment container, giá trị căn chỉnh đã cho được tôn trọng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa cơ bản

Trong ví dụ sau chúng ta có grid layout 2 x 2. Ban đầu grid container được gán giá trị `justify-items` là `stretch` — mặc định — khiến các grid item co giãn trên toàn bộ chiều rộng của các ô.

Các grid item thứ hai, ba và bốn sau đó được gán các giá trị khác nhau của `justify-self`, để cho thấy cách chúng ghi đè giá trị `justify-items`. Các giá trị này khiến các grid item chỉ rộng bằng nội dung của chúng và căn chỉnh ở các vị trí khác nhau trong các ô.

#### HTML

```html
<article class="container">
  <span>First child</span>
  <span>Second child</span>
  <span>Third child</span>
  <span>Fourth child</span>
</article>
```

#### CSS

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
  letter-spacing: 1px;
}

article {
  background-color: red;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 40px;
  grid-gap: 10px;
  margin: 20px;
  width: 300px;
  justify-items: stretch;
}

span:nth-child(2) {
  justify-self: start;
}

span:nth-child(3) {
  justify-self: center;
}

span:nth-child(4) {
  justify-self: end;
}

article span {
  background-color: black;
  color: white;
  margin: 1px;
  text-align: center;
}

article,
span {
  padding: 10px;
  border-radius: 7px;
}
```

#### Kết quả

{{EmbedLiveSample('Basic_demonstration', '100%', 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) module
- {{CSSxRef("justify-items")}}
- {{cssxref("align-self")}}
- {{cssxref("place-self")}}
