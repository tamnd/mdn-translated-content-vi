---
title: What HTML features promote accessibility?
slug: Learn_web_development/Howto/Design_and_accessibility/HTML_features_for_accessibility
page-type: learn-faq
sidebar: learn-how-to
---

Nội dung sau đây mô tả các tính năng cụ thể của HTML nên được sử dụng để làm cho trang web dễ tiếp cận hơn với những người có các khuyết tật khác nhau.

## Văn bản liên kết

Nếu bạn có một liên kết không tự mô tả, hoặc đích đến của liên kết có thể được giải thích chi tiết hơn, bạn có thể thêm thông tin vào liên kết bằng cách sử dụng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

```html
<p>
  I'm really bad at writing link text.
  <a
    href="inept.html"
    aria-label="Why I'm rubbish at writing link text: An explanation and an apology."
    >Click here</a
  >
  to find out more.
</p>
<p>
  I'm really <span id="incompetence">bad at writing link text</span>.
  <a href="inept.html" aria-labelledby="incompetence">Click here</a> to find out
  more.
</p>
```

Lưu ý rằng, hầu hết thời gian, tốt hơn là thay vào đó viết văn bản liên kết có ích:

```html
<p>
  I wrote a
  <a href="capable.html">blog post about how good I am at writing link text</a>.
</p>
```

## Liên kết bỏ qua

Để hỗ trợ tab, bạn có thể cung cấp [liên kết bỏ qua](/en-US/docs/Web/HTML/Reference/Elements/a#skip_links) cho phép người dùng nhảy qua các phần của trang web của bạn. Bạn có thể muốn cho phép ai đó nhảy qua nhiều liên kết điều hướng được tìm thấy trên mỗi trang. Điều này cho phép người dùng bàn phím nhanh chóng tab qua nội dung lặp lại và đi thẳng đến nội dung chính của trang:

```html
<header>
  <h1>The Heading</h1>
  <a href="#content">Skip to content</a>
</header>

<nav>
  <!-- navigation stuff -->
</nav>

<section id="content">
  <!--your content -->
</section>
```

## Thuộc tính Alt cho hình ảnh

Mỗi hình ảnh nên có thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt). Nếu hình ảnh hoàn toàn là trang trí và không bổ sung ý nghĩa vào nội dung hoặc ngữ cảnh của tài liệu, thuộc tính `alt` nên có mặt nhưng rỗng. Bạn cũng có thể thêm tùy chọn [`role="presentation"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role). Tất cả các hình ảnh khác nên bao gồm thuộc tính `alt` cung cấp [văn bản thay thế mô tả hình ảnh](/en-US/docs/Web/HTML/Reference/Elements/img#accessibility) theo cách hữu ích cho người dùng có thể đọc phần còn lại của nội dung nhưng không thể nhìn thấy hình ảnh. Hãy nghĩ về cách bạn sẽ mô tả hình ảnh cho ai đó không thể tải hình ảnh của bạn: đó là thông tin bạn nên bao gồm làm giá trị của thuộc tính `alt`.

```html
<!-- decorative image -->
<img alt="" src="blueswish.png" role="presentation" />
<img
  alt="The Open Web Docs logo: Carle the book worm smiling"
  src="carle.svg"
  role="img" />
```

Thuộc tính `alt` cho cùng nội dung có thể thay đổi tùy thuộc vào ngữ cảnh. Trong ví dụ sau, ảnh gif động được sử dụng thay cho thanh tiến trình để hiển thị tiến độ tải trang cho tài liệu dạy nhà phát triển cách sử dụng phần tử HTML [`<progress>`](/en-US/docs/Web/HTML/Reference/Elements/progress):

```html
<img alt="20% complete" src="load-progress.gif" />
<img
  alt="The progress bar is a thick green square to the left of the thumb and a thin grey line to the right. The thumb is a circle with a diameter the height of the green area."
  src="screenshot-progressbar.png" />
```

## Thuộc tính role của ARIA

Theo mặc định, tất cả các phần tử ngữ nghĩa trong HTML đều có [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles); ví dụ, `<input type="radio">` có role `radio`. Các phần tử không ngữ nghĩa trong HTML không có role. Các role ARIA có thể được sử dụng để mô tả các phần tử không tồn tại tự nhiên trong HTML, như widget [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role). Các role cũng hữu ích cho các phần tử mới hơn tồn tại nhưng chưa có hỗ trợ trình duyệt đầy đủ. Ví dụ, khi sử dụng hình ảnh SVG, hãy thêm `role="img"` vào thẻ mở, vì có [lỗi SVG VoiceOver](https://webkit.org/b/216364) trong đó VoiceOver không thông báo hình ảnh SVG một cách chính xác.

```html
<img src="mdn.svg" alt="MDN logo" role="img" />
```
