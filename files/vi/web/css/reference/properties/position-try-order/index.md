---
title: position-try-order
slug: Web/CSS/Reference/Properties/position-try-order
page-type: css-property
browser-compat: css.properties.position-try-order
sidebar: cssref
---

Thuộc tính **`position-try-order`** của [CSS](/vi/docs/Web/CSS) cho phép bạn chỉ định các tùy chọn dự phòng khác nhau để sử dụng một tùy chọn dự phòng position-try sẵn có nhằm đặt vị trí cho phần tử được định vị theo neo, thay vì cài đặt vị trí ban đầu của nó.

> [!NOTE]
> Cũng có thuộc tính viết tắt — {{cssxref("position-try")}}, có thể được dùng để chỉ định các giá trị `position-try-order` và {{cssxref("position-try-fallbacks")}} trong một khai báo duy nhất.

## Cú pháp

```css
/* Từ khóa */
position-try-order: normal;
position-try-order: most-height;
position-try-order: most-width;
position-try-order: most-block-size;
position-try-order: most-inline-size;

/* Giá trị toàn cục */
position-try-order: inherit;
position-try-order: initial;
position-try-order: revert;
position-try-order: revert-layer;
position-try-order: unset;
```

### Giá trị

Thuộc tính `position-try-order` có thể được chỉ định là giá trị từ khóa `normal` hoặc một `<try-size>`.

- `normal`
  - : Mặc định. Không có tùy chọn dự phòng position-try nào được thử khi phần tử được hiển thị lần đầu.
- `<try-size>`
  - : Xác định các tùy chọn dự phòng try size khác nhau, chỉ định tiêu chí xác định tùy chọn dự phòng nào sẽ được áp dụng cho phần tử được định vị theo neo khi nó được hiển thị lần đầu. Các giá trị có thể là:
    - `most-height`
      - : Tùy chọn dự phòng position try sẽ được áp dụng để mang lại cho khối chứa phần tử nhiều chiều cao nhất.
    - `most-width`
      - : Tùy chọn dự phòng position try sẽ được áp dụng để mang lại cho khối chứa phần tử nhiều chiều rộng nhất.
    - `most-block-size`
      - : Tùy chọn dự phòng position try sẽ được áp dụng để mang lại cho khối chứa phần tử kích thước lớn nhất theo hướng block.
    - `most-inline-size`
      - : Tùy chọn dự phòng position try sẽ được áp dụng để mang lại cho khối chứa phần tử kích thước lớn nhất theo hướng inline.

## Mô tả

Thuộc tính `position-try-order` có trọng tâm hơi khác so với các tính năng chức năng position-try còn lại, ở chỗ nó sử dụng các tùy chọn dự phòng position-try khi phần tử được định vị lần đầu hiển thị, thay vì khi nó đang được cuộn. Ví dụ, bạn có thể muốn ban đầu hiển thị phần tử trong không gian có nhiều chiều cao hoặc chiều rộng sẵn có hơn so với vị trí ban đầu mặc định.

Trình duyệt sẽ kiểm tra các tùy chọn dự phòng position-try sẵn có để tìm tùy chọn nào mang lại cho phần tử được định vị theo neo nhiều không gian nhất trong kích thước được chỉ định. Sau đó nó sẽ áp dụng tùy chọn đó, ghi đè kiểu dáng ban đầu của phần tử.

Nếu không có tùy chọn dự phòng position try nào cung cấp nhiều chiều rộng/chiều cao hơn so với vị trí ban đầu được gán cho phần tử, không có tùy chọn position try nào sẽ được áp dụng. Về hiệu quả, hành vi giống như `position-try-order` được đặt thành `normal`.

Để biết thông tin chi tiết về tính năng neo và cách sử dụng tùy chọn position try, xem module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `position-try-order` cơ bản

Bản demo này minh họa hiệu ứng của `position-try-order`.

#### HTML

HTML bao gồm hai phần tử {{htmlelement("div")}} sẽ trở thành một neo và một phần tử được định vị theo neo, và một `<form>` chứa các nút radio cho phép bạn chọn các giá trị `position-try-order` khác nhau.

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<form>
  <fieldset>
    <legend>Choose a try order</legend>
    <div>
      <label for="radio-normal">normal</label>
      <input
        type="radio"
        id="radio-normal"
        name="position-try-order"
        value="normal"
        checked />
    </div>
    <div>
      <label for="radio-most-height">most-height</label>
      <input
        type="radio"
        id="radio-most-height"
        name="position-try-order"
        value="most-height" />
    </div>
  </fieldset>
</form>
```

#### CSS

Trong CSS, neo được đặt {{cssxref("anchor-name")}} và có {{cssxref("margin")}} lớn để định vị nó ở gần trung tâm phía trên của viewport:

```css hidden
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
  margin: 90px auto;
}
```

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
  text-align: center;
}

form {
  position: fixed;
  bottom: 2px;
  right: 2px;
}
```

Tiếp theo chúng ta thêm tùy chọn vị trí tùy chỉnh tên `--custom-bottom` để định vị phần tử bên dưới neo và đặt lề phù hợp:

```css
@position-try --custom-bottom {
  top: anchor(bottom);
  bottom: unset;
  margin-top: 10px;
}
```

Ban đầu chúng ta định vị phần tử phía trên neo, sau đó cung cấp tùy chọn vị trí tùy chỉnh bằng thuộc tính viết tắt `position-try`, đồng thời đặt thuộc tính `position-try-order` thành `normal`:

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;

  bottom: anchor(top);
  margin-bottom: 10px;
  justify-self: anchor-center;

  position-try: normal --custom-bottom;
}
```

#### JavaScript

Cuối cùng, chúng ta thêm JavaScript. Đây đặt trình xử lý sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) trên các nút radio để khi một giá trị mới được chọn, giá trị đó được áp dụng cho thuộc tính `position-try-order` của infobox.

```js
const infobox = document.querySelector(".infobox");
const form = document.forms[0];
const radios = form.elements["position-try-order"];

for (const radio of radios) {
  radio.addEventListener("change", setTryOrder);
}

function setTryOrder(e) {
  const tryOrder = e.target.value;
  infobox.style.positionTryOrder = tryOrder;
}
```

#### Kết quả

{{ EmbedLiveSample("Basic `position-try-order` usage", "100%", "310") }}

Thử chọn tùy chọn thứ tự `most-height`. Điều này có hiệu ứng áp dụng `--custom-bottom` làm tùy chọn dự phòng position try, đặt phần tử bên dưới neo. Điều này xảy ra vì có nhiều không gian dọc hơn bên dưới neo so với phía trên.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-try")}}
- {{cssxref("position-try-fallbacks")}}
- Quy tắc at {{cssxref("@position-try")}}
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Fallback options and conditional hiding for overflow](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
