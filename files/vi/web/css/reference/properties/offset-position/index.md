---
title: offset-position
slug: Web/CSS/Reference/Properties/offset-position
page-type: css-property
browser-compat: css.properties.offset-position
sidebar: cssref
---

Thuộc tính **`offset-position`** [CSS](/en-US/docs/Web/CSS) xác định vị trí ban đầu của phần tử dọc theo một đường dẫn. Thuộc tính này thường được sử dụng kết hợp với thuộc tính {{cssxref("offset-path")}} để tạo hiệu ứng chuyển động. Giá trị của `offset-position` xác định nơi phần tử được đặt ban đầu để di chuyển dọc theo đường dẫn offset nếu hàm `offset-path` như {{cssxref("basic-shape/path", "path()")}} không chỉ định vị trí bắt đầu riêng của nó.

Thuộc tính `offset-position` là một phần của hệ thống chuyển động dựa trên các thuộc tính thành phần {{cssxref("offset")}}, bao gồm {{cssxref("offset-anchor")}}, {{cssxref("offset-distance")}}, và `offset-path`. Các thuộc tính này hoạt động cùng nhau để tạo ra các hiệu ứng chuyển động khác nhau dọc theo đường dẫn.

## Cú pháp

```css
/* Giá trị từ khóa */
offset-position: normal;
offset-position: auto;
offset-position: top;
offset-position: bottom;
offset-position: left;
offset-position: right;
offset-position: center;

/* Giá trị <percentage> */
offset-position: 25% 75%;

/* Giá trị <length> */
offset-position: 0 0;
offset-position: 1cm 2cm;
offset-position: 10ch 8em;

/* Giá trị offset cạnh */
offset-position: bottom 10px right 20px;
offset-position: right 3em bottom 10px;
offset-position: bottom 10px right;
offset-position: top right 10px;

/* Giá trị toàn cục */
offset-position: inherit;
offset-position: initial;
offset-position: revert;
offset-position: revert-layer;
offset-position: unset;
```

### Giá trị

- `normal`
  - : Chỉ ra rằng phần tử không có vị trí bắt đầu offset và đặt phần tử tại `50% 50%` của khối chứa. Đây là giá trị mặc định.
- `auto`
  - : Chỉ ra rằng vị trí bắt đầu offset là góc trên bên trái của hộp phần tử.
- {{cssxref("&lt;position&gt;")}}
  - : Chỉ định vị trí như tọa độ x/y để đặt phần tử tương đối so với các cạnh hộp của nó. Vị trí có thể được xác định bằng một đến bốn giá trị. Nếu hai giá trị không phải từ khóa được sử dụng, giá trị đầu tiên đại diện cho vị trí ngang và giá trị thứ hai đại diện cho vị trí dọc. Nếu chỉ một giá trị được chỉ định, giá trị thứ hai được giả định là `center`. Nếu ba hoặc bốn giá trị được sử dụng, các giá trị {{cssxref("length-percentage")}} là các offset cho (các) giá trị từ khóa trước đó. Để biết thêm giải thích về các loại giá trị này, hãy xem {{cssxref("background-position")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt vị trí offset ban đầu cho một offset-path

Trong ví dụ này, thuộc tính {{cssxref("offset-path")}} được sử dụng để xác định đường dẫn mà phần tử `cyan` nên di chuyển. Giá trị của hàm CSS {{cssxref("basic-shape/path", "path()")}} là một [đường dẫn dữ liệu SVG](/en-US/docs/Web/SVG/Reference/Attribute/d) mô tả một đường dẫn cong. Phần tử di chuyển dọc theo đường dẫn cong này trong suốt hoạt ảnh `move`.

#### HTML

```html
<div id="wrap">
  <div id="motion-demo"></div>
</div>
```

#### CSS

```css hidden
#wrap {
  width: 260px;
  height: 160px;
  border: 1px dashed black;
}
```

```css
#motion-demo {
  offset-path: path("M20,20 C20,100 200,0 200,100");
  offset-position: left top;
  animation: move 3000ms infinite alternate ease-in-out;
  width: 40px;
  height: 40px;
  background: cyan;
}

@keyframes move {
  0%,
  20% {
    offset-distance: 0%;
  }
  80%,
  100% {
    offset-distance: 100%;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Setting_initial_offset_position_for_an_offset-path', '100%', 200)}}

### So sánh các vị trí bắt đầu offset khác nhau

Ví dụ này so sánh trực quan các vị trí bắt đầu offset ban đầu khác nhau của phần tử khi {{cssxref("ray()")}} được sử dụng để chỉ định giá trị cho thuộc tính {{cssxref("offset-path")}}. Số bên trong hộp phần tử chỉ ra phần tử CSS được áp dụng cũng như điểm anchor của phần tử.

```html hidden
<div class="wrap">
  <div class="box">0</div>
  <div class="box box0">0</div>
  <pre>
    offset-position: normal;
    /* No offset-path specified */
  </pre>
</div>

<div class="wrap">
  <div class="box">0</div>
  <div class="box box1">1</div>
  <pre>
    offset-position: normal;
    offset-path: ray(0deg);
  </pre>
</div>

<div class="wrap">
  <div class="box">0</div>
  <div class="box box2">2</div>
  <pre>
    offset-position: auto;
    offset-path: ray(0deg);
  </pre>
</div>

<div class="wrap">
  <div class="box">0</div>
  <div class="box box3">3</div>
  <pre>
    offset-position: left top;
    offset-path: ray(0deg);
  </pre>
</div>

<div class="wrap">
  <div class="box">0</div>
  <div class="box box4">4</div>
  <pre>
    offset-position: 30% 70%;
    offset-path: ray(120deg);
  </pre>
</div>
```

```css hidden
.wrap {
  position: relative;
  width: 80vw;
  height: 120px;
  border: 1px solid black;
  margin: 0 2em 4em 5em;
  text-align: center;
}

pre {
  font-size: 1em;
  text-align: right;
  padding-right: 10px;
  line-height: 1em;
}

.box {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 50px;
  height: 50px;
}

.box + .box {
  opacity: 1;
}
```

```css
.box {
  background-color: green;
  border-top: 6px dashed white;
  background-clip: border-box;
  position: absolute;
  top: 20px;
  left: 20px;
  opacity: 20%;
  color: white;
}

.box0 {
  offset-position: normal;
}

.box1 {
  offset-position: normal;
  offset-path: ray(0deg);
}

.box2 {
  offset-position: auto;
  offset-path: ray(0deg);
}

.box3 {
  offset-position: left top;
  offset-path: ray(0deg);
}

.box4 {
  offset-position: 30% 70%;
  offset-path: ray(120deg);
}
```

#### Kết quả

{{EmbedLiveSample('Comparing various offset starting positions', '100%', 930)}}

Trong `box0`, sự vắng mặt của thuộc tính `offset-path` có nghĩa là `offset-position` là `normal` hoặc `auto` không có hiệu lực. Khi `offset-position` là `normal`, ray bắt đầu tại tâm của khối chứa (tức là `50% 50%`). Đây là vị trí bắt đầu mặc định của đường dẫn offset và được sử dụng khi không có `offset-position` được chỉ định. Lưu ý sự khác biệt giữa các vị trí bắt đầu offset `auto` và `left top`. Giá trị `auto` căn chỉnh điểm anchor của phần tử với góc trên bên trái của chính nó, trong khi giá trị `left top` căn chỉnh điểm anchor của phần tử với góc trên bên trái của khối chứa.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("offset")}}
- {{cssxref("offset-anchor")}}
- {{cssxref("offset-distance")}}
- {{cssxref("offset-path")}}
- {{cssxref("offset-rotate")}}
