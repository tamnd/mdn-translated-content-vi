---
title: pointer-events
slug: Web/CSS/Reference/Properties/pointer-events
page-type: css-property
browser-compat: css.properties.pointer-events
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`pointer-events`** đặt điều kiện (nếu có) để một phần tử đồ họa cụ thể có thể trở thành [mục tiêu](/en-US/docs/Web/API/Event/target) của các sự kiện con trỏ.

{{InteractiveExample("CSS Demo: pointer-events")}}

```css interactive-example-choice
pointer-events: auto;
```

```css interactive-example-choice
pointer-events: none;
```

```css interactive-example-choice
pointer-events: stroke; /* SVG-only */
```

```css interactive-example-choice
pointer-events: fill; /* SVG-only */
```

```html interactive-example
<section class="flex-column" id="default-example">
  <div id="example-element">
    <p>
      <a href="#">example link</a>
    </p>
    <p>
      <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <a xlink:href="#">
          <circle
            cx="50"
            cy="50"
            fill="#3E6E84"
            r="40"
            stroke="#ffb500"
            stroke-width="5"></circle>
          <text fill="white" text-anchor="middle" x="50" y="55">SVG</text>
        </a>
      </svg>
    </p>
  </div>
</section>
```

```css interactive-example
#example-element {
  font-weight: bold;
}

#example-element a {
  color: #009e5f;
}

#example-element svg {
  width: 10em;
  height: 10em;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
pointer-events: auto;
pointer-events: none;

/* Giá trị dùng trong SVG */
pointer-events: visiblePainted;
pointer-events: visibleFill;
pointer-events: visibleStroke;
pointer-events: visible;
pointer-events: painted;
pointer-events: fill;
pointer-events: stroke;
pointer-events: bounding-box;
pointer-events: all;

/* Giá trị toàn cục */
pointer-events: inherit;
pointer-events: initial;
pointer-events: revert;
pointer-events: revert-layer;
pointer-events: unset;
```

Thuộc tính `pointer-events` được chỉ định bằng một từ khóa từ danh sách giá trị bên dưới.

### Các giá trị

- `auto`
  - : Phần tử hoạt động như thể thuộc tính `pointer-events` không được chỉ định. Trong nội dung SVG, giá trị này và giá trị `visiblePainted` có cùng hiệu lực.
- `none`
  - : Bản thân phần tử không bao giờ là [mục tiêu](/en-US/docs/Web/API/Event/target) của các sự kiện con trỏ. Tuy nhiên, cây con của nó vẫn có thể là mục tiêu bằng cách đặt `pointer-events` cho phần tử con thành một giá trị khác. Trong những trường hợp này, các sự kiện con trỏ sẽ kích hoạt trình lắng nghe sự kiện trên phần tử cha này khi cần thiết khi đi đến hoặc từ phần tử con trong giai đoạn bắt và [nổi bọt](/en-US/docs/Web/API/Event/bubbles) sự kiện.

    > [!NOTE]
    > Các sự kiện `pointerenter` và `pointerleave` được kích hoạt khi thiết bị trỏ di chuyển vào một phần tử hoặc một trong các phần tử con của nó. Vì vậy, ngay cả khi `pointer-events: none` được đặt cho phần tử cha mà không đặt cho các phần tử con, các sự kiện vẫn được kích hoạt trên phần tử cha sau khi con trỏ di chuyển vào hoặc ra khỏi phần tử con.

#### Chỉ SVG (thử nghiệm cho HTML)

- `visiblePainted`
  - : Chỉ SVG (thử nghiệm cho HTML). Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi thuộc tính `visibility` được đặt là `visible` và ví dụ con trỏ chuột đang ở phần bên trong (tức là 'fill') của phần tử và thuộc tính `fill` được đặt là giá trị khác `none`, hoặc khi con trỏ chuột ở chu vi (tức là 'stroke') của phần tử và thuộc tính `stroke` được đặt là giá trị khác `none`.
- `visibleFill`
  - : Chỉ SVG. Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi thuộc tính `visibility` được đặt là `visible` và ví dụ con trỏ chuột đang ở phần bên trong (tức là fill) của phần tử. Giá trị của thuộc tính `fill` không ảnh hưởng đến việc xử lý sự kiện.
- `visibleStroke`
  - : Chỉ SVG. Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi thuộc tính `visibility` được đặt là `visible` và ví dụ con trỏ chuột đang ở chu vi (tức là stroke) của phần tử. Giá trị của thuộc tính `stroke` không ảnh hưởng đến việc xử lý sự kiện.
- `visible`
  - : Chỉ SVG (thử nghiệm cho HTML). Phần tử có thể là mục tiêu của sự kiện con trỏ khi thuộc tính `visibility` được đặt là `visible` và ví dụ con trỏ chuột đang ở phần bên trong (tức là fill) hoặc chu vi (tức là stroke) của phần tử. Giá trị của `fill` và `stroke` không ảnh hưởng đến việc xử lý sự kiện.
- `painted`
  - : Chỉ SVG (thử nghiệm cho HTML). Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi ví dụ con trỏ chuột đang ở phần bên trong (tức là 'fill') của phần tử và thuộc tính `fill` được đặt là giá trị khác `none`, hoặc khi con trỏ chuột ở chu vi (tức là 'stroke') và thuộc tính `stroke` được đặt là giá trị khác `none`. Giá trị của thuộc tính `visibility` không ảnh hưởng đến việc xử lý sự kiện.
- `fill`
  - : Chỉ SVG. Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi con trỏ ở phần bên trong (tức là fill) của phần tử. Giá trị của thuộc tính `fill` và `visibility` không ảnh hưởng đến việc xử lý sự kiện.
- `stroke`
  - : Chỉ SVG. Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi con trỏ ở chu vi (tức là stroke) của phần tử. Giá trị của thuộc tính `stroke` và `visibility` không ảnh hưởng đến việc xử lý sự kiện.
- `bounding-box`
  - : Chỉ SVG. Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi con trỏ ở [bounding box](/en-US/docs/Glossary/Bounding_box) của phần tử.
- `all`
  - : Chỉ SVG (thử nghiệm cho HTML). Phần tử chỉ có thể là mục tiêu của sự kiện con trỏ khi con trỏ ở phần bên trong (tức là fill) hoặc chu vi (tức là stroke) của phần tử. Giá trị của thuộc tính `fill`, `stroke` và `visibility` không ảnh hưởng đến việc xử lý sự kiện.

## Mô tả

Khi thuộc tính này không được chỉ định, các đặc điểm tương tự của giá trị `visiblePainted` áp dụng cho nội dung SVG.

Ngoài việc chỉ ra rằng phần tử không phải là mục tiêu của sự kiện con trỏ, giá trị `none` hướng dẫn sự kiện con trỏ đi "xuyên qua" phần tử và nhắm vào bất cứ thứ gì "bên dưới" phần tử đó.

Lưu ý rằng việc ngăn phần tử trở thành mục tiêu của sự kiện con trỏ bằng cách dùng `pointer-events` _không_ nhất thiết có nghĩa là các trình lắng nghe sự kiện con trỏ trên phần tử đó _không thể_ hoặc _sẽ không_ được kích hoạt. Nếu một trong các phần tử con có `pointer-events` được đặt rõ ràng để _cho phép_ phần tử con đó là mục tiêu của sự kiện con trỏ, thì bất kỳ sự kiện nào nhắm vào phần tử con đó sẽ đi qua phần tử cha khi sự kiện truyền theo chuỗi cha, và kích hoạt trình lắng nghe sự kiện trên phần tử cha khi thích hợp. Tất nhiên mọi hoạt động con trỏ tại một điểm trên màn hình được bao phủ bởi phần tử cha nhưng không phải bởi phần tử con sẽ không bị bắt bởi cả phần tử con lẫn cha (nó sẽ "xuyên qua" phần tử cha và nhắm vào bất cứ thứ gì bên dưới).

Các phần tử có `pointer-events: none` vẫn nhận được tiêu điểm thông qua điều hướng bàn phím tuần tự dùng phím <kbd>Tab</kbd>.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Vô hiệu hóa sự kiện con trỏ trên tất cả hình ảnh

Ví dụ này vô hiệu hóa các sự kiện con trỏ (nhấp, kéo, di chuột, v.v.) trên tất cả hình ảnh.

```css
img {
  pointer-events: none;
}
```

### Vô hiệu hóa sự kiện con trỏ trên một liên kết đơn

Ví dụ này vô hiệu hóa các sự kiện con trỏ trên liên kết đến `http://example.com`.

#### HTML

```html
<ul>
  <li><a href="https://developer.mozilla.org">MDN</a></li>
  <li><a href="http://example.com">example.com</a></li>
</ul>
```

#### CSS

```css
a[href="http://example.com"] {
  pointer-events: none;
}
```

#### Kết quả

{{EmbedLiveSample("Disabling_pointer_events_on_a_single_link", "500", "100")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("user-select")}}
- Thuộc tính SVG {{SVGAttr("pointer-events")}}
- Thuộc tính SVG {{SVGAttr("visibility")}}
- {{domxref("PointerEvent")}}
