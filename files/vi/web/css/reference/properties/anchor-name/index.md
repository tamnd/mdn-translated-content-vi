---
title: anchor-name
slug: Web/CSS/Reference/Properties/anchor-name
page-type: css-property
browser-compat: css.properties.anchor-name
sidebar: cssref
---

Thuộc tính **`anchor-name`** [CSS](/en-US/docs/Web/CSS) cho phép định nghĩa một phần tử là **phần tử neo** bằng cách gán cho nó một hoặc nhiều **tên neo** nhận dạng. Mỗi tên sau đó có thể được đặt làm giá trị cho thuộc tính {{cssxref("position-anchor")}} của phần tử được định vị để liên kết nó với neo.

## Cú pháp

```css
/* Giá trị đơn */
anchor-name: none;
anchor-name: --name;

/* Nhiều giá trị */
anchor-name: --name, --another-name;

/* Giá trị toàn cục */
anchor-name: inherit;
anchor-name: initial;
anchor-name: revert;
anchor-name: revert-layer;
anchor-name: unset;
```

### Giá trị

- `none`
  - : Giá trị mặc định. Đặt `anchor-name: none` trên một phần tử có nghĩa là phần tử đó không được định nghĩa là phần tử neo. Nếu phần tử trước đó đã được định nghĩa là neo và được liên kết với một phần tử được định vị, việc đặt `anchor-name: none` sẽ hủy liên kết giữa hai phần tử.

- {{cssxref("dashed-ident")}}
  - : Một hoặc nhiều định danh tùy chỉnh được phân tách bằng dấu phẩy, định nghĩa tên hoặc các tên của neo, sau đó có thể được tham chiếu trong thuộc tính {{cssxref("position-anchor")}}.

## Mô tả

Để định vị một phần tử tương đối với phần tử neo, phần tử được định vị cần ba yếu tố: liên kết, vị trí và địa điểm. Thuộc tính `anchor-name` và {{cssxref("position-anchor")}} cung cấp liên kết tường minh.

Phần tử neo chấp nhận một hoặc nhiều tên neo `<dashed-ident>` được đặt trên nó thông qua thuộc tính `anchor-name`. Khi một trong những tên đó được đặt làm giá trị của thuộc tính `position-anchor` của một phần tử có {{cssxref("position")}} được đặt thành `absolute` hoặc `fixed`, hai phần tử sẽ được liên kết với nhau. Hai phần tử trở nên gắn kết bằng cách đặt vị trí trên phần tử liên kết tương đối với neo, biến nó thành phần tử "được định vị bằng neo".

Nếu nhiều phần tử neo có cùng tên neo được đặt trên chúng, và tên đó được tham chiếu bởi giá trị thuộc tính `position-anchor` của phần tử được định vị, phần tử được định vị đó sẽ được liên kết với phần tử neo cuối cùng có tên neo đó theo thứ tự nguồn.

Định vị neo thay đổi [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của các phần tử được định vị bằng neo, làm cho `position` của nó tương đối với neo thay vì với phần tử tổ tiên được định vị gần nhất.

Để gắn kết và đặt một phần tử được định vị ở một vị trí cụ thể tương đối với phần tử neo, cần có tính năng định vị neo, chẳng hạn như hàm {{cssxref("anchor()")}} (được đặt trong giá trị của {{glossary("inset properties", "thuộc tính inset")}}) hoặc thuộc tính {{cssxref("position-area")}}.

Bạn không thể liên kết phần tử được định vị với phần tử neo nếu neo bị ẩn, chẳng hạn như với {{cssxref("display", "display: none")}} hoặc {{cssxref("visibility", "visibility: hidden")}}, hoặc nếu neo là một phần của [nội dung bị bỏ qua](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents) của phần tử khác do có {{cssxref("content-visibility", "content-visibility: hidden")}} được đặt trên nó.

Thuộc tính `anchor-name` được hỗ trợ trên tất cả các phần tử tạo ra hộp chính. Điều này có nghĩa là [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements), bao gồm nội dung được tạo bằng {{cssxref("::before")}} và {{cssxref("::after")}}, và các tính năng giao diện người dùng như thanh trượt của [`range` input](/en-US/docs/Web/HTML/Reference/Elements/input/range) ({{cssxref("::-webkit-slider-thumb")}}) đều có thể là phần tử neo. Pseudo-element được neo ngầm định vào cùng phần tử với phần tử gốc của pseudo-element, trừ khi có quy định khác.

Để biết thêm thông tin về tính năng và cách sử dụng neo, hãy xem mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này gắn kết phần tử được định vị với neo, đặt phần tử ở bên phải của neo.

#### HTML

Chúng ta chỉ định hai phần tử {{htmlelement("div")}}: một phần tử neo với class `anchor` và một phần tử được định vị với class `infobox`.

Chúng ta cũng bao gồm một số văn bản lấp đầy xung quanh hai `<div>` để làm {{htmlelement("body")}} cao hơn để cuộn được.

```html
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

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
```

#### CSS

Đầu tiên chúng ta khai báo `<div>` `anchor` là phần tử neo bằng cách đặt tên neo trên nó thông qua thuộc tính `anchor-name`:

```css hidden
body {
  width: 50%;
  margin: 0 auto;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
}
```

Chúng ta liên kết `<div>` thứ hai với phần tử neo bằng cách đặt tên neo làm giá trị của thuộc tính {{cssxref("position-anchor")}} của phần tử được định vị. Sau đó chúng ta đặt:

- Thuộc tính {{cssxref("position")}} thành `fixed`, chuyển đổi nó thành _phần tử được định vị bằng neo_ để có thể định vị nó tương đối với vị trí của neo trên trang.
- Thuộc tính {{cssxref("left")}} và {{cssxref("top")}} thành hàm {{cssxref("anchor()")}} với các giá trị lần lượt là `right` và `top`. Điều này đặt cạnh trái của infobox trùng với cạnh phải của neo, và cạnh trên tương đối với cạnh trên của neo.
- {{cssxref("margin-left")}} thành `10px`, tạo khoảng cách giữa phần tử được định vị bằng neo và neo của nó.

```css hidden
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
.infobox {
  position-anchor: --my-anchor;
  position: fixed;
  left: anchor(right);
  top: anchor(top);
  margin-left: 10px;
}
```

#### Kết quả

Cuộn trang để xem cách infobox được định vị tương đối với neo. Khi neo cuộn lên, phần tử được định vị sẽ di chuyển cùng với nó.

{{ EmbedLiveSample("Basic usage", "100%", "225") }}

### Nhiều phần tử được định vị

Ví dụ này minh họa cách bạn có thể liên kết nhiều phần tử được định vị với một neo.

#### HTML

HTML giống như ví dụ trước, ngoại trừ lần này chúng ta có nhiều `<div>` phần tử được định vị với các [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) khác nhau để nhận dạng chúng.

```html
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox" id="infobox1">
  <p>This is an information box.</p>
</div>

<div class="infobox" id="infobox2">
  <p>This is another information box.</p>
</div>

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
```

#### CSS

Chúng ta khai báo `<div>` `anchor` là phần tử neo bằng thuộc tính `anchor-name`, gán cho nó tên neo như trước.

```css hidden
body {
  width: 50%;
  margin: 0 auto;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
}
```

Mỗi trong hai phần tử được định vị được liên kết với phần tử neo bằng cách đặt tên neo làm giá trị thuộc tính {{cssxref("position-anchor")}} của phần tử được định vị. Cả hai cũng được gán định vị `fixed`, biến chúng thành **phần tử được định vị bằng neo**. Các phần tử được định vị sau đó được định vị ở các vị trí khác nhau tương đối với neo bằng cách kết hợp các thuộc tính inset như trên và thuộc tính {{cssxref("align-self")}} / {{cssxref("justify-self")}} với giá trị `anchor-center`, căn giữa infobox với tâm của neo theo chiều inline/block tương ứng.

```css hidden
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
.infobox {
  position-anchor: --my-anchor;
  position: fixed;
}

#infobox1 {
  left: anchor(right);
  align-self: anchor-center;
  margin-left: 10px;
}

#infobox2 {
  bottom: anchor(top);
  justify-self: anchor-center;
  margin-bottom: 15px;
}
```

#### Kết quả

Cuộn trang để xem cả hai infobox được gắn kết với neo.

{{ EmbedLiveSample("Multiple positioned elements", "100%", "225") }}

### Nhiều tên neo

Ví dụ này minh họa cách một phần tử neo có thể có nhiều hơn một tên neo.

#### HTML

HTML giống như ví dụ trước.

```html hidden
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox" id="infobox1">
  <p>This is an information box.</p>
</div>

<div class="infobox" id="infobox2">
  <p>This is another information box.</p>
</div>

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
```

#### CSS

CSS giống như ví dụ trước, ngoại trừ chúng ta bao gồm hai tên được phân tách bằng dấu phẩy trong giá trị thuộc tính `anchor-name` của mục tiêu và mỗi phần tử được định vị có giá trị khác nhau cho `position-anchor`.

```css hidden
body {
  width: 50%;
  margin: 0 auto;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
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
  anchor-name: --anchor1, --anchor2;
}

.infobox {
  position: fixed;
}

#infobox1 {
  position-anchor: --anchor1;
  left: anchor(right);
  align-self: anchor-center;
  margin-left: 10px;
}

#infobox2 {
  position-anchor: --anchor2;
  bottom: anchor(top);
  justify-self: anchor-center;
  margin-bottom: 15px;
}
```

#### Kết quả

Cuộn trang để xem cả hai infobox được gắn kết với neo.

{{ EmbedLiveSample("Multiple anchor names", "100%", "225") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-anchor")}}
- {{cssxref("anchor-scope")}}
- Thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor)
- Mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
