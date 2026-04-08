---
title: margin-left
slug: Web/CSS/Reference/Properties/margin-left
page-type: css-property
browser-compat: css.properties.margin-left
sidebar: cssref
---

Thuộc tính **`margin-left`** [CSS](/en-US/docs/Web/CSS) đặt [vùng lề](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#margin_area) ở phía bên trái của phần tử. Giá trị dương đặt phần tử xa hơn so với các phần tử lân cận, trong khi giá trị âm đặt nó gần hơn.

{{InteractiveExample("CSS Demo: margin-left")}}

```css interactive-example-choice
margin-left: 1em;
```

```css interactive-example-choice
margin-left: 10%;
```

```css interactive-example-choice
margin-left: 10px;
```

```css interactive-example-choice
margin-left: 0;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="col"></div>
    <div class="col transition-all" id="example-element"></div>
    <div class="col"></div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  justify-content: flex-start;
}

.col {
  width: 33.33%;
  border: solid #5b6dcd 10px;
  background-color: rgb(229 232 252 / 0.6);
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffc129;
  background-color: rgb(255 244 219 / 0.6);
}
```

Lề dọc của hai hộp liền kề có thể hợp nhất lại. Hiện tượng này được gọi là [_thu gọn lề_](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing).

Trong các trường hợp hiếm khi chiều rộng bị ràng buộc quá mức (tức là khi tất cả các giá trị `width`, `margin-left`, `border`, `padding`, vùng nội dung và `margin-right` đều được xác định), `margin-left` bị bỏ qua và sẽ có cùng giá trị tính toán như khi giá trị `auto` được chỉ định.

## Cú pháp

```css
/* Giá trị <length> */
margin-left: 10px; /* Độ dài tuyệt đối */
margin-left: 1em; /* Tương đối với kích thước văn bản */
margin-left: 5%; /* Tương đối với chiều rộng của khối chứa gần nhất */
margin-left: anchor-size(self-inline);
margin-left: calc(anchor-size(--my-anchor width, 20px) / 4);

/* Giá trị từ khóa */
margin-left: auto;

/* Giá trị toàn cục */
margin-left: inherit;
margin-left: initial;
margin-left: revert;
margin-left: revert-layer;
margin-left: unset;
```

Thuộc tính `margin-left` được chỉ định là từ khóa `auto`, hoặc một `<length>`, hoặc một `<percentage>`. Giá trị của nó có thể là dương, không hoặc âm.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của lề dưới dạng giá trị cố định.
    - Đối với _các phần tử được định vị bằng neo_, hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối với chiều rộng hoặc chiều cao của _phần tử neo_ liên kết (xem [Đặt lề phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_margin_based_on_anchor_size)).

- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của lề dưới dạng phần trăm, tương đối với kích thước nội tuyến (_chiều rộng_ trong ngôn ngữ ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Lề trái nhận một phần không gian ngang chưa sử dụng, được xác định chủ yếu bởi chế độ bố cục được dùng. Nếu cả giá trị của `margin-left` và `margin-right` đều là `auto`, không gian tính toán được phân bổ đều nhau. Bảng dưới đây tóm tắt các trường hợp khác nhau:

    <table class="standard-table">
      <thead>
        <tr>
          <th scope="col">Giá trị của {{cssxref("display")}}</th>
          <th scope="col">Giá trị của {{cssxref("float")}}</th>
          <th scope="col">Giá trị của {{cssxref("position")}}</th>
          <th scope="col">Giá trị tính toán của <code>auto</code></th>
          <th scope="col">Ghi chú</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th>
            <code>inline</code>, <code>inline-block</code>,
            <code>inline-table</code>
          </th>
          <th><em>bất kỳ</em></th>
          <th><code>static</code> hoặc <code>relative</code></th>
          <td><code>0</code></td>
          <td>Chế độ bố cục nội tuyến</td>
        </tr>
        <tr>
          <th>
            <code>block</code>, <code>inline</code>, <code>inline-block</code>,
            <code>block</code>, <code>table</code>, <code>inline-table</code>,
            <code>list-item</code>, <code>table-caption</code>
          </th>
          <th><em>bất kỳ</em></th>
          <th><code>static</code> hoặc <code>relative</code></th>
          <td>
            <code>0</code>, ngoại trừ khi cả <code>margin-left</code> và
            <code>margin-right</code> được đặt thành <code>auto</code>. Trong trường hợp đó,
            nó được đặt thành giá trị căn giữa phần tử bên trong phần tử cha.
          </td>
          <td>Chế độ bố cục khối</td>
        </tr>
        <tr>
          <th>
            <code>block</code>, <code>inline</code>, <code>inline-block</code>,
            <code>block</code>, <code>table</code>, <code>inline-table</code>,
            <code>list-item</code>, <code>table-caption</code>
          </th>
          <th><code>left</code> hoặc <code>right</code></th>
          <th><code>static</code> hoặc <code>relative</code></th>
          <td><code>0</code></td>
          <td>Chế độ bố cục khối (phần tử nổi)</td>
        </tr>
        <tr>
          <th>
            <em>bất kỳ </em><code>table-*</code><em>, ngoại trừ </em
            ><code>table-caption</code>
          </th>
          <th><em>bất kỳ</em></th>
          <th><em>bất kỳ</em></th>
          <td><code>0</code></td>
          <td>
            Các phần tử <code>table-*</code> nội bộ không có lề, hãy sử dụng
            {{ cssxref("border-spacing") }} thay thế
          </td>
        </tr>
        <tr>
          <th>
            <em>bất kỳ, ngoại trừ <code>flex</code>,</em> <code>inline-flex</code
            ><em>, hoặc </em><code>table-*</code>
          </th>
          <th><em>bất kỳ</em></th>
          <th>
            <em><code>fixed</code></em> hoặc <code>absolute</code>
          </th>
          <td>
            <code>0</code>, ngoại trừ khi cả <code>margin-left</code> và
            <code>margin-right</code> được đặt thành <code>auto</code>. Trong trường hợp đó,
            nó được đặt thành giá trị căn giữa vùng viền bên trong
            <code>width</code> có sẵn, nếu cố định.
          </td>
          <td>Chế độ bố cục định vị tuyệt đối</td>
        </tr>
        <tr>
          <th><code>flex</code>, <code>inline-flex</code></th>
          <th><em>bất kỳ</em></th>
          <th><em>bất kỳ</em></th>
          <td>
            <code>0</code>, ngoại trừ khi có không gian ngang tự do dương.
            Trong trường hợp đó, nó được phân bổ đều cho tất cả các lề
            <code>auto</code> theo chiều ngang.
          </td>
          <td>Chế độ bố cục Flexbox</td>
        </tr>
      </tbody>
    </table>

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt margin-left theo phần trăm

Các giá trị phần trăm cho `margin-left` tương đối với kích thước nội tuyến của vùng chứa.

#### HTML

```html
<p>
  A large rose-tree stood near the entrance of the garden: the roses growing on
  it were white, but there were three gardeners at it, busily painting them red.
</p>
<p class="example">
  Alice thought this a very curious thing, and she went nearer to watch them,
  and just as she came up to them she heard one of them say, "Look out now,
  Five! Don't go splashing paint over me like that!"
</p>
<p>
  "I couldn't help it," said Five, in a sulky tone; "Seven jogged my elbow."
</p>
```

#### CSS

```css
.example {
  margin-left: 50%;
}
```

#### Kết quả

{{EmbedLiveSample("Setting margin-left as a percentage","","250")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, và {{cssxref("margin-bottom")}}
- Viết tắt {{cssxref("margin")}}
- {{cssxref("margin-block-start")}}, {{cssxref("margin-block-end")}}, {{cssxref("margin-inline-start")}}, và {{cssxref("margin-inline-end")}}
- Các viết tắt {{cssxref("margin-block")}} và {{cssxref("margin-inline")}}
- Mô-đun [mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
