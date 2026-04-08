---
title: background-position
slug: Web/CSS/Reference/Properties/background-position
page-type: css-property
browser-compat: css.properties.background-position
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`background-position`** đặt vị trí ban đầu cho mỗi ảnh nền. Vị trí tương đối so với lớp vị trí được đặt bởi {{cssxref("background-origin")}}.

{{InteractiveExample("CSS Demo: background-position")}}

```css interactive-example-choice
background-position: top;
```

```css interactive-example-choice
background-position: left;
```

```css interactive-example-choice
background-position: center;
```

```css interactive-example-choice
background-position: 25% 75%;
```

```css interactive-example-choice
background-position: bottom 50px right 100px;
```

```css interactive-example-choice
background-position: right 35% bottom 45%;
```

```html interactive-example
<section class="display-block" id="default-example">
  <div class="transition-all" id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  background-color: navajowhite;
  background-image: url("/shared-assets/images/examples/star.png");
  background-repeat: no-repeat;
  height: 100%;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-position: top;
background-position: bottom;
background-position: left;
background-position: right;
background-position: center;

/* Giá trị <percentage> */
background-position: 25% 75%;

/* Giá trị <length> */
background-position: 0 0;
background-position: 1cm 2cm;
background-position: 10ch 8em;

/* Nhiều ảnh */
background-position:
  0 0,
  center;

/* Giá trị offset cạnh */
background-position: bottom 10px right 20px;
background-position: right 3em bottom 10px;
background-position: bottom 10px right;
background-position: top right 10px;

/* Giá trị toàn cục */
background-position: inherit;
background-position: initial;
background-position: revert;
background-position: revert-layer;
background-position: unset;
```

Thuộc tính `background-position` được chỉ định bằng một hoặc nhiều giá trị `<position>`, phân cách bằng dấu phẩy.

### Giá trị

- `<position>`
  - : Một {{cssxref("&lt;position&gt;")}}. Một vị trí định nghĩa tọa độ x/y, để đặt một mục tương đối so với các cạnh của hộp phần tử. Nó có thể được định nghĩa bằng một đến bốn giá trị. Nếu hai giá trị không phải từ khóa được sử dụng, giá trị đầu tiên đại diện cho vị trí ngang và giá trị thứ hai đại diện cho vị trí dọc. Nếu chỉ có một giá trị được chỉ định, giá trị thứ hai được mặc định là `center`. Nếu ba hoặc bốn giá trị được sử dụng, các giá trị length-percentage là offset cho giá trị từ khóa đứng trước.

    **Cú pháp 1 giá trị:** Giá trị có thể là:
    - Giá trị từ khóa `center`, căn giữa ảnh.
    - Một trong các giá trị từ khóa `top`, `left`, `bottom`, hoặc `right`. Điều này chỉ định một cạnh để đặt mục. Chiều kia sau đó được đặt là 50%, vì vậy mục được đặt ở giữa cạnh được chỉ định.
    - Một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Điều này chỉ định tọa độ X tương đối so với cạnh trái, với tọa độ Y được đặt là 50%.

    **Cú pháp 2 giá trị:** Một giá trị định nghĩa X và giá trị kia định nghĩa Y. Mỗi giá trị có thể là:
    - Một trong các giá trị từ khóa `top`, `left`, `bottom`, hoặc `right`. Nếu `left` hoặc `right` được cho, thì giá trị này định nghĩa X và giá trị kia định nghĩa Y. Nếu `top` hoặc `bottom` được cho, thì giá trị này định nghĩa Y và giá trị kia định nghĩa X.
    - Một {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Nếu giá trị kia là `left` hoặc `right`, thì giá trị này định nghĩa Y, tương đối so với cạnh trên. Nếu giá trị kia là `top` hoặc `bottom`, thì giá trị này định nghĩa X, tương đối so với cạnh trái. Nếu cả hai giá trị đều là `<length>` hoặc `<percentage>`, thì giá trị đầu tiên định nghĩa X và giá trị thứ hai định nghĩa Y.
    - Lưu ý: Nếu một giá trị là `top` hoặc `bottom`, thì giá trị kia không thể là `top` hoặc `bottom`. Nếu một giá trị là `left` hoặc `right`, thì giá trị kia không thể là `left` hoặc `right`. Điều này có nghĩa là, ví dụ, `top top` và `left right` không hợp lệ.
    - Thứ tự: Khi ghép các từ khóa, vị trí không quan trọng vì trình duyệt có thể sắp xếp lại; các giá trị `top left` và `left top` sẽ cho kết quả giống nhau. Khi ghép {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} với từ khóa, vị trí quan trọng: giá trị định nghĩa X phải đến trước rồi đến Y, vì vậy ví dụ giá trị `right 20px` hợp lệ trong khi `20px right` không hợp lệ. Các giá trị `left 20%` và `20% bottom` hợp lệ vì các giá trị X và Y được xác định rõ ràng và vị trí đúng.
    - Giá trị mặc định là `left top` hoặc `0% 0%`.

    **Cú pháp 3 giá trị:** Hai giá trị là giá trị từ khóa, và giá trị thứ ba là offset cho giá trị đứng trước:
    - Giá trị đầu tiên là một trong các giá trị từ khóa `top`, `left`, `bottom`, `right`, hoặc `center`. Nếu `left` hoặc `right` được cho ở đây, thì giá trị này định nghĩa X. Nếu `top` hoặc `bottom` được cho, thì giá trị này định nghĩa Y và giá trị từ khóa kia định nghĩa X.
    - Giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}, nếu là giá trị thứ hai, là offset cho giá trị đầu tiên. Nếu là giá trị thứ ba, nó là offset cho giá trị thứ hai.
    - Giá trị length hoặc percentage đơn là offset cho giá trị từ khóa đứng trước nó. Tổ hợp một từ khóa với hai giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}} không hợp lệ.

    **Cú pháp 4 giá trị:** Giá trị đầu tiên và thứ ba là giá trị từ khóa định nghĩa X và Y. Giá trị thứ hai và thứ tư là offset cho các giá trị từ khóa X và Y đứng trước:
    - Giá trị đầu tiên và thứ ba bằng một trong các giá trị từ khóa `top`, `left`, `bottom`, hoặc `right`. Nếu `left` hoặc `right` được cho cho giá trị đầu tiên, thì giá trị này định nghĩa X và giá trị kia định nghĩa Y. Nếu `top` hoặc `bottom` được cho cho giá trị đầu tiên, thì giá trị này định nghĩa Y và giá trị từ khóa kia định nghĩa X.
    - Giá trị thứ hai và thứ tư là các giá trị {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị thứ hai là offset cho từ khóa đầu tiên. Giá trị thứ tư là offset cho từ khóa thứ hai.

### Về phần trăm

Offset phần trăm của vị trí ảnh nền được cho tương đối so với container. Giá trị 0% có nghĩa là cạnh trái (hoặc trên) của ảnh nền được căn với cạnh trái (hoặc trên) tương ứng của container, hay điểm 0% của ảnh sẽ ở điểm 0% của container. Giá trị 100% có nghĩa là cạnh _phải_ (hoặc _dưới_) của ảnh nền được căn với cạnh _phải_ (hoặc _dưới_) của container, hay điểm 100% của ảnh sẽ ở điểm 100% của container. Vì vậy giá trị 50% ngang hoặc dọc căn giữa ảnh nền vì điểm 50% của ảnh sẽ ở điểm 50% của container. Tương tự, `background-position: 25% 75%` có nghĩa là điểm trên ảnh cách trái 25% và cách trên 75% sẽ được đặt tại điểm trên container cách trái 25% và cách trên 75%.

Về cơ bản điều xảy ra là kích thước ảnh nền _bị trừ_ khỏi kích thước container tương ứng, rồi một phần trăm của giá trị kết quả được dùng làm offset trực tiếp từ cạnh trái (hoặc trên).

```plain
(container width - image width) * (position x%) = (x offset value)
(container height - image height) * (position y%) = (y offset value)
```

Sử dụng trục X làm ví dụ, giả sử chúng ta có ảnh rộng 300px và sử dụng nó trong container rộng 100px, với `background-size` được đặt là auto:

```plain
100px - 300px = -200px (container & image difference)
```

Vậy với phần trăm vị trí là -25%, 0%, 50%, 100%, 125%, chúng ta nhận được các giá trị offset cạnh ảnh so với container là:

```plain
-200px * -25% = 50px
-200px * 0% = 0px
-200px * 50% = -100px
-200px * 100% = -200px
-200px * 125% = -250px
```

Vậy với các giá trị kết quả này cho ví dụ của chúng ta, **cạnh trái** của **ảnh** được offset từ **cạnh trái** của **container** theo:

- \+ 50px (đặt cạnh trái ảnh ở giữa container rộng 100px)
- 0px (cạnh trái ảnh trùng với cạnh trái container)
- \-100px (cạnh trái ảnh cách 100px về bên trái container, trong ví dụ này có nghĩa là 100px giữa ảnh được căn giữa container)
- \-200px (cạnh trái ảnh cách 200px về bên trái container, trong ví dụ này có nghĩa là cạnh phải ảnh trùng với cạnh phải container)
- \-250px (cạnh trái ảnh cách 250px về bên trái container, trong ví dụ này đặt cạnh phải của ảnh 300px ở giữa container)

Đáng lưu ý rằng nếu `background-size` của bạn bằng kích thước container cho một trục nhất định, thì vị trí _phần trăm_ cho trục đó sẽ không có hiệu lực vì "sự khác biệt container-ảnh" sẽ bằng không. Bạn sẽ cần offset bằng giá trị tuyệt đối.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định vị ảnh nền

Mỗi trong ba ví dụ này sử dụng thuộc tính {{cssxref("background")}} để tạo phần tử hình chữ nhật màu vàng chứa ảnh ngôi sao. Trong mỗi ví dụ, ngôi sao ở một vị trí khác nhau. Ví dụ thứ ba minh họa cách chỉ định vị trí cho hai ảnh nền khác nhau trong một phần tử.

#### HTML

```html
<div class="example-one">Example One</div>
<div class="example-two">Example Two</div>
<div class="example-three">Example Three</div>
```

#### CSS

```css
/* Shared among all <div>s */
div {
  background-color: #ffee99;
  background-repeat: no-repeat;
  width: 300px;
  height: 80px;
  margin-bottom: 12px;
}

/* These examples use the `background` shorthand property */
.example-one {
  background: url("star-transparent.gif") #ffee99 2.5cm bottom no-repeat;
}
.example-two {
  background: url("star-transparent.gif") #ffee99 left 4em bottom 1em no-repeat;
}

/* Multiple background images: Each image is matched with the
   corresponding position, from first specified to last. */
.example-three {
  background-image: url("star-transparent.gif"), url("cat-front.png");
  background-position:
    0px 0px,
    right 3em bottom 2em;
}
```

#### Kết quả

{{EmbedLiveSample('Positioning_background_images', 420, 200)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-position-x")}}
- {{cssxref("background-position-y")}}
- [Sử dụng nhiều nền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- {{cssxref("transform-origin")}}
