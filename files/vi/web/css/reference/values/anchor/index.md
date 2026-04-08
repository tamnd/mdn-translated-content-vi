---
title: anchor()
slug: Web/CSS/Reference/Values/anchor
page-type: css-function
browser-compat: css.types.anchor
sidebar: cssref
---

[Hàm](/vi/docs/Web/CSS/Reference/Values/Functions) [CSS](/vi/docs/Web/CSS) **`anchor()`** có thể được dùng trong các giá trị [thuộc tính inset](#properties_that_accept_anchor_function_values) của một phần tử **được định vị neo (anchor-positioned)**, trả về một giá trị độ dài tương đối so với vị trí các cạnh của phần tử neo liên kết với nó.

## Cú pháp

```css
/* side or percentage */
top: anchor(bottom);
top: anchor(50%);
top: calc(anchor(bottom) + 10px)
inset-block-end: anchor(start);

/* side of named anchor */
top: anchor(--my-anchor bottom);
inset-block-end: anchor(--my-anchor start);

/* side of named anchor with fallback */
top: anchor(--my-anchor bottom, 50%);
inset-block-end: anchor(--my-anchor start, 200px);
left: calc(anchor(--my-anchor right, 0%) + 10px);
```

### Tham số

Cú pháp của hàm `anchor()` như sau:

```plain
anchor(<anchor-name> <anchor-side>, <length-percentage>)
```

Các tham số bao gồm:

- `<anchor-name>` {{optional_inline}}
  - : Giá trị thuộc tính {{cssxref("anchor-name")}} của phần tử neo mà bạn muốn định vị cạnh của phần tử tương đối so với nó. Đây là giá trị `<dashed-ident>`. Nếu bỏ qua, **neo mặc định** của phần tử, được tham chiếu trong thuộc tính {{cssxref("position-anchor")}} của nó hoặc được liên kết qua thuộc tính HTML [`anchor`](/vi/docs/Web/HTML/Reference/Global_attributes/anchor), sẽ được dùng.

    > [!NOTE]
    > Việc chỉ định `<anchor-name>` bên trong hàm `anchor()` không liên kết phần tử với neo đó; nó chỉ định vị phần tử tương đối so với neo đó. Thuộc tính CSS {{cssxref("position-anchor")}} hoặc thuộc tính HTML [`anchor`](/vi/docs/Web/HTML/Reference/Global_attributes/anchor) vẫn cần thiết để tạo liên kết.

- `<anchor-side>`
  - : Xác định cạnh của neo, hoặc khoảng cách tương đối từ cạnh `start`, mà phần tử được định vị tương đối so với. Nếu giá trị vật lý hoặc logic không [tương thích](#compatibility_of_inset_properties_and_anchor-side_values) với thuộc tính inset mà `anchor()` được đặt trên đó, giá trị dự phòng sẽ được dùng. Các giá trị hợp lệ bao gồm:
    - `top`
      - : Cạnh trên của phần tử neo.
    - `right`
      - : Cạnh phải của phần tử neo.
    - `bottom`
      - : Cạnh dưới của phần tử neo.
    - `left`
      - : Cạnh trái của phần tử neo.
    - `inside`
      - : Cùng cạnh với thuộc tính inset.
    - `outside`
      - : Cạnh đối diện với thuộc tính inset.
    - `start`
      - : Điểm bắt đầu logic của [khối chứa (containing block)](/vi/docs/Web/CSS/Guides/Display/Containing_block) của phần tử neo dọc theo trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.
    - `end`
      - : Điểm kết thúc logic của khối chứa của phần tử neo dọc theo trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.
    - `self-start`
      - : Điểm bắt đầu logic của nội dung phần tử neo dọc theo trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.
    - `self-end`
      - : Điểm kết thúc logic của nội dung phần tử neo dọc theo trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.
    - `center`
      - : Trung tâm của trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.
    - {{cssxref("percentage")}}
      - : Xác định khoảng cách, tính theo phần trăm, từ đầu nội dung phần tử dọc theo trục của thuộc tính inset mà hàm `anchor()` được đặt trên đó.

- {{cssxref("length-percentage")}} {{optional_inline}}
  - : Xác định giá trị dự phòng mà hàm sẽ dùng nếu hàm `anchor()` không hợp lệ.

### Giá trị trả về

Trả về giá trị {{cssxref("length")}}.

## Mô tả

Hàm `anchor()` cho phép định vị phần tử tương đối so với các cạnh của phần tử neo. Nó chỉ hợp lệ trong các giá trị {{glossary("inset properties", "thuộc tính inset")}} được đặt trên các phần tử có vị trí tuyệt đối (absolute) hoặc cố định (fixed).

Nó trả về giá trị `<length>` xác định khoảng cách giữa cạnh phần tử được định vị neo (được xác định bởi giá trị inset) và cạnh của phần tử neo (được xác định bởi giá trị `<anchor-side>` được chọn). Vì nó trả về `<length>`, nên có thể dùng trong [các hàm CSS khác](/vi/docs/Web/CSS/Reference/Values/Functions) chấp nhận giá trị độ dài, như {{cssxref("calc()")}}, {{cssxref("clamp()")}}, v.v.

Nếu không có neo nào với tên được chỉ định bởi `<anchor-name>`, hoặc phần tử được định vị không có neo liên kết (qua thuộc tính {{cssxref("position-anchor")}}), tham số đầu tiên được coi là không hợp lệ và giá trị dự phòng `<length-percentage>` sẽ được dùng nếu có. Ví dụ, nếu `top: anchor(bottom, 50px)` được chỉ định cho phần tử được định vị nhưng không có neo nào liên kết, giá trị dự phòng sẽ được dùng và `top` sẽ có giá trị tính toán là `50px`.

Để biết thêm thông tin chi tiết về tính năng và cách dùng neo, xem mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Sử dụng CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using).

### Các thuộc tính chấp nhận giá trị hàm `anchor()`

Các {{glossary("inset properties", "thuộc tính inset")}} CSS chấp nhận hàm `anchor()` như là thành phần giá trị bao gồm:

- {{cssxref("top")}}
- {{cssxref("left")}}
- {{cssxref("bottom")}}
- {{cssxref("right")}}
- Viết tắt {{cssxref("inset")}}
- {{cssxref("inset-block-start")}}
- {{cssxref("inset-block-end")}}
- Viết tắt {{cssxref("inset-block")}}
- {{cssxref("inset-inline-start")}}
- {{cssxref("inset-inline-end")}}
- Viết tắt {{cssxref("inset-inline")}}

### Tính tương thích của thuộc tính inset và giá trị `<anchor-side>`

Khi dùng hàm `anchor()` bên trong giá trị thuộc tính inset, tham số `<anchor-side>` được chỉ định bên trong hàm `anchor()` phải tương thích với trục của thuộc tính inset đó.

Điều này có nghĩa là các giá trị `<anchor-side>` vật lý có thể được dùng trong các giá trị thuộc tính inset vật lý nếu thuộc tính có cùng hướng trục với `<anchor-side>`. Nói cách khác, cạnh `top` và `bottom` không hợp lệ trong giá trị thuộc tính `left` và `right`, và cạnh `left` và `right` không hợp lệ trong giá trị thuộc tính `top` và `bottom`. Ví dụ, `top: anchor(bottom)` ổn vì cả hai đều là giá trị dọc nhưng `top: anchor(left)` không hợp lệ vì `left` là giá trị ngang. Nếu `top: anchor(left, 50px)` được chỉ định, giá trị dự phòng sẽ được dùng và `top` sẽ có giá trị tính toán là `50px`. Nếu không có giá trị dự phòng, thuộc tính inset sẽ hoạt động như thể được đặt thành `auto`.

Bạn có thể dùng các giá trị `<anchor-side>` logic trong cả thuộc tính inset logic và vật lý vì các giá trị `<anchor-side>` logic tương đối so với trục liên quan của thuộc tính inset. Ví dụ, `top: anchor(start)`, `top: anchor(self-end)`, `inset-block-start: anchor(end)` và `inset-inline-end: anchor(self-start)` đều hoạt động tốt.

Vấn đề phức tạp hơn khi dùng tham số `<anchor-side>` vật lý trong các giá trị thuộc tính inset logic vì cạnh vật lý phải khớp với trục mà thuộc tính inset liên quan đến trong chế độ viết hiện tại. Ví dụ:

- Trong chế độ viết ngang, hướng khối là từ trên xuống dưới, vì vậy `inset-block-end: anchor(bottom)` sẽ hoạt động nhưng `inset-block-end: anchor(left)` không tương thích. Nếu `inset-block-end: anchor(left, 50px)` được đặt, giá trị tính toán sẽ là `50px`, và phần tử được định vị sẽ được đặt cách `50px` từ cuối khối (phía dưới) của phần tử được định vị gần nhất hoặc viewport.
- Trong chế độ viết dọc, hướng khối là phải-sang-trái hoặc trái-sang-phải, vì vậy `inset-block-end: anchor(left)` sẽ hoạt động nhưng `inset-block-end: anchor(top)` không tương thích. Nếu `inset-block-end: anchor(top, 50px)` được đặt, giá trị tính toán sẽ là `50px`, và phần tử được định vị sẽ được đặt cách `50px` từ cuối khối (trái hoặc phải tùy chế độ viết).

Để tránh nhầm lẫn với các giá trị này, bạn nên dùng thuộc tính inset logic với các giá trị `<anchor-side>` logic, và thuộc tính inset vật lý với các giá trị `<anchor-side>` vật lý. Bạn nên ưu tiên dùng các giá trị logic vì chúng tốt hơn cho [quốc tế hóa](/vi/docs/Glossary/Internationalization).

Các giá trị `center` và `<percentage>` hợp lệ trong hàm `anchor()` trong tất cả các thuộc tính inset logic và vật lý.

Bảng dưới đây liệt kê các thuộc tính inset và các giá trị tham số `<anchor-side>` tương thích với chúng. Chúng tôi chỉ liệt kê các thuộc tính inset dạng dài; đây là các thành phần giá trị thuộc tính inset viết tắt.

| Thuộc tính inset                            | Giá trị `<anchor-side>` tương thích                                                                                                            |
| ------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Tất cả                                      | `center`                                                                                                                                       |
| Tất cả                                      | `<percentage>`                                                                                                                                 |
| `top` và `bottom`                           | `top`, `bottom`, `start`, `end`, `self-start`, `self-end`                                                                                      |
| `left` và `right`                           | `left`, `right`, `start`, `end`, `self-start`, `self-end`                                                                                      |
| `inset-block-start` và `inset-block-end`    | `start`, `end`, `self-start`, và `self-end`<br>`top` và `bottom` trong chế độ viết ngang<br>`left` và `right` trong chế độ viết dọc           |
| `inset-inline-start` và `inset-inline-end`  | `start`, `end`, `self-start`, và `self-end`<br>`left` và `right` trong chế độ viết ngang<br>`top` và `bottom` trong chế độ viết dọc           |

### Dùng `anchor()` để định vị popover

Khi dùng `anchor()` để định vị [popover](/vi/docs/Web/HTML/Reference/Global_attributes/popover), hãy lưu ý rằng [các kiểu mặc định cho popover](https://html.spec.whatwg.org/multipage/rendering.html#flow-content-3:~:text=%5Bpopover%5D%20%7B) có thể xung đột với vị trí bạn muốn đạt được. Nguyên nhân thường gặp là các kiểu mặc định cho `margin` và `inset`, vì vậy nên đặt lại chúng:

```css
.positionedPopover {
  margin: 0;
  inset: auto;
}
```

Nhóm làm việc CSS đang [tìm cách để tránh phải dùng giải pháp này](https://github.com/w3c/csswg-drafts/issues/10258).

### Dùng `anchor()` bên trong `calc()`

Khi hàm `anchor()` tham chiếu đến một cạnh của neo mặc định, bạn có thể thêm {{cssxref("margin")}} để tạo khoảng cách giữa các cạnh của neo và phần tử được định vị. Hoặc bạn có thể bao hàm `anchor()` bên trong hàm {{cssxref("calc")}} để thêm khoảng cách.

Ví dụ này định vị cạnh phải của phần tử được định vị thẳng hàng với cạnh trái của phần tử neo, rồi thêm margin để tạo khoảng cách giữa các cạnh:

```css
.positionedElement {
  right: anchor(left);
  margin-left: 10px;
}
```

Ví dụ này định vị cạnh kết thúc khối logic của phần tử được định vị cách `10px` từ cạnh bắt đầu khối logic của phần tử neo:

```css
.positionedElement {
  inset-block-end: calc(anchor(start) + 10px);
}
```

### Định vị phần tử tương đối so với nhiều neo

Bạn có thể định vị phần tử tương đối so với nhiều neo bằng cách chỉ định các giá trị `<anchor-name>` khác nhau bên trong hàm `anchor()` của các thuộc tính inset khác nhau trên cùng một phần tử (xem [Phần tử được định vị tương đối so với nhiều neo](#element_positioned_relative_to_multiple_anchors) bên dưới). Điều này có thể được dùng để tạo ra các chức năng hữu ích như tay nắm kéo ở các góc của phần tử được định vị cho phép thay đổi kích thước.

Mặc dù phần tử được định vị có thể được định vị tương đối so với nhiều phần tử neo, nhưng nó chỉ liên kết với một neo duy nhất được xác định qua thuộc tính {{cssxref("position-anchor")}} (hoặc thuộc tính HTML [`anchor`](/vi/docs/Web/HTML/Reference/Global_attributes/anchor)). Đây là neo mà phần tử sẽ cuộn theo khi trang cuộn; nó cũng có thể được dùng để kiểm soát khi nào phần tử bị [ẩn có điều kiện](/vi/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding#conditionally_hiding_anchor-positioned_elements).

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Cách dùng phổ biến

Trong ví dụ này, hàm `anchor()` được dùng để đặt chiều cao của một phần tử được định vị neo bằng chiều cao của neo bằng cách đặt cạnh dưới và cạnh trên vào cạnh dưới và cạnh trên của neo. Hàm `anchor()` bên trong hàm `calc()` sau đó được dùng để bù vị trí của phần tử được định vị neo so với neo.

#### HTML

Chúng ta thêm phần tử {{htmlelement("div")}}, sẽ được đặt làm neo, và phần tử {{htmlelement("p")}} mà chúng ta sẽ định vị tương đối so với neo đó:

```html
<div class="anchor">⚓︎</div>

<p class="positionedElement">This is a positioned element.</p>
```

#### CSS

Chúng ta đặt giá trị `anchor-name` của phần tử neo làm giá trị thuộc tính `position-anchor` của phần tử được định vị để liên kết các phần tử, sau đó đặt ba thuộc tính inset trên phần tử được định vị neo. Hai thuộc tính đầu tiên định vị cạnh trên của phần tử thẳng hàng với cạnh trên của neo và cạnh dưới thẳng hàng với cạnh dưới của neo. Trong thuộc tính inset thứ ba, hàm `anchor()` được dùng bên trong hàm `calc()` để định vị cạnh trái của phần tử cách `10px` so với cạnh phải của neo.

```css
.anchor {
  anchor-name: --infobox;
  background: palegoldenrod;
  font-size: 3em;
  width: fit-content;
  border: 1px solid goldenrod;
}

.positionedElement {
  position: absolute;
  position-anchor: --infobox;
  margin: 0;
  top: anchor(top);
  left: calc(anchor(right) + 10px);
  bottom: anchor(bottom);
  background-color: olive;
  border: 1px solid darkolivegreen;
}
```

#### Kết quả

{{EmbedLiveSample("common_usage", "100%", '240')}}

### So sánh các giá trị anchor-side khác nhau

Ví dụ này hiển thị một phần tử được định vị tương đối so với neo qua các thuộc tính {{cssxref("top")}} và {{cssxref("left")}}, được xác định bằng các hàm `anchor()`. Ví dụ cũng bao gồm hai menu thả xuống cho phép bạn thay đổi các giá trị `<anchor-side>` bên trong các hàm `anchor()` đó, để bạn có thể thấy hiệu ứng của chúng.

#### HTML

Chúng ta chỉ định hai phần tử {{htmlelement("div")}}, một với lớp `anchor` và một với lớp `infobox`. Chúng được thiết kế là phần tử neo và phần tử được định vị tương ứng.

Chúng ta cũng bao gồm văn bản điền và hai phần tử {{htmlelement("select")}} để tạo menu thả xuống cho phép chọn các giá trị `<anchor-side>` khác nhau. Văn bản điền và các phần tử `<select>` đã được ẩn đi để ngắn gọn.

```html hidden
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
```

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```html hidden
<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>

<form>
  <div>
    <label for="top-anchor-side">
      Choose a vertical <code>anchor()</code> value:
    </label>
    <select id="top-anchor-side" name="top-anchor-side">
      <option value="top">top: anchor(top)</option>
      <option value="bottom" selected>top: anchor(bottom)</option>
      <option value="start">top: anchor(start)</option>
      <option value="end">top: anchor(end)</option>
      <option value="center">top: anchor(center)</option>
      <option value="0%">top: anchor(0%)</option>
      <option value="25%">top: anchor(25%)</option>
      <option value="50%">top: anchor(50%)</option>
      <option value="75%">top: anchor(75%)</option>
      <option value="100%">top: anchor(100%)</option>
    </select>
  </div>
  <div>
    <label for="left-anchor-side">
      Choose a horizontal <code>anchor()</code> value:
    </label>
    <select id="left-anchor-side" name="left-anchor-side">
      <option value="left">left: anchor(left)</option>
      <option value="right" selected>left: anchor(right)</option>
      <option value="self-start">left: anchor(self-start)</option>
      <option value="self-end">left: anchor(self-end)</option>
      <option value="center">left: anchor(center)</option>
      <option value="0%">left: anchor(0%)</option>
      <option value="25%">left: anchor(25%)</option>
      <option value="50%">left: anchor(50%)</option>
      <option value="75%">left: anchor(75%)</option>
      <option value="100%">left: anchor(100%)</option>
    </select>
  </div>
</form>
```

#### CSS

Chúng ta khai báo phần tử `anchor` `<div>` là phần tử neo bằng cách đặt tên neo cho nó qua thuộc tính {{cssxref("anchor-name")}}. Sau đó chúng ta liên kết nó với phần tử được định vị bằng cách đặt cùng giá trị cho thuộc tính {{cssxref("position-anchor")}} của nó. `top: anchor(--my-anchor bottom)` định vị cạnh trên của infobox thẳng hàng với cạnh dưới của neo, trong khi `left: anchor(right)` định vị cạnh trái của infobox thẳng hàng với cạnh phải của neo. Điều này cung cấp vị trí ban đầu sẽ bị ghi đè khi chọn các giá trị khác từ menu thả xuống.

```css hidden
.anchor {
  font-size: 2rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: 100px;
  height: 100px;
  text-align: center;
  line-height: 100px;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

body {
  width: 80%;
  margin: 0 auto;
}

form {
  background: white;
  border: 1px solid black;
  padding: 5px;
  position: fixed;
  top: 0;
  right: 2px;
}

select {
  display: block;
  margin-top: 5px;
}

form div:last-child {
  margin-top: 10px;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
}

.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  top: anchor(--my-anchor bottom);
  left: anchor(right);
}
```

#### JavaScript

Chúng ta lắng nghe sự kiện `change` xảy ra khi chọn giá trị `<anchor-side>` mới và đặt giá trị được chọn làm `<anchor-side>` trong hàm `anchor()` bên trong thuộc tính inset liên quan (`top` hoặc `left`) của infobox.

```js
const infobox = document.querySelector(".infobox");
const topSelect = document.querySelector("#top-anchor-side");
const leftSelect = document.querySelector("#left-anchor-side");

topSelect.addEventListener("change", (e) => {
  const anchorSide = e.target.value;
  infobox.style.top = `anchor(--my-anchor ${anchorSide})`;
});

leftSelect.addEventListener("change", (e) => {
  const anchorSide = e.target.value;
  infobox.style.left = `anchor(${anchorSide})`;
});
```

#### Kết quả

Chọn các giá trị khác nhau từ menu thả xuống để xem cách chúng ảnh hưởng đến vị trí của infobox.

{{EmbedLiveSample("Comparison of different anchor-side values", "100%", '240')}}

### Phần tử được định vị tương đối so với nhiều neo

Ví dụ này định vị phần tử tương đối so với hai neo khác nhau, được dùng để đặt vị trí góc trên-trái và góc dưới-phải của phần tử được định vị neo. Các neo có thể được di chuyển qua điều khiển bàn phím hoặc kéo thả, thay đổi kích thước phần tử được định vị.

#### HTML

Chúng ta chỉ định tổng cộng ba phần tử {{htmlelement("div")}}. Hai phần tử đầu tiên có lớp `anchor` và sẽ được xác định là neo; mỗi phần tử có `id` riêng sẽ được dùng để cung cấp thông tin định vị khác nhau. Phần tử `<div>` cuối cùng có lớp `infobox` và sẽ được xác định là phần tử được định vị. Chúng ta bao gồm thuộc tính [`tabindex`](/vi/docs/Web/HTML/Reference/Global_attributes/tabindex) để kích hoạt việc nhận focus bàn phím.

```html
<div id="anchor1" class="anchor" tabindex="0">⚓︎1</div>

<div id="anchor2" class="anchor" tabindex="0">⚓︎2</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

#### CSS

```css hidden
body {
  width: 150vw;
  height: 150vh;
}

.anchor {
  font-size: 1rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
  &:focus {
    background-color: hsl(60 100% 75%);
  }
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

Mỗi neo được đặt một giá trị {{cssxref("anchor-name")}} khác nhau, giá trị {{cssxref("position")}} là `absolute`, và các giá trị inset khác nhau để định vị các neo theo hình chữ nhật.

```css
.anchor {
  position: absolute;
}

#anchor1 {
  anchor-name: --my-anchor1;
  top: 50px;
  left: 100px;
}

#anchor2 {
  anchor-name: --my-anchor2;
  top: 200px;
  left: 350px;
}
```

Phần tử được định vị neo, với `position` được đặt thành `fixed`, được liên kết với một neo qua thuộc tính {{cssxref("position-anchor")}} của nó. Nó được định vị tương đối so với hai neo bằng cách bao gồm hai giá trị `<anchor-name>` khác nhau với các hàm `anchor()` được đặt trên các thuộc tính inset của nó. Trong trường hợp này, chúng ta dùng các giá trị {{cssxref("percentage")}} cho tham số `<anchor-side>`, xác định khoảng cách từ đầu trục của thuộc tính inset mà hàm được đặt trên đó.

```css
.infobox {
  position-anchor: --my-anchor1;
  position: fixed;
  top: anchor(--my-anchor1 100%);
  left: anchor(--my-anchor1 100%);
  bottom: anchor(--my-anchor2 0%);
  right: anchor(--my-anchor2 0%);
}
```

```js hidden
// grab all the anchors and make each one draggable
const anchors = document.querySelectorAll(".anchor");
anchors.forEach((anchor) => makeDraggable(anchor));

function makeDraggable(elem) {
  let pos1, pos2, pos3, pos4;

  elem.onmousedown = dragMouseDown;
  elem.addEventListener("keyup", (e) => {
    switch (e.key) {
      case "d":
        elem.style.left = `${elem.offsetLeft + 5}px`;
        break;
      case "a":
        elem.style.left = `${elem.offsetLeft - 5}px`;
        break;
      case "w":
        elem.style.top = `${elem.offsetTop - 5}px`;
        break;
      case "s":
        elem.style.top = `${elem.offsetTop + 5}px`;
        break;
    }
    e.preventDefault();
  });

  function elementMove(e) {
    console.dir(e);
    // calculate the new cursor position:
    pos1 = pos3 - e.offsetLeft;
    pos2 = pos4 - e.offsetTop;
    pos3 = e.offsetLeft;
    pos4 = e.offsetTop;
    // set the element's new position:
    elem.style.top = `${elem.offsetTop - pos2}px`;
    elem.style.left = `${elem.offsetLeft - pos1}px`;
  }

  function dragMouseDown(e) {
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the mouse moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elem.style.top = `${elem.offsetTop - pos2}px`;
    elem.style.left = `${elem.offsetLeft - pos1}px`;
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
```

#### Kết quả

Phần tử được định vị tương đối so với cả hai phần tử neo. Kéo chúng bằng chuột hoặc tab đến chúng và dùng các phím <kbd>W</kbd>, <kbd>A</kbd>, <kbd>S</kbd>, và <kbd>D</kbd> để di chuyển lên, xuống, trái, và phải. Xem cách điều này thay đổi vị trí của chúng, và do đó, diện tích của phần tử được định vị. Cuộn để xem cách vị trí của tất cả các phần tử được duy trì.

{{EmbedLiveSample("Element positioned relative to multiple anchors", "100%", '350')}}

> [!NOTE]
> Ví dụ này là bằng chứng khái niệm và không dùng cho code sản xuất. Trong số các hạn chế, ví dụ sẽ bị hỏng nếu bạn cố di chuyển các neo qua nhau theo chiều ngang hoặc dọc.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-anchor")}}
- {{cssxref("position-area")}}
- Hàm {{cssxref("anchor-size()")}}
- Hướng dẫn [Sử dụng CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Tùy chọn dự phòng và ẩn có điều kiện khi tràn](/vi/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- Mô-đun [CSS anchor positioning](/vi/docs/Web/CSS/Guides/Anchor_positioning)
