---
title: Understanding timeline range names
slug: Web/CSS/Guides/Scroll-driven_animations/Timeline_range_names
page-type: guide
sidebar: cssref
---

Theo mặc định, [view progress timeline](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines) theo dõi các phần tử trên toàn bộ scrollport. Animation timeline bắt đầu khi pixel đầu tiên của cạnh bắt đầu phần tử đi qua cạnh kết thúc của scrollport, và kết thúc khi cạnh cuối phần tử đi qua cạnh bắt đầu của scrollport. Bạn có thể thay đổi phạm vi gắn animation mặc định này. Ví dụ, bạn có thể giới hạn view progress timeline chỉ bắt đầu khi phần tử subject đã hoàn toàn vào scrollport.

Hướng dẫn này giải thích cách chỉnh sửa tên timeline range, đặc biệt xem xét các tên timeline range khác nhau, ý nghĩa của chúng và cách chúng được sử dụng.

<!--Limiting the animation timeline to a specific portion of an named animation timeline range is discussed in the [insetting scroll animations guide](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timeline_insets).-->

## Sơ lược về view progress timeline

[CSS animations](/en-US/docs/Web/CSS/Guides/Animations) được tạo bằng cách gắn animation {{cssxref("@keyframes")}} vào một phần tử dùng thuộc tính {{cssxref("animation-name")}} (hoặc shorthand {{cssxref("animation")}}). Các keyframe xác định hành vi của animation, trong khi {{cssxref("animation-timeline")}} xác định thời điểm và cách phần tử tiến qua các keyframe đó.

Theo mặc định, timeline của animation là {{domxref("DocumentTimeline")}} dựa trên thời gian mặc định của tài liệu. Với [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines), timeline của animation — hay sự tiến triển — được điều khiển bởi cuộn của người dùng ([scroll progress timeline](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#scroll_progress_timelines)) hoặc khả năng hiển thị của phần tử ([view progress timeline](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines)), thay vì sự trôi qua của thời gian.

Với view progress timeline, sự tiến triển của keyframe được gắn với lượng phần tử subject hiển thị trong scroller và vị trí của nó trong scroller. Khi phần tử vào viewport, timeline tiến lên. Nếu người dùng đảo ngược cuộn, timeline đảo ngược. Nói cách khác, khi phần tử đi vào hoặc ra khỏi view, timeline tiến triển hoặc đảo ngược, tương ứng. Animation chỉ xảy ra khi subject hiển thị trong scrollport. Nếu cuộn dừng lại trong khi phần tử đang trong view, animation tạm dừng.

### View progress timeline mặc định

Theo mặc định, tiến triển của [view progress timeline](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines#view_progress_timelines) bắt đầu khi cạnh bắt đầu của subject được theo dõi giao cắt với scrollport ở cạnh cuối và kết thúc khi cạnh cuối của subject thoát khỏi scrollport ở cạnh bắt đầu. Đây là các cạnh trên và dưới của subject và scrollport khi cuộn dọc, và các cạnh trái phải hoặc phải trái khi cuộn ngang, tùy thuộc vào writing mode.

```html hidden live-sample___initial live-sample___entry_exit live-sample___inset_cover live-sample___contains live-sample___inset_contain live-sample___cover_contain live-sample___entry_crossing live-sample___exit_crossing
<main>
  <article>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>Scroll down ⇩</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <section class="one animated_element">
      <div>
        <i>Animated Element</i>
        <span></span>
      </div>
    </section>
    <section class="double">
      <div>
        <i id="A" class="animated_element">A</i>
        <i id="B" class="animated_element">B</i>
      </div>
    </section>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>Scroll up ⇧</p>
  </article>
</main>
```

```html hidden live-sample___initial live-sample___entry_exit live-sample___inset_cover live-sample___contains live-sample___inset_contain live-sample___cover_contain live-sample___entry_crossing live-sample___exit_crossing
<fieldset>
  <legend>Select the height of the animated element</legend>

  <label><input name="height" value="50" type="radio" checked /> 50px</label>
  <label><input name="height" value="250" type="radio" /> 250px</label>
  <label><input name="height" value="500" type="radio" /> 500px</label>
</fieldset>
```

```css hidden live-sample___initial live-sample___entry_exit live-sample___inset_cover live-sample___contains live-sample___inset_contain live-sample___cover_contain live-sample___entry_crossing live-sample___exit_crossing
:root {
  --animElHeight: 50px;
  --animElHeightWord: "50px";
}
body:has(input[value="250"]:checked) {
  --animElHeight: 250px;
  --animElHeightWord: "250px";
}
body:has(input[value="500"]:checked) {
  --animElHeight: 500px;
  --animElHeightWord: "500px";
}
main {
  padding: 20px 0 0 20px;
  margin-bottom: 2em;
}
article {
  outline: 3px dashed;
  width: 500px;
  margin: auto;
  overflow: scroll;
  position: relative;
  height: 250px;
  box-sizing: content-box;
}

p {
  padding: 10px;
  margin: 10px;
}

section {
  --clr: yellow;
  --words: "Animation not started";
  position: relative;
  margin: 20px;
  text-align: center;
}
.one,
.double i {
  animation: showAnim step-end 1 forwards;
  animation-timeline: view();
}
i {
  background-color: hsl(from var(--clr) h s calc(l * 1.4));
  display: block;
  height: var(--animElHeight);
  line-height: var(--animElHeight);
}
span {
  background-color: hsl(from var(--clr) h s 90%);
  border: 5px solid hsl(from var(--clr) h s 20%);
  min-width: 250px;
  height: 30px;
  line-height: 30px;
}
span,
i {
  font-family: sans-serif;
  font-size: 1.5rem;
}
span::before {
  content: var(--words);
}
span {
  position: fixed;
  top: 10px;
  left: 10px;
  padding: 10px;
}
i::after {
  content: " ( " var(--animElHeightWord) " )";
}
label {
  padding-right: 2em;
}
legend {
  margin-top: 2em;
}

@keyframes showAnim {
  from {
    --clr: green;
    --words: "Currently animating";
  }
  to {
    --clr: red;
    --words: "Animation complete";
  }
}
body::before {
  display: block;
  text-align: center;
  font-family: sans-serif;
  font-size: 1.5rem;
}

@layer no-support {
  @supports not (animation-timeline: view()) {
    body::before {
      content: "Your browser doesn't support view progress scrolling.";
      background-color: wheat;
      display: block;
      text-align: center;
    }
  }
}
```

```css hidden live-sample___initial live-sample___inset_cover live-sample___contains live-sample___inset_contain
.double {
  display: none;
}
```

```css hidden live-sample___cover_contain live-sample___entry_crossing live-sample___exit_crossing live-sample___entry_exit
.one {
  display: none;
}
.double div {
  display: flex;
  gap: 10px;
}
```

Trong ví dụ sau, hãy thử cuộn xuống. Lưu ý cách animation bắt đầu ngay khi cạnh trên của phần tử được animate căn chỉnh với cạnh dưới của scroll container và kết thúc, đạt `100%` tiến triển, khi cạnh dưới căn chỉnh với cạnh trên của container, bất kể phần tử được animate cao bao nhiêu.

{{EmbedLiveSample("initial", "100%", "400")}}

Writing mode và hướng cuộn của scroll container xác định cạnh bắt đầu và kết thúc của scroll container.

## Phạm vi gắn animation

Theo mặc định, phần tử được animate trong toàn bộ thời gian bất kỳ phần nào của phần tử subject đang hiển thị. Điều này có nghĩa là **phạm vi gắn animation** mặc định là tổng chiều cao của scroll container và chiều cao của phần tử subject, với chiều cao thêm vào ở cạnh cuối cuộn.

Trong ví dụ trước, scroll container cao `250px`, và phần tử được animate cao `50px` theo mặc định, nghĩa là phạm vi gắn animation dọc là `300px` chiều cao. Khi subject được đặt thành `250px`, phạm vi trở thành `500px`; khi phần tử được đặt thành `500px`, kích thước phạm vi gắn animation tăng lên `750px`.

Module [CSS scroll driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations) cung cấp các cơ chế để xác định các phạm vi gắn animation khác nhau. Các thuộc tính {{cssxref("animation-range-start")}} và {{cssxref("animation-range-end")}}, cả hai đều có thể được đặt bằng shorthand {{cssxref("animation-range")}}, xác định phạm vi gắn cho cạnh bắt đầu và cạnh kết thúc của phạm vi animation, cùng với bất kỳ inset nào từ cạnh nào đó, tương ứng.

Các thuộc tính animation-range chấp nhận từ khóa `normal`, một {{cssxref("timeline-range-name")}}, một {{cssxref("length-percentage")}}, hoặc cả `<timeline-range-name>` và `<length-percentage>`. Trong hướng dẫn này, chúng ta đang đề cập đến các giá trị cho thành phần `<timeline-range-name>` của giá trị.

<!--The length-percentage values, such as `20%` or `100px`, inset the animation timeline from the named animation attachment ranges, by the set amount, with the value defaulting to `0`. This is covered in xxx.-->

## Tên timeline range

Kiểu giá trị `<timeline-range-name>` chấp nhận sáu từ khóa: `cover`, `contain`, `entry`, `exit`, `entry-crossing` và `exit-crossing`. Mỗi cái đại diện cho một _named timeline range_ được xác định trước. Named timeline range là một đoạn được đặt tên của animation timeline. Các từ khóa này cho phép nhà phát triển đặt cơ sở phạm vi gắn animation mà các offset liên quan đến đó. Điểm bắt đầu của đoạn được biểu thị là tiến triển `0%` qua phạm vi; điểm kết thúc của đoạn được biểu thị là tiến triển `100%` qua phạm vi. Các điểm này nằm ở đâu tùy thuộc vào phạm vi được đặt tên.

### Cover

Phạm vi gắn animation trong các ví dụ trước đều "bao phủ" toàn bộ phạm vi. Phạm vi này đại diện cho toàn bộ phạm vi của view progress timeline. Tiến triển `0%` đại diện cho điểm mà cạnh border bắt đầu của subject căn chỉnh với cạnh cuối của scrollport, và tiến triển `100%` đại diện cho điểm mà cạnh border cuối của subject đến cạnh bắt đầu của scrollport. Như chúng ta đã thấy, kích thước của phạm vi `cover` là tổng của kích thước subject và scrollport theo hướng cuộn. Trong tất cả các ví dụ cho đến nay, chiều cao của phạm vi gắn animation là chiều cao của container cộng với chiều cao của phần tử được animate.

Named timeline range `cover` là phạm vi mặc định. Chúng ta có thể đặt `<timeline-range-name>` một cách tường minh để đạt được kết quả tương tự:

```css
.animated_element {
  animation-range-start: cover;
  animation-range-end: cover;
}
```

```html hidden live-sample___svg_cover
<div>
  <svg viewBox="-1 -1 462 1252" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="450" />
    <rect class="medium end" width="100" height="250" x="125" y="250" />
    <rect class="large end" width="100" height="500" x="240" y="0" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="750" />
    <rect class="medium start" width="100" height="250" x="125" y="750" />
    <rect class="large start" width="100" height="500" x="240" y="750" />
    <text y="625" x="5">cover</text>
    <text y="520" x="360">100%</text>
    <line x1="0" x2="350" y1="500" y2="500" />
    <line x1="0" x2="350" y1="750" y2="750" />
    <text y="760" x="360">0%</text>
  </svg>
</div>
```

{{EmbedLiveSample("svg_cover", "100%", "720")}}

Hình ảnh minh họa animation timeline. Vị trí của phần tử khi đạt đến dấu `0%` của phạm vi gắn animation được hiển thị là khối màu vàng. Điều này đại diện cho vị trí phần tử khi keyframe `from` được áp dụng. Khối màu đỏ đại diện cho vị trí của phần tử subject so với scrollport khi keyframe `to` được áp dụng. Đây là vị trí của phần tử được animate khi đạt đến cuối animation.

Tùy thuộc vào kích thước của phần tử subject và timeline range được chọn, vị trí bắt đầu và kết thúc có thể chồng lên nhau. Các vùng chồng lên nhau (như được thấy trong các sơ đồ tiếp theo) sẽ được biểu thị bằng các vùng kẻ sọc đỏ và vàng.

### Contain

Named timeline range `contain` _chứa_ toàn bộ animation trong scrollport — phạm vi bắt đầu khi phần tử được animate hiển thị 100% và kết thúc khi nó không còn hiển thị hoàn toàn, nếu nó có thể hiển thị hoàn toàn.

Giá trị `contain` đại diện cho phạm vi mà trong đó hộp chính hoặc được scrollport chứa hoàn toàn hoặc bao phủ hoàn toàn phạm vi hiển thị của view progress trong scrollport, tùy thuộc vào việc phần tử subject nhỏ hơn (có thể được scrollport chứa hoàn toàn) hay lớn hơn scrollport.

- Nếu phần tử nhỏ hơn scrollport theo hướng cuộn, `0%` xảy ra khi cạnh border cuối của phần tử được animate căn chỉnh với cạnh cuối của scrollport, và `100%` xảy ra khi cạnh border bắt đầu của phần tử được animate căn chỉnh với cạnh bắt đầu của scrollport. Nói cách khác, giá trị `contain` trải dài từ điểm mà phần tử subject lần đầu tiên được scrollport chứa hoàn toàn (`0%`), đến điểm mà nó không còn được scrollport chứa hoàn toàn (`100%`).

- Nếu phần tử lớn hơn scrollport, tiến triển `0%` là khi cạnh border bắt đầu của phần tử được animate đạt đến cạnh bắt đầu của scrollport, và `100%` là khi cạnh border cuối căn chỉnh với cạnh cuối. Nói cách khác, nếu animation lớn hơn container của nó, phần tử được animate không bao giờ hiển thị hoàn toàn vì nó không được "chứa" trong scrollport. Animation bắt đầu khi cạnh bắt đầu đạt đến cạnh bắt đầu của scrollport, và kết thúc khi cạnh cuối của phần tử được animate đạt đến cạnh cuối của container.

- Nếu phần tử được animate có cùng kích thước với container của nó, animation vẫn xảy ra, nhưng trong `0px`, không hiển thị với người dùng.

```css live-sample___contains
.animated_element {
  animation-range: contain;
}
```

```css hidden live-sample___contains
body::before {
  content: "Contain";
}
```

{{EmbedLiveSample("contains", "100%", "400")}}

Trong ví dụ này, chiều cao ban đầu của phần tử được animate là 20% chiều cao của scrollport và do đó có thể được chứa hoàn toàn trong nó. Kết quả là, như đã giải thích trước, animation sẽ bắt đầu ngay khi phần tử bắt đầu vào scrollport và kết thúc ngay khi nó bắt đầu rời đi.

Nếu bạn chọn nút radio `500px`, subject trở nên gấp đôi chiều cao của scrollport. Phạm vi animation bắt đầu khi phần tử subject lần đầu bao phủ hoàn toàn scroll port, với `0%` xảy ra khi cạnh bắt đầu đạt đến cạnh bắt đầu của container. Nó kết thúc khi phần tử không còn bao phủ hoàn toàn scrollport, với `100%` xảy ra khi cạnh cuối vượt qua cạnh cuối của container.

Khi subject có cùng kích thước với scroll container, như xảy ra khi `250px` được chọn, animation vẫn xảy ra, nhưng trong `0px`. Vì `0%` và `100%` xảy ra cùng lúc, animation là tức thời. Sự khác biệt về styling chỉ có thể nhận ra vì các thuộc tính được định nghĩa trong trạng thái keyframe `100%` được áp dụng sau khi animation kết thúc. Điều này vì thuộc tính {{cssxref("animation-fill-mode")}} được đặt thành `forwards`. Nếu không, subject cỡ trung bình `250px`, có cùng chiều cao với scroll container, sẽ dường như không animate gì cả.

```html hidden live-sample___svg_contain
<div>
  <svg viewBox="-1 -1 462 1000" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="500" />
    <rect class="medium end" width="100" height="250" x="120" y="500" />
    <rect class="large end" width="100" height="500" x="230" y="500" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="700" />
    <rect class="medium start" width="100" height="250" x="120" y="500" />
    <rect class="large start" width="100" height="500" x="230" y="250" />
    <rect width="100" height="250" x="120" y="500" fill="url(#g)" />
    <rect width="100" height="250" x="230" y="500" fill="url(#g)" />
    <text y="460" x="10">contain</text>
    <text y="520" x="360">100%</text>
    <line x1="0" x2="350" y1="500" y2="500" />
    <line x1="0" x2="350" y1="750" y2="750" />
    <text y="760" x="360">0%</text>
  </svg>
</div>
```

```css hidden live-sample___svg_contain
body div,
body svg {
  margin: -60px 0 -300px;
}
```

{{EmbedLiveSample("svg_contain", "100%", "450")}}

Animation xảy ra khi phần tử nằm trong các vùng được biểu thị bởi vùng trắng của container trong ví dụ `50px` và bởi các vùng đỏ/vàng trong ví dụ `250px` và `500px`.

Có thể hữu ích khi so sánh và đối chiếu các giá trị `cover` và `contain`. Chúng ta có thể dùng shorthand `animation-range` để đặt các thuộc tính `animation-range-start` và `animation-range-end` thành cùng giá trị `<animation-name-range>`:

```css live-sample___cover_contain
#A {
  animation-range: contain;
}
#B {
  animation-range: cover;
}
```

```css hidden live-sample___cover_contain
body::before {
  content: "contain vs cover";
}
#A,
#B {
  width: 140px;
}
#A::after {
  content: " ( contain )";
}
#B::after {
  content: " ( cover ) ";
}
```

{{EmbedLiveSample("cover_contain", "100%", "420")}}

Chọn các nút radio khác nhau và cuộn scrollport để so sánh hiệu ứng của các giá trị `cover` và `contain` trên animation timeline.

Hãy xem xét các giá trị từ khóa `<timeline-range-name>` khác!

### Entry và exit

Để làm cho toàn bộ animation chỉ xảy ra khi subject đang trong quá trình vào hoặc rời khỏi scrollport, hãy dùng các giá trị `entry` hoặc `exit`, tương ứng. Với hai giá trị này, phạm vi gắn animation dựa trên kích thước của phần tử được animate, không phải kích thước của scrollport.

#### Entry

Với `entry`, tiến triển `0%` xảy ra vào thời điểm phần tử được animate bắt đầu vào scrollport, khi cạnh bắt đầu của subject vượt qua cạnh cuối của scrollport.

Toàn bộ animation xảy ra khi subject đi vào view, kết thúc khi nó trở nên hoàn toàn hiển thị hoặc khi đạt đến cạnh bắt đầu; cái nào xảy ra trước. Nếu phần tử được animate nhỏ hơn scrollport, phạm vi gắn animation là kích thước của subject.

{{EmbedLiveSample("svg_entry_only", "100%", "500")}}

Vị trí ở tiến triển `0%` được hiển thị màu vàng. Vị trí ở tiến triển `100%` được hiển thị màu đỏ. Khi phần tử được animate lớn hơn scrollport, hai vị trí này chồng lên nhau, được biểu thị bằng nền kẻ sọc.

Với `entry`, phạm vi gắn animation là kích thước của phần tử được animate hoặc kích thước của container, cái nào nhỏ hơn. Nếu subject lớn hơn scrollport, phạm vi gắn animation là toàn bộ scrollport. Với `entry`, `100%` xảy ra khi cạnh cuối của subject vượt qua cạnh cuối của scrollport hoặc, nếu phần tử được animate lớn hơn scrollport theo hướng cuộn, khi cạnh bắt đầu của phần tử được animate đạt đến cạnh bắt đầu của scrollport.

Đặt `animation-range-start: entry` giống với đặt `animation-range-start: cover`.
Đặt `animation-range-end: entry` tương đương với đặt `animation-range-end: contain`.

```html hidden live-sample___svg_entry_only
<div>
  <svg viewBox="-60 400 530 980" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="700" />
    <rect class="medium end" width="100" height="250" x="120" y="500" />
    <rect class="large end" width="100" height="500" x="230" y="500" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="750" />
    <rect class="medium start" width="100" height="250" x="120" y="750" />
    <rect class="large start" width="100" height="500" x="230" y="750" />
    <rect width="100" height="250" x="230" y="750" fill="url(#g)" />
    <text y="460" x="10">entry</text>
    <text y="520" x="360">100%</text>
    <text y="690" x="-50">100%</text>
    <line x1="130" x2="350" y1="500" y2="500" />
    <line x1="-10" x2="120" y1="700" y2="700" />
    <line x1="0" x2="350" y1="750" y2="750" />
    <text y="760" x="360">0%</text>
  </svg>
</div>
```

#### Exit

Giá trị `exit` là nghịch đảo của `entry`.
Với `exit`, phạm vi gắn bắt đầu khi cạnh bắt đầu của phần tử được animate vượt qua cạnh bắt đầu của scrollport.

```html hidden live-sample___svg_exit_only
<div>
  <svg viewBox="-60 -1 530 800" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="450" />
    <rect class="medium end" width="100" height="250" x="120" y="250" />
    <rect class="large end" width="100" height="500" x="230" y="0" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="501" />
    <rect class="medium start" width="100" height="250" x="120" y="500" />
    <rect class="large start" width="100" height="500" x="230" y="250" />
    <rect width="100" height="250" x="230" y="250" fill="url(#g)" />
    <text y="600" x="10">exit</text>
    <text y="520" x="370">100%</text>
    <line x1="-5" x2="365" y1="500" y2="500" />
    <line x1="-10" x2="140" y1="550" y2="550" />
    <line x1="110" x2="360" y1="750" y2="750" />
    <text y="760" x="370">0%</text>
    <text y="560" x="-60">0%</text>
  </svg>
</div>
```

```css hidden live-sample___svg_entry_only live-sample___svg_exit_only
:root body div {
  margin: 0 0 -140px 0;
}
```

{{EmbedLiveSample("svg_exit_only", "100%", "460")}}

Tiến triển `0%` xảy ra khi cạnh bắt đầu của subject đạt đến cạnh bắt đầu của scrollport.
Tiến triển `100%` xảy ra khi cạnh cuối của subject vượt qua cạnh bắt đầu.
Đặt `animation-range-start: exit 0%` tương đương với đặt `animation-range-start: contain 100%`.
Đặt `animation-range-end: exit 100%` tương đương với `animation-range-end: cover 100%`.

#### So sánh entry và exit

Có thể hữu ích khi xem `entry` và `exit` cạnh nhau để hiểu tác động của kích thước subject lên phạm vi gắn animation: với hai giá trị này, phạm vi gắn animation không bao giờ lớn hơn container.

```css live-sample___entry_exit
#A {
  animation-range: entry;
}
#B {
  animation-range: exit;
}
```

```css hidden live-sample___entry_exit
body::before {
  content: "Entry and exit";
}
#A,
#B {
  width: 140px;
}
#A::after {
  content: " ( entry )";
}
#B::after {
  content: " ( exit ) ";
}
```

Cuộn viewbox để xem phạm vi của các giá trị `entry` và `exit`, sau đó thay đổi kích thước của các subject bằng nút radio và cuộn lại.

{{EmbedLiveSample("entry_exit", "100%", "400")}}

Khi các subject đủ nhỏ để được chứa hoàn toàn trong scrollport, phạm vi gắn animation timeline nằm ở đầu (`entry`) hoặc cuối (`exit`) của scrollport và kích thước của phạm vi gắn bị giới hạn theo kích thước của phần tử được animate theo hướng cuộn.

Với `entry` và `exit`, phạm vi animation được giới hạn theo kích thước của scrollport, trong khi phần tử thì không.

Nếu phần tử subject có kích thước bằng scrollport hoặc lớn hơn:

- Trong trường hợp `entry`, animation kết thúc khi phần tử bao phủ hoàn toàn scrollport theo hướng cuộn.
- Trong trường hợp `exit`, animation không bắt đầu cho đến khi phần tử bao phủ hoàn toàn scrollport theo hướng cuộn.

Đây có thể không phải là hiệu ứng bạn muốn. Nếu bạn muốn animation entry tiếp tục chạy cho đến khi toàn bộ phần tử đã hoàn thành việc vào cạnh bắt đầu của scrollport, hoặc nếu bạn muốn animation exit bắt đầu ngay khi phần tử bắt đầu thoát khỏi cạnh cuối của scrollport, bạn cần dùng `entry-crossing` và `exit-crossing`.

### Entry- và exit-crossing

Nếu phần tử subject nhỏ hơn scrollport và bạn muốn toàn bộ animation xảy ra khi nó vào hoặc thoát khỏi scrollport, bạn có thể dùng [`entry`](#entry) hoặc [`exit`](#exit), tương ứng.

Khi subject lớn hơn scrollport, animation không chạy toàn bộ quá trình phần tử vào hoặc thoát scrollport. Giá trị `entry` đặt tiến triển `100%` ở thời điểm cạnh bắt đầu của phần tử đạt đến cạnh bắt đầu của scrollport, trước khi phần tử đã vào scrollport hoàn toàn. Với `exit`, tiến triển `0%` xảy ra khi cạnh cuối của phần tử đạt đến cạnh cuối của scroll container, khi một phần của subject đã thoát khỏi scrollport. Với cả hai giá trị này, phạm vi gắn animation nhỏ hơn subject. Nếu đây không phải là hiệu ứng bạn muốn, các giá trị `*-crossing` có thể là giải pháp bạn tìm kiếm.

#### Entry-crossing

Giá trị `entry-crossing` đại diện cho phạm vi mà trong đó phần tử được animate vượt qua cạnh cuối của scrollport, với tiến triển `0%` xảy ra khi cạnh bắt đầu của phần tử căn chỉnh với cạnh cuối của scrollport và tiến triển `100%` xảy ra khi cạnh cuối của phần tử đạt đến cạnh cuối của scrollport, nghĩa là nó đã hoàn toàn cuộn vào scrollport.

{{EmbedLiveSample("svg_entry-crossing", "100%", "600")}}

Có thể hữu ích khi so sánh hai giá trị trong ví dụ trực tiếp.

```css live-sample___entry_crossing
#A {
  animation-range: entry;
}
#B {
  animation-range: entry-crossing;
}
```

```css hidden live-sample___entry_crossing
body::before {
  content: "entry vs. entry-crossing";
}
#A::after {
  content: " ( entry )";
}
#B::after {
  content: " ( entry-crossing ) ";
}
```

Chọn các giá trị chiều cao khác nhau, sau đó cuộn để so sánh `entry` với `entry-crossing` cho mỗi kích thước.

{{EmbedLiveSample("entry_crossing", "100%", "400")}}

Lưu ý cách các hiệu ứng tương tự nhau, ngoại trừ khi `500px` được chọn và phần tử được animate cao hơn container.
Phạm vi `entry-crossing` tạo ra kết quả giống như `entry` khi phần tử bằng hoặc nhỏ hơn scrollport, nhưng khi phần tử lớn hơn scrollport, `100%` xảy ra muộn hơn, chỉ khi cạnh cuối đã vào viewport.
Phạm vi gắn animation là kích thước của subject, không bị giới hạn bởi kích thước của scrollport.

```html hidden live-sample___svg_entry-crossing
<div>
  <svg viewBox="-60 -1 530 1252" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="700" />
    <rect class="medium end" width="100" height="250" x="120" y="500" />
    <rect class="large end" width="100" height="500" x="230" y="500" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="750" />
    <rect class="medium start" width="100" height="250" x="120" y="750" />
    <rect class="large start" width="100" height="500" x="230" y="750" />
    <rect class="orange" width="100" height="250" x="230" y="750" fill="url(#g)" />
    <text y="460" x="10">entry</text>
    <text y="520" x="360">100%</text>
    <text y="690" x="-50">100%</text>
    <line x1="130" x2="350" y1="500" y2="500" />
    <line x1="-10" x2="120" y1="700" y2="700" />
    <line x1="0" x2="350" y1="750" y2="750" />
    <text y="760" x="360">0%</text>
  </svg>

  <svg viewBox="-60 -1 530 1252" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="700" />
    <rect class="medium end" width="100" height="250" x="120" y="500" />
    <rect class="large end" width="100" height="500" x="230" y="250" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="750" />
    <rect class="medium start" width="100" height="250" x="120" y="750" />
    <rect class="large start" width="100" height="500" x="230" y="750" />
    <text y="200" x="0">entry-crossing</text>
    <text y="260" x="330">100%</text>
    <text y="490" x="80">100%</text>
    <text y="690" x="-50">100%</text>
    <line x1="225" x2="345" y1="250" y2="250" />
    <line x1n h0" x2="230" y1="500" y2="500" />
    <line x1="-10" x2="120" y1="700" y2="700" />
    <line x1="0" x2="350" y1="750" y2="750" />
    <text y="760" x="360">0%</text>
  </svg>
</div>
```

```css hidden hidden live-sample___svg_entry-crossing
:root body div {
  margin: -70px 0 -100px;
}
```

#### Exit-crossing

Giá trị `exit-crossing` đại diện cho phạm vi mà trong đó phần tử được animate vượt qua cạnh bắt đầu của scrollport, với tiến triển `0%` xảy ra khi cạnh bắt đầu của phần tử căn chỉnh với cạnh bắt đầu của scrollport và tiến triển `100%` xảy ra khi cạnh cuối của phần tử đạt đến cạnh bắt đầu của scrollport.

{{EmbedLiveSample("svg_exit_crossing", "100%", "540")}}

Với `exit-crossing`, animation bắt đầu ngay khi subject bao phủ scrollport (với `exit`, animation không bắt đầu cho đến khi cạnh cuối của subject đi vào view). Trong cả hai trường hợp, animation tiếp tục cho đến khi subject hoàn toàn thoát khỏi cạnh bắt đầu của scrollport.

```css live-sample___exit_crossing
#A {
  animation-range: exit;
}
#B {
  animation-range: exit-crossing;
}
```

```css hidden live-sample___exit_crossing
body::before {
  content: "exit vs. exit-crossing";
}
#A::after {
  content: " ( exit )";
}
#B::after {
  content: " ( exit-crossing ) ";
}
```

`exit-crossing` tạo ra kết quả giống như `exit` khi phần tử bằng hoặc nhỏ hơn scrollport, nhưng khi phần tử lớn hơn scrollport, `0%` xảy ra sớm hơn, xảy ra ngay khi cạnh bắt đầu của phần tử đạt đến cạnh bắt đầu của scrollport, thay vì chờ đến khi cạnh cuối của phần tử vào scrollport.

{{EmbedLiveSample("exit_crossing", "100%", "400")}}

Giống như với `entry-crossing`, phạm vi gắn animation là kích thước của subject, không bị giới hạn bởi kích thước của scrollport.

```html hidden live-sample___svg_exit_crossing
<div>
  <svg viewBox="-60 -1 530 1052" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="450" />
    <rect class="medium end" width="100" height="250" x="120" y="250" />
    <rect class="large end" width="100" height="500" x="230" y="0" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="501" />
    <rect class="medium start" width="100" height="250" x="120" y="500" />
    <rect class="large start" width="100" height="500" x="230" y="250" />
    <rect width="100" height="250" x="230" y="250" fill="url(#g)" />
    <text y="800" x="-10">exit</text>
    <text y="520" x="370">100%</text>
    <line x1="-5" x2="365" y1="500" y2="500" />
    <line x1="-10" x2="140" y1="550" y2="550" />
    <line x1="110" x2="360" y1="750" y2="750" />
    <text y="760" x="370">0%</text>
    <text y="560" x="-60">0%</text>
  </svg>
  <svg viewBox="-60 -1 530 1052" xmlns="http://www.w3.org/2000/svg">
    <rect class="small end" width="100" height="50" x="10" y="450" />
    <rect class="medium end" width="100" height="250" x="120" y="250" />
    <rect class="large end" width="100" height="500" x="230" y="0" />
    <rect class="container" width="350" height="250" x="0" y="500" />
    <rect class="small start" width="100" height="50" x="10" y="501" />
    <rect class="medium start" width="100" height="250" x="120" y="500" />
    <rect class="large start" width="100" height="500" x="230" y="500" />
    <text y="800" x="-10">exit-crossing</text>
    <text y="520" x="370">100%</text>
    <line x1="-5" x2="365" y1="500" y2="500" />
    <line x1="-10" x2="140" y1="550" y2="550" />
    <line x1="110" x2="360" y1="750" y2="750" />
    <text y="760" x="370">0%</text>
    <text y="560" x="-60">0%</text>
  </svg>
</div>
```

```css hidden hidden live-sample___svg_exit_crossing
:root body div {
  margin-bottom: -300px;
}
```

```html hidden live-sample___svg_exit_crossing live-sample___svg_entry_only live-sample___svg_exit_only live-sample___svg_contain live-sample___svg_cover live-sample___svg_entry-crossing
<svg id="gradient">
  <defs>
    <linearGradient
      id="g"
      x1="0"
      y1="0"
      x2="20"
      y2="20"
      spreadMethod="repeat"
      gradientUnits="userSpaceOnUse">
      <stop offset="50%" stop-color="red" />
      <stop offset="50%" stop-color="yellow" />
    </linearGradient>
  </defs>
</svg>
```

```css hidden live-sample___svg_exit_crossing live-sample___svg_entry_only live-sample___svg_exit_only live-sample___svg_contain live-sample___svg_cover live-sample___svg_entry-crossing
body::before {
  display: block;
  text-align: center;
  font-family: sans-serif;
  font-size: 1.5rem;
}
div {
  display: flex;
  gap: 20px;
}
svg {
  width: 260px;
}
#gradient {
  height: 1px;
  position: absolute;
  width: 1px;
}
rect {
  stroke: black;
  stroke-width: 3;
}
.start {
  fill: yellow;
}
.end {
  fill: red;
}
.container {
  fill: none;
}
text {
  font: 40px monospace;
  fill: black;
}
line {
  stroke: black;
  stroke-width: 8;
  stroke-dasharray: 10;
}
```

<!--
### Other progress values

In this guide, we have mentioned `0%` and `100%` progress points. The animation-range values aren't limited to these to progress points. You can inset any of the named animation ranges by a set amount or a percentage of the full animation attachment range. This is discussed in the [insets]() guide. -->

## Xem thêm

- Kiểu dữ liệu {{cssxref("timeline-range-name")}}
- [Keyframe selectors](/en-US/docs/Web/CSS/Reference/Selectors/Keyframe_selectors)
- [Scroll-driven animation timelines](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations/Timelines)
- Module [Scroll-driven animation](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
- Module [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
