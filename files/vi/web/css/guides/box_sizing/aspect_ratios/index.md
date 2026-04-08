---
title: Understanding and setting aspect ratios
short-title: Aspect ratios
slug: Web/CSS/Guides/Box_sizing/Aspect_ratios
page-type: guide
spec-urls: https://drafts.csswg.org/css-sizing/#aspect-ratio
sidebar: cssref
---

Mỗi phần tử được render ra trang đều có chiều cao và chiều rộng, và do đó có một {{glossary("aspect ratio")}}, là tỷ lệ giữa chiều rộng và chiều cao. Kích thước tự nhiên của một đối tượng media, tức là kích thước của nó khi không áp dụng sizing, scaling, zooming hay border, được gọi là kích thước tự nhiên hoặc {{glossary("intrinsic size")}}. Intrinsic size của phần tử được xác định bởi chính phần tử đó, chứ không phải bằng cách áp dụng định dạng như [box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing) hay thiết lập chiều rộng của border, margin hay padding.

Khi phát triển website, bạn thường muốn thiết lập chiều rộng của phần tử theo phần trăm kích thước viewport hoặc container cha, và để chiều cao thay đổi theo tỷ lệ, từ đó duy trì một aspect ratio cụ thể tùy thuộc vào kích thước viewport. Đối với các phần tử replaced như hình ảnh và video, việc duy trì aspect ratio cụ thể không chỉ cần thiết cho việc tạo {{glossary("responsive web design")}}, mà còn là một yếu tố quan trọng để cung cấp trải nghiệm người dùng tốt. Thiết lập aspect ratio của một asset ngăn chặn [jank](/en-US/docs/Learn_web_development/Extensions/Performance/Multimedia#rendering_strategy_preventing_jank_when_loading_images) khi tải — sự thay đổi layout xảy ra khi media tải sau khi trang đã được vẽ, gây ra reflow vì không gian cho asset chưa được đặt trước.

Sử dụng CSS, bạn có thể điều chỉnh kích thước của các phần tử replaced và non-replaced dựa trên aspect ratio của chúng. Trong hướng dẫn này, chúng ta sẽ tìm hiểu về thuộc tính `aspect-ratio`, thảo luận về aspect ratio cho các phần tử replaced và non-replaced, sau đó xem xét một số trường hợp sử dụng aspect ratio phổ biến.

## Cách thuộc tính `aspect-ratio` hoạt động

Giá trị của thuộc tính CSS {{cssxref("aspect-ratio")}} định nghĩa tỷ lệ chiều rộng trên chiều cao ưa thích của box của phần tử. Giá trị có thể là {{cssxref("ratio")}}, từ khóa `auto`, hoặc kết hợp cả hai cách nhau bởi khoảng trắng.

`<ratio>` là tỷ lệ giữa chiều rộng và chiều cao, theo thứ tự đó. Nó được biểu diễn bằng hai giá trị {{cssxref("number")}} dương cách nhau bởi dấu gạch chéo (`/`) hoặc một `<number>` đơn lẻ. Khi dùng một số đơn lẻ, nó tương đương với việc viết tỷ lệ là `<number> / 1`, tức là chiều rộng chia chiều cao.

Các giá trị sau đều tương đương:

```css
aspect-ratio: 3 / 6;
aspect-ratio: 1 / 2;
aspect-ratio: 0.5 / 1;
aspect-ratio: 0.5;
```

Các giá trị sau cũng đều tương đương:

```css
aspect-ratio: 9/6;
aspect-ratio: 3/2;
aspect-ratio: 1.5;
```

```html hidden live-sample___number
<div>0.5</div>
<div>1.5</div>
```

```css hidden live-sample___number
div {
  height: 121px;
  aspect-ratio: 0.5;
  background-color: pink;
  line-height: 100px;
  text-align: center;
  float: left;
  background-image:
    repeating-linear-gradient(to right, black 0px 1px, transparent 1px 20px),
    repeating-linear-gradient(black 0px 1px, transparent 1px 20px);
  background-size:
    181px 5px,
    5px 121px;
  background-repeat: no-repeat;
}

div + div {
  aspect-ratio: 1.5;
  background-color: lightgreen;
  margin-left: 10px;
}
```

{{EmbedLiveSample("number", "100", "130")}}

Hiệu ứng của từ khóa `auto` phụ thuộc vào việc phần tử được áp dụng có phải là phần tử replaced hay không. Đối với các phần tử replaced có intrinsic aspect ratio, `auto` có nghĩa là nên sử dụng intrinsic aspect ratio. Trong tất cả các trường hợp khác, giá trị `auto` có nghĩa là box không có aspect ratio ưa thích. Trong cả hai trường hợp, đây là hành vi mặc định như thể không có thuộc tính `aspect-ratio` nào được áp dụng.

Khi giá trị chứa cả từ khóa `auto` và giá trị `<ratio>`, chẳng hạn như `aspect-ratio: auto 2 / 3;` hoặc `aspect-ratio: 0.75 auto;`, giá trị `auto` được áp dụng cho các phần tử replaced có natural aspect ratio và tỷ lệ `width / height` hoặc `<number>` đã chỉ định được dùng làm aspect ratio ưa thích.

Bạn sẽ nhận thấy từ "ưa thích" trong các định nghĩa trên. Giá trị `aspect-ratio` không phải lúc nào cũng được áp dụng khi được đặt. Thuộc tính `aspect-ratio` đặt một aspect ratio "ưa thích", vì vậy chỉ có hiệu lực khi ít nhất một trong các kích thước của box được sizing tự động.

Khi cả chiều cao lẫn chiều rộng, hoặc cả kích thước inline lẫn block đều được đặt tường minh, giá trị thuộc tính `aspect-ratio` sẽ bị bỏ qua. Trong trường hợp này, không có kích thước nào được phép sizing tự động — các kích thước ưa thích được đặt tường minh — vì vậy thuộc tính `aspect-ratio` không có hiệu lực. Khi bạn khai báo cả kích thước inline lẫn block, chúng sẽ được ưu tiên.

Với các phần tử replaced, nếu bạn không đặt tường minh giá trị (khác `auto`) cho bất kỳ kích thước nào, cả hai sẽ mặc định là intrinsic size của chúng (giá trị `aspect-ratio` nào cũng không được áp dụng). `aspect-ratio` sẽ áp dụng cho các phần tử non-replaced không có kích thước nào được đặt tường minh, vì các phần tử non-replaced được sizing theo [intrinsic](/en-US/docs/Glossary/Intrinsic_Size) hoặc [extrinsic](/en-US/docs/Glossary/Extrinsic_size), nhận kích thước từ nội dung, container, thuộc tính [box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model), v.v.

Khi một phần tử được render ra trang, nếu không có CSS nào được áp dụng và không có thuộc tính sizing HTML nào được bao gồm, user agent sẽ render đối tượng theo kích thước tự nhiên của nó.

## Điều chỉnh aspect ratio của các phần tử replaced

Các phần tử replaced như {{htmlelement("img")}} và {{htmlelement("video")}} được thay thế bằng media có kích thước đặt sẵn, và do đó có intrinsic aspect ratio. Hãy xem xét một hình ảnh raster, chẳng hạn như JPEG, PNG hoặc GIF. Nếu bạn đặt hình ảnh trên trang và không thiết lập chiều cao hay chiều rộng, dù thông qua thuộc tính {{htmlelement("img")}} hay CSS, nó sẽ được hiển thị theo intrinsic size của nó.

<!-- temporarily ignore these images. Testing preview -->

```html hidden live-sample___original
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg?image=good"
  alt="220 pixel square pride flag" />
```

{{EmbedLiveSample("original", "100", "230")}}

Đây là hình ảnh vuông `220px` không có CSS nào được áp dụng; nó được hiển thị theo intrinsic hoặc kích thước mặc định của nó.

Nếu nội dung replaced được auto-sized hoặc bạn chỉ cung cấp kích thước cho một chiều, chẳng hạn như đặt giá trị cho `width`, trình duyệt sẽ tự động thay đổi kích thước chiều kia, trong trường hợp này là chiều cao, trong khi vẫn duy trì aspect ratio gốc của media.

Trong ví dụ này, chỉ có {{cssxref("width")}} được đặt trên hình ảnh, vì vậy user agent giữ nguyên aspect ratio của nó. Cùng một hình ảnh được lặp lại ba lần, hiển thị ở các chiều rộng khác nhau: `55px`, `110px`, và theo kích thước tự nhiên `220px` thông qua giá trị [`width: auto`](/en-US/docs/Web/CSS/Reference/Properties/width).

```html hidden live-sample___image
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

```css hidden live-sample___image
img {
  width: 55px;
  margin-right: 5px;
}

img + img {
  width: 110px;
}

img + img + img {
  width: auto;
}
```

{{EmbedLiveSample("image", "100", "230")}}

Chỉ khi bạn cung cấp kích thước cho cả hai chiều thì mới có nguy cơ làm biến dạng phần tử replaced. Ví dụ, đặt `width: 100vw;` và `height: 100vh;` trên một hình ảnh tạo ra aspect ratio biến đổi; hình ảnh sẽ bị kéo dài hoặc bị nén khi aspect ratio của viewport khác với aspect ratio tự nhiên của hình ảnh.

Trong ví dụ này, cùng một hình ảnh được lặp lại ba lần, được sizing tường minh với cùng giá trị {{cssxref("height")}} (`110px`) nhưng các giá trị {{cssxref("width")}} khác nhau (`55px`, `110px`, và `220px`).

```html hidden live-sample___image-bad
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

```css hidden live-sample___image-bad
img {
  width: 55px;
  height: 110px;
}

img + img {
  width: 110px;
}

img + img + img {
  width: 220px;
}
```

{{EmbedLiveSample("image-bad", "100", "120")}}

Chúng ta đã cố ý làm biến dạng hình ảnh bằng cách đặt cả `height` lẫn `width`: hình ảnh đầu tiên bị nén và hình ảnh thứ ba bị kéo dài.

Chúng ta có thể tạo hiệu ứng biến dạng tương tự bằng cách sử dụng thuộc tính CSS {{cssxref("aspect-ratio")}}, bằng cách đặt một kích thước đơn (không phải cả hai hoặc không phải không kích thước nào) và cung cấp giá trị khác `1` (hoặc `1 / 1`). Bạn thường không muốn làm vậy, nhưng biết rằng điều đó là có thể thì rất hữu ích.

```html hidden live-sample___stretch
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

```css live-sample___stretch
img {
  height: 90vh;
  aspect-ratio: 3;
}
```

{{EmbedLiveSample("stretch", "100", "270")}}

Chúng ta đã khai báo một kích thước đơn; `100vh` là chiều cao đầy đủ của viewport {{htmlelement("iframe")}} trong ví dụ. Để `aspect-ratio` áp dụng cho các phần tử replaced, chỉ một kích thước phải được đặt. Đặt cả hai hoặc không đặt kích thước nào đều không hoạt động.

### Vừa khít phần tử replaced vào container của chúng

Để vừa khít một phần tử replaced vào kích thước container của nó trong khi vẫn duy trì intrinsic aspect ratio, hãy đặt giá trị thuộc tính {{cssxref("object-fit")}} thành `cover` hoặc `contain`. Điều này sẽ thay đổi kích thước phần tử replaced và cắt nó để "cover" container hoặc hiển thị nó ở kích thước nhỏ hơn, được "contain" hoàn toàn trong container.

Trong ví dụ này, hình ảnh vuông được đặt trong grid gồm ba item, mỗi item có aspect ratio là `5 / 2`.

Để bắt đầu, chúng ta tạo một container với ba item, mỗi item chứa một hình ảnh:

```html live-sample___image-grid
<div class="grid">
  <div>
    <img
      src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      alt="Pride flag" />
  </div>
  <div>
    <img
      class="cover"
      src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      alt="Pride flag" />
  </div>
  <div>
    <img
      class="contain"
      src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      alt="Pride flag" />
  </div>
</div>
```

Tiếp theo, chúng ta chỉ định container là một grid, trong đó mỗi item có aspect ratio là `2.5` (`5/2`) với chiều rộng tối thiểu là `150px`. Do đó, chiều cao tối thiểu sẽ là `60px`. Tuy nhiên, chiều rộng và chiều cao cuối cùng được xác định bởi chiều rộng của iframe trong ví dụ, phụ thuộc vào kích thước viewport của bạn:

```css live-sample___image-grid
.grid {
  display: grid;
  gap: 20px;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  font-size: 0; /* to minimize whitespace */
}

div div {
  aspect-ratio: 5 / 2;
  background-color: #cccccc;
}
```

Sau đó chúng ta sizing các hình ảnh và đặt thuộc tính `object-fit` trên hai hình ảnh cuối:

```css live-sample___image-grid
img {
  height: 100%;
  width: 100%;
}

.cover {
  object-fit: cover;
}

.contain {
  object-fit: contain;
}
```

{{EmbedLiveSample("image-grid", "100", "100")}}

Chỉ có hình ảnh đầu tiên bị biến dạng (kéo dài). Chúng ta có thể dùng giá trị `fill` của `object-fit` để tạo hiệu ứng tương tự. Hình ảnh `cover` trải dài toàn bộ chiều rộng của container, được căn giữa theo chiều dọc, và bị cắt để vừa với container. Giá trị `contain` đảm bảo hình ảnh được chứa bên trong container, căn giữa theo chiều ngang, và thu nhỏ để vừa.

## Định nghĩa aspect ratio cho các phần tử non-replaced

Trong khi aspect ratio của phần tử replaced được duy trì theo mặc định, việc điều chỉnh intrinsic size của phần tử non-replaced thường thay đổi aspect ratio của nó. Ví dụ, nội dung giống hệt nhau có thể xuất hiện như ba dòng trên màn hình rộng hoặc trong container cha rộng, nhưng là tám dòng trên màn hình hẹp hoặc container hẹp.

Trong ví dụ này, cùng một trích dẫn được hiển thị trong các container rộng `200px` và `600px`, và một hình vuông được đặt với chiều cao bằng chiều rộng `200px` của nó:

```html hidden live-sample___alder
<p>Narrow:</p>
<blockquote>
  <q
    >When you stop living your life based on what others think of you real life
    begins. At that moment, you will finally see the door of self acceptance
    opened.</q
  >
  - Shannon L. Alder
</blockquote>
<p>Wide:</p>
<blockquote>
  <q
    >When you stop living your life based on what others think of you real life
    begins. At that moment, you will finally see the door of self acceptance
    opened.</q
  >
  - Shannon L. Alder
</blockquote>
<p>Aspect ratio with overflow:</p>
<blockquote>
  <q
    >When you stop living your life based on what others think of you real life
    begins. At that moment, you will finally see the door of self acceptance
    opened.</q
  >
  - Shannon L. Alder
</blockquote>
<p>
  <label
    ><input type="checkbox" checked /> Toggle between
    <code>overflow</code> values <code>auto</code> and
    <code>visible</code></label
  >
</p>
```

Để làm nổi bật vấn đề khi đặt aspect ratio của phần tử non-replaced thông qua kích thước, hãy chuyển đổi thuộc tính {{cssxref("overflow")}} giữa `auto` và `visible`.

```css hidden live-sample___alder
blockquote {
  border: 3px dotted #cccccc;
  padding: 0 3px;
  margin: 20px 0;
  font-size: 1.25rem;
  line-height: 1.5;
}

body:has(:checked) blockquote {
  overflow: auto;
}

:checked + code,
:not(:checked) + code + code {
  outline: 1px solid green;
}

p:nth-last-of-type(n + 2) {
  font-weight: bold;
}
```

```css live-sample___alder
blockquote {
  width: 200px;
}

blockquote:nth-of-type(2) {
  width: 600px;
}

blockquote:nth-of-type(3) {
  height: 200px;
}
```

{{EmbedLiveSample("alder", "100", "800")}}

Mặc dù có thể định nghĩa aspect ratio trên các phần tử non-replaced bằng cách đặt cả hai kích thước và ẩn nội dung tràn ra, thuộc tính CSS {{cssxref("aspect-ratio")}} cung cấp hỗ trợ aspect ratio tường minh. Điều này có nghĩa là một aspect ratio cụ thể có thể được đặt ngay cả khi bạn không biết kích thước nội dung hay màn hình.

Trong ví dụ tiếp theo, chúng ta render các hộp vuông bất kể chiều rộng của văn bản bằng cách đặt `aspect ratio: 1` trên {{htmlelement("blockquote")}}, một phần tử non-replaced:

```html hidden live-sample___words
<p>Short text:</p>
<blockquote>Breath.</blockquote>
<p>Longer text:</p>
<blockquote>You're perfect just as you are.</blockquote>
```

```css live-sample___words
blockquote {
  inline-size: max-content;
  aspect-ratio: 1;
}
```

```css hidden live-sample___words
blockquote {
  border: 1px solid #cccccc;
  padding: 1px;
  margin: 20px 0;
  background-color: #ededed;
}
```

{{EmbedLiveSample("words", "100", "400")}}

Mỗi hộp có một kích thước được định nghĩa: {{cssxref("inline-size")}}, là chiều rộng trong các ngôn ngữ ngang, được đặt thành {{cssxref("max-content")}}, thiết lập kích thước rộng đủ để vừa nội dung mà không xuống dòng. Kích thước thứ hai, trong trường hợp này là {{cssxref("block-size")}} hoặc {{cssxref("height")}}, được đặt bằng kích thước đầu tiên. Điều này được thực hiện bằng thuộc tính {{cssxref("aspect-ratio")}}. Chúng ta đã định nghĩa tỷ lệ chiều rộng trên chiều cao ưa thích của box phần tử là `1`, tương đương với `1 / 1`, là hình vuông. Điều này đặt chiều hướng block khớp với chiều rộng của phần tử, mà không dùng các thuộc tính {{cssxref("height")}} hoặc {{cssxref("block-size")}}.

Trong các ví dụ này, một kích thước được đặt tường minh trên chính phần tử. Khi làm việc với các phần tử non-replaced, aspect ratio phát huy tác dụng khi không có kích thước nào được đặt tường minh.

### Tạo hình tròn dựa trên kích thước container

Inline-size của các phần tử block-level non-replaced là kích thước của [content box](/en-US/docs/Web/CSS/Reference/Values/box-edge#content-box) của container của chúng. Vì chúng có kích thước mặc định, chúng không cần phải có kích thước tường minh được đặt để thuộc tính `aspect-ratio` hoạt động.

Trong ví dụ này, chúng ta có một container {{htmlelement("div")}} rộng `200px`, bao gồm `5px` padding ở mỗi bên. Do đó, inline-size của content box là `190px`. Nếu không đặt chiều cao hay chiều rộng trên phần tử {{htmlelement("p")}} lồng bên trong, chúng ta biết inline-size của nó là `190px`. Với `aspect-ratio: 1` được đặt, đoạn văn sẽ cao `190px`, trừ khi nó có nội dung tràn ra ngoài visible khiến nó cao hơn (điều này không xảy ra).

Chiều cao của phần tử `<div>` không được đặt tường minh, nhưng nó chứa đoạn văn cao `190px`, `5px` padding ở trên và dưới, và chiều cao kết hợp của margin mặc định trên và dưới của `<p>`. Kết quả là nó cao hơn chiều rộng. Cả hai phần tử đều có {{cssxref("border-radius")}} là `50%`, nên container là hình oval trong khi phần tử con, với `aspect-ratio` là `1` nhưng không có inline hay block sizing được định nghĩa tường minh, là hình tròn.

```html live-sample___circle
<div><p>Hello world</p></div>
```

```css live-sample___circle
div,
p {
  border-radius: 50%;
}

div {
  width: 200px;
  padding: 5px;
  border: 1px solid black;
  background-color: #66ccff;
}

p {
  aspect-ratio: 1;
  text-align: center;
  border: 10px solid white;
  background-color: #f4aab9;
}
```

{{EmbedLiveSample("circle", "100", "250")}}

Để làm cho `<div>` thành hình tròn, chúng ta có thể đặt `height` và `width` bằng nhau, hoặc đặt `aspect-ratio: 1` và đặt `overflow` thành `auto` hoặc `hidden`. Hoặc chúng ta có thể chỉ đơn giản là xóa margin trên đoạn văn bằng [`margin-block: 0`](/en-US/docs/Web/CSS/Reference/Properties/margin-block). Cả hai tùy chọn này được hiển thị bên dưới.

```html live-sample___circle2
<div><p>Hello world</p></div>
<div><p>Hello world</p></div>
```

```css hidden live-sample___circle2
div {
  width: 200px;
  padding: 5px;
  margin: 1rem;
  border: 1px solid black;
  background-color: #66ccff;
}

p {
  text-align: center;
  border: 10px solid white;
  background-color: #f4aab9;
}
```

```css live-sample___circle2
div,
p {
  aspect-ratio: 1;
  border-radius: 50%;
}

div:first-of-type {
  overflow: hidden;
}

div:last-of-type p {
  margin-block: 0;
}
```

{{EmbedLiveSample("circle2", "100", "520")}}

## Các trường hợp sử dụng `aspect-ratio` phổ biến

Hãy xem xét một số tình huống mà bạn có thể dùng `aspect-ratio` để giải quyết một số thách thức phổ biến khi tạo responsive design.

### Làm cho các asset bên ngoài có responsive

Tất cả nội dung phải responsive, kể cả khi đó là embed từ bên thứ ba, chẳng hạn như video từ TikTok, YouTube hoặc Instagram. Đoạn code bạn dùng để nhúng những video bên ngoài này thường tạo ra một {{htmlelement("iframe")}}.

Trong khi phần tử {{htmlelement("video")}} thường áp dụng aspect ratio của file media của nó, các phần tử `iframe` thiếu khả năng này. Điều này đặt ra thách thức đảm bảo rằng `<iframe>` có responsive trong khi luôn duy trì aspect ratio của video nó chứa. Một trong những kỹ thuật chúng ta có thể dùng là đặt chiều rộng của iframe thành `100%` của container hoặc `100vw` để khớp với chiều rộng viewport bất kể kích thước viewport. Tuy nhiên, đặt chiều cao cố định có thể kéo dài hoặc nén video. Thay vào đó, chúng ta đặt `aspect-ratio` trên container của video, căn chỉnh nó với cùng aspect ratio của video. Vấn đề đã được giải quyết!

Để tham khảo, aspect ratio tiêu chuẩn của video YouTube là 16:9 khi xem trên máy tính để bàn hoặc laptop, trong khi video TikTok và Instagram có aspect ratio 9:16.

```css
.youtube {
  aspect-ratio: 16/9;
}

.instagram,
.tiktok {
  aspect-ratio: 9/16;
}
```

Chúng ta có thể sử dụng tính năng `aspect-ratio` trong {{cssxref("@media")}} query cùng với thuộc tính `aspect-ratio` để điều chỉnh kích thước của cả iframe lẫn video nó chứa. Điều này đảm bảo nội dung video luôn to nhất có thể — chiếm toàn bộ chiều rộng hoặc chiều cao của viewport, bất kể kích thước viewport — trong khi vẫn duy trì một aspect ratio cụ thể.

Chúng ta có thể đặt video YouTube theo chiều ngang rộng bằng viewport và iframe video TikTok và Instagram theo chiều dọc cao bằng viewport. Nếu aspect ratio của viewport rộng hơn 16:9, chúng ta đặt video YouTube cao bằng viewport. Nếu viewport hẹp hơn 9:16, chúng ta đặt cả video Instagram và TikTok rộng bằng viewport.

```css
iframe.youtube {
  aspect-ratio: 16/9;
  width: 100vw;
  height: auto;
}

iframe.instagram,
iframe.tiktok {
  aspect-ratio: 9/16;
  height: 100vh;
  width: auto;
}

/* If the viewport is very wide but not very tall */
@media (aspect-ratio > 16 / 9) {
  iframe.youtube {
    width: auto;
    height: 100vh;
  }
}

/* If the viewport is very tall but not very wide */
@media (aspect-ratio < 9 / 16) {
  iframe.instagram,
  iframe.tiktok {
    height: auto;
    width: 100vw;
  }
}
```

### Tạo các ô grid hình vuông

Một grid các ô hình vuông có thể được tạo bằng cách định nghĩa [kích thước column track](/en-US/docs/Web/CSS/Reference/Properties/grid-template-columns) cố định, đảm bảo mỗi hàng khớp với kích thước column track. Tuy nhiên, khi tạo responsive grid dùng `auto-fill` để vừa nhiều column track nhất có thể trong container, chiều rộng của mỗi item trở nên không xác định. Điều này gây khó khăn trong việc xác định chiều cao phù hợp để tạo các item vuông.

Bằng cách đặt aspect ratio trên các item, chúng ta có thể đảm bảo khi các grid item được bố trí, mỗi grid item sẽ cao bằng chiều rộng của nó, tạo ra các grid item vuông bất kể kích thước container.

Trong ví dụ về grid item vuông này, các grid track được auto-sized, nhận kích thước từ các item. Mỗi item sẽ rộng ít nhất `95px` nhưng có thể rộng hơn nhiều. Dù chiều rộng là bao nhiêu, mỗi item sẽ là hình vuông, với chiều cao được xác định bởi `aspect-ratio` để khớp với chiều rộng của nó.

```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(95px, 1fr));
}

.item {
  aspect-ratio: 1;
}
```

```css hidden
div {
  gap: 20px;
  font-size: 1.1rem;
}

div div {
  background-color: #cccccc;
  aspect-ratio: 1;
  counter-increment: items;
}

div div::after {
  content: counter(items);
}

.item::after {
  /*  hide the number if there's content  */
  position: absolute;
  color: transparent;
}
```

```html hidden
<div class="grid">
  <div></div>
  <div></div>
  <div class="item">
    This text would overflow the parent, but we've set properties to prevent it
    from doing so.
  </div>
  <div></div>
  <div></div>
  <div></div>
  <div class="item">
    <img
      src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
      alt="Pride flag" />
  </div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

Để nội dung của grid item không vượt quá chiều cao ưa thích được đặt bởi `aspect-ratio`, hãy đặt {{cssxref("min-height")}} thành `0` và {{cssxref("overflow")}} thành giá trị khác `visible`. Điều này sẽ hoạt động với nội dung được sizing theo intrinsic. Nếu bạn có nội dung có intrinsically lớn hơn không gian có sẵn, hãy đặt nội dung đó không lớn hơn grid item bằng cách đặt {{cssxref("max-height")}} (hoặc {{cssxref("max-width")}}, tùy thuộc vào nội dung) thành `100%`.

```css
.item {
  min-height: 0;
  overflow: auto;
}

.item > * {
  max-height: 100%;
}
```

{{EmbedLiveSample("making_grid_cells_square", "100", "380")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS box sizing](/en-US/docs/Web/CSS/Guides/Box_sizing)
