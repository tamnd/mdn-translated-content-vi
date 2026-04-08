---
title: place-self
slug: Web/CSS/Reference/Properties/place-self
page-type: css-shorthand-property
browser-compat: css.properties.place-self
sidebar: cssref
---

Thuộc tính viết tắt [CSS](/en-US/docs/Web/CSS) **`place-self`** cho phép bạn căn chỉnh một mục riêng lẻ theo cả hướng khối và hướng nội tuyến cùng lúc (tức là các thuộc tính {{cssxref("align-self")}} và {{cssxref("justify-self")}}). Thuộc tính này áp dụng cho các hộp cấp khối, hộp có vị trí tuyệt đối và các mục grid. Nếu giá trị thứ hai không có, giá trị đầu tiên cũng sẽ được dùng cho nó.

{{InteractiveExample("CSS Demo: place-self")}}

```css interactive-example-choice
place-self: stretch center;
```

```css interactive-example-choice
place-self: center start;
```

```css interactive-example-choice
place-self: start end;
```

```css interactive-example-choice
place-self: end center;
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
  grid-auto-rows: 80px;
  grid-gap: 10px;
}

.example-container > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Các thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("align-self")}}
- {{cssxref("justify-self")}}

## Cú pháp

```css
/* Căn chỉnh theo vị trí */
place-self: auto center;
place-self: normal start;
place-self: center normal;
place-self: start auto;
place-self: end normal;
place-self: self-start auto;
place-self: self-end normal;
place-self: flex-start auto;
place-self: flex-end normal;
place-self: anchor-center;

/* Căn chỉnh theo baseline */
place-self: baseline normal;
place-self: first baseline auto;
place-self: last baseline normal;
place-self: stretch auto;

/* Giá trị toàn cục */
place-self: inherit;
place-self: initial;
place-self: revert;
place-self: revert-layer;
place-self: unset;
```

### Các giá trị

- `auto`
  - : Tính toán thành giá trị {{cssxref("align-items")}} của phần tử cha.
- `normal`
  - : Hiệu ứng của từ khóa này phụ thuộc vào chế độ bố cục đang dùng:
    - Trong bố cục có vị trí tuyệt đối, từ khóa hoạt động như `start` trên các hộp có vị trí tuyệt đối _được thay thế_, và như `stretch` trên _tất cả các_ hộp có vị trí tuyệt đối khác.
    - Ở vị trí tĩnh của bố cục có vị trí tuyệt đối, từ khóa hoạt động như `stretch`.
    - Đối với các mục flex, từ khóa hoạt động như `stretch`.
    - Đối với các mục grid, từ khóa dẫn đến hành vi tương tự như `stretch`, ngoại trừ các hộp có {{glossary("aspect ratio")}} hoặc kích thước nội tại thì hoạt động như `start`.
    - Thuộc tính này không áp dụng cho các hộp cấp khối và ô bảng.

- `self-start`
  - : Căn chỉnh các mục sát với cạnh của vùng chứa căn chỉnh tương ứng với phía bắt đầu của mục trên trục chéo.
- `self-end`
  - : Căn chỉnh các mục sát với cạnh của vùng chứa căn chỉnh tương ứng với phía kết thúc của mục trên trục chéo.
- `flex-start`
  - : Cạnh lề cross-start của mục flex được sát với cạnh cross-start của dòng.
- `flex-end`
  - : Cạnh lề cross-end của mục flex được sát với cạnh cross-end của dòng.
- `center`
  - : Hộp lề của mục flex được căn giữa trong dòng trên trục chéo. Nếu kích thước chéo của mục lớn hơn flex container, nó sẽ tràn đều theo cả hai hướng.
- `baseline`, `first baseline`. `last baseline`
  - : Xác định sự tham gia vào căn chỉnh baseline đầu tiên hoặc cuối cùng: căn chỉnh baseline căn chỉnh của baseline đầu tiên hoặc cuối cùng của hộp với baseline tương ứng trong tập baseline đầu tiên hoặc cuối cùng chia sẻ của tất cả các hộp trong nhóm chia sẻ baseline của nó.
    Căn chỉnh dự phòng cho `first baseline` là `start`, cho `last baseline` là `end`.
- `stretch`
  - : Nếu kích thước kết hợp của các mục theo trục chéo nhỏ hơn kích thước của vùng chứa căn chỉnh và mục có kích thước `auto`, kích thước của nó được tăng đều nhau (không theo tỉ lệ), trong khi vẫn tôn trọng các ràng buộc áp đặt bởi {{cssxref("max-height")}}/{{cssxref("max-width")}} (hoặc chức năng tương đương), để kích thước kết hợp của tất cả các mục có kích thước `auto` lấp đầy hoàn toàn vùng chứa căn chỉnh theo trục chéo.
- `anchor-center`
  - : Trong trường hợp các phần tử [có vị trí neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning), căn chỉnh mục vào trung tâm của phần tử neo liên kết theo hướng khối và nội tuyến. Xem [Căn giữa trên neo bằng `anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center).

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Minh họa cơ bản

Trong ví dụ sau, chúng ta có bố cục grid 2 x 2. Ban đầu grid container có giá trị {{cssxref("justify-items")}} và {{cssxref("align-items")}} là `stretch` — mặc định — khiến các mục grid kéo dài trên toàn bộ chiều rộng của ô.

Mục grid thứ hai, thứ ba và thứ tư được gán các giá trị `place-self` khác nhau, để minh họa cách những giá trị này ghi đè các vị trí mặc định. Các giá trị này khiến các mục grid chỉ rộng/cao bằng chiều rộng/chiều cao nội dung, và căn chỉnh ở các vị trí khác nhau trong ô, theo hướng khối và hướng nội tuyến.

#### HTML

```html
<article class="container">
  <span>First</span>
  <span>Second</span>
  <span>Third</span>
  <span>Fourth</span>
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
  grid-auto-rows: 80px;
  grid-gap: 10px;
  margin: 20px;
  width: 300px;
}

span:nth-child(2) {
  place-self: start center;
}

span:nth-child(3) {
  place-self: center start;
}

span:nth-child(4) {
  place-self: end;
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

{{EmbedLiveSample('Basic_demonstration', '100%', 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("align-self")}}
- {{cssxref("justify-self")}}
- [Khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- Mô-đun [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
