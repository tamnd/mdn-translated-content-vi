---
title: Stacking context
slug: Web/CSS/Guides/Positioned_layout/Stacking_context
page-type: guide
sidebar: cssref
---

**Stacking context** là khái niệm hóa ba chiều của các phần tử HTML dọc theo một trục z ảo tương đối với người dùng, người này được giả định là đang nhìn vào viewport hay trang web. Stacking context xác định cách các phần tử được xếp lớp chồng lên nhau dọc theo trục z (hãy nghĩ đó là chiều "sâu" trên màn hình của bạn). Stacking context xác định thứ tự hiển thị trực quan của nội dung chồng lấp nhau.

Các phần tử trong một stacking context được xếp chồng độc lập với các phần tử nằm ngoài stacking context đó, đảm bảo các phần tử trong một stacking context không can thiệp vào thứ tự stacking của các phần tử trong stacking context khác. Mỗi stacking context hoàn toàn độc lập với các stacking context anh em của nó: chỉ các phần tử con mới được xem xét khi xử lý stacking.

Mỗi stacking context là khép kín. Sau khi nội dung của một phần tử được xếp chồng xong, toàn bộ phần tử đó được coi là một đơn vị duy nhất trong thứ tự stacking của stacking context cha của nó.

Trong một stacking context, các phần tử con được xếp chồng theo các giá trị `z-index` của tất cả các anh em. Stacking context của các phần tử lồng nhau này chỉ có nghĩa trong stacking context cha này. Stacking context được xử lý nguyên tử như một đơn vị duy nhất trong stacking context cha. Stacking context có thể nằm trong các stacking context khác, và cùng nhau tạo thành một phân cấp các stacking context.

Phân cấp các stacking context là tập hợp con của phân cấp các phần tử HTML vì chỉ một số phần tử nhất định mới tạo ra stacking context. Các phần tử không tạo stacking context riêng được _đồng hóa_ vào stacking context cha.

## Các tính năng tạo stacking context

Stacking context được hình thành ở bất kỳ đâu trong tài liệu, bởi bất kỳ phần tử nào trong các trường hợp sau:

- Phần tử gốc của tài liệu (`<html>`).
- Phần tử có giá trị {{cssxref("position")}} là `absolute` hoặc `relative` và giá trị {{cssxref("z-index")}} khác `auto`.
- Phần tử có giá trị {{cssxref("position")}} là `fixed` hoặc `sticky`.
- Phần tử có giá trị {{cssxref("container-type")}} là `size` hoặc `inline-size` được đặt (Xem [container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)).
- Phần tử là [flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) với giá trị {{cssxref("z-index")}} khác `auto`.
- Phần tử là [grid item]() với giá trị {{cssxref("z-index")}} khác `auto`.
- Phần tử có giá trị {{cssxref("opacity")}} nhỏ hơn `1`.
- Phần tử có giá trị {{cssxref("mix-blend-mode")}} khác `normal`.
- Phần tử có bất kỳ thuộc tính nào sau đây với giá trị khác `none`:
  - {{cssxref("transform")}}
  - {{cssxref("scale")}}
  - {{cssxref("rotate")}}
  - {{cssxref("translate")}}
  - {{cssxref("filter")}}
  - {{cssxref("backdrop-filter")}}
  - {{cssxref("perspective")}}
  - {{cssxref("clip-path")}}
  - {{cssxref("mask")}} / {{cssxref("mask-image")}} / {{cssxref("mask-border")}}

- Phần tử có giá trị {{cssxref("isolation")}} là `isolate`.
- Phần tử có giá trị {{cssxref("will-change")}} chỉ định bất kỳ thuộc tính nào mà sẽ tạo stacking context khi có giá trị không phải ban đầu.
- Phần tử có giá trị {{cssxref("contain")}} là `layout` hoặc `paint`, hoặc giá trị kết hợp bao gồm một trong hai giá trị này (ví dụ: `contain: strict`, `contain: content`).
- Phần tử được đặt vào [top layer](/en-US/docs/Glossary/Top_layer) và {{cssxref("::backdrop")}} tương ứng của nó. Ví dụ bao gồm các phần tử [fullscreen](/en-US/docs/Web/API/Fullscreen_API) và [popover](/en-US/docs/Web/API/Popover_API).
- Phần tử có các thuộc tính tạo stacking context (chẳng hạn như `opacity`) được animate bằng {{cssxref("@keyframes")}}, với {{cssxref("animation-fill-mode")}} được đặt thành [`forwards`](/en-US/docs/Web/CSS/Reference/Properties/animation-fill-mode#forwards).

## Stacking context lồng nhau

Stacking context có thể nằm trong các stacking context khác, và chúng có thể cùng nhau tạo thành một phân cấp các stacking context.

Phần tử gốc của tài liệu là một stacking context mà trong hầu hết các trường hợp, chứa các stacking context lồng nhau, nhiều stacking context trong số đó sẽ chứa thêm các stacking context. Trong mỗi stacking context, các phần tử con được xếp chồng theo cùng các quy tắc được giải thích trong [Using `z-index`](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index). Quan trọng là các giá trị `z-index` của các stacking context con chỉ có nghĩa trong stacking context của cha của chúng. Stacking context được xử lý nguyên tử như một đơn vị duy nhất trong stacking context cha.

Để tìm ra _thứ tự hiển thị_ của các phần tử được xếp chồng dọc theo trục z, hãy nghĩ mỗi giá trị index như một loại "số phiên bản", trong đó các phần tử con đại diện cho số phiên bản phụ bên dưới số phiên bản chính của cha chúng.

Để minh họa cách thứ tự stacking của mỗi phần tử tham gia vào thứ tự stacking của stacking context tổ tiên, hãy xem một trang ví dụ với sáu phần tử container. Có ba phần tử {{htmlelement("article")}} anh em. Phần tử `<article>` cuối cùng chứa ba phần tử {{htmlelement("section")}} anh em, với {{htmlelement("heading_elements", "&lt;h1&gt;")}} và {{htmlelement("code")}} của bài viết thứ ba đó xuất hiện giữa phần tử `<section>` thứ nhất và thứ hai.

```html
<article id="container1">
  <h1>Article element #1</h1>
  <code>
    position: relative;<br />
    z-index: 5;
  </code>
</article>

<article id="container2">
  <h1>Article Element #2</h1>
  <code>
    position: relative;<br />
    z-index: 2;
  </code>
</article>

<article id="container3">
  <section id="container4">
    <h1>Section Element #4</h1>
    <code>
      position: relative;<br />
      z-index: 6;
    </code>
  </section>

  <h1>Article Element #3</h1>
  <code>
    position: absolute;<br />
    z-index: 4;
  </code>

  <section id="container5">
    <h1>Section Element #5</h1>
    <code>
      position: relative;<br />
      z-index: 1;
    </code>
  </section>

  <section id="container6">
    <h1>Section Element #6</h1>
    <code>
      position: absolute;<br />
      z-index: 3;
    </code>
  </section>
</article>
```

Mỗi phần tử container có {{cssxref("opacity")}} nhỏ hơn `1` (tạo stacking context), và {{cssxref("position")}} là `relative` hoặc `absolute` (tạo stacking context khi phần tử cũng có giá trị `z-index` khác `auto`).

```css hidden
* {
  margin: 0;
}
html {
  padding: 20px;
  font:
    12px/20px "Arial",
    sans-serif;
}
h1 {
  font-size: 1.25em;
}
#container1,
#container2 {
  border: 1px dashed #669966;
  padding: 10px;
  background-color: #ccffcc;
}
#container1 {
  margin-bottom: 190px;
}
#container3 {
  border: 1px dashed #990000;
  background-color: #ffdddd;
  padding: 40px 20px 20px;
  width: 330px;
}
#container4 {
  border: 1px dashed #999966;
  background-color: #ffffcc;
  padding: 25px 10px 5px;
  margin-bottom: 15px;
}
#container5 {
  border: 1px dashed #999966;
  background-color: #ffffcc;
  margin-top: 15px;
  padding: 5px 10px;
}
#container6 {
  background-color: #ddddff;
  border: 1px dashed #000099;
  padding-left: 20px;
  padding-top: 125px;
  width: 150px;
  height: 125px;
}
```

```css
section,
article {
  opacity: 0.85;
  position: relative;
}
#container1 {
  z-index: 5;
}
#container2 {
  z-index: 2;
}
#container3 {
  z-index: 4;
  position: absolute;
  top: 40px;
  left: 180px;
}
#container4 {
  z-index: 6;
}
#container5 {
  z-index: 1;
}
#container6 {
  z-index: 3;
  position: absolute;
  top: 20px;
  left: 180px;
}
```

Các thuộc tính CSS về màu sắc, font chữ, căn chỉnh và [box-model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction) đã được ẩn đi để ngắn gọn.

{{ EmbedLiveSample('Nested stacking contexts', '100%', '396') }}

Phân cấp stacking context trong ví dụ trên như sau:

```plain no-lint
Root
│
├── ARTICLE #1
├── ARTICLE #2
└── ARTICLE #3
  │
  ├── SECTION #4
  ├────  ARTICLE #3 content
  ├── SECTION #5
  └── SECTION #6
```

Ba phần tử `<section>` là con của ARTICLE #3. Do đó, việc xếp chồng các phần tử section được giải quyết hoàn toàn trong ARTICLE #3. Sau khi xếp chồng và hiển thị trong ARTICLE #3 hoàn thành, toàn bộ phần tử ARTICLE #3 được chuyển để xếp chồng trong phần tử gốc liên quan đến các phần tử `<article>` anh em của nó.

Bằng cách so sánh `z-index` như "số phiên bản", chúng ta có thể thấy cách một phần tử có `z-index` là `1` (SECTION #5) được xếp trên một phần tử có `z-index` là `2` (ARTICLE #2), và cách một phần tử có `z-index` là `6` (SECTION #4) được xếp bên dưới một phần tử có `z-index` là `5` (ARTICLE #1).
SECTION #4 được hiển thị dưới ARTICLE #1 vì z-index của ARTICLE #1 (`5`) hợp lệ trong stacking context của phần tử gốc, trong khi z-index của SECTION #4 (`6`) hợp lệ trong stacking context của ARTICLE #3 (`z-index: 4`). Vì vậy SECTION #4 nằm dưới ARTICLE #1 vì SECTION #4 thuộc về ARTICLE #3, có giá trị z-index thấp hơn (`4-6` nhỏ hơn `5-0`).

Vì lý do tương tự, ARTICLE #2 (`z-index: 2`) được hiển thị dưới SECTION #5 (`z-index`: 1) vì SECTION #5 thuộc về ARTICLE #3 (`z-index: 4`), có giá trị z-index cao hơn (`2-0` nhỏ hơn `4-1`).

Z-index của ARTICLE #3 là `4`, nhưng giá trị này độc lập với `z-index` của ba section lồng bên trong nó vì chúng thuộc về một stacking context khác.

Trong ví dụ của chúng ta (sắp xếp theo thứ tự hiển thị cuối cùng):

- Root
  - ARTICLE #2: (`z-index`: 2), kết quả thứ tự hiển thị là `2-0`
  - ARTICLE #3: (`z-index`: 4), kết quả thứ tự hiển thị là `4-0`
    - SECTION #5: (`z-index`: 1), xếp dưới một phần tử (`z-index`: 4), kết quả thứ tự hiển thị là `4-1`
    - SECTION #6: (`z-index`: 3), xếp dưới một phần tử (`z-index`: 4), kết quả thứ tự hiển thị là `4-3`
    - SECTION #4: (`z-index`: 6), xếp dưới một phần tử (`z-index`: 4), kết quả thứ tự hiển thị là `4-6`

  - ARTICLE #1: (`z-index`: 5), kết quả thứ tự hiển thị là `5-0`

## Ví dụ bổ sung

Các ví dụ bổ sung bao gồm [phân cấp 2 cấp với `z-index` ở cấp cuối](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_1), [phân cấp HTML 2 cấp, `z-index` ở tất cả các cấp](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_2), và [phân cấp HTML 3 cấp, `z-index` ở cấp thứ hai](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context/Example_3).

## Xem thêm

- [Understanding z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index)
- [Stacking without the `z-index` property](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_without_z-index)
- [Stacking floating elements](/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_floating_elements)
- [Using z-index](/en-US/docs/Web/CSS/Guides/Positioned_layout/Using_z-index)
- {{glossary("Top layer")}}
- Module [CSS positioned layout](/en-US/docs/Web/CSS/Guides/Positioned_layout)
