---
title: Using container scroll-state queries
slug: Web/CSS/Guides/Conditional_rules/Container_scroll-state_queries
page-type: guide
sidebar: cssref
---

**Container scroll-state queries** là một loại [container query](/en-US/docs/Web/CSS/Reference/At-rules/@container). Thay vì áp dụng có chọn lọc các style cho các phần tử descendant dựa trên kích thước của container, scroll-state queries cho phép bạn áp dụng có chọn lọc các style cho các phần tử descendant dựa trên trạng thái cuộn của container. Điều này có thể bao gồm việc container có đang được cuộn một phần, được snap vào ancestor [scroll snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container), hoặc được định vị qua [`position: sticky`](/en-US/docs/Web/CSS/Reference/Properties/position) và đang bám vào ranh giới của ancestor {{glossary("scroll container")}}.

Bài viết này giải thích cách sử dụng container scroll-state queries, đi qua ví dụ của từng loại. Nó giả định rằng bạn biết cơ bản về container queries. Nếu bạn chưa quen với container queries, hãy đọc [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries) trước khi tiếp tục.

## Các loại container scroll-state query

Có ba descriptor `@container` bạn có thể dùng trong truy vấn `scroll-state()`:

- `scrollable`: Truy vấn xem container có thể được cuộn theo hướng đã cho qua cuộn do người dùng khởi tạo (ví dụ bằng cách kéo thanh cuộn hoặc sử dụng cử chỉ trackpad). Nói cách khác, có nội dung tràn theo hướng đã cho có thể được cuộn đến không? Điều này hữu ích để áp dụng style liên quan đến vị trí cuộn của scroll container. Ví dụ, bạn có thể hiển thị gợi ý khuyến khích mọi người cuộn xuống và xem thêm nội dung khi thanh cuộn đang ở trên cùng, và ẩn nó khi người dùng đã thực sự bắt đầu cuộn.
- `scrolled`: Truy vấn xem container được cuộn gần đây nhất theo hướng đã cho. Điều này cho phép bạn áp dụng có chọn lọc các style dựa trên hướng cuộn của người dùng, ví dụ thanh menu trên cùng chỉ hiển thị khi người dùng đang cuộn lên.
- `snapped`: Truy vấn xem container có sắp được snap vào ancestor [scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) container dọc theo trục đã cho không. Điều này hữu ích để áp dụng style khi một phần tử được snap vào scroll snap container. Ví dụ, bạn có thể muốn làm nổi bật một phần tử được snap theo một cách nào đó, hoặc tiết lộ một số nội dung của nó trước đây bị ẩn.
- `stuck`: Truy vấn xem container có giá trị {{cssxref("position")}} là `sticky` có đang bám vào một cạnh của ancestor scroll container không. Điều này hữu ích để tạo style cho các phần tử `position: sticky` khác nhau khi bị bám — ví dụ, bạn có thể đặt cho chúng bảng màu hoặc layout khác.

## Tổng quan cú pháp

Để thiết lập container element như là scroll-state query container, đặt thuộc tính {{cssxref("container-type")}} trên nó với giá trị `scroll-state`. Bạn cũng có thể tùy chọn đặt {{cssxref("container-name")}} cho nó, để bạn có thể nhắm mục tiêu bằng container query cụ thể:

```css
.container {
  container-type: scroll-state;
  container-name: my-container;
}
```

Sau đó bạn có thể tạo block {{cssxref("@container")}} chỉ định truy vấn, các quy tắc được áp dụng cho children của container nếu kiểm tra vượt qua, và tùy chọn, `container-name` của container bạn muốn truy vấn. Nếu bạn không chỉ định `container-name`, container query sẽ được áp dụng cho tất cả scroll-state query containers trên trang.

Ở đây, chúng ta chỉ truy vấn các containers có tên `my-container` để xác định xem container có thể được cuộn về phía cạnh trên cùng của nó không:

```css
@container my-container scroll-state(scrollable: top) {
  /* CSS rules go here */
}
```

> [!NOTE]
> Để tách scroll-state queries khỏi các container queries khác, các scroll-state descriptor và giá trị được đặt trong ngoặc đơn, đứng trước bởi `scroll-state` (`scroll-state( ... )`). Các cấu trúc này trông như hàm, nhưng chúng không phải.

## Sử dụng truy vấn `scrollable`

Truy vấn scroll-state [`scrollable`](/en-US/docs/Web/CSS/Reference/At-rules/@container#scrollable), được viết là `scroll-state(scrollable: <keyword>)`, kiểm tra xem ancestor cuộn của container có thể được cuộn theo hướng đã cho qua cuộn do người dùng khởi tạo không. Nếu không, truy vấn trả về false.

Giá trị keyword cho biết hướng bạn đang kiểm tra khả năng cuộn, ví dụ:

- `top`: Kiểm tra xem container có thể được cuộn về phía cạnh trên cùng của nó không.
- `inline-end`: Kiểm tra xem container có thể được cuộn về phía cạnh inline-end của nó không.
- `y`: Kiểm tra xem container có thể được cuộn theo một hoặc cả hai hướng dọc theo trục y của nó không.

Nếu kiểm tra vượt qua, các quy tắc bên trong block `@container` được áp dụng cho các descendant của scroll container phù hợp.

Hãy xem ví dụ trong đó chúng ta có scroll container đầy nội dung, và một liên kết nhỏ tiện dụng để cuộn trở lại đầu trang nếu muốn. Chúng ta sẽ dùng truy vấn `scrollable` để chỉ hiển thị liên kết khi người dùng đã bắt đầu cuộn xuống nội dung.

### HTML

Trong HTML, chúng ta có phần tử {{htmlelement("article")}} chứa đủ nội dung để tài liệu cuộn, đứng trước bởi [liên kết back-to-top](/en-US/docs/Web/HTML/Reference/Elements/a#result_8):

```html
<a class="back-to-top" href="#" aria-label="Top of page">↑</a>
<article>
  <h1>Reader with container query-controlled "back-to-top" link</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    ...
  </section>

  ...
</article>
```

Chúng ta đã ẩn hầu hết HTML để ngắn gọn.

```html hidden live-sample___scrollable
<a class="back-to-top" href="#" aria-label="Scroll back to top">↑</a>
<article>
  <h1>Reader with container query-controlled "back-to-top" link</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    <p>
      Mauris non malesuada est, sed vestibulum nibh. Duis vestibulum iaculis
      lectus, eu sagittis dolor dignissim iaculis. Nunc et orci sed sapien
      eleifend placerat. Curabitur dapibus risus eget odio sollicitudin, sit
      amet luctus justo pellentesque.
    </p>

    <p>
      <strong>Morbi non pharetra quam.</strong> Fusce vestibulum sem diam, ac
      consequat augue consectetur ut. Donec at augue viverra, tempus urna sit
      amet, porta augue.
      <em>Phasellus fringilla tincidunt sem ullamcorper varius.</em> Aenean
      gravida feugiat sem nec ultricies.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Sed pellentesque placerat mi sed maximus. Sed vitae dui vitae mi pulvinar
      gravida sed et libero.
      <a href="#">Duis nec venenatis dolor, sed tristique felis.</a>
      Integer dapibus facilisis leo elementum vulputate. Curabitur a urna quis
      nulla vulputate tincidunt quis ac enim.
    </p>

    <p>
      Cras non elit vel leo dignissim convallis. Duis eros urna, varius sit amet
      lorem vel, feugiat euismod est.
      <strong>Aliquam ornare eu elit ut iaculis.</strong>
      Suspendisse vulputate tempor leo, non rhoncus risus aliquam vel.
    </p>
  </section>
  <section>
    <header>
      <h2>This one, not so much</h2>

      <p>Suspendisse varius est ac turpis mollis cursus.</p>
    </header>

    <p>
      <strong
        >Curabitur faucibus condimentum eros, ut auctor felis lacinia
        sed.</strong
      >
      Praesent vitae scelerisque eros.
    </p>

    <p>
      <em>Ut vitae suscipit augue.</em> Cras et orci condimentum ante dignissim
      iaculis. Sed consectetur quis est sed dignissim. Nulla egestas orci erat,
      et commodo arcu feugiat ut.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Sed non tempor massa, at accumsan ante. Pellentesque habitant morbi
      <a href="#">tristique senectus</a> et netus et malesuada fames ac turpis
      egestas.
    </p>

    <p>
      Pellentesque placerat luctus tempor. Nunc congue dapibus eros, at
      vulputate nulla. Sed rutrum eleifend magna vel porta. Integer cursus orci
      faucibus turpis scelerisque, nec pharetra arcu molestie.
    </p>
  </section>
  <section>
    <header>
      <h2>Hopefully this section provides some clarity?</h2>

      <p>Curabitur facilisis ornare lorem et eleifend.</p>
    </header>

    <p>
      <strong>Aenean mollis non neque sed finibus.</strong> Lorem ipsum dolor
      sit amet, consectetur adipiscing elit. Suspendisse sagittis viverra urna.
      In hac habitasse platea dictumst. Vestibulum neque orci, mollis sagittis
      augue et, pharetra vehicula diam.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      <a href="#">Pellentesque sollicitudin</a> nunc quis nisl condimentum, ac
      iaculis libero feugiat.
      <strong>Nullam ultrices purus a nulla dignissim hendrerit.</strong> In
      molestie consectetur est quis pulvinar.
    </p>

    <p>
      Vivamus ac erat eu est lobortis commodo. Orci varius natoque penatibus et
      magnis dis parturient montes, nascetur ridiculus mus. In nulla turpis,
      <strong>mollis et est tempor</strong>, dignissim aliquam metus. Proin eu
      arcu quis erat mollis pulvinar. Vivamus at facilisis neque.
    </p>

    <p>
      Integer bibendum laoreet erat, quis vulputate mauris bibendum nec. Class
      aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
      himenaeos. Nam ut est in arcu interdum hendrerit.
    </p>
  </section>
  <section>
    <header>
      <h2>A summary of sorts</h2>

      <p>Nunc facilisis augue quis ex porta aliquam.</p>
    </header>

    <img src="#" alt="Placeholder" />

    <p>
      <strong
        >Fusce nisi enim, venenatis a est vel, varius placerat lacus.</strong
      >
      Nunc tempus rutrum nisl bibendum aliquet. Pellentesque vitae nunc sed nisl
      tincidunt elementum a sit amet nisi. Morbi pretium at dolor in pulvinar.
      Curabitur dapibus eleifend accumsan.
    </p>

    <p>
      Donec rhoncus, leo vitae mollis maximus, tellus lorem interdum arcu, eu
      <em>tempor lectus libero in risus</em>. Ut sit amet magna vitae mauris
      tempor bibendum. <a href="#">Integer id mauris ut ex mattis finibus.</a>
    </p>

    <p>
      Curabitur dui felis, elementum et tellus id, blandit facilisis lorem.
      Aliquam sed posuere ligula, at auctor ipsum. Morbi dignissim accumsan
      tellus pretium iaculis.
    </p>
  </section>
</article>
```

### CSS

Liên kết `.back-to-top` được đặt giá trị {{cssxref("position")}} là `fixed`, đặt ở góc dưới bên phải của viewport, và di chuyển ra ngoài viewport bằng giá trị {{cssxref("translate")}} là `80px 0`. Giá trị {{cssxref("transition")}} sẽ tạo hiệu ứng chuyển động cho `translate` và {{cssxref("background-color")}} khi một trong hai giá trị thay đổi.

```css hidden live-sample___scrollable
/* General styling */

* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
  height: 100%;
}

body {
  height: inherit;
  width: 100%;
  max-width: 540px;
  padding: 20px;
  margin: 0 auto;
}

p {
  line-height: 1.5;
}

img {
  display: block;
  width: 90%;
  margin: 30px auto;
  padding: 20px;
  border: 2px solid gray;
  aspect-ratio: 3/2;
}
```

```css live-sample___scrollable
.back-to-top {
  width: 64px;
  height: 64px;
  color: white;
  text-align: center;
  position: fixed;
  bottom: 10px;
  right: 10px;
  translate: 80px 0;
  transition:
    0.4s translate,
    0.2s background-color;
}
```

```css hidden live-sample___scrollable
.back-to-top {
  text-decoration: none;
  border-radius: 50%;
  border: 1px solid #00000077;
  background-color: #00000077;
  color: white;
  font-size: 3rem;
  text-shadow: 0 0 2px black;
  padding-bottom: 10px;
}

.back-to-top:hover,
.back-to-top:focus {
  background: #00000099;
}
```

{{glossary("scroll container")}} trong ví dụ này là chính phần tử `<html>`, được ký hiệu là scroll-state query container với giá trị {{cssxref("container-type")}} là `scroll-state`. {{cssxref("container-name")}} không thực sự cần thiết nhưng hữu ích trong các trường hợp code được thêm vào codebase với nhiều scroll-state query containers được nhắm mục tiêu bằng các truy vấn khác nhau.

```css live-sample___scrollable
html {
  container-type: scroll-state;
  container-name: scroller;
}
```

Tiếp theo, chúng ta định nghĩa block {{cssxref("@container")}} đặt tên container được nhắm mục tiêu bởi truy vấn này, và bản thân truy vấn — `scrollable: top`. Truy vấn này áp dụng các quy tắc trong block chỉ nếu phần tử `<html>` có thể được cuộn về phía cạnh trên cùng của nó — nói cách khác, nếu container trước đây đã được cuộn xuống. Nếu đó là trường hợp, `translate: 0 0` được áp dụng cho liên kết `.back-to-top`, chuyển đổi nó trở lại màn hình.

```css live-sample___scrollable
@container scroller scroll-state(scrollable: top) {
  .back-to-top {
    translate: 0 0;
  }
}
```

Chúng ta đã ẩn phần còn lại của CSS ví dụ để ngắn gọn.

### Kết quả

{{EmbedLiveSample("scrollable", "100%", "400px")}}

Thử cuộn tài liệu xuống, và chú ý cách liên kết "back-to-top" xuất hiện kết quả, chuyển động mượt mà từ phía bên phải của viewport do `transition`. Nếu bạn cuộn trở lại đầu bằng cách kích hoạt liên kết hoặc cuộn thủ công, liên kết "back-to-top" chuyển đổi ra ngoài màn hình.

## Sử dụng truy vấn `scrolled`

Truy vấn scroll-state [`scrolled`](/en-US/docs/Web/CSS/Reference/At-rules/@container#scrolled), được viết là `scroll-state(scrolled: <keyword>)`, kiểm tra xem ancestor cuộn của container được cuộn gần đây nhất theo hướng đã cho không. Nếu không, truy vấn trả về false.

Giá trị keyword cho biết hướng bạn đang kiểm tra. Ví dụ:

- `block-start`: Kiểm tra xem container được cuộn gần đây nhất về phía cạnh block-start của nó không.
- `right`: Kiểm tra xem container được cuộn gần đây nhất về phía cạnh bên phải của nó không.
- `y`: Kiểm tra xem container được cuộn lên hoặc xuống dọc theo trục y không.
- `none`: Kiểm tra xem container không phải là {{glossary("scroll container")}} hoặc chưa được cuộn theo bất kỳ hướng nào kể từ khi render không.

Nếu kiểm tra trả về true, các quy tắc bên trong block `@container` được áp dụng cho các descendant của scroll container phù hợp.

Hãy xem ví dụ về scroll container với truy vấn `scrolled` hiển thị các "bar" nội dung trên và dưới chỉ khi người dùng đang cuộn lên hoặc xuống tương ứng.

### HTML

Trong HTML, chúng ta có phần tử {{htmlelement("article")}} chứa đủ nội dung để tài liệu cuộn, đứng trước bởi hai phần tử {{htmlelement("div")}} đại diện cho các "bar" trên và dưới:

```html
<div class="bar" id="top-bar">You're currently scrolling towards the top.</div>
<div class="bar" id="bottom-bar">
  You're currently scrolling towards the bottom.
</div>
<article>
  <h1>Document with scrolled container query</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    ...
  </section>

  ...
</article>
```

Chúng ta đã ẩn hầu hết HTML để ngắn gọn.

```html hidden live-sample___scrolled
<div class="bar" id="top-bar">You're currently scrolling towards the top.</div>
<div class="bar" id="bottom-bar">
  You're currently scrolling towards the bottom.
</div>
<article>
  <h1>Document with scrolled container query</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    <p>
      Mauris non malesuada est, sed vestibulum nibh. Duis vestibulum iaculis
      lectus, eu sagittis dolor dignissim iaculis. Nunc et orci sed sapien
      eleifend placerat. Curabitur dapibus risus eget odio sollicitudin, sit
      amet luctus justo pellentesque.
    </p>

    <p>
      <strong>Morbi non pharetra quam.</strong> Fusce vestibulum sem diam, ac
      consequat augue consectetur ut. Donec at augue viverra, tempus urna sit
      amet, porta augue.
      <em>Phasellus fringilla tincidunt sem ullamcorper varius.</em> Aenean
      gravida feugiat sem nec ultricies.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Sed pellentesque placerat mi sed maximus. Sed vitae dui vitae mi pulvinar
      gravida sed et libero.
      <a href="#">Duis nec venenatis dolor, sed tristique felis.</a>
      Integer dapibus facilisis leo elementum vulputate. Curabitur a urna quis
      nulla vulputate tincidunt quis ac enim.
    </p>

    <p>
      Cras non elit vel leo dignissim convallis. Duis eros urna, varius sit amet
      lorem vel, feugiat euismod est.
      <strong>Aliquam ornare eu elit ut iaculis.</strong>
      Suspendisse vulputate tempor leo, non rhoncus risus aliquam vel.
    </p>
  </section>
  <section>
    <header>
      <h2>This one, not so much</h2>

      <p>Suspendisse varius est ac turpis mollis cursus.</p>
    </header>

    <p>
      <strong
        >Curabitur faucibus condimentum eros, ut auctor felis lacinia
        sed.</strong
      >
      Praesent vitae scelerisque eros.
    </p>

    <p>
      <em>Ut vitae suscipit augue.</em> Cras et orci condimentum ante dignissim
      iaculis. Sed consectetur quis est sed dignissim. Nulla egestas orci erat,
      et commodo arcu feugiat ut.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Sed non tempor massa, at accumsan ante. Pellentesque habitant morbi
      <a href="#">tristique senectus</a> et netus et malesuada fames ac turpis
      egestas.
    </p>

    <p>
      Pellentesque placerat luctus tempor. Nunc congue dapibus eros, at
      vulputate nulla. Sed rutrum eleifend magna vel porta. Integer cursus orci
      faucibus turpis scelerisque, nec pharetra arcu molestie.
    </p>
  </section>
  <section>
    <header>
      <h2>Hopefully this section provides some clarity?</h2>

      <p>Curabitur facilisis ornare lorem et eleifend.</p>
    </header>

    <p>
      <strong>Aenean mollis non neque sed finibus.</strong> Lorem ipsum dolor
      sit amet, consectetur adipiscing elit. Suspendisse sagittis viverra urna.
      In hac habitasse platea dictumst. Vestibulum neque orci, mollis sagittis
      augue et, pharetra vehicula diam.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      <a href="#">Pellentesque sollicitudin</a> nunc quis nisl condimentum, ac
      iaculis libero feugiat.
      <strong>Nullam ultrices purus a nulla dignissim hendrerit.</strong> In
      molestie consectetur est quis pulvinar.
    </p>

    <p>
      Vivamus ac erat eu est lobortis commodo. Orci varius natoque penatibus et
      magnis dis parturient montes, nascetur ridiculus mus. In nulla turpis,
      <strong>mollis et est tempor</strong>, dignissim aliquam metus. Proin eu
      arcu quis erat mollis pulvinar. Vivamus at facilisis neque.
    </p>

    <p>
      Integer bibendum laoreet erat, quis vulputate mauris bibendum nec. Class
      aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
      himenaeos. Nam ut est in arcu interdum hendrerit.
    </p>
  </section>
  <section>
    <header>
      <h2>A summary of sorts</h2>

      <p>Nunc facilisis augue quis ex porta aliquam.</p>
    </header>

    <img src="#" alt="Placeholder" />

    <p>
      <strong
        >Fusce nisi enim, venenatis a est vel, varius placerat lacus.</strong
      >
      Nunc tempus rutrum nisl bibendum aliquet. Pellentesque vitae nunc sed nisl
      tincidunt elementum a sit amet nisi. Morbi pretium at dolor in pulvinar.
      Curabitur dapibus eleifend accumsan.
    </p>

    <p>
      Donec rhoncus, leo vitae mollis maximus, tellus lorem interdum arcu, eu
      <em>tempor lectus libero in risus</em>. Ut sit amet magna vitae mauris
      tempor bibendum. <a href="#">Integer id mauris ut ex mattis finibus.</a>
    </p>

    <p>
      Curabitur dui felis, elementum et tellus id, blandit facilisis lorem.
      Aliquam sed posuere ligula, at auctor ipsum. Morbi dignissim accumsan
      tellus pretium iaculis.
    </p>
  </section>
</article>
```

### CSS

Các "bar" được đặt style cơ bản. Quan trọng nhất, chúng được đặt giá trị {{cssxref("position")}} là `fixed`, được offset từ hai phía bằng các giá trị {{cssxref("left")}} và {{cssxref("right")}}.

```css hidden live-sample___scrolled
/* General styling */

* {
  box-sizing: border-box;
}

html {
  font-family: Arial, Helvetica, sans-serif;
  height: 100%;
}

body {
  height: inherit;
  width: 90%;
  margin: 0 auto;
}

p {
  line-height: 1.5;
}

img {
  display: block;
  width: 90%;
  margin: 30px auto;
  padding: 20px;
  border: 2px solid gray;
  aspect-ratio: 3/2;
}
```

```css live-sample___scrolled
.bar {
  border-radius: 10px;
  border: 1px solid #000;
  background-color: #0009;
  padding: 10px;
  color: white;
  text-shadow: 1px 1px 1px black;
  display: flex;
  justify-content: center;
  align-items: center;

  position: fixed;
  left: 5px;
  right: 5px;
}
```

Tiếp theo, chúng ta đặt các giá trị độ dài {{cssxref("top")}} và {{cssxref("bottom")}} âm cho bar trên và dưới để chúng bị ẩn phía trên và phía dưới viewport theo mặc định. Chúng ta thêm {{cssxref("transition")}} để tạo hiệu ứng chuyển động mượt mà cho chúng vào view khi giá trị {{cssxref("translate")}} của chúng thay đổi.

```css live-sample___scrolled
#top-bar {
  top: -50px;
  transition: 0.6s translate;
}

#bottom-bar {
  bottom: -50px;
  transition: 0.6s translate;
}
```

{{glossary("scroll container")}} trong ví dụ này là chính phần tử `<html>`, được ký hiệu là scroll-state query container với giá trị {{cssxref("container-type")}} là `scroll-state`. {{cssxref("container-name")}} không thực sự cần thiết, nhưng hữu ích khi codebase có nhiều scroll-state query containers được nhắm mục tiêu bằng các truy vấn khác nhau.

```css live-sample___scrolled
html {
  container-type: scroll-state;
  container-name: scroller;
}
```

Tiếp theo, chúng ta định nghĩa hai block {{cssxref("@container")}}, cả hai đều nhắm mục tiêu tên container `scroller`. Block đầu tiên định nghĩa truy vấn `scrolled: block-end` và block thứ hai định nghĩa truy vấn `scrolled: block-start`. Lần lượt, các truy vấn này áp dụng các quy tắc trong block của chúng chỉ nếu phần tử `<html>` được cuộn gần đây nhất về phía cạnh block-end hoặc block-start của nó. Nói cách khác, khi container được cuộn xuống hoặc lên. Khi một trong hai điều kiện trở thành true, bar được tham chiếu bên trong block có giá trị `translate` được đặt để khiến nó chuyển đổi vào màn hình. Bar được tham chiếu trong `@condition` không còn đúng nữa chuyển đổi ra ngoài màn hình.

```css live-sample___scrolled
@container scroller scroll-state(scrolled: block-start) {
  #top-bar {
    translate: 0 55px;
  }
}

@container scroller scroll-state(scrolled: block-end) {
  #bottom-bar {
    translate: 0 -55px;
  }
}
```

Chúng ta đã ẩn phần còn lại của CSS ví dụ để ngắn gọn.

### Kết quả

{{EmbedLiveSample("scrolled", "100%", "400px")}}

Thử cuộn tài liệu lên và xuống, và chú ý cách các bar khác nhau xuất hiện kết quả, chuyển động mượt mà vào và ra khỏi màn hình.

## Sử dụng truy vấn `snapped`

Chỉ liên quan khi [scroll snapping](/en-US/docs/Web/CSS/Guides/Scroll_snap) được triển khai, truy vấn scroll-state [`snapped`](/en-US/docs/Web/CSS/Reference/At-rules/@container#snapped), được viết là `scroll-state(snapped: <keyword>)`, kiểm tra xem container có sắp được snap vào ancestor [scroll snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container) dọc theo trục đã cho không. Nếu không, truy vấn trả về false.

Giá trị keyword trong trường hợp này cho biết hướng bạn đang kiểm tra khả năng snap của phần tử, ví dụ:

- `x`: Kiểm tra xem container có snap theo chiều ngang vào ancestor scroll-snap container của nó không.
- `inline`: Kiểm tra xem container có snap vào ancestor scroll-snap container của nó theo hướng inline không.
- `y`: Kiểm tra xem container có snap vào ancestor scroll-snap container của nó theo cả hai hướng không.

Để đánh giá container với truy vấn `snapped` scroll-state không phải `none`, nó phải là container có ancestor scroll-snap container, tức là ancestor có giá trị {{cssxref("scroll-snap-type")}} khác `none`. Container query `scroll-state(snapped: none)` khớp các scroll-state containers không có ancestor scroll container.

Việc đánh giá sẽ xảy ra khi sự kiện [`scrollsnapchanging`](/en-US/docs/Web/API/Element/scrollsnapchanging_event) kích hoạt trên scroll snap container.

Nếu kiểm tra vượt qua, các quy tắc bên trong block `@container` được áp dụng cho các descendant của scroll snap target container phù hợp.

Trong ví dụ này, chúng ta sẽ xem xét scroll snap container với các children snap vào nó theo chiều dọc và dùng truy vấn `snapped` để tạo style cho các children chỉ khi chúng được snap hoặc sắp được snap.

### HTML

HTML bao gồm phần tử {{htmlelement("main")}} sẽ là scroll snap container. Bên trong là nhiều phần tử {{htmlelement("section")}} sẽ là snap targets. Mỗi `<section>` chứa wrapper {{htmlelement("div")}} và `<h2>` [heading](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements). Các wrapper được bao gồm để tạo style target vì container queries cho phép tạo style cho các descendant của container, không phải bản thân container.

```html
<main>
  <section>
    <div class="wrapper">
      <h2>Section 1</h2>
    </div>
  </section>

  ...
</main>
```

Chúng ta đã ẩn hầu hết HTML để ngắn gọn.

```html hidden live-sample___snapped
<main>
  <section>
    <div class="wrapper">
      <h2>Section 1</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 2</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 3</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 4</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 5</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 6</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 7</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 8</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 9</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 10</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 11</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 12</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 13</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 14</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 15</h2>
    </div>
  </section>
  <section>
    <div class="wrapper">
      <h2>Section 16</h2>
    </div>
  </section>
</main>
```

### CSS

```css hidden live-sample___snapped
* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

/* body and main sizing */

body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: inherit;
}

main {
  gap: 50px;
}
```

Chúng ta đặt giá trị {{cssxref("overflow")}} là `scroll` và {{cssxref("height")}} cố định trên phần tử `<main>` để biến nó thành scroll container dọc. Chúng ta cũng đặt giá trị {{cssxref("scroll-snap-type")}} là `y mandatory` để biến `<main>` thành scroll snap container mà snap targets sẽ snap vào dọc theo trục y; `mandatory` có nghĩa là snap target _luôn_ được snap vào.

```css live-sample___snapped
main {
  overflow: scroll;
  scroll-snap-type: y mandatory;
  height: 450px;
  width: 250px;
  border: 3px solid black;
}
```

Các phần tử `<section>` được chỉ định là snap targets bằng cách đặt giá trị {{cssxref("scroll-snap-align")}} không phải `none`. Giá trị `center` có nghĩa là chúng sẽ snap vào container tại điểm trung tâm của chúng.

```css live-sample___snapped
section {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 150px;
  height: 150px;
  margin: 50px auto;

  scroll-snap-align: center;
}
```

```css hidden live-sample___snapped
.wrapper {
  width: 100%;
  height: 100%;
  border-radius: 5px;
  background: #eeeeee;
  box-shadow:
    inset 1px 1px 4px rgb(255 255 255 / 0.5),
    inset -1px -1px 4px rgb(0 0 0 / 0.5);

  display: flex;
  align-items: center;
  justify-content: center;

  transition:
    0.6s background,
    0.6s color;
}

h2 {
  font-size: 1rem;
  letter-spacing: 1px;
}
```

Chúng ta muốn cho phép các phần tử `<section>` được truy vấn. Cụ thể, chúng ta muốn kiểm tra xem các phần tử `<section>` có đang trong quá trình snap vào container của chúng không, vì vậy chúng ta ký hiệu chúng là scroll-state query containers bằng cách đặt giá trị {{cssxref("container-type")}} là `scroll-state` trên chúng. Chúng ta cũng đặt cho chúng {{cssxref("container-name")}}, không thực sự cần thiết, nhưng sẽ hữu ích nếu code của chúng ta trở nên phức tạp hơn sau này và chúng ta có nhiều scroll-state query containers mà chúng ta muốn nhắm mục tiêu bằng các truy vấn khác nhau.

```css live-sample___snapped
section {
  container-type: scroll-state;
  container-name: snap-container;
}
```

Tiếp theo, chúng ta định nghĩa block {{cssxref("@container")}} đặt tên container chúng ta đang nhắm mục tiêu với truy vấn này, và bản thân truy vấn — `snapped: y`. Truy vấn này áp dụng các quy tắc trong block chỉ nếu phần tử `<section>` đang được snap theo chiều dọc vào container của nó. Nếu đó là trường hợp, chúng ta áp dụng {{cssxref("background")}} và {{cssxref("color")}} mới cho `<div>` `.wrapper` child của phần tử `<section>` để làm nổi bật nó.

```css live-sample___snapped
@container snap-container scroll-state(snapped: y) {
  .wrapper {
    background: purple;
    color: white;
  }
}
```

### Kết quả

Kết quả được render dưới đây. Thử cuộn container lên và xuống, và chú ý cách style `<section>` thay đổi khi nó được snap vào container.

{{EmbedLiveSample("snapped", "100%", "500px")}}

## Sử dụng truy vấn `stuck`

Truy vấn scroll-state [`stuck`](/en-US/docs/Web/CSS/Reference/At-rules/@container#scrollable), được viết là `scroll-state(stuck: <keyword>)`, kiểm tra xem container có giá trị {{cssxref("position")}} là `sticky` có đang bám vào một cạnh của ancestor scroll container không. Nếu không, truy vấn trả về false.

Giá trị keyword trong trường hợp này cho biết cạnh scroll container bạn đang kiểm tra, ví dụ:

- `top`: Kiểm tra xem container có đang bám vào cạnh trên của ancestor scroll container của nó không.
- `block-end`: Kiểm tra xem container có đang bám vào cạnh block-end của ancestor scroll container của nó không.
- `none`: Kiểm tra xem container có không bám vào bất kỳ cạnh nào của ancestor scroll container của nó không. Lưu ý rằng truy vấn `none` sẽ khớp ngay cả khi container không có `position: sticky` được đặt trên nó.

Nếu truy vấn trả về true, các quy tắc bên trong block `@container` được áp dụng cho các descendant của container `position: sticky` phù hợp.

Hãy xem ví dụ trong đó chúng ta có scroll container với nội dung tràn, trong đó các tiêu đề được đặt thành `position: sticky` và bám vào cạnh trên của container khi chúng cuộn đến vị trí đó. Chúng ta sẽ dùng truy vấn scroll-state `stuck` để tạo style khác nhau cho các tiêu đề khi chúng bám vào cạnh trên.

### HTML

Trong HTML, chúng ta có phần tử {{htmlelement("article")}} chứa đủ nội dung để tài liệu cuộn. Nó được cấu trúc bằng nhiều phần tử {{htmlelement("section")}}, mỗi phần tử chứa {{htmlelement("header")}} với nội dung lồng nhau:

```html
<article>
  <h1>Sticky reader with scroll-state container query</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    ...
  </section>

  <section>
    <header>
      <h2>This one, not so much</h2>

      <p>Confecta res esset.</p>
    </header>

    ...
  </section>

  ...
</article>
```

Chúng ta đã ẩn hầu hết HTML để ngắn gọn.

```html hidden live-sample___stuck
<article>
  <h1>Sticky reader with scroll-state container query</h1>
  <section>
    <header>
      <h2>This first section is interesting</h2>

      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
    </header>

    <p>
      Id deserunt exercitation in incididunt in dolor ipsum enim occaecat quis
      officia et. In dolore Lorem anim enim. Dolor nulla deserunt laboris irure
      incididunt labore tempor amet consectetur. Commodo eu tempor qui laboris
      duis ipsum adipisicing sunt. Do anim laboris commodo aliquip consequat ut
      eiusmod mollit sint nostrud sunt exercitation do.
    </p>

    <p>
      <strong>Est proident voluptate dolore.</strong> Aute irure ea culpa mollit
      <em>anim aute proident consectetur.</em> Duis deserunt consequat elit non.
      Cupidatat et amet anim labore est. Incididunt aute incididunt ex amet
      sint.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Ullamco duis qui amet sunt eu nulla deserunt dolore officia irure nulla.
      <a href="#">Qui enim dolore est virtus;</a>
      Erat enim consectetur.
    </p>

    <p>
      Dolor aliquip officia id esse Lorem ullamco ea veniam.
      <strong>Voluptate cillum commodo anim veniam;</strong>
      Ad nulla amet anim eu incididunt reprehenderit proident in aliqua sit
      commodo magna.
    </p>
  </section>
  <section>
    <header>
      <h2>This one, not so much</h2>

      <p>Confecta res esset.</p>
    </header>

    <p>
      <strong>Nam quid possums facere delius?</strong> Tu quidem reddes; Omnis
      peccant para dicts.
    </p>

    <p>
      <em>Pariatur ex cupidatat exercitation</em> reprehenderit quis culpa est
      proident pariatur ut.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      Non nulla pariatur cillum pariatur.
      <a href="#">Ipsum magna proident fugiat qui duis et.</a>
      Reprehenderit sit ipsum ut adipisicing aliqua eiusmod nulla consectetur
      deserunt dolor dolor.
    </p>

    <p>
      Cupidatat deserunt adipisicing adipisicing occaecat voluptate duis laboris
      excepteur labore et in aliquip aute. Quis aliquip reprehenderit dolor
      nostrud cupidatat nostrud nisi occaecat elit. Magna dolor ullamco eiusmod
      deserunt elit cillum qui amet. Dolor ad consequat anim commodo eu sunt do
      tempor eu velit est.
    </p>
  </section>
  <section>
    <header>
      <h2>Hopefully this section provides some clarity?</h2>

      <p>Dolor consectetur esse aute eiusmod ex reprehenderit cupidatat.</p>
    </header>

    <p>
      <strong>Ipsum quis sint incididunt aliquip</strong>. Duis tempor sunt enim
      Lorem ut officia cillum magna.
    </p>

    <img src="#" alt="Placeholder" />

    <p>
      <a href="#">Sint modo partes vitae beatae.</a>
      Ipsum esse nostrud incididunt ipsum ipsum esse aliquip Lorem enim.
      <strong>Sed hoc sane concedays.</strong> Voluptate qui consequat dolor
      dolor dolore ex. Enim dolor enim sit proident. Ad laborum incididunt
      dolore aliquip exercitation exercitation. Sunt cupidatat esse enim duis
      proident.
    </p>

    <p>
      Labore dolor cupidatat ut velit in minim cupidatat enim nisi proident
      eiusmod.
      <strong
        >Non nostrud consectetur est occaecat ut esse esse tempor eiusmod
        non.</strong
      >
      Cupidatat aliqua dolore est sit ad exercitation nostrud nostrud eu. Qui
      consequat et aliquip ea labore.
    </p>

    <p>
      Pariatur quis quis nostrud exercitation pariatur magna veniam Lorem
      commodo cupidatat irure reprehenderit. Nostrud pariatur est pariatur elit
      sit ea voluptate minim mollit. Aliqua pariatur cupidatat et cillum. Velit
      exercitation adipisicing laboris ullamco. Incididunt id eiusmod id cillum
      qui anim. Aliquip minim nostrud excepteur dolore deserunt pariatur eu
      eiusmod reprehenderit ullamco magna.
    </p>
  </section>
  <section>
    <header>
      <h2>A summary of sorts</h2>

      <p>Irure adipisicing occaecat dolore in ex voluptate.</p>
    </header>

    <img src="#" alt="Placeholder" />

    <p>
      <strong>An quidem modi?</strong>
      <strong
        >Excepteur non Lorem ex aliqua est reprehenderit incididunt sunt in
        ullamco in et;</strong
      >
      Aliqua veniam nulla magna anim labore amet proident nisi mollit non.
      Consequat incididunt exercitation nisi consequat culpa officia aliqua
      veniam. Anim aliqua consectetur pariatur mollit proident incididunt id.
    </p>

    <p>
      Non labore, inquit, de nomin. <em>Fall igniter possimus.</em>
      <a href="#">Preterits, inquit, gaud.</a>
      Est commodo adipisicing qui duis excepteur sit ea irure amet voluptate
      deserunt anim deserunt.
    </p>

    <p>
      Ad mollit laboris reprehenderit magna tempor. Consequat pariatur esse
      ipsum duis laboris.
    </p>
  </section>
</article>
```

### CSS

Mỗi `<header>` có giá trị {{cssxref("position")}} là `sticky` và giá trị {{cssxref("top")}} là `0`, bám chúng vào cạnh trên của scroll container. Để kiểm tra xem các phần tử `<header>` có đang bám vào cạnh trên container không, chúng được ký hiệu là scroll-state query containers với giá trị {{cssxref("container-type")}} là `scroll-state`. {{cssxref("container-name")}} không thực sự cần thiết nhưng sẽ hữu ích nếu code này được thêm vào codebase với nhiều scroll-state query containers được nhắm mục tiêu bằng các truy vấn khác nhau.

```css hidden live-sample___stuck
/* General styling */

* {
  box-sizing: border-box;
}

html {
  font-family: "Helvetica", "Arial", sans-serif;
  height: 100%;
}

body {
  height: inherit;
  width: 100%;
  max-width: 540px;
  padding: 20px;
  margin: 0 auto;
}

p {
  line-height: 1.5;
}

img {
  display: block;
  width: 90%;
  margin: 30px auto;
  padding: 20px;
  border: 2px solid gray;
  aspect-ratio: 3/2;
}
```

```css live-sample___stuck
header {
  background: white;
  position: sticky;
  top: 0;
  container-type: scroll-state;
  container-name: sticky-heading;
}
```

Chúng ta cũng đặt style cơ bản cho các phần tử `<h2>` và `<p>` bên trong các phần tử `<header>`, và giá trị {{cssxref("transition")}} để chúng sẽ chuyển động mượt mà khi giá trị {{cssxref("background")}} của chúng thay đổi.

```css live-sample___stuck
h2,
header p {
  margin: 0;
  transition: 0.4s background;
}

h2 {
  padding: 20px 5px;
  margin-bottom: 10px;
}

header p {
  font-style: italic;
  padding: 10px 5px;
}
```

Tiếp theo, chúng ta định nghĩa block {{cssxref("@container")}} đặt tên container chúng ta đang nhắm mục tiêu với truy vấn này, và bản thân truy vấn — `stuck: top`. Truy vấn này áp dụng các quy tắc trong block chỉ nếu phần tử `<header>` đang bám vào đầu scroll container của nó. Khi đó là trường hợp, `background` khác và {{cssxref("box-shadow")}} được áp dụng cho `<h2>` và `<p>` bên trong.

```css live-sample___stuck
@container sticky-heading scroll-state(stuck: top) {
  h2,
  p {
    background: #cccccc;
    box-shadow: 0 5px 2px #00000077;
  }
}
```

```css hidden live-sample___scrollable live-sample___scrolled live-sample___snapped live-sample___stuck
@supports not (container-type: scroll-state) {
  body::before {
    content: "Your browser does not support `scroll-state` container queries.";
    color: black;
    background-color: wheat;
    position: fixed;
    left: 0;
    right: 0;
    top: 40%;
    text-align: center;
    padding: 1rem 0;
    z-index: 1;
  }
}
```

Chúng ta đã ẩn phần còn lại của CSS để ngắn gọn.

### Kết quả

Thử cuộn tài liệu xuống và lên, và chú ý cách các phần tử `<h2>` và `<p>` chuyển đổi sang bảng màu mới khi chúng bám vào cạnh trên của container.

{{EmbedLiveSample("stuck", "100%", "400px")}}

## Xem thêm

- {{Cssxref("container-name")}}
- {{Cssxref("container-type")}}
- {{Cssxref("position")}}
- {{Cssxref("@container")}}
- [CSS container queries](/en-US/docs/Web/CSS/Guides/Containment/Container_queries)
- [Using container size and style queries](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries)
- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
- Module [CSS positioning](/en-US/docs/Web/CSS/Guides/Positioned_layout)
