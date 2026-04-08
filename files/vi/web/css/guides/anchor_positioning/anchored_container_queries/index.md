---
title: Using anchored container queries
short-title: Anchored container queries
slug: Web/CSS/Guides/Anchor_positioning/Anchored_container_queries
page-type: guide
sidebar: cssref
---

[CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) bao gồm các cơ chế cung cấp [fallback option](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding). Đây là các vị trí thay thế mà trình duyệt có thể thử đặt một anchor-positioned element vào, tương đối với anchor của nó, nhằm đưa phần tử đó trở lại màn hình nếu phần tử bắt đầu tràn ra ngoài viewport.

**Anchored container queries** giúp tăng thêm tính hữu ích của các fallback option trong anchor positioning bằng cách cho phép áp dụng style khác nhau cho anchor-positioned element tùy thuộc vào vị trí fallback nào đang được áp dụng. Hướng dẫn này trình bày cách sử dụng anchored container queries kèm theo một số ví dụ minh họa.

> [!NOTE]
> Để nắm được các khái niệm cơ bản của CSS anchor positioning, hãy xem [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Tóm tắt tính năng

Khi định vị một tooltip tương đối với một phần tử UI bằng anchor positioning, việc cung cấp các `position-try` fallback option thông qua thuộc tính {{cssxref("position-try-fallbacks")}} rất hữu ích. Chúng giúp đảm bảo tooltip hiển thị trên màn hình lâu nhất có thể.

Ví dụ, nếu tooltip được đặt phía trên phần tử UI mà nó neo vào theo mặc định, thì khi người dùng cuộn lên trên, bạn có thể dùng fallback để di chuyển tooltip xuống dưới phần tử ngay trước khi tooltip biến mất khỏi màn hình.

Một vấn đề mà cơ chế này chưa giải quyết được là cập nhật style của anchor-positioned element cho phù hợp với các fallback option khác nhau. Ví dụ, người ta thường thêm một mũi tên nhỏ vào tooltip trỏ về phía anchor element mà nó liên kết, giúp cải thiện trải nghiệm người dùng bằng cách làm rõ sự liên kết trực quan. Khi tooltip di chuyển sang vị trí khác, vị trí và hướng của mũi tên cũng phải thay đổi, nếu không sẽ trông không đúng.

Để giải quyết vấn đề này, bạn có thể sử dụng anchored container queries. Tính năng này mở rộng chức năng của [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries), cho phép bạn phát hiện khi nào một fallback option cụ thể được áp dụng cho anchor-positioned element và áp dụng CSS cho các phần tử con của nó. Cụ thể, anchored container queries dựa trên hai tính năng:

- Giá trị `anchored` của thuộc tính {{cssxref("container-type")}}: Áp dụng giá trị này cho anchor-positioned element để bắt đầu phát hiện khi các fallback option khác nhau được áp dụng lên nó.
- Hàm `anchored()` trong at-rule {{cssxref("@container")}}: Hàm này nhận một [`fallback` descriptor](/en-US/docs/Web/CSS/Reference/At-rules/@container#fallback) làm đối số. Giá trị của descriptor là một giá trị `position-try-fallbacks`.

Ví dụ, giả sử chúng ta có một tooltip element được định vị phía trên anchor theo mặc định thông qua giá trị {{cssxref("position-area")}} là `top`, nhưng có giá trị {{cssxref("position-try-fallbacks")}} là `flip-block`. Điều này sẽ khiến tooltip lật theo hướng block xuống phía dưới anchor khi nó bắt đầu tràn ra khỏi phần trên của viewport. Nếu muốn phát hiện khi fallback được áp dụng cho tooltip, trước tiên ta cần đặt `container-type: anchored` trên nó để biến nó thành anchored query container.

```css
.tooltip {
  position: absolute;
  position-anchor: --my-anchor;
  position-area: top;
  position-try-fallbacks: flip-block;
  container-type: anchored;
}
```

Sau khi thiết lập xong, chúng ta có thể viết một container query như sau:

```css
@container anchored(fallback: flip-block) {
  /* Styles cho phần tử con ở đây */
}
```

Biểu thức kiểm tra — `anchored(fallback: flip-block)` — sẽ trả về true khi fallback option `flip-block` được áp dụng cho tooltip, khi đó các style được chỉ định trong khối `@container` sẽ được áp dụng. Ví dụ, bạn có thể muốn thay đổi vị trí và hướng của mũi tên để nó trỏ lên trên thay vì xuống dưới, hoặc thay đổi hướng của một gradient.

> [!NOTE]
> Lưu ý rằng, giống như tất cả container queries, các style được áp dụng chỉ có thể ảnh hưởng đến các phần tử con của container, không phải bản thân container. Điều này có thể yêu cầu bạn áp dụng một số style của phần tử được định vị lên một wrapper element bên trong nó, thay vì lên chính phần tử đó, như được minh họa trong [Ví dụ nhiều fallback](#multiple_fallbacks_example).

## Ví dụ cơ bản

Ví dụ này bao gồm một anchor element với một infobox được định vị tương đối với nó.
Ban đầu, infobox được đặt phía trên anchor và có một mũi tên trỏ xuống phía anchor. Chúng ta thêm một position try fallback để infobox di chuyển xuống dưới anchor khi nội dung cuộn lên đủ để infobox bắt đầu cuộn ra khỏi phần trên của viewport. Ngoài ra, chúng ta dùng anchored container query để thay đổi style khi fallback hoạt động, di chuyển mũi tên và trỏ nó lên trên thay vì.

Anchor và infobox được biểu diễn bởi hai phần tử {{htmlelement("div")}}, như bên dưới. Chúng được bao quanh bởi nội dung văn bản trong bản render cuối cùng để gây ra việc cuộn trang, nhưng chúng tôi đã ẩn nó để ngắn gọn:

```html
<div class="anchor">⚓︎</div>

<div class="infobox">Infobox</div>
```

```html hidden live-sample___basic-example
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">Infobox</div>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>

<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique. Porta lorem mollis aliquam ut porttitor. Turpis cursus in hac
  habitasse platea dictumst quisque. Dolor sit amet consectetur adipiscing elit.
  Ornare lectus sit amet est placerat. Nulla aliquet porttitor lacus luctus
  accumsan.
</p>
```

Trong CSS, chúng ta bắt đầu bằng cách chỉ định `<div>` có class `anchor` là một anchor element bằng cách gán {{cssxref("anchor-name")}} là `--my-anchor`.

```css hidden live-sample___basic-example
* {
  box-sizing: border-box;
}

html {
  font-family: sans-serif;
}

body {
  width: 80%;
  max-width: 600px;
  margin: 0 auto;
}

p {
  font-size: 1.4em;
  line-height: 1.5;
}

.anchor {
  font-size: 2em;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: blue;
  width: fit-content;
  padding: 5px 10px;
}

.infobox {
  color: white;
  background-color: black;
  font-size: 1.4em;
  padding: 10px;
  margin: 1rem;
  border-radius: 10px;
}

.infobox::before {
  color: black;
  font-size: 1rem;
  margin: 0;
  line-height: 0.5;
  left: 0;
  width: 100%;
  text-align: center;
}

@supports not (container-type: anchored) {
  body::before {
    content: "Your browser does not support anchored container queries.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body {
    width: 100%;
    max-width: 100%;
    margin: 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___basic-example
.anchor {
  anchor-name: --my-anchor;
}
```

Tiếp theo, chúng ta gán cho `<div>` có class `infobox` giá trị {{cssxref("position")}} là `fixed` và giá trị {{cssxref("position-anchor")}} là `--my-anchor` để liên kết nó với anchor element. Sau đó chúng ta gán giá trị {{cssxref("position-area")}} là `top` để định vị nó phía trên anchor element và giá trị {{cssxref("position-try-fallbacks")}} là `bottom` để infobox di chuyển xuống dưới anchor khi nó bắt đầu tràn ra khỏi phần trên viewport khi nội dung được cuộn lên.

Cuối cùng, chúng ta đặt giá trị {{cssxref("container-type")}} là `anchored` trên infobox để chỉ định nó là anchored query container, nghĩa là chúng ta có thể phát hiện khi các `position-try-fallbacks` khác nhau đang hoạt động trên infobox thông qua at-rule {{cssxref("@container")}}, và cập nhật style trên các phần tử con của nó.

```css live-sample___basic-example
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top;
  position-try-fallbacks: bottom;
  container-type: anchored;
}
```

Bây giờ chúng ta thêm mũi tên vào infobox bằng cách sử dụng generated content trên pseudo-element {{cssxref("::before")}} của nó. Chúng ta đặt thuộc tính {{cssxref("content")}} của pseudo-element thành biểu tượng mũi tên xuống thích hợp, định vị nó tuyệt đối, và đặt thuộc tính {{cssxref("top")}} thành `105%` để định vị nó ở dưới cùng của infobox (chúng ta đặt hơn `100%` để nó khớp trực quan với vị trí của mũi tên lên tương ứng).

```css live-sample___basic-example
.infobox::before {
  content: "▼";
  position: absolute;
  top: 105%;
}
```

Tiếp theo chúng ta thêm anchored container query. Chúng ta thêm một at-rule `@container` với biểu thức kiểm tra được định nghĩa là `anchored(fallback: bottom)`. Điều này có nghĩa là khi fallback `bottom` của position-try được áp dụng cho infobox, CSS bên trong at-rule sẽ được áp dụng cho tài liệu. Bên trong, chúng ta định nghĩa style thay thế cho pseudo-element `::before` của infobox, đổi biểu tượng mũi tên xuống thành mũi tên lên và định vị nó ở đầu infobox.

```css live-sample___basic-example
@container anchored(fallback: bottom) {
  .infobox::before {
    content: "▲";
    bottom: 100%;
    top: auto;
  }
}
```

> [!NOTE]
> Ví dụ này có thêm CSS để xử lý style cơ bản cho tất cả các phần tử, nhưng chúng tôi chỉ hiển thị các phần liên quan đến anchored container queries. Để xem toàn bộ code, hãy mở ví dụ trong MDN Playground bằng cách nhấn nút "Play" trên một trong các khối code hoặc trên bản render trực tiếp.

Ví dụ này hiển thị như sau:

{{ EmbedLiveSample("basic-example", "100%", "350") }}

Hãy thử cuộn demo để anchor di chuyển gần phần trên của viewport và quan sát cách infobox không chỉ di chuyển xuống dưới anchor để hiển thị trên màn hình, mà style cũng được cập nhật để biểu tượng mũi tên vẫn hoạt động đúng với vị trí mới của infobox.

Nếu bạn cuộn anchor trở lại xuống phía dưới viewport, infobox sẽ di chuyển trở lại lên phía trên nó. Chúng ta không cần chỉ định thêm giá trị `position-try-fallbacks` là `top` để đạt được điều này vì `position-area: top` là vị trí mặc định của infobox. Nếu các fallback được cung cấp không ngăn được anchor-positioned element bị tràn, trình duyệt sẽ quay lại vị trí mặc định của nó.

## Ví dụ nhiều fallback

Ví dụ này minh họa nhiều position-try fallback và anchored container queries hoạt động cùng nhau, đồng thời giải quyết vấn đề khi bạn muốn sử dụng anchored container queries để đặt style trên bản thân anchor-positioned element chứ không phải các phần tử con của nó, bằng cách dùng thêm một wrapper element. Ví dụ cũng bao gồm một số JavaScript cho phép bạn di chuyển anchor element xung quanh màn hình bằng chuột hoặc bàn phím để xem các fallback khác nhau.

HTML cho ví dụ này bao gồm hai phần tử {{htmlelement("div")}} đại diện cho anchor và infobox. `<div>` có class `anchor` bao gồm thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) để có thể focus bằng bàn phím, trong khi `<div>` có class `infobox` bao gồm thêm một wrapper `<div>` để áp dụng style infobox, giúp chúng ta có thể style nó thông qua at-rule `@container`.

```html live-sample___multiple-fallbacks
<div class="anchor" tabindex="0">⚓︎</div>

<div class="infobox">
  <div>Infobox</div>
</div>
```

Chúng ta bắt đầu style bằng cách chỉ định `<div>` có class `anchor` là một anchor element, lại bằng cách gán `anchor-name` là `--my-anchor`. Chúng ta cũng định vị nó tuyệt đối để có thể di chuyển nó bằng cách đặt các giá trị {{glossary("inset properties", "inset property")}} khác nhau qua JavaScript.

```css hidden live-sample___multiple-fallbacks
* {
  box-sizing: border-box;
}

html {
  font-family: sans-serif;
  height: 100%;
}

body {
  height: inherit;
}

p {
  font-size: 1.4em;
  line-height: 1.5;
}

.anchor {
  font-size: 2em;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: blue;
  width: fit-content;
  padding: 5px 10px;
}

@supports not (container-type: anchored) {
  body::before {
    content: "Your browser does not support anchored container queries.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___multiple-fallbacks
.anchor {
  anchor-name: --my-anchor;
  position: absolute;
}
```

Tiếp theo, chúng ta định vị infobox tương đối với anchor bằng cách định vị nó tuyệt đối và gán giá trị `position-anchor` là `--my-anchor`. Lần này chúng ta định vị nó ở phía trên-trái của anchor với giá trị `position-area` là `top left`. Sau đó chúng ta đặt ba `position-try-fallbacks` — `flip-block`, `flip-inline`, và `flip-block flip-inline` — điều này làm cho infobox lật vị trí theo trục block, trục inline, hoặc cả hai, để duy trì trên màn hình khi anchor tiến gần các cạnh khác nhau của viewport.

Cuối cùng, chúng ta biến infobox thành anchored query container bằng cách đặt `container-type: anchored`.

```css live-sample___multiple-fallbacks
.infobox {
  position: absolute;
  position-anchor: --my-anchor;
  position-area: top left;
  position-try-fallbacks:
    flip-block,
    flip-inline,
    flip-block flip-inline;
  container-type: anchored;
}
```

Tại đây, chúng ta sẽ cho bạn thấy các style trực quan cơ bản được đặt trên infobox, để minh họa rằng trong trường hợp này, chúng ta đang đặt các style này trên wrapper `<div>` bên trong infobox thay vì trên bản thân infobox. Như đã đề cập trước đó, chúng ta làm vậy để có thể thao tác các style này thông qua anchored container queries. Điều này sẽ không thể thực hiện được nếu chúng được đặt trực tiếp trên infobox, vì nó là anchored query container.

Đáng chú ý nhất, ở đây chúng ta đặt giá trị {{cssxref("border-radius")}} tạo ra góc bo tròn ở mọi góc của infobox ngoại trừ góc dưới-phải. Vì infobox được định vị ở phía trên-trái của anchor, góc này hoạt động như một mũi tên trỏ vào anchor.

```css live-sample___multiple-fallbacks
.infobox div {
  color: white;
  background-color: black;
  font-size: 1.4em;
  padding: 10px;
  margin: 1px;

  border-radius: 10px 10px 0 10px;
}
```

Cuối cùng, chúng ta định nghĩa một anchored container query cho mỗi position-try fallback có thể được áp dụng cho infobox bằng cách sử dụng at-rule `@container`. Trong mỗi trường hợp, chúng ta thay đổi các góc bo tròn được áp dụng cho wrapper `<div>` của infobox sao cho góc gần nhất với anchor luôn không bo tròn.

```css live-sample___multiple-fallbacks
@container anchored(fallback: flip-block) {
  .infobox div {
    border-radius: 10px 0 10px 10px;
  }
}

@container anchored(fallback: flip-inline) {
  .infobox div {
    border-radius: 10px 10px 10px 0;
  }
}

@container anchored(fallback: flip-block flip-inline) {
  .infobox div {
    border-radius: 0 10px 10px 10px;
  }
}
```

> [!NOTE]
> Một lần nữa, chúng tôi đã ẩn phần lớn style cơ bản để ngắn gọn, cũng như JavaScript cung cấp các điều khiển di chuyển (điều này không liên quan đến những gì chúng tôi đang cố gắng minh họa ở đây). Để xem toàn bộ code, hãy mở ví dụ trong MDN Playground bằng cách nhấn nút "Play" trên một trong các khối code hoặc trên bản render trực tiếp.

```js hidden live-sample___multiple-fallbacks
const anchorDiv = document.querySelector(".anchor");

let xPos = 250;
let yPos = 120;

function setPos() {
  const maxX = document.body.clientWidth - anchorDiv.clientWidth - 25;
  const maxY = document.body.clientHeight - anchorDiv.clientHeight - 25;

  if (xPos < 25) {
    xPos = 25;
  }

  if (xPos > maxX) {
    xPos = maxX;
  }

  if (yPos < 25) {
    yPos = 25;
  }

  if (yPos > maxY) {
    yPos = maxY;
  }

  anchorDiv.style.left = `${xPos}px`;
  anchorDiv.style.top = `${yPos}px`;
}

setPos();

document.body.addEventListener("keydown", (e) => {
  if (e.key === "w") {
    yPos -= 25;
  } else if (e.key === "d") {
    xPos += 25;
  } else if (e.key === "s") {
    yPos += 25;
  } else if (e.key === "a") {
    xPos -= 25;
  }

  setPos();
});

document.body.addEventListener("click", (e) => {
  xPos = e.clientX;
  yPos = e.clientY;

  setPos();
});
```

Ví dụ này hiển thị như sau:

{{ EmbedLiveSample("multiple-fallbacks", "100%", "350") }}

Hãy thử di chuyển anchor element xung quanh viewport bằng cách:

- Nhấp chuột (hoặc chạm màn hình nếu bạn dùng thiết bị cảm ứng) vào vị trí bạn muốn di chuyển anchor đến.
- Sử dụng các phím <kbd>W</kbd>, <kbd>A</kbd>, <kbd>S</kbd>, và <kbd>D</kbd> để di chuyển anchor lên, sang trái, xuống, và sang phải tương ứng.

Khi bạn di chuyển anchor element đến gần các cạnh của màn hình, hãy quan sát cách infobox di chuyển sang các vị trí khác nhau xung quanh nó để ở lại trên màn hình, và cũng cách `border-radius` được đặt trên infobox thay đổi sao cho góc không bo tròn luôn trỏ vào anchor. Di chuyển anchor vào các góc khác nhau chắc chắn sẽ cho bạn thấy các hiệu ứng khác nhau.

## Xem thêm

- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- [Using container scroll-state queries](/en-US/docs/Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- [Học: CSS positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
