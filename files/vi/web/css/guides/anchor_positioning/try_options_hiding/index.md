---
title: Fallback options and conditional hiding for overflow
short-title: Handling overflow
slug: Web/CSS/Guides/Anchor_positioning/Try_options_hiding
page-type: guide
sidebar: cssref
---

Khi sử dụng [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning), một vấn đề quan trọng cần lưu ý là đảm bảo rằng các anchor-positioned element luôn hiển thị ở vị trí thuận tiện cho người dùng tương tác, nếu có thể, bất kể anchor được đặt ở đâu. Ví dụ, khi bạn cuộn trang, các anchor cùng các phần tử được định vị liên kết sẽ di chuyển về phía cạnh của viewport. Khi một phần tử được định vị bắt đầu tràn ra ngoài viewport, bạn sẽ muốn thay đổi vị trí của nó để đưa nó trở lại màn hình, ví dụ về phía đối diện của anchor.

Ngoài ra, trong một số tình huống có thể tốt hơn là chỉ ẩn các phần tử được định vị bị tràn — ví dụ, nếu anchor của chúng đã ra ngoài màn hình thì nội dung của chúng có thể không còn ý nghĩa.

Hướng dẫn này giải thích cách sử dụng các cơ chế CSS anchor positioning để quản lý các vấn đề này — **position-try fallback option** và **conditional hiding** (ẩn có điều kiện). Position-try fallback option cung cấp các vị trí thay thế để trình duyệt thử đặt các phần tử được định vị khi chúng bắt đầu tràn, giúp giữ chúng trên màn hình. Conditional hiding cho phép chỉ định các điều kiện mà dưới đó anchor hoặc phần tử được định vị sẽ bị ẩn.

> [!NOTE]
> Để nắm được các khái niệm cơ bản của CSS anchor positioning, hãy xem [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Tóm tắt tính năng

Nếu một tooltip được cố định ở phía trên-phải của một phần tử UI, khi người dùng cuộn nội dung sao cho phần tử UI nằm ở góc trên-phải của viewport, tooltip của phần tử UI đó sẽ bị cuộn ra khỏi màn hình. CSS anchor positioning giải quyết các vấn đề như vậy. Thuộc tính {{cssxref("position-try-fallbacks")}} của module chỉ định một hoặc nhiều position-try fallback option thay thế để trình duyệt thử ngăn phần tử được định vị bị tràn.

Position-try fallback option có thể được chỉ định bằng cách sử dụng:

- [Predefined fallback option](#predefined_fallback_options).
- [Giá trị `position-area`](#using_position-area_try_fallback_options).
- [Custom option](#custom_fallback_options) được định nghĩa bằng at-rule {{cssxref("@position-try")}}.

Ngoài ra, thuộc tính {{cssxref("position-try-order")}} cho phép bạn chỉ định các tùy chọn khác nhau dẫn đến việc một position try option khả dụng được ưu tiên so với vị trí ban đầu của phần tử. Ví dụ, bạn có thể muốn hiển thị phần tử ban đầu trong khoảng không gian có chiều cao hoặc chiều rộng khả dụng lớn hơn.

Thuộc tính shorthand {{cssxref("position-try")}} có thể được dùng để chỉ định các giá trị `position-try-order` và `position-try-fallbacks` trong một khai báo duy nhất.

Trong một số tình huống, nội dung anchor-positioned không có ý nghĩa nếu anchor ra ngoài màn hình, hoặc ngược lại. Ví dụ, bạn có thể có một anchor chứa câu hỏi của một bài kiểm tra và các câu trả lời được chứa trong các phần tử được định vị liên kết, và muốn hiển thị cả hai cùng nhau hoặc không hiển thị gì cả. Điều này có thể đạt được với conditional hiding, được quản lý thông qua thuộc tính {{cssxref("position-visibility")}}. Thuộc tính này nhận các giá trị khác nhau xác định các điều kiện mà dưới đó các phần tử bị tràn sẽ bị ẩn.

## Predefined fallback option

Các giá trị predefined fallback option của thuộc tính `position-try-fallbacks` (được định nghĩa là [`<try-tactic>`](/en-US/docs/Web/CSS/Reference/Properties/position-try-fallbacks#try-tactic) trong đặc tả) sẽ "lật" vị trí của anchor-positioned element theo một hoặc cả hai trục nếu phần tử sẽ bị tràn.

Phần tử có thể được đặt để lật theo trục block (`flip-block`), trục inline (`flip-inline`), hoặc chéo qua một đường tưởng tượng vẽ từ một góc của anchor qua tâm của nó đến góc đối diện (`flip-start`). Ba giá trị này lật phần tử, phản chiếu vị trí của nó sang phía đối diện với hai giá trị đầu, và sang phía kề với `flip-start`. Ví dụ, nếu một phần tử được định vị `10px` phía trên anchor của nó bắt đầu tràn ở phía trên anchor, giá trị `flip-block` sẽ lật phần tử được định vị xuống 10px phía dưới anchor.

Trong ví dụ này, chúng ta thêm hai phần tử {{htmlelement("div")}}. Phần tử đầu tiên sẽ là anchor element của chúng ta, và phần tử thứ hai sẽ được định vị tương đối với anchor:

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

Chúng ta style phần tử `<body>` để lớn hơn viewport để có thể cuộn anchor và phần tử được định vị xung quanh trong viewport, cả theo chiều ngang lẫn chiều dọc:

```css
body {
  width: 1500px;
  height: 500px;
}
```

Để minh họa, chúng ta định vị anchor tuyệt đối để nó xuất hiện gần trung tâm của bản render `<body>` ban đầu:

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

.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}
```

Anchor-positioned element được gán fixed positioning và neo vào góc trên-trái của anchor bằng `position-area`. Nó được gán `position-try-fallbacks: flip-block, flip-inline;` để cung cấp một số fallback option nhằm di chuyển phần tử được định vị để ngăn nó bị tràn khi anchor đến gần cạnh viewport.

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

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;
  position-try-fallbacks: flip-block, flip-inline;
}
```

> [!NOTE]
> Khi nhiều position try fallback option được chỉ định, chúng được phân cách bằng dấu phẩy và được thử theo thứ tự chúng được chỉ định.

Hãy thử cuộn demo để anchor bắt đầu tiếp cận các cạnh:

{{ EmbedLiveSample("Using predefined fallback options", "100%", "250") }}

- Di chuyển anchor đến phía trên của viewport. Phần tử được định vị lật sang phía dưới-trái của anchor để tránh bị tràn.
- Di chuyển anchor sang phía trái của viewport. Phần tử được định vị lật sang phía trên-phải của anchor để tránh bị tràn.

Nếu bạn di chuyển anchor về phía góc trên-trái của viewport, bạn sẽ nhận thấy một vấn đề — khi phần tử được định vị bắt đầu tràn theo cả hướng block và inline, nó sẽ quay lại vị trí mặc định trên-trái của nó và tràn theo cả hai hướng, điều này không phải những gì chúng ta muốn.

Điều này xảy ra vì chúng ta chỉ cung cấp cho trình duyệt các tùy chọn vị trí `flip-block` _hoặc_ `flip-inline`. Chúng ta không cho nó tùy chọn thử cả hai cùng một lúc. Trình duyệt thử các fallback option, tìm một option khiến phần tử được định vị được render hoàn toàn bên trong viewport hoặc containing block. Nếu không tìm thấy, nó sẽ render phần tử được định vị ở vị trí render được định nghĩa ban đầu, không có fallback option nào được áp dụng.

Phần tiếp theo sẽ trình bày cách khắc phục vấn đề này.

## Kết hợp nhiều giá trị thành một option

Có thể đặt nhiều [predefined try fallback option](#predefined_fallback_options) hoặc tên [custom try option](#custom_fallback_options) vào một giá trị try fallback option phân tách bằng dấu cách duy nhất trong danh sách `position-try-fallbacks` phân tách bằng dấu phẩy. Khi thử áp dụng các fallback option này, trình duyệt sẽ kết hợp các hiệu ứng riêng lẻ thành một fallback option kết hợp duy nhất.

Hãy sử dụng một combined try fallback option để khắc phục vấn đề chúng ta gặp phải với demo trước. HTML và CSS trong demo này giống nhau, ngoại trừ các style định vị infobox. Trong trường hợp này, nó được gán thêm một position try fallback option thứ ba: `flip-block flip-inline`:

```html hidden
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```css hidden
body {
  width: 1500px;
  height: 500px;
}

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

.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css-nolint
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;
  position-try-fallbacks:
    flip-block,
    flip-inline,
    flip-block flip-inline;
}
```

Điều này có nghĩa là trình duyệt trước tiên sẽ thử `flip-block` và sau đó thử `flip-inline` để tránh tràn. Nếu cả hai fallback option đó đều thất bại, nó sẽ thử kết hợp cả hai, lật vị trí của phần tử theo cả hướng block _và_ inline cùng một lúc. Bây giờ khi bạn cuộn anchor về phía cạnh _trên_ và _trái_ của viewport, phần tử được định vị sẽ lật sang phía dưới-phải.

{{ EmbedLiveSample("Combining multiple values into one option", "100%", "250") }}

## Sử dụng `position-area` try fallback option

Các `<try-tactic>` predefined try fallback option hữu ích nhưng có giới hạn, vì chúng chỉ cho phép lật vị trí phần tử được định vị theo các trục. Nếu bạn có một anchor-positioned element được định vị ở phía trên-trái của anchor và muốn thay đổi vị trí của nó xuống ngay dưới anchor nếu nó bắt đầu tràn thì sao?

Để đạt được điều này, bạn có thể sử dụng giá trị {{cssxref("position-area")}} làm position-try fallback option, đưa nó vào danh sách `position-try-fallbacks`. Điều này tự động tạo ra một try fallback option dựa trên position area đó. Về thực chất, đây là một phím tắt để tạo một [custom position option](#custom_fallback_options) chỉ chứa giá trị thuộc tính `position-area` đó.

Ví dụ sau đây cho thấy các `position-area` position try fallback option đang được sử dụng. Chúng ta dùng cùng HTML và CSS, ngoại trừ định vị infobox. Trong trường hợp này, các position-try fallback option của chúng ta là các giá trị `position-area` — `top`, `top-right`, `right`, `bottom-right`, `bottom`, `bottom-left`, và `left`. Phần tử được định vị sẽ được định vị hợp lý bất kể cạnh viewport nào mà anchor tiếp cận. Cách tiếp cận chi tiết này linh hoạt và granular hơn so với cách dùng predefined value.

```html hidden
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```css hidden
body {
  width: 1500px;
  height: 500px;
}

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

.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css-nolint
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  position-area: top left;
  position-try-fallbacks:
    top, top right, right,
    bottom right, bottom,
    bottom left, left;
}
```

> [!NOTE]
> Bạn không thể thêm `position-area` try fallback option vào một combined position option phân tách bằng dấu cách trong một position-try fallback list.

Cuộn trang và quan sát hiệu ứng của các position-try fallback option này khi anchor tiếp cận cạnh viewport:

{{ EmbedLiveSample("Using `position-area` try fallback options", "100%", "250") }}

## Custom fallback option

Để sử dụng các custom position fallback option không có sẵn thông qua các cơ chế trên, bạn có thể tự tạo bằng at-rule {{cssxref("@position-try")}}. Cú pháp như sau:

```plain
@position-try --try-fallback-name {
  descriptor-list
}
```

`--try-fallback-name` là tên do developer tự định nghĩa cho position try fallback option. Tên này có thể được chỉ định trong danh sách try fallback option phân tách bằng dấu phẩy trong giá trị thuộc tính {{cssxref("position-try-fallbacks")}}. Nếu nhiều quy tắc `@position-try` có cùng tên, quy tắc cuối cùng trong thứ tự tài liệu sẽ ghi đè các quy tắc khác. Tránh sử dụng cùng tên cho các try fallback option _và_ tên anchor hay custom property của bạn; điều đó không làm mất hiệu lực at-rule, nhưng sẽ khiến CSS rất khó theo dõi.

`descriptor-list` xác định các giá trị thuộc tính cho từng custom try fallback option riêng lẻ đó, bao gồm cách phần tử được định vị nên được đặt và điều chỉnh kích thước, cùng với bất kỳ margin nào. Danh sách giới hạn các property descriptor được phép bao gồm:

- {{cssxref("position-area")}}
- [Inset properties](/en-US/docs/Glossary/Inset_properties)
- Margin properties (ví dụ: {{cssxref("margin-left")}}, {{cssxref("margin-block-start")}})
- Thuộc tính [self-alignment](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center)
- Sizing properties ({{cssxref("width")}}, {{cssxref("block-size")}}, v.v.)
- {{cssxref("position-anchor")}}

Các giá trị bạn đưa vào at-rule sẽ được áp dụng cho phần tử được định vị nếu custom-try fallback option được đặt tên được áp dụng. Nếu bất kỳ thuộc tính nào đã được đặt trước đó trên phần tử được định vị, những giá trị thuộc tính đó sẽ bị ghi đè bởi các giá trị descriptor. Nếu người dùng cuộn, dẫn đến một fallback option khác hoặc không có fallback option nào được áp dụng, các giá trị từ try fallback option đã áp dụng trước đó sẽ được unset.

Trong ví dụ này, chúng ta thiết lập và sử dụng một số custom try fallback option. Chúng ta dùng cùng base HTML và CSS như trong các ví dụ trước.

Chúng ta bắt đầu bằng cách định nghĩa bốn custom try fallback option bằng `@position-try`:

```html hidden
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>
```

```css hidden
body {
  width: 1500px;
  height: 500px;
}

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

.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
}
```

```css
@position-try --custom-left {
  position-area: left;
  width: 100px;
  margin-right: 10px;
}

@position-try --custom-bottom {
  position-area: bottom;
  margin-top: 10px;
}

@position-try --custom-right {
  position-area: right;
  width: 100px;
  margin-left: 10px;
}

@position-try --custom-bottom-right {
  position-area: bottom right;
  margin: 10px 0 0 10px;
}
```

Sau khi các custom try fallback option được tạo, chúng ta có thể đưa chúng vào danh sách vị trí bằng cách tham chiếu đến tên của chúng:

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

Lưu ý rằng vị trí mặc định của chúng ta được xác định bởi `position-area: top`. Khi infobox không tràn ra khỏi trang theo bất kỳ hướng nào, infobox nằm phía trên anchor, và các position-try fallback option được đặt trong thuộc tính `position-try-fallbacks` bị bỏ qua. Cũng lưu ý rằng infobox có chiều rộng cố định và bottom margin được đặt. Những giá trị này sẽ thay đổi khi các position-try fallback option khác nhau được áp dụng.

Nếu infobox bắt đầu tràn, trình duyệt thử các position option được liệt kê trong thuộc tính `position-try-fallbacks`:

- Trình duyệt đầu tiên thử vị trí fallback `--custom-left`. Điều này di chuyển infobox sang trái của anchor, điều chỉnh margin cho phù hợp, và cũng gán cho infobox một chiều rộng khác.
- Tiếp theo, trình duyệt thử vị trí `--custom-bottom`. Điều này di chuyển infobox xuống dưới anchor, và đặt margin phù hợp. Nó không bao gồm descriptor `width`, vì vậy infobox trở lại chiều rộng mặc định là `200px` được đặt bởi thuộc tính `width`.
- Trình duyệt tiếp theo thử vị trí `--custom-right`. Điều này hoạt động tương tự như vị trí `--custom-left`, với cùng giá trị descriptor `width` được áp dụng, nhưng các giá trị `position-area` và `margin` được phản chiếu để đặt infobox phù hợp ở bên phải.
- Nếu không có fallback nào thành công trong việc ngăn phần tử được định vị bị tràn, trình duyệt thử vị trí `--custom-bottom-right` như phương án cuối cùng. Điều này hoạt động tương tự như các fallback option khác, nhưng nó đặt phần tử được định vị ở phía dưới-phải của anchor.

Nếu không có fallback nào thành công trong việc ngăn phần tử được định vị bị tràn, vị trí sẽ quay lại giá trị `position-area: top;` ban đầu.

> [!NOTE]
> Khi một position try fallback option được áp dụng, các giá trị của nó sẽ ghi đè các giá trị mặc định được đặt trên phần tử được định vị. Ví dụ, giá trị `width` mặc định được đặt trên phần tử được định vị là `200px`, nhưng khi position try fallback option `--custom-right` được áp dụng, chiều rộng của nó được đặt thành `100px`.

Cuộn trang và quan sát hiệu ứng của các position-try fallback option này khi anchor tiếp cận cạnh viewport:

{{ EmbedLiveSample("Custom fallback options", "100%", "250") }}

## Styling anchor-positioned element dựa trên fallback đang hoạt động

Một vấn đề mà chức năng trên không giải quyết được là cập nhật style của anchor-positioned element cho phù hợp với các fallback option khác nhau của nó. Ví dụ, người ta thường thêm một mũi tên nhỏ vào tooltip trỏ về phía anchor element mà nó liên kết, giúp cải thiện trải nghiệm người dùng bằng cách làm rõ sự liên kết trực quan. Khi tooltip di chuyển sang vị trí khác, bạn sẽ cần thay đổi vị trí và hướng của mũi tên, nếu không sẽ trông không đúng.

Để giải quyết vấn đề này, bạn có thể sử dụng anchored container queries. Tính năng này mở rộng chức năng của [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries), cho phép bạn phát hiện khi nào một fallback option cụ thể được áp dụng cho anchor-positioned element và áp dụng CSS cho các phần tử con của nó. Cụ thể, anchored container queries dựa trên hai tính năng:

- Giá trị `anchored` của thuộc tính {{cssxref("container-type")}}: Áp dụng giá trị này cho anchor-positioned element để bắt đầu phát hiện khi các fallback option khác nhau được áp dụng lên nó.
- Từ khóa `anchored` trong at-rule {{cssxref("@container")}}: Theo sau đó là một cặp ngoặc đơn bên trong chứa descriptor `fallback`. Giá trị của descriptor là một giá trị `position-try-fallbacks`.

Ví dụ, giả sử chúng ta có một anchor-positioned tooltip element được định vị phía trên anchor theo mặc định thông qua giá trị {{cssxref("position-area")}} là `top`, nhưng có giá trị {{cssxref("position-try-fallbacks")}} là `flip-block`. Điều này sẽ khiến tooltip lật theo hướng block xuống phía dưới anchor khi nó bắt đầu tràn ra khỏi phần trên của viewport. Nếu muốn phát hiện khi fallback được áp dụng cho tooltip, trước tiên ta cần đặt `container-type: anchored` trên nó để biến nó thành anchored query container.

```css
.tooltip {
  position: absolute;
  position-anchor: --myAnchor;
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

Biểu thức kiểm tra — `anchored(fallback: flip-block)` — sẽ trả về true khi fallback option `flip-block` được áp dụng cho tooltip, khi đó các style được chỉ định trong khối `@container` sẽ được áp dụng. Ví dụ, bạn có thể muốn thay đổi vị trí và hướng của biểu tượng mũi tên để nó tiếp tục trỏ về phía anchor, thay đổi hướng của gradient, v.v.

Để biết thêm thông tin về anchored container queries và một số ví dụ, hãy xem [Using anchored container queries](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Anchored_container_queries).

## Sử dụng `position-try-order`

Thuộc tính {{cssxref("position-try-order")}} có trọng tâm hơi khác so với phần còn lại của chức năng position try, ở chỗ nó sử dụng các position try fallback option khi phần tử được định vị được hiển thị lần đầu tiên, thay vì khi nó đang trong quá trình tràn.

Thuộc tính này cho phép bạn chỉ định rằng bạn muốn phần tử được định vị ban đầu được hiển thị bằng position try fallback option cung cấp cho containing block của nó chiều rộng hoặc chiều cao lớn nhất. Điều này được thực hiện bằng cách đặt giá trị `most-height`, `most-width`, `most-block-size`, hoặc `most-inline-size`. Bạn cũng có thể xóa các hiệu ứng của bất kỳ giá trị `position-try-order` đã được đặt trước đó bằng cách sử dụng giá trị `normal`.

Nếu không có position-try fallback option nào khả dụng cung cấp nhiều chiều rộng/chiều cao hơn vị trí ban đầu được gán cho phần tử, `position-try-order` sẽ không có hiệu lực.

Hãy xem một demo minh họa hiệu ứng của thuộc tính này. HTML giống như trong các ví dụ trước, ngoại trừ việc chúng ta đã thêm một `<form>` chứa các radio button, cho phép bạn chọn các giá trị khác nhau của `position-try-order` để xem hiệu ứng của chúng.

```html hidden
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

Chúng ta thêm một custom try fallback option — `--custom-bottom` — định vị phần tử bên dưới anchor và thêm margin:

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

.anchor {
  anchor-name: --my-anchor;
  position: absolute;
  top: 100px;
  left: 45%;
}

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

```css
@position-try --custom-bottom {
  top: anchor(bottom);
  bottom: unset;
  margin-top: 10px;
}
```

Chúng ta đặt infobox ban đầu ở phía trên anchor, rồi gán custom try fallback cho nó:

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  bottom: anchor(top);
  margin-bottom: 10px;
  justify-self: anchor-center;
  position-try-fallbacks: --custom-bottom;
}
```

Cuối cùng, chúng ta thêm một số JavaScript để đặt event handler [`change`](/en-US/docs/Web/API/HTMLElement/change_event) trên các radio button. Khi một radio button được chọn, giá trị của nó được áp dụng cho thuộc tính `position-try-order` của infobox.

```js
const infobox = document.querySelector(".infobox");
const radios = document.querySelectorAll('[name="position-try-order"]');

for (const radio of radios) {
  radio.addEventListener("change", setTryOrder);
}

function setTryOrder(e) {
  const tryOrder = e.target.value;
  infobox.style.positionTryOrder = tryOrder;
}
```

Hãy thử chọn tùy chọn order `most-height`. Điều này có hiệu lực áp dụng position try fallback option `--custom-bottom`, định vị phần tử bên dưới anchor. Điều này xảy ra vì có nhiều không gian hơn bên dưới anchor so với bên trên nó.

{{ EmbedLiveSample("Using `position-try-order`", "100%", "300") }}

## Ẩn anchor-positioned element có điều kiện

Trong một số tình huống, bạn có thể muốn ẩn một anchor-positioned element. Ví dụ, nếu anchor element bị cắt vì nó quá gần cạnh viewport, bạn có thể muốn ẩn hoàn toàn phần tử liên kết của nó. Thuộc tính {{cssxref("position-visibility")}} cho phép bạn chỉ định các điều kiện mà dưới đó các phần tử được định vị bị ẩn.

Theo mặc định, phần tử được định vị `always` hiển thị. Giá trị `no-overflow` sẽ **strongly hide** (ẩn hoàn toàn) phần tử được định vị nếu nó bắt đầu tràn ra khỏi containing element hoặc viewport của nó.

Giá trị `anchors-visible`, mặt khác, strongly hide phần tử được định vị nếu anchor liên kết của nó bị _hoàn toàn_ ẩn, dù bởi tràn ra khỏi containing element (hoặc viewport) hay bị che bởi các phần tử khác. Phần tử được định vị sẽ hiển thị nếu bất kỳ phần nào của anchor vẫn còn hiển thị.

Một phần tử bị strongly hidden hoạt động như thể nó và các phần tử con của nó có giá trị {{cssxref("visibility")}} là `hidden`, bất kể giá trị `visibility` thực tế của chúng là gì.

Hãy xem thuộc tính này hoạt động như thế nào.

Ví dụ này sử dụng cùng HTML và CSS như trong các ví dụ trước, với infobox được neo vào cạnh dưới của anchor. Infobox được gán `position-visibility: no-overflow;` để ẩn hoàn toàn khi nó bị cuộn lên đến điểm bắt đầu tràn ra khỏi viewport.

```html hidden
<p>
  Malesuada nunc vel risus commodo viverra maecenas accumsan lacus. Vel elit
  scelerisque mauris pellentesque pulvinar pellentesque habitant morbi
  tristique.
</p>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
  incididunt ut labore et dolore magna aliqua. Dui nunc mattis enim ut tellus
  elementum sagittis vitae et.
</p>

<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>This is an information box.</p>
</div>

<p>
  Nisi quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. In arcu
  cursus euismod quis viverra nibh cras pulvinar. Vulputate ut pharetra sit amet
  aliquam.
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

.anchor {
  anchor-name: --my-anchor;
}

body {
  width: 50%;
  margin: 0 auto;
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

```css
.infobox {
  position: fixed;
  position-anchor: --my-anchor;
  margin-bottom: 5px;
  position-area: top span-all;
  position-visibility: no-overflow;
}
```

Cuộn xuống trang và quan sát cách phần tử được định vị bị ẩn khi nó đến phần trên của viewport:

{{ EmbedLiveSample("Conditional hiding using `position-visibility`", "100%", "250") }}

## Xem thêm

- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- [Học: CSS positioning](/en-US/docs/Learn_web_development/Core/CSS_layout/Positioning)
- Module [CSS logical properties and values](/en-US/docs/Web/CSS/Guides/Logical_properties_and_values)
- [Học: Sizing items in CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Sizing)
