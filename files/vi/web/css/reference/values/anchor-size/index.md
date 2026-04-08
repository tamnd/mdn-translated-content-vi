---
title: anchor-size()
slug: Web/CSS/Reference/Values/anchor-size
page-type: css-function
browser-compat: css.types.anchor-size
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`anchor-size()`** cho phép đặt [kích thước](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using#sizing_elements_based_on_anchor_size), [vị trí](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_position_based_on_anchor_size), và [lề](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_margin_based_on_anchor_size) của phần tử được định vị neo tương đối so với kích thước của các phần tử neo. Nó trả về `<length>` của một cạnh cụ thể của phần tử neo đích. `anchor-size()` chỉ hợp lệ khi được dùng trong giá trị của [các thuộc tính định kích thước, inset, và lề](#properties_that_accept_anchor-size_function_values) của phần tử được định vị neo.

Để biết thêm thông tin chi tiết về tính năng và cách dùng neo, xem mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Sử dụng CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Cú pháp

```css
/* without parameters */
anchor-size()

/* anchor size parameter */
anchor-size(width);
anchor-size(block);
anchor-size(self-inline);

/* anchor-name and anchor-side */
width: anchor-size(--my-anchor width);
block-size: anchor-size(--my-anchor block);

/* sizing relative to named anchor's side with fallback */
width: anchor-size(--my-anchor width, 50%);
block-size: anchor-size(--my-anchor block, 200px);

/* positioning relative to anchor side */
left: anchor-size(width);
inset-inline-end: anchor-size(--my-anchor height, 100px);

/* setting margin relative to anchor side */
margin-left: calc(anchor-size(width) / 4);
margin-block-start: anchor-size(--my-anchor self-block, 20px);
```

### Tham số

Cú pháp của hàm `anchor-size()` như sau:

```plain
anchor-size(<anchor-name> <anchor-size>, <length-percentage>)
```

Các tham số bao gồm:

- `<anchor-name>` {{optional_inline}}
  - : Giá trị thuộc tính {{cssxref("anchor-name")}} của phần tử neo mà bạn muốn đặt kích thước, vị trí, hoặc lề của phần tử tương đối so với. Đây là giá trị `<dashed-ident>`. Nếu bỏ qua, neo mặc định của phần tử được dùng.

    > [!NOTE]
    > Việc chỉ định `<anchor-name>` bên trong hàm `anchor-size()` không liên kết hay neo giữ phần tử với neo; nó chỉ xác định neo mà các giá trị thuộc tính của phần tử nên được đặt tương đối so với.

- `<anchor-size>` {{optional_inline}}
  - : Xác định chiều của phần tử neo mà các giá trị thuộc tính của phần tử được định vị sẽ được đặt tương đối so với. Các giá trị hợp lệ bao gồm:
    - `width`
      - : Chiều rộng của phần tử neo.

    - `height`
      - : Chiều cao của phần tử neo.

    - `block`
      - : Chiều dài của [khối chứa (containing block)](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử neo theo hướng block.

    - `inline`
      - : Chiều dài của khối chứa của phần tử neo theo hướng inline.

    - `self-block`
      - : Chiều dài của phần tử neo theo hướng block.

    - `self-inline`
      - : Chiều dài của phần tử neo theo hướng inline.

    > [!NOTE]
    > Nếu tham số này bị bỏ qua, chiều mặc định là từ khóa `<anchor-size>` khớp với trục của thuộc tính mà hàm được bao gồm. Ví dụ, `width: anchor-size();` tương đương với `width: anchor-size(width);`.

- {{cssxref("length-percentage")}} {{optional_inline}}
  - : Xác định kích thước để dùng làm giá trị dự phòng nếu phần tử không được định vị tuyệt đối hoặc cố định, hoặc phần tử neo không tồn tại. Nếu tham số này bị bỏ qua trong trường hợp giá trị dự phòng sẽ được dùng, khai báo không hợp lệ.

> [!NOTE]
> Chiều neo bạn đặt các giá trị thuộc tính của phần tử được định vị tương đối so với không nhất thiết phải cùng trục với giá trị định kích thước đang được đặt. Ví dụ, `width: anchor-size(height)` hợp lệ.

### Giá trị trả về

Trả về giá trị {{cssxref("length")}}.

## Mô tả

Hàm `anchor-size()` cho phép các giá trị định kích thước, vị trí, và lề của phần tử được định vị được biểu thị theo kích thước của phần tử neo; nó trả về giá trị {{cssxref("length")}} biểu diễn chiều của phần tử neo cụ thể mà các giá trị thuộc tính của phần tử được định vị được đặt tương đối so với. Đây là giá trị hợp lệ cho [các thuộc tính định kích thước, inset, và lề](#properties_that_accept_anchor-size_function_values) được đặt trên phần tử được định vị neo.

Giá trị độ dài trả về là kích thước dọc hoặc ngang của phần tử neo hoặc khối chứa của nó. Chiều được dùng được xác định bởi tham số `<anchor-size>`. Nếu tham số đó bị bỏ qua, chiều được dùng sẽ khớp với trục của thuộc tính định kích thước, vị trí, hoặc lề được đặt trên nó. Ví dụ:

- `width: anchor-size()` tương đương với `width: anchor-size(width)`.
- `top: anchor-size()` tương đương với `top: anchor-size(height)`.
- `margin-inline-end: anchor-size()` tương đương với `margin-inline-end: anchor-size(self-inline)`. `margin-inline-end: anchor-size()` cũng tương đương với `margin-inline-end: anchor-size(width)` trong chế độ viết ngang, hoặc `margin-inline-end: anchor-size(height)` trong chế độ viết dọc.

Phần tử neo được dùng làm cơ sở cho chiều dài là phần tử có `anchor-name` được chỉ định trong tham số `<anchor-name>`. Nếu có nhiều hơn một phần tử có cùng tên neo, phần tử cuối cùng có tên neo đó trong thứ tự DOM được dùng.

Nếu không có tham số `<anchor-name>` nào được bao gồm trong lời gọi hàm, **neo mặc định** của phần tử, được tham chiếu trong thuộc tính {{cssxref("position-anchor")}} của nó, hoặc được liên kết với phần tử qua thuộc tính HTML [`anchor`](/vi/docs/Web/HTML/Reference/Global_attributes/anchor), sẽ được dùng.

Nếu tham số `<anchor-name>` được bao gồm và không có phần tử nào khớp với tên neo đó, giá trị dự phòng sẽ được dùng. Nếu không có giá trị dự phòng nào được bao gồm, khai báo bị bỏ qua. Ví dụ, nếu `width: anchor-size(--foo width, 50px); height: anchor-size(--foo width);` được chỉ định trên phần tử được định vị nhưng không có neo có tên `--foo` nào tồn tại trong DOM, `width` sẽ là `50px` và khai báo `height` sẽ không có hiệu lực.

Nếu phần tử có các thuộc tính định kích thước, vị trí, hoặc lề với giá trị `anchor-size()` được đặt trên chúng, nhưng nó không phải là phần tử được định vị neo (thuộc tính {{cssxref("position")}} không được đặt thành `absolute` hoặc `fixed` hoặc không có neo liên kết qua thuộc tính `position-anchor`), giá trị dự phòng sẽ được dùng nếu có. Nếu không có giá trị dự phòng nào, khai báo bị bỏ qua.

Ví dụ, nếu `width: anchor-size(width, 50px);` được chỉ định trên phần tử được định vị nhưng không có neo liên kết, giá trị dự phòng sẽ được dùng và `width` sẽ có giá trị tính toán là `50px`.

Để biết thêm thông tin chi tiết về tính năng và cách dùng neo, xem mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Sử dụng CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using).

### Các thuộc tính chấp nhận giá trị hàm `anchor-size()`

Các thuộc tính chấp nhận hàm `anchor-size()` làm giá trị bao gồm:

- Thuộc tính định kích thước:
  - {{cssxref("width")}}
  - {{cssxref("height")}}
  - {{cssxref("min-width")}}
  - {{cssxref("min-height")}}
  - {{cssxref("max-width")}}
  - {{cssxref("max-height")}}
  - {{cssxref("block-size")}}
  - {{cssxref("inline-size")}}
  - {{cssxref("min-block-size")}}
  - {{cssxref("min-inline-size")}}
  - {{cssxref("max-block-size")}}
  - {{cssxref("max-inline-size")}}
- Thuộc tính inset:
  - {{cssxref("bottom")}}
  - {{cssxref("left")}}
  - {{cssxref("right")}}
  - {{cssxref("top")}}
  - Viết tắt {{cssxref("inset")}}
  - Viết tắt {{cssxref("inset-block")}}
  - {{cssxref("inset-block-end")}}
  - {{cssxref("inset-block-start")}}
  - Viết tắt {{cssxref("inset-inline")}}
  - {{cssxref("inset-inline-end")}}
  - {{cssxref("inset-inline-start")}}
- Thuộc tính lề:
  - Viết tắt {{cssxref("margin")}}
  - {{cssxref("margin-bottom")}}
  - {{cssxref("margin-left")}}
  - {{cssxref("margin-right")}}
  - {{cssxref("margin-top")}}
  - Viết tắt {{cssxref("margin-block")}}
  - {{cssxref("margin-block-end")}}
  - {{cssxref("margin-block-start")}}
  - Viết tắt {{cssxref("margin-inline")}}
  - {{cssxref("margin-inline-end")}}
  - {{cssxref("margin-inline-start")}}

### Dùng `anchor-size()` bên trong `calc()`

Các hàm `anchor-size()` phổ biến nhất bạn sẽ dùng chỉ tham chiếu đến một chiều của neo mặc định. Ngoài ra, hãy bao gồm hàm `anchor-size()` bên trong hàm {{cssxref("calc")}} để sửa đổi kích thước áp dụng cho phần tử được định vị.

Ví dụ, quy tắc này đặt chiều rộng của phần tử được định vị bằng chiều rộng của phần tử neo mặc định:

```css
.positionedElem {
  width: anchor-size(width);
}
```

Quy tắc này đặt kích thước inline của phần tử được định vị bằng 4 lần kích thước inline của phần tử neo, với phép nhân được thực hiện bên trong hàm {{cssxref("calc()")}}:

```css
.positionedElem {
  inline-size: calc(anchor-size(self-inline) * 4);
}
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Cách dùng `anchor-size()` cơ bản

Ví dụ này cho thấy hai phần tử được định vị tương đối so với một neo và được định kích thước bằng các hàm `anchor-size()`.

#### HTML

Chúng ta chỉ định ba phần tử {{htmlelement("div")}}, một phần tử `anchor` và hai phần tử `infobox` mà chúng ta sẽ định vị tương đối so với neo. Chúng ta cũng bao gồm văn bản điền để làm cho {{htmlelement("body")}} đủ cao để yêu cầu cuộn, nhưng điều này đã được ẩn để ngắn gọn.

```html hidden
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>
```

```html
<div class="anchor">⚓︎</div>

<div class="infobox" id="infobox1">
  <p>This is the first infobox.</p>
</div>

<div class="infobox" id="infobox2">
  <p>This is the second infobox.</p>
</div>
```

```html hidden
<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

#### CSS

Chúng ta khai báo phần tử `anchor` `<div>` là phần tử neo bằng cách đặt cho nó {{cssxref("anchor-name")}}. Các phần tử được định vị, với các thuộc tính {{cssxref("position")}} được đặt thành `fixed`, được liên kết với phần tử neo qua các thuộc tính {{cssxref("position-anchor")}} của chúng. Chúng ta cũng đặt các kích thước {{cssxref("height")}} và {{cssxref("width")}} tuyệt đối trên neo để cung cấp điểm tham chiếu khi kiểm tra kích thước phần tử được định vị, ví dụ với công cụ nhà phát triển trình duyệt:

```css hidden
.anchor {
  font-size: 2rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  text-align: center;
  align-content: center;
  outline: 1px solid black;
}

body {
  width: 80%;
  margin: 0 auto;
}

.infobox {
  align-content: center;
  color: darkblue;
  background-color: azure;
  outline: 1px solid #dddddd;
  font-size: 1rem;
  text-align: center;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
  width: 100px;
  height: 50px;
}

.infobox {
  position-anchor: --my-anchor;
  position: fixed;
}
```

Chúng ta đặt một số giá trị thuộc tính riêng biệt trên các phần tử được định vị:

- Các phần tử được định vị được neo vào neo với các giá trị {{cssxref("position-area")}} khác nhau đặt các phần tử ở các vị trí khác nhau xung quanh phần tử neo.
- {{cssxref("height")}} của infobox đầu tiên được đặt bằng chiều cao của phần tử neo: `anchor-size(height)` trả về chiều cao của phần tử neo. {{cssxref("width")}} của phần tử được đặt bằng hai lần chiều rộng của phần tử neo bằng hàm `anchor-size()` bên trong hàm {{cssxref("calc()")}}: `anchor-size(width)` lấy chiều rộng của phần tử neo, sau đó nhân với hai.
- {{cssxref("height")}} của infobox thứ hai được đặt bằng 80% chiều cao của phần tử neo, dùng kỹ thuật tương tự.
- Các giá trị lề được bao gồm để cung cấp khoảng cách từ phần tử neo.

```css
#infobox1 {
  position-area: right;
  height: anchor-size(height);
  width: calc(anchor-size(width) * 2);
  margin-left: 5px;
}

#infobox2 {
  position-area: top span-right;
  height: calc(anchor-size(height) / 1.25);
  margin-bottom: 5px;
}
```

#### Kết quả

{{EmbedLiveSample("Basic `anchor-size()` usage", "100%", "240")}}

Dùng công cụ trình duyệt của bạn để kiểm tra các phần tử được định vị neo. Infobox đầu tiên sẽ cao `50px` và rộng `200px`, trong khi infobox thứ hai sẽ cao `40px`, với `width` mặc định là {{cssxref("max-content")}}.

### Ví dụ vị trí và lề

Xem [Ví dụ vị trí và lề `anchor-size()`](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using#anchor-size_position_and_margin_example).

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- Hàm {{cssxref("anchor()")}}
- Hướng dẫn [Sử dụng CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning)
