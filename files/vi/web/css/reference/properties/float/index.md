---
title: float
slug: Web/CSS/Reference/Properties/float
page-type: css-property
browser-compat: css.properties.float
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`float`** đặt một phần tử sang phía trái hoặc phải của container, cho phép văn bản và các phần tử inline bao quanh nó. Phần tử được lấy ra khỏi luồng bình thường của trang, nhưng vẫn là một phần của luồng (khác với [định vị tuyệt đối](/en-US/docs/Web/CSS/Reference/Properties/position#absolute_positioning)).

{{InteractiveExample("CSS Demo: float")}}

```css interactive-example-choice
float: none;
```

```css interactive-example-choice
float: left;
```

```css interactive-example-choice
float: right;
```

```css interactive-example-choice
float: inline-start;
```

```css interactive-example-choice
float: inline-end;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">Float me</div>
    As much mud in the streets as if the waters had but newly retired from the
    face of the earth, and it would not be wonderful to meet a Megalosaurus,
    forty feet long or so, waddling like an elephantine lizard up Holborn Hill.
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  padding: 0.75em;
  text-align: left;
  width: 80%;
  line-height: normal;
}

#example-element {
  border: solid 10px #efac09;
  background-color: #040d46;
  color: white;
  padding: 1em;
  width: 40%;
}
```

_Phần tử float_ là phần tử có giá trị tính toán của `float` khác `none`.

Vì `float` ngụ ý sử dụng bố cục khối, nó thay đổi giá trị tính toán của các giá trị {{cssxref("display")}} trong một số trường hợp:

| Giá trị được khai báo | Giá trị tính toán |
| --------------------- | ----------------- |
| `inline`              | `block`           |
| `inline-block`        | `block`           |
| `inline-table`        | `table`           |
| `table-row`           | `block`           |
| `table-row-group`     | `block`           |
| `table-column`        | `block`           |
| `table-column-group`  | `block`           |
| `table-cell`          | `block`           |
| `table-caption`       | `block`           |
| `table-header-group`  | `block`           |
| `table-footer-group`  | `block`           |
| `inline-flex`         | `flex`            |
| `inline-grid`         | `grid`            |
| _khác_                | _không đổi_       |

> [!NOTE]
> Khi truy cập thuộc tính CSS trong JavaScript thông qua đối tượng {{domxref("HTMLElement.style")}}, các tên thuộc tính một từ được dùng nguyên bản. Mặc dù `float` là từ khóa dành riêng trong JavaScript, thuộc tính CSS `float` được truy cập dưới dạng `float` trong các trình duyệt hiện đại. Trong các trình duyệt cũ hơn, bạn phải dùng `cssFloat` để truy cập thuộc tính `float`. (Điều này tương tự cách thuộc tính "class" được truy cập là "className" và thuộc tính "for" của phần tử `<label>` được truy cập là "htmlFor".)

## Cú pháp

```css
/* Giá trị từ khóa */
float: left;
float: right;
float: none;
float: inline-start;
float: inline-end;

/* Giá trị toàn cục */
float: inherit;
float: initial;
float: revert;
float: revert-layer;
float: unset;
```

Thuộc tính `float` được xác định bằng một từ khóa duy nhất, chọn từ danh sách giá trị dưới đây.

### Giá trị

- `left`
  - : Phần tử phải float sang phía trái của khối chứa.
- `right`
  - : Phần tử phải float sang phía phải của khối chứa.
- `none`
  - : Phần tử không được float.
- `inline-start`
  - : Phần tử phải float về phía đầu của khối chứa. Đó là phía trái với văn bản `ltr` và phía phải với văn bản `rtl`.
- `inline-end`
  - : Phần tử phải float về phía cuối của khối chứa. Đó là phía phải với văn bản `ltr` và phía trái với văn bản `rtl`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách định vị các phần tử float

Như đã đề cập ở trên, khi một phần tử được float, nó được lấy ra khỏi luồng bình thường của tài liệu (nhưng vẫn là một phần của nó). Nó được dịch chuyển sang trái hoặc phải cho đến khi chạm vào cạnh hộp chứa, _hoặc một phần tử float khác_.

Trong ví dụ này, có ba hình vuông màu. Hai hình float sang trái và một hình float sang phải. Lưu ý rằng hình vuông "trái" thứ hai được đặt sang phải của hình vuông đầu tiên. Các hình vuông bổ sung sẽ tiếp tục xếp sang phải, cho đến khi lấp đầy hộp chứa, sau đó sẽ bao sang dòng tiếp theo.

Một phần tử float có chiều cao ít nhất bằng chiều cao của các float lồng trong cao nhất. Chúng ta đã đặt `width: 100%` cho phần tử cha và float nó để đảm bảo nó đủ cao để bao gồm các float con, và để đảm bảo nó chiếm chiều rộng của phần tử cha để chúng ta không phải xóa phần tử anh em liền kề của nó.

#### HTML

```html
<section>
  <div class="left">1</div>
  <div class="left">2</div>
  <div class="right">3</div>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique
    sapien ac erat tincidunt, sit amet dignissim lectus vulputate. Donec id
    iaculis velit. Aliquam vel malesuada erat. Praesent non magna ac massa
    aliquet tincidunt vel in massa. Phasellus feugiat est vel leo finibus
    congue.
  </p>
</section>
```

#### CSS

```css
section {
  box-sizing: border-box;
  border: 1px solid blue;
  width: 100%;
  float: left;
}

div {
  margin: 5px;
  width: 50px;
  height: 150px;
}

.left {
  float: left;
  background: pink;
}

.right {
  float: right;
  background: cyan;
}
```

#### Kết quả

{{EmbedLiveSample('How_floated_elements_are_positioned','400','190')}}

### Xóa float

Đôi khi bạn có thể muốn buộc một item di chuyển xuống dưới bất kỳ phần tử float nào. Ví dụ, bạn có thể muốn các đoạn văn nằm bên cạnh các float, nhưng buộc tiêu đề nằm trên dòng riêng của chúng. Xem {{cssxref("clear")}} để biết ví dụ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Block formatting context](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- Sử dụng {{cssxref("clear")}} để buộc một item di chuyển xuống dưới phần tử float.
