---
title: position-visibility
slug: Web/CSS/Reference/Properties/position-visibility
page-type: css-property
browser-compat: css.properties.position-visibility
sidebar: cssref
---

Thuộc tính **`position-visibility`** của [CSS](/vi/docs/Web/CSS) cho phép ẩn có điều kiện một phần tử được định vị theo neo, tùy thuộc vào ví dụ như liệu nó có đang tràn ra ngoài phần tử chứa hoặc viewport hay không.

## Cú pháp

```css
/* Giá trị đơn lẻ */
position-visibility: always;
position-visibility: anchors-valid;
position-visibility: anchors-visible;
position-visibility: no-overflow;

/* Giá trị toàn cục */
position-visibility: inherit;
position-visibility: initial;
position-visibility: revert;
position-visibility: revert-layer;
position-visibility: unset;
```

### Giá trị

- `always`
  - : Phần tử được định vị luôn được hiển thị.
- `anchors-valid`
  - : Nếu giá trị {{cssxref("position-anchor")}} của phần tử được định vị không trỏ đến một phần tử neo hợp lệ, phần tử được định vị sẽ bị ẩn mạnh.
- `anchors-visible`
  - : Nếu neo bị ẩn hoàn toàn, do tràn ra ngoài phần tử chứa (hoặc viewport) hoặc bị che bởi các phần tử khác, phần tử được định vị sẽ bị ẩn mạnh.
- `no-overflow`
  - : Nếu phần tử được định vị bắt đầu tràn ra ngoài phần tử chứa hoặc viewport, nó sẽ bị ẩn mạnh.

## Mô tả

Trong một số tình huống, bạn có thể không muốn hiển thị một phần tử được định vị theo neo. Ví dụ, nếu neo liên quan đã cuộn ra ngoài màn hình nhưng phần tử được định vị theo neo vẫn hiển thị một phần hoặc toàn bộ, có thể không rõ nó đề cập đến điều gì và chiếm không gian không cần thiết, vì vậy bạn có thể muốn ẩn nó đi hoàn toàn.

Thuộc tính `position-visibility` có thể được dùng để `always` hiển thị phần tử được định vị theo neo, hoặc ẩn nó có điều kiện trong các tình huống nhất định:

- `anchors-visible`: Phần tử neo liên kết bị ẩn hoàn toàn.
- `anchors-valid`: Thuộc tính `position-anchor` của phần tử được định vị theo neo không tham chiếu đến {{cssxref("anchor-name")}} hợp lệ được đặt trên một phần tử neo trong cùng tài liệu.
- `no-overflow`: Phần tử được định vị theo neo bị ẩn một phần hoặc hoàn toàn.

Khi một phần tử bị ẩn do `position-visibility`, nó được gọi là **ẩn mạnh**. Điều này có nghĩa là nó sẽ hoạt động như thể nó và các phần tử con của nó có giá trị {{cssxref("visibility")}} là `hidden`, bất kể giá trị visibility thực tế của chúng là gì.

`position-visibility` chỉ nên được sử dụng trong các tình huống mà ẩn hoàn toàn phần tử được định vị là điều ưu tiên. Trong hầu hết các trường hợp, việc thay đổi vị trí của các phần tử được định vị khi chúng bắt đầu tràn ra ngoài để giữ chúng trên màn hình và có thể sử dụng sẽ hợp lý hơn. Điều này có thể được thực hiện bằng thuộc tính {{cssxref("position-try-fallbacks")}} và quy tắc at {{cssxref("@position-try")}}. Xem hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding) để biết thêm thông tin.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ này cho phép thay đổi giá trị thuộc tính `position-visibility` của phần tử được định vị theo neo để minh họa hiệu ứng của từng giá trị.

#### HTML

Chúng ta chỉ định hai phần tử {{htmlelement("div")}}: một phần tử neo với lớp `anchor` và một phần tử được định vị với lớp `infobox`.

```html hidden
<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique.
</p>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque.
</p>
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
  <fieldset>
    <legend>Choose position visibility</legend>
    <div>
      <label for="radio-always">always</label>
      <input
        type="radio"
        id="radio-always"
        name="position-visibility"
        value="always"
        checked />
    </div>
    <div>
      <label for="radio-anchors-visible">anchors-visible</label>
      <input
        type="radio"
        id="radio-anchors-visible"
        name="position-visibility"
        value="anchors-visible" />
    </div>
    <div>
      <label for="radio-no-overflow">no-overflow</label>
      <input
        type="radio"
        id="radio-no-overflow"
        name="position-visibility"
        value="no-overflow" />
    </div>
  </fieldset>
</form>
```

HTML cũng bao gồm văn bản lấp đầy để làm nội dung cao hơn viewport nhằm yêu cầu cuộn. Chúng ta cũng thêm một {{htmlelement("fieldset")}} với nhóm [radio inputs](/vi/docs/Web/HTML/Reference/Elements/input/radio) với các giá trị `position-visibility` khác nhau. Phần đánh dấu này không được hiển thị để ngắn gọn.

#### CSS

Chúng ta tạo kiểu `<div>` có `anchor` làm phần tử neo và neo `<div>` có `infobox` vào nó. CSS liên quan như sau:

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

form {
  position: fixed;
  background: white;
  bottom: 2px;
  right: 2px;
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
  position-anchor: --my-anchor;
  position: fixed;
  position-area: top span-all;
  margin-bottom: 5px;
  position-visibility: always;
}
```

#### JavaScript

Chúng ta thêm trình xử lý sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) trên các nút radio để khi một giá trị mới được chọn, chúng ta cập nhật giá trị thuộc tính `position-visibility` của infobox.

```js
const infobox = document.querySelector(".infobox");
const radios = document.querySelectorAll('[name="position-visibility"]');

for (const radio of radios) {
  radio.addEventListener("change", setPositionVisibility);
}

function setPositionVisibility(e) {
  infobox.style.positionVisibility = e.target.value;
}
```

#### Kết quả

Chọn các giá trị `position-visibility` khác nhau rồi cuộn trang lên xuống để xem hiệu ứng của chúng. Với `position-visibility: always`, phần tử được định vị sẽ không bị ẩn. Với `position-visibility: anchors-visible`, phần tử được định vị chỉ hiển thị khi neo hiển thị một phần hoặc toàn bộ trên màn hình. Với `position-visibility: no-overflow`, phần tử được định vị sẽ bị ẩn ngay khi nó bắt đầu tràn ra ngoài viewport.

{{ EmbedLiveSample("Basic usage", "100%", "180") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- {{cssxref("position")}}
- {{cssxref("position-area")}}
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
