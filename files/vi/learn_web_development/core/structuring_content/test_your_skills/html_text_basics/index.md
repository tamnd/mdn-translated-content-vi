---
title: "Kiểm tra kỹ năng: Kiến thức cơ bản về văn bản HTML"
short-title: "Kiểm tra: Kiến thức cơ bản về văn bản HTML"
slug: Learn_web_development/Core/Structuring_content/Test_your_skills/HTML_text_basics
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Lists", "Learn_web_development/Core/Structuring_content/Advanced_text_features", "Learn_web_development/Core/Structuring_content")}}

Mục đích của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn có hiểu cách đánh dấu văn bản trong HTML để cung cấp cấu trúc và ý nghĩa hay không.

> [!NOTE]
> Để được trợ giúp, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels) của chúng tôi.

## Văn bản cơ bản 1

Trong bài tập này, chúng tôi muốn bạn đánh dấu HTML được cung cấp bằng các phần tử tiêu đề và đoạn văn ngữ nghĩa.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('text-basics-1', "100%", 130) }}

Đây là mã nền cho điểm xuất phát này:

```html-nolint live-sample___text-basics-1
Basic HTML Animals

This is the first paragraph in our page. It introduces our animals.

The Llama

Our Llama is a big fan of list items. When she spies a patch of them on a web page, she will eat them like sweets, licking her lips as she goes.

The Anaconda

The crafty anaconda likes to slither around the page, traveling rapidly by way of anchors to sneak up on his prey.
```

<!-- Shared/setup CSS code -->

```css hidden live-sample___text-basics-1 live-sample___text-basics-1-finished live-sample___text-basics-2 live-sample___text-basics-2-finished live-sample___text-basics-3 live-sample___text-basics-3-finished live-sample___text-basics-4 live-sample___text-basics-4-finished
body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  margin: 0;
}

h1 {
  font-size: 2rem;
  margin: 0;
}

h2 {
  font-size: 1.6rem;
  margin: 0;
}

* {
  box-sizing: border-box;
}
```

<!-- Example-specific code -->

```css hidden live-sample___text-basics-1 live-sample___text-basics-1-finished
h1,
h2 {
  color: purple;
}

p {
  color: gray;
  margin: 0.5em 0;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('text-basics-1-finished', "100%", 320) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___text-basics-1-finished
<h1>Basic HTML Animals</h1>

<p>This is the first paragraph in our page. It introduces our animals.</p>

<h2>The Llama</h2>

<p>
  Our Llama is a big fan of list items. When she spies a patch of them on a web
  page, she will eat them like sweets, licking her lips as she goes.
</p>

<h2>The Anaconda</h2>

<p>
  The crafty anaconda likes to slither around the page, traveling rapidly by way
  of anchors to sneak up on his prey.
</p>
```

</details>

## Văn bản cơ bản 2

Trong bài tập này, chúng tôi muốn bạn chuyển danh sách chưa được đánh dấu đầu tiên thành danh sách không có thứ tự, và danh sách thứ hai thành danh sách có thứ tự.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('text-basics-2', "100%", 220) }}

Đây là mã nền cho điểm xuất phát này:

```html-nolint live-sample___text-basics-2
<h1>Looking at lists</h1>

<p>Turn the following list of my favorite vegetables into an unordered list.</p>

Cucumber
Broccoli
Asparagus
Pepper

<p>Turn the following directions into an ordered list.</p>

First knock on the door
When prompted, say the magic word
Wait for at least 5 seconds
Turn the handle and push
```

```css hidden live-sample___text-basics-2 live-sample___text-basics-2-finished
p {
  margin: 0.5em 0;
}

ol {
  border: 2px solid purple;
}

ul {
  border: 2px solid orange;
}

ol,
ul {
  padding: 5px 20px;
  border-radius: 4px;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('text-basics-2-finished', "100%", 400) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___text-basics-2-finished
<h1>Looking at lists</h1>

<p>Turn the following list of my favorite vegetables into an unordered list.</p>

<ul>
  <li>Cucumber</li>
  <li>Broccoli</li>
  <li>Asparagus</li>
  <li>Pepper</li>
</ul>

<p>Turn the following directions into an ordered list.</p>

<ol>
  <li>First knock on the door</li>
  <li>When prompted, say the magic word</li>
  <li>Wait for at least 5 seconds</li>
  <li>Turn the handle and push</li>
</ol>
```

</details>

## Văn bản cơ bản 3

Trong bài tập này, chúng tôi muốn bạn chuyển các động vật và định nghĩa của chúng được cung cấp thành danh sách mô tả.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('text-basics-3', "100%", 160) }}

Đây là mã nền cho điểm xuất phát này:

```html-nolint live-sample___text-basics-3
<h1>Advanced HTML Animals</h1>

Llama
Tall, woolly quadruped, pointy ears. Sometimes rideable, but grumpy and spits a lot. Big fan of list items.
Anaconda
A very large constrictor snake; travels rapidly by way of anchors to sneak up on his prey.
Hippopotamus
His description is bottomless.
```

```css hidden live-sample___text-basics-3 live-sample___text-basics-3-finished
h1 {
  color: purple;
}

dl {
  color: gray;
  margin: 0.5em 0;
}

dt {
  font-weight: bold;
  color: purple;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('text-basics-3-finished', "100%", 260) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___text-basics-3-finished
<h1>Advanced HTML Animals</h1>

<dl>
  <dt>Llama</dt>
  <dd>
    Tall, woolly quadruped, pointy ears. Sometimes rideable, but grumpy and
    spits a lot. Big fan of list items.
  </dd>
  <dt>Anaconda</dt>
  <dd>
    A very large constrictor snake; travels rapidly by way of anchors to sneak
    up on his prey.
  </dd>
  <dt>Hippopotamus</dt>
  <dd>His description is bottomless.</dd>
</dl>
```

</details>

## Văn bản cơ bản 4

Trong bài tập này, bạn được cung cấp một đoạn văn, và mục tiêu của bạn là sử dụng một số phần tử nội tuyến để đánh dấu một vài từ phù hợp với tầm quan trọng mạnh, và một vài từ với sự nhấn mạnh.

Điểm xuất phát của bài tập trông như thế này:

{{ EmbedLiveSample('text-basics-4', "100%", 160) }}

Đây là mã nền cho điểm xuất phát này:

```html live-sample___text-basics-4
<h1>Emphasis and importance</h1>

<p>
  There are two things I care about — music and friends. Someday I might be able
  to get my friends interested in each other, and my music!
</p>
```

```css hidden live-sample___text-basics-4 live-sample___text-basics-4-finished
h1,
strong {
  color: purple;
}

p,
em {
  margin: 0.5em 0;
}

em {
  color: gray;
}
```

Nội dung được cập nhật sẽ trông như thế này:

{{ EmbedLiveSample('text-basics-4-finished', "100%", 140) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

HTML hoàn chỉnh của bạn sẽ trông như thế này:

```html live-sample___text-basics-4-finished
<h1>Emphasis and importance</h1>

<p>
  There are <strong>two</strong> things I care about —
  <strong>music</strong> and <strong>friends</strong>. Someday I
  <em>might</em> be able to get my friends interested in each other,
  <em>and</em> my music!
</p>
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Structuring_content/Lists", "Learn_web_development/Core/Structuring_content/Advanced_text_features", "Learn_web_development/Core/Structuring_content")}}
