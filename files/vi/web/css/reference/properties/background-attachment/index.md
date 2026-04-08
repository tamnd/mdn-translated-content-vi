---
title: background-attachment
slug: Web/CSS/Reference/Properties/background-attachment
page-type: css-property
browser-compat: css.properties.background-attachment
sidebar: cssref
---

Thuộc tính **`background-attachment`** [CSS](/en-US/docs/Web/CSS) xác định xem vị trí của hình ảnh nền có cố định trong {{glossary("viewport")}} hay cuộn cùng với khối chứa của nó.

{{InteractiveExample("CSS Demo: background-attachment")}}

```css interactive-example-choice
background-attachment: scroll;
```

```css interactive-example-choice
background-attachment: fixed;
```

```css interactive-example-choice
background-attachment: local;
```

```css interactive-example-choice
background-attachment: fixed, scroll;
```

```css interactive-example-choice
background-attachment: scroll, fixed;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>
      From there to here<br />
      from here to there,<br />
      Funny things<br />
      Are everywhere.
    </p>
    <p>--Dr. Seuss</p>
  </div>
</section>
```

```css interactive-example
body {
  overflow: scroll;
}

#default-example {
  height: 600px;
}

#example-element {
  max-width: 20rem;
  height: 100%;
  background:
    url("/shared-assets/images/examples/lizard.png") right 3rem top 1rem / 15rem
      no-repeat,
    url("/shared-assets/images/examples/moon.jpg") center / 10rem;
  font-size: 1.2rem;
  font-weight: bolder;
  overflow: auto;
  padding: 20px;
  color: red;
  text-shadow:
    0 0 0.5rem black,
    0 0 0.5rem black;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
background-attachment: scroll;
background-attachment: fixed;
background-attachment: local;

/* Giá trị toàn cục */
background-attachment: inherit;
background-attachment: initial;
background-attachment: revert;
background-attachment: revert-layer;
background-attachment: unset;
```

Thuộc tính `background-attachment` được chỉ định là một hoặc nhiều giá trị từ khóa, phân tách bằng dấu phẩy.

### Giá trị

- `fixed`
  - : Nền được cố định tương đối với viewport. Ngay cả khi phần tử có cơ chế cuộn, nền không di chuyển cùng với phần tử. Nếu được thiết lập, thuộc tính {{cssxref("background-origin")}} bị bỏ qua.
- `local`
  - : Nền được cố định tương đối với nội dung của phần tử. Nếu phần tử có cơ chế cuộn, nền cuộn cùng với nội dung của phần tử, và vùng vẽ nền và vùng định vị nền là tương đối với vùng cuộn của phần tử thay vì với đường viền bao quanh chúng.
- `scroll`
  - : Nền được cố định tương đối với chính phần tử và không cuộn cùng với nội dung của nó. (Nó thực tế được gắn với đường viền của phần tử.)

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

#### HTML

Chúng ta bao gồm một danh sách không thứ tự ({{htmlelement("ul")}}) với một số mục danh sách (({{htmlelement("li")}}).

```html
<ul>
  <li>One fish</li>
  <li>Two fish</li>
  <li>Red fish</li>
  <li>Blue fish</li>
  <li>Black fish</li>
  <li>Blue fish</li>
  <li>Old fish</li>
  <li>New fish.</li>
  <li>This one has a little star.</li>
  <li>This one has a little car.</li>
  <li>Say! What a lot</li>
  <li>Of fish there are.</li>
</ul>
```

#### CSS

Chúng ta định nghĩa {{cssxref("background-image")}} và thiết lập `background-attachment` thành `fixed`. Chúng ta cũng bao gồm {{cssxref("height")}}, {{cssxref("width")}} và {{cssxref("overflow")}} để đảm bảo phần tử cuộn được.

```css
ul {
  background-image: url("star-solid.gif");
  background-attachment: fixed;

  width: 300px;
  height: 70px;
  overflow: scroll;
}
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

Lưu ý cách nền vẫn cố định tương đối với viewport của danh sách khi bạn cuộn văn bản tràn ra vào tầm nhìn.

### Nhiều hình ảnh nền

Thuộc tính này hỗ trợ nhiều hình ảnh nền. Bạn có thể chỉ định `<attachment>` khác nhau cho mỗi nền, phân tách bằng dấu phẩy. Mỗi hình ảnh được khớp với kiểu `<attachment>` tương ứng, từ đầu tiên đến cuối cùng được chỉ định.

#### HTML

Chúng ta bao gồm toàn bộ bài thơ của Dr. Seuss.

```html
<div>
  <ul>
    <li>One fish</li>
    <li>Two fish</li>
    <li>Red fish</li>
    <li>Blue fish</li>
    <li>Black fish</li>
    <li>Blue fish</li>
    <li>Old fish</li>
    <li>New fish.</li>
    <li>This one has a little star.</li>
    <li>This one has a little car.</li>
    <li>Say! What a lot</li>
    <li>Of fish there are.</li>
    <li>Yes. Some are red. And some are blue.</li>
    <li>Some are old. And some are new.</li>
    <li>Some are sad.</li>
    <li>And some are glad.</li>
    <li>And some are very, very bad.</li>
    <li>Why are they</li>
    <li>Sad and glad and bad?</li>
    <li>I do not know.</li>
    <li>Go ask your dad.</li>
    <li>Some are thin.</li>
    <li>And some are fat.</li>
    <li>The fat one has</li>
    <li>A yellow hat.</li>
    <li>From there to here, from here to there,</li>
    <li>Funny things</li>
    <li>Are everywhere.</li>
  </ul>
  <p>--Dr. Seuss</p>
</div>
```

#### CSS

Chúng ta bao gồm {{cssxref("height")}}, {{cssxref("width")}} và {{cssxref("overflow")}} trên phần tử cha {{htmlelement("div")}} để đảm bảo nội dung cuộn được.

Chúng ta định nghĩa hai hình ảnh nền phân tách bằng dấu phẩy trên danh sách, và thiết lập `background-attachment` thành `fixed, scroll`, có nghĩa là hình ảnh nền đầu tiên sẽ là `fixed` và hình ảnh thứ hai sẽ `scroll`. Chúng ta thiết lập {{cssxref("background-repeat")}} để cả hai hình ảnh nền lặp lại theo chiều dọc, phân tách chúng bằng thuộc tính {{cssxref("background-position")}}.

```css
div {
  width: 300px;
  height: 200px;
  overflow: scroll;
}
ul {
  background-image: url("star-solid.gif"), url("star-transparent.gif");
  background-attachment: fixed, scroll;
  background-repeat: repeat-y;
  background-position:
    0 0,
    100px 0;
}
```

#### Kết quả

{{EmbedLiveSample("Multiple_background_images")}}

Lưu ý cách hình ảnh nền đầu tiên được cố định với viewport trong khi hình ảnh nền thứ hai được cố định tương đối với danh sách.

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính CSS {{cssxref("background")}} khác:
  - {{cssxref("background-clip")}}
  - {{cssxref("background-color")}}
  - {{cssxref("background-image")}}
  - {{cssxref("background-origin")}}
  - {{cssxref("background-position")}}
  - {{cssxref("background-repeat")}}
  - {{cssxref("background-size")}}
- [Using multiple backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
