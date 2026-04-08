---
title: "@position-try"
slug: Web/CSS/Reference/At-rules/@position-try
page-type: css-at-rule
browser-compat: css.at-rules.position-try
sidebar: cssref
---

At-rule **`@position-try`** của [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) được dùng để định nghĩa một tùy chọn dự phòng thử vị trí tùy chỉnh, có thể được dùng để xác định vị trí và căn chỉnh cho các phần tử được định vị neo. Một hoặc nhiều bộ tùy chọn dự phòng thử vị trí có thể được áp dụng cho phần tử được neo qua thuộc tính {{cssxref("position-try-fallbacks")}} hoặc cách viết tắt {{cssxref("position-try")}}. Khi phần tử được định vị bị di chuyển đến vị trí mà nó bắt đầu tràn ra ngoài khối chứa hoặc viewport, trình duyệt sẽ chọn tùy chọn dự phòng thử vị trí đầu tiên mà nó tìm thấy để đặt phần tử được định vị hoàn toàn trở lại trên màn hình.

Mỗi tùy chọn vị trí được đặt tên bằng {{cssxref("dashed-ident")}} và chứa danh sách mô tả chỉ định các khai báo xác định thông tin như vị trí inset, lề, kích thước và căn chỉnh bản thân. `<dashed-ident>` được dùng để tham chiếu đến tùy chọn vị trí tùy chỉnh trong thuộc tính {{cssxref("position-try-fallbacks")}} và cách viết tắt {{cssxref("position-try")}}.

Để biết thông tin chi tiết về các tính năng neo và cách sử dụng dự phòng thử vị trí, hãy xem module [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Tùy chọn dự phòng và ẩn có điều kiện khi tràn](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding).

## Cú pháp

```css
@position-try --try-option-name {
  descriptor-list
}
```

> [!NOTE]
> `--try-option-name` là {{cssxref("dashed-ident")}} chỉ định tên nhận dạng cho tùy chọn vị trí tùy chỉnh, sau đó có thể được sử dụng để thêm tùy chọn dự phòng đó vào danh sách {{cssxref("position-try-fallbacks")}}.

### Mô tả

Các mô tả chỉ định các giá trị thuộc tính xác định hành vi của tùy chọn vị trí tùy chỉnh, tức là nơi nó sẽ đặt phần tử được định vị.

- `position-anchor`
  - : Chỉ định giá trị thuộc tính {{cssxref("position-anchor")}} xác định phần tử neo mà phần tử được định vị gắn kết với, bằng cách chỉ định giá trị {{cssxref("dashed-ident")}} bằng với giá trị thuộc tính {{cssxref("anchor-name")}} của phần tử neo.
- `position-area`
  - : Chỉ định giá trị thuộc tính {{cssxref("position-area")}} xác định vị trí của phần tử được định vị neo so với neo.
- [Mô tả thuộc tính Inset](/en-US/docs/Glossary/Inset_properties)
  - : Chỉ định các giá trị hàm [`anchor()`](/en-US/docs/Web/CSS/Reference/Values/anchor) xác định vị trí của các cạnh phần tử được định vị neo so với cạnh phần tử neo. Các mô tả thuộc tính inset có thể được đặt để đại diện cho các thuộc tính sau:
    - {{cssxref("top")}}
    - {{cssxref("left")}}
    - {{cssxref("bottom")}}
    - {{cssxref("right")}}.
    - {{cssxref("inset-block-start")}}
    - {{cssxref("inset-block-end")}}
    - {{cssxref("inset-inline-start")}}
    - {{cssxref("inset-inline-end")}}
    - {{cssxref("inset-block")}}
    - {{cssxref("inset-inline")}}
    - {{cssxref("inset")}}
- Mô tả thuộc tính lề
  - : Chỉ định lề được đặt trên phần tử được định vị neo. Các mô tả thuộc tính lề có thể được đặt để đại diện cho các thuộc tính sau:
    - {{cssxref("margin-top")}}
    - {{cssxref("margin-left")}}
    - {{cssxref("margin-bottom")}}
    - {{cssxref("margin-right")}}
    - {{cssxref("margin-block-start")}}
    - {{cssxref("margin-block-end")}}
    - {{cssxref("margin-inline-start")}}
    - {{cssxref("margin-inline-end")}}
    - {{cssxref("margin")}}
    - {{cssxref("margin-block")}}
    - {{cssxref("margin-inline")}}
- Mô tả thuộc tính kích thước
  - : Chỉ định các giá trị hàm [`anchor-size()`](/en-US/docs/Web/CSS/Reference/Values/anchor-size) xác định kích thước của phần tử được định vị neo so với kích thước phần tử neo. Các mô tả thuộc tính kích thước có thể được đặt để đại diện cho các thuộc tính sau:
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
- Mô tả thuộc tính căn chỉnh bản thân
  - : Chỉ định giá trị [`anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center) để căn chỉnh phần tử được định vị neo so với trung tâm của phần tử neo, theo hướng khối hoặc nội tuyến. Các mô tả thuộc tính {{cssxref("align-self")}} và {{cssxref("justify-self")}} có thể nhận giá trị `anchor-center`.

> [!NOTE]
> Khi một tùy chọn vị trí tùy chỉnh được áp dụng cho một phần tử, các giá trị thuộc tính được định nghĩa trong mô tả at-rule `@position-try` có ưu tiên cao hơn các giá trị được đặt trên phần tử thông qua các thuộc tính CSS chuẩn.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng tùy chọn vị trí tùy chỉnh

Trong ví dụ này, chúng tôi định nghĩa một phần tử neo và một phần tử được định vị neo, sau đó tạo bốn tùy chọn dự phòng thử vị trí tùy chỉnh có tên. Các tùy chọn này được áp dụng cho phần tử được định vị để đảm bảo nội dung của nó luôn hiển thị bất kể phần tử neo ở đâu trong viewport.

#### HTML

Chúng tôi bao gồm hai phần tử {{htmlelement("div")}} sẽ trở thành một neo và một phần tử được định vị neo:

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

#### CSS

Đầu tiên chúng tôi tạo kiểu cho phần tử `<body>` rất lớn để chúng tôi có thể cuộn neo và phần tử được định vị quanh viewport, cả ngang và dọc:

```css
body {
  width: 1500px;
  height: 500px;
}
```

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

Neo được cung cấp một {{cssxref("anchor-name")}} và có giá trị {{cssxref("position")}} là `absolute`. Sau đó chúng tôi định vị nó ở đâu đó gần trung tâm của kết xuất `<body>` ban đầu bằng cách sử dụng các giá trị {{cssxref("top")}} và {{cssxref("left")}}:

```css
.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 350px;
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
}
```

Tiếp theo, chúng tôi sử dụng at-rule `@position-try` để định nghĩa bốn tùy chọn vị trí tùy chỉnh, với tên {{cssxref("dashed-ident")}} mô tả để nhận dạng chúng và mô tả mục đích của chúng. Mỗi cái đặt phần tử được định vị ở một vị trí cụ thể quanh phần tử neo và cung cấp cho nó lề `10px` phù hợp giữa phần tử được định vị và neo của nó. Việc định vị được xử lý theo nhiều cách khác nhau, để minh họa các kỹ thuật khác nhau có sẵn:

- Tùy chọn vị trí đầu tiên và cuối cùng sử dụng {{cssxref("position-area")}}.
- Tùy chọn vị trí thứ hai sử dụng {{cssxref("top")}} với giá trị {{cssxref("anchor()")}} và {{cssxref("justify-self", "justify-self: anchor-center")}} để căn giữa phần tử được định vị trên neo theo hướng nội tuyến.
- Tùy chọn vị trí thứ ba sử dụng {{cssxref("left")}} với giá trị {{cssxref("anchor()")}}, được bọc trong hàm {{cssxref("calc()")}} thêm `10px` khoảng cách (thay vì tạo khoảng cách bằng {{cssxref("margin")}} như các tùy chọn khác). Sau đó nó sử dụng {{cssxref("align-self", "align-self: anchor-center")}} để căn giữa phần tử được định vị trên neo theo hướng khối.

Cuối cùng, các tùy chọn vị trí trái và phải được cung cấp {{cssxref("width")}} hẹp hơn

```css
@position-try --custom-left {
  position-area: left;
  width: 100px;
  margin-right: 10px;
}

@position-try --custom-bottom {
  top: anchor(bottom);
  justify-self: anchor-center;
  margin-top: 10px;
  position-area: none;
}

@position-try --custom-right {
  left: calc(anchor(right) + 10px);
  align-self: anchor-center;
  width: 100px;
  position-area: none;
}

@position-try --custom-bottom-right {
  position-area: bottom right;
  margin: 10px 0 0 10px;
}
```

Hộp thông tin được cung cấp vị trí cố định, thuộc tính {{cssxref("position-anchor")}} tham chiếu đến `anchor-name` của neo để liên kết hai cái lại với nhau, và nó được gắn vào cạnh trên của neo bằng {{cssxref("position-area")}}. Chúng tôi cũng cung cấp cho nó một {{cssxref("width")}} cố định và một số {{cssxref("margin")}} phía dưới. Các tùy chọn vị trí tùy chỉnh sau đó được tham chiếu trong thuộc tính {{cssxref("position-try-fallbacks")}} để ngăn phần tử được định vị tràn ra ngoài, hoặc bị cuộn ra khỏi tầm nhìn, khi neo đến gần cạnh của viewport.

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top;
  width: 200px;
  margin-bottom: 10px;
  position-try-fallbacks:
    --custom-left, --custom-bottom, --custom-right, --custom-bottom-right;
}
```

#### Kết quả

Cuộn trang và nhận thấy sự thay đổi trong vị trí đặt của phần tử được định vị khi neo tiến gần đến các cạnh khác nhau của viewport. Điều này là do các tùy chọn vị trí dự phòng khác nhau được áp dụng.

{{ EmbedLiveSample("Custom position option usage", "100%", "250") }}

Hãy nói qua cách các tùy chọn vị trí này hoạt động:

- Trước hết, lưu ý rằng vị trí mặc định của chúng tôi được xác định bởi `position-area: top`. Khi hộp thông tin không tràn ra ngoài trang theo bất kỳ hướng nào, hộp thông tin nằm phía trên neo và các tùy chọn dự phòng thử vị trí được đặt trong thuộc tính `position-try-fallbacks` bị bỏ qua. Cũng lưu ý rằng hộp thông tin có chiều rộng cố định và lề dưới được đặt. Các giá trị này sẽ thay đổi khi các tùy chọn dự phòng thử vị trí khác nhau được áp dụng.
- Nếu hộp thông tin bắt đầu tràn ra ngoài, trình duyệt đầu tiên thử vị trí `--custom-left`. Điều này di chuyển hộp thông tin sang trái của neo bằng `position-area: left`, điều chỉnh lề cho phù hợp và cũng cung cấp cho hộp thông tin một chiều rộng khác.
- Tiếp theo, trình duyệt thử vị trí `--custom-bottom`. Điều này di chuyển hộp thông tin xuống dưới neo bằng `top` và `justify-self` thay vì `position-area`, và đặt lề phù hợp. Nó không bao gồm mô tả `width`, vì vậy hộp thông tin quay trở lại chiều rộng mặc định `200px` được đặt bởi thuộc tính `width`.
- Trình duyệt tiếp theo thử vị trí `--custom-right`. Điều này hoạt động khá giống với vị trí `--custom-left`, với cùng giá trị mô tả `width` được áp dụng. Tuy nhiên, chúng tôi đang sử dụng `left` và `align-self` để đặt phần tử được định vị thay vì `position-area`. Và chúng tôi đang bọc giá trị `left` trong hàm `calc()` mà trong đó chúng tôi đang thêm `10px` để tạo khoảng cách, thay vì sử dụng `margin`.
- Nếu không có tùy chọn dự phòng thử nào khác thành công trong việc ngăn phần tử được định vị tràn ra ngoài, trình duyệt thử vị trí `--custom-bottom-right` như là phương án cuối cùng. Điều này đặt phần tử được định vị ở phía dưới bên phải của neo bằng `position-area: bottom right`.

Khi một tùy chọn vị trí được áp dụng, các giá trị của nó ghi đè các giá trị ban đầu được đặt trên phần tử được định vị. Ví dụ, `width` ban đầu được đặt trên phần tử được định vị là `200px`, nhưng khi tùy chọn vị trí `--custom-right` được áp dụng, chiều rộng của nó được đặt thành `100px`.

Trong một số trường hợp, chúng tôi cần đặt các giá trị bên trong các tùy chọn vị trí tùy chỉnh để tắt các giá trị ban đầu. Các tùy chọn `--custom-bottom` và `--custom-right` sử dụng thuộc tính inset và các giá trị `*-self: anchor-center` để đặt phần tử được định vị, do đó chúng tôi xóa giá trị `position-area` đã đặt trước đó trong mỗi trường hợp bằng cách đặt `position-area: none`. Nếu chúng tôi không làm điều này, giá trị `position-area: top` ban đầu được đặt vẫn sẽ có hiệu lực và can thiệp vào thông tin định vị khác.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("position-area")}}
- {{cssxref("position-anchor")}}
- {{cssxref("position-try-fallbacks")}}
- {{cssxref("position-try")}}
- Hàm {{cssxref("anchor()")}}
- Hàm {{cssxref("anchor-size()")}}
- Module [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Sử dụng định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Tùy chọn dự phòng và ẩn có điều kiện khi tràn](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- {{domxref("CSSPositionTryRule")}}
