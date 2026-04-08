---
title: justify-items
slug: Web/CSS/Reference/Properties/justify-items
page-type: css-property
browser-compat: css.properties.justify-items
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`justify-items`** xác định {{CSSxRef("justify-self")}} mặc định cho tất cả các mục của hộp, cung cấp cho tất cả chúng cách mặc định để căn chỉnh mỗi hộp dọc theo trục thích hợp.

{{InteractiveExample("CSS Demo: justify-items")}}

```css interactive-example-choice
justify-items: stretch;
```

```css interactive-example-choice
justify-items: center;
```

```css interactive-example-choice
justify-items: start;
```

```css interactive-example-choice
justify-items: end;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 40px;
  grid-gap: 10px;
  width: 220px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

Hiệu ứng của thuộc tính này phụ thuộc vào chế độ layout chúng ta đang sử dụng:

- Trong block-level layout, nó căn chỉnh các mục bên trong containing block của chúng trên trục inline.
- Đối với các phần tử được định vị tuyệt đối, nó căn chỉnh các mục bên trong containing block của chúng trên trục inline, tính đến các giá trị offset của top, left, bottom và right.
- Trong table cell layout, thuộc tính này _bị bỏ qua_ (xem [Box alignment for block, absolutely positioned, and table layouts](/en-US/docs/Web/CSS/Guides/Box_alignment/In_block_abspos_tables))
- Trong flexbox layout, thuộc tính này _bị bỏ qua_ (xem [Box alignment in flexbox](/en-US/docs/Web/CSS/Guides/Box_alignment/In_flexbox))
- Trong grid layout, nó căn chỉnh các mục bên trong grid area của chúng trên trục inline (xem [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout))

## Cú pháp

```css
/* Từ khóa cơ bản */
justify-items: normal;
justify-items: stretch;

/* Căn chỉnh theo vị trí */
justify-items: center; /* Đóng gói các mục quanh trung tâm */
justify-items: start; /* Đóng gói các mục từ điểm bắt đầu */
justify-items: end; /* Đóng gói các mục từ điểm kết thúc */
justify-items: flex-start; /* Tương đương với 'start'. Lưu ý rằng justify-items bị bỏ qua trong flexbox layout. */
justify-items: flex-end; /* Tương đương với 'end'. Lưu ý rằng justify-items bị bỏ qua trong flexbox layout. */
justify-items: self-start;
justify-items: self-end;
justify-items: left; /* Đóng gói các mục từ bên trái */
justify-items: right; /* Đóng gói các mục từ bên phải */
justify-items: anchor-center;

/* Căn chỉnh baseline */
justify-items: baseline;
justify-items: first baseline;
justify-items: last baseline;

/* Căn chỉnh tràn (chỉ dành cho căn chỉnh theo vị trí) */
justify-items: safe center;
justify-items: unsafe center;

/* Căn chỉnh legacy */
justify-items: legacy left;
justify-items: legacy right;
justify-items: legacy center;

/* Giá trị toàn cục */
justify-items: inherit;
justify-items: initial;
justify-items: revert;
justify-items: revert-layer;
justify-items: unset;
```

Thuộc tính này có thể nhận một trong bốn dạng khác nhau:

- Từ khóa cơ bản: một trong các giá trị từ khóa `normal` hoặc `stretch`.
- Căn chỉnh baseline: từ khóa `baseline`, cộng thêm tùy chọn một trong `first` hoặc `last`.
- Căn chỉnh theo vị trí: một trong: `center`, `start`, `end`, `flex-start`, `flex-end`, `self-start`, `self-end`, `left`, hoặc `right`. Cộng thêm tùy chọn `safe` hoặc `unsafe`.
- Căn chỉnh legacy: từ khóa `legacy`, theo sau là một trong `left`, `right`, hoặc `center`.

### Giá trị

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
  - : Trong trường hợp các phần tử [anchor-positioned](/en-US/docs/Web/CSS/Guides/Anchor_positioning), căn chỉnh các mục vào trung tâm của phần tử anchor liên kết theo hướng inline. Xem [Centering on the anchor using `anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center).
- `safe`
  - : Nếu kích thước của mục tràn alignment container, mục thay vào đó được căn chỉnh như thể chế độ căn chỉnh là `start`.
- `unsafe`
  - : Bất kể kích thước tương đối của mục và alignment container, giá trị căn chỉnh đã cho được tôn trọng.
- `legacy`
  - : Làm cho giá trị được kế thừa bởi các phần tử con của hộp. Lưu ý rằng nếu một phần tử con có giá trị `justify-self: auto`, từ khóa `legacy` không được phần tử con xem xét, chỉ có giá trị `left`, `right` hoặc `center` liên kết với nó.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Minh họa cơ bản

Trong ví dụ này, chúng ta có grid layout 2 x 2. Ban đầu grid container được gán giá trị `justify-items` là `stretch` (mặc định), khiến các grid item co giãn trên toàn bộ chiều rộng của các ô.

Tuy nhiên, nếu bạn hover hoặc tab vào grid container, nó được gán giá trị `justify-items` là `center`, khiến các grid item chỉ rộng bằng nội dung của chúng và căn chỉnh vào giữa các ô.

#### HTML

```html
<article class="container" tabindex="0">
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

article:hover,
article:focus {
  justify-items: center;
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

- {{CSSxRef("justify-self")}}
- {{CSSxRef("align-items")}}
- {{CSSxRef("place-items")}} shorthand
- [Box alignment in grid layout](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [CSS box alignment](/en-US/docs/Web/CSS/Guides/Box_alignment) module
