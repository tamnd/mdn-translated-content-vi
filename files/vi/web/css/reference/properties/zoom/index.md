---
title: zoom
slug: Web/CSS/Reference/Properties/zoom
page-type: css-property
browser-compat: css.properties.zoom
sidebar: cssref
---

Thuộc tính **`zoom`** của [CSS](/vi/docs/Web/CSS) có thể được sử dụng để kiểm soát mức độ phóng to của một phần tử. {{cssxref("transform-function/scale", "transform: scale()")}} có thể được sử dụng như một giải pháp thay thế cho thuộc tính này.

Thuộc tính CSS `zoom` phóng to phần tử được nhắm đến, điều này có thể ảnh hưởng đến bố cục trang. Khi phóng to, phần tử được thu phóng từ `top` và `center` khi sử dụng {{CSSXRef("writing-mode")}} mặc định.

Ngược lại, một phần tử được thu phóng bằng {{cssxref("transform-function/scale", "scale()")}} sẽ không gây ra tính toán lại bố cục hoặc di chuyển các phần tử khác trên trang. Nếu sử dụng `scale()` làm cho nội dung lớn hơn phần tử chứa, thì {{CSSXRef("overflow")}} sẽ có hiệu lực. Ngoài ra, các phần tử được điều chỉnh bằng biến đổi `scale()` sẽ thu phóng từ `center` theo mặc định; điều này có thể được thay đổi bằng thuộc tính CSS {{CSSXRef("transform-origin")}}.

## Cú pháp

```css
/* Giá trị <percentage> */
zoom: 50%;
zoom: 200%;

/* Giá trị <number> */
zoom: 1.1;
zoom: 0.7;

/* Giá trị từ khóa không chuẩn */
zoom: normal;
zoom: reset;

/* Giá trị toàn cục */
zoom: inherit;
zoom: initial;
zoom: revert;
zoom: revert-layer;
zoom: unset;
```

### Giá trị

- {{cssxref("&lt;percentage&gt;")}}
  - : Hệ số thu phóng. `100%` tương đương với `normal`. Các giá trị lớn hơn `100%` phóng to. Các giá trị nhỏ hơn `100%` thu nhỏ.
- {{cssxref("&lt;number&gt;")}}
  - : Hệ số thu phóng. Tương đương với phần trăm tương ứng (`1.0` = `100%` = `normal`). Các giá trị lớn hơn `1.0` phóng to. Các giá trị nhỏ hơn `1.0` thu nhỏ.

Hai giá trị từ khóa không chuẩn không được khuyến nghị. Kiểm tra dữ liệu [khả năng tương thích trình duyệt](#browser_compatibility):

- `normal`
  - : Hiển thị phần tử ở kích thước bình thường; tương đương với `zoom: 1`. Sử dụng giá trị từ khóa toàn cục {{cssxref("unset")}} thay thế.
- `reset`
  - : Đặt lại giá trị về `zoom: 1` và ngăn phần tử bị (thu)phóng nếu người dùng áp dụng thu phóng không dựa trên chụm (ví dụ: bằng cách nhấn phím tắt <kbd>Ctrl</kbd> \- <kbd>-</kbd> hoặc <kbd>Ctrl</kbd> \+ <kbd>+</kbd>) vào tài liệu.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thay đổi kích thước đoạn văn

Trong ví dụ này, các phần tử đoạn văn được thu phóng; khi di chuột qua một đoạn văn, giá trị `zoom` được đặt thành `unset`.

#### HTML

```html
<p class="small">Small</p>
<p class="normal">Normal</p>
<p class="big">Big</p>
```

#### CSS

```css hidden
body {
  display: flex;
  align-items: center;
  justify-content: space-around;
  height: 100vh;
}
```

```css
.small {
  zoom: 75%;
}
.normal {
  zoom: normal;
}
.big {
  zoom: 2.5;
}
p:hover {
  zoom: unset;
}
```

#### Kết quả

{{EmbedLiveSample('resizing_paragraphs')}}

### Thay đổi kích thước phần tử

Trong ví dụ này, các phần tử `div` được thu phóng bằng cách sử dụng các giá trị `normal`, `<percentage>` và `<number>`.

#### HTML

```html
<div id="a" class="circle"></div>
<div id="b" class="circle"></div>
<div id="c" class="circle"></div>
```

#### CSS

```css
div.circle {
  width: 25px;
  height: 25px;
  border-radius: 100%;
  vertical-align: middle;
  display: inline-block;
}
div#a {
  background-color: gold;
  zoom: normal; /* circle is 25px diameter */
}
div#b {
  background-color: green;
  zoom: 200%; /* circle is 50px diameter */
}
div#c {
  background-color: blue;
  zoom: 2.9; /* circle is 72.5px diameter */
}
```

#### Kết quả

{{EmbedLiveSample('resizing_elements')}}

### Tạo điều khiển thu phóng

Trong ví dụ này, một trường `select` được sử dụng để thay đổi mức thu phóng của phần tử.

#### HTML

Trong khối HTML đầu tiên, một trường `select` được xác định với các giá trị `zoom` khác nhau sẽ được sử dụng.

```html
<section class="controls">
  <label for="zoom"
    >Zoom level
    <select name="zoom" id="zoom">
      <option value="0.5">Extra Small</option>
      <option value="0.75">Small</option>
      <option value="normal" selected>Normal</option>
      <option value="1.5">Large</option>
      <option value="2">Extra Large</option>
    </select>
  </label>
</section>
```

Trong khối thứ hai, một thông báo **không được hỗ trợ** được thêm vào và sẽ bị ẩn nếu trình duyệt hỗ trợ `zoom`.

```html
<p class="zoom-notice">CSS zoom is not supported</p>
```

Khối cuối cùng xác định nội dung sẽ được thu phóng.

```html
<section class="content">
  <h1>This is the heading</h1>
  <p>
    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Placeat inventore
    ea eveniet, fugiat in consequatur molestiae nostrum repellendus nam
    provident repellat officiis facilis alias facere obcaecati quos sunt
    voluptas! Iste.
  </p>
  <p>
    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Placeat inventore
    ea eveniet, fugiat in consequatur molestiae nostrum repellendus nam
    provident repellat officiis facilis alias facere obcaecati quos sunt
    voluptas! Iste.
  </p>
</section>
```

#### CSS

Trong khối CSS đầu tiên, chúng ta đặt giá trị khởi đầu cho `--zoom-level` bằng [thuộc tính tùy chỉnh](/vi/docs/Web/CSS/Reference/Properties/--*) và sau đó sử dụng nó làm giá trị cho `zoom` trên khối nội dung.

```css
html {
  --zoom-level: normal;
}
.content {
  max-width: 60ch;
  margin: auto;
  zoom: var(--zoom-level);
}
```

```css hidden
.controls,
.zoom-notice {
  display: flex;
  justify-content: space-around;
}
.zoom-notice {
  color: red;
}
```

Trong khối CSS cuối cùng, chúng ta kiểm tra xem trình duyệt có hỗ trợ `zoom` không và nếu có thì đặt thông báo **không được hỗ trợ** thành `display: none;`.

```css
@supports (zoom: 1) {
  .zoom-notice {
    display: none;
  }
}
```

#### JavaScript

JavaScript này theo dõi sự thay đổi trong trường select và đặt giá trị mới cho `--zoom-level` trên `section` nội dung, ví dụ: `style="--zoom-level: 1.5;"`.

```js
const zoomControl = document.querySelector("#zoom");
const content = document.querySelector(".content");
const updateZoom = () => {
  content.style = `--zoom-level: ${zoomControl.value}`;
};
zoomControl.addEventListener("change", updateZoom);
```

#### Kết quả

{{EmbedLiveSample('creating_a_zoom_control', '550', '280')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`zoom` entry in CSS-Tricks' CSS Almanac](https://css-tricks.com/almanac/properties/z/zoom/)
- {{cssxref("transform")}}
- {{cssxref("scale")}}
- Từ khóa {{cssxref("unset")}}
- [Legacy `zoom` property](https://css-tricks.com/almanac/properties/z/zoom/) via CSS-Tricks (2013)
