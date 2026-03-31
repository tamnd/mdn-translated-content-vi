---
title: Create fancy boxes
slug: Learn_web_development/Howto/Solve_CSS_problems/Create_fancy_boxes
page-type: learn-faq
sidebar: learn-how-to
---

CSS box là các khối xây dựng của bất kỳ trang web nào được định kiểu bằng CSS. Làm cho chúng trông đẹp vừa thú vị vừa đầy thử thách. Thú vị vì đó là việc biến ý tưởng thiết kế thành code hoạt động được; thử thách vì những ràng buộc của CSS. Hãy cùng tạo một số box thú vị.

Trước khi bắt đầu đi vào phần thực hành, hãy đảm bảo bạn quen thuộc với [the CSS box model](/en-US/docs/Learn_web_development/Core/Styling_basics/Box_model). Cũng là ý tưởng hay, nhưng không bắt buộc, khi quen thuộc với một số [CSS layout basics](/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction).

Về mặt kỹ thuật, việc tạo các box ưa thích là tất cả về việc nắm vững các thuộc tính border và background của CSS và cách áp dụng chúng cho một box nhất định. Nhưng ngoài các kỹ thuật, đó còn là về việc giải phóng sự sáng tạo của bạn. Nó sẽ không hoàn thành trong một ngày, và một số nhà phát triển web dành cả cuộc đời vui vẻ với nó.

Chúng ta sắp xem nhiều ví dụ, nhưng chúng ta sẽ luôn làm việc trên đoạn HTML đơn giản nhất có thể, một phần tử đơn giản:

```html
<div class="fancy">Hi! I want to be fancy.</div>
```

Được rồi, đó là một đoạn HTML rất nhỏ, chúng ta có thể tinh chỉnh những gì trên phần tử đó? Tất cả những điều sau đây:

- Các thuộc tính box model: {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("padding")}}, {{cssxref("border")}}, v.v.
- Các thuộc tính background: {{cssxref("background")}}, {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-position")}}, {{cssxref("background-size")}}, v.v.
- Các pseudo-element: {{cssxref("::before")}} và {{cssxref("::after")}}
- và một số thuộc tính bổ sung như: {{cssxref("box-shadow")}}, {{cssxref("rotate")}}, {{cssxref("outline")}}, v.v.

Vậy là chúng ta có một sân chơi rất rộng. Hãy bắt đầu thôi.

## Tinh chỉnh box model

Box model một mình cho phép chúng ta làm một số thứ cơ bản, như thêm border đơn giản, tạo hình vuông, v.v. Nó bắt đầu trở nên thú vị khi bạn đẩy các thuộc tính đến giới hạn bằng cách có `padding` và/hoặc `margin` âm hoặc có `border-radius` lớn hơn kích thước thực tế của box.

### Tạo hình tròn

```html hidden
<div class="fancy">Hi! I want to be fancy.</div>
```

Đây là điều vừa rất đơn giản vừa rất thú vị. Thuộc tính {{cssxref("border-radius")}} được tạo ra để tạo góc bo tròn áp dụng cho các box, nhưng điều gì xảy ra nếu kích thước bán kính bằng hoặc lớn hơn chiều rộng thực tế của box?

```css
.fancy {
  /* Within a circle, centered text looks prettier. */
  text-align: center;

  /* Let's avoid our text touching the border. As
     our text will still flow in a square, it looks
     nicer that way, giving the feeling that it's a "real"
     circle. */
  padding: 1em;

  /* The border will make the circle visible.
     You could also use a background, as
     backgrounds are clipped by border radius */
  border: 0.5em solid black;

  /* Let's make sure we have a square.
     If it's not a square, we'll get an
     ellipsis rather than a circle */
  width: 4em;
  height: 4em;

  /* and let's turn the square into a circle */
  border-radius: 100%;
}
```

Đúng vậy, chúng ta có được hình tròn:

{{ EmbedLiveSample('Making_circles', '100%', '120') }}

## Backgrounds

Khi nói về một box ưa thích, các thuộc tính cốt lõi để xử lý là [background-\* properties](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders). Khi bạn bắt đầu tùy chỉnh backgrounds, CSS box của bạn trở thành một tấm canvas trắng mà bạn sẽ lấp đầy.

Trước khi chúng ta nhảy vào một số ví dụ thực tế, hãy lui một bước vì có hai điều bạn nên biết về backgrounds.

- Có thể đặt [several backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds) trên một box duy nhất. Chúng được xếp chồng lên nhau như các lớp.
- Backgrounds có thể là màu đặc hoặc hình ảnh: màu đặc luôn lấp đầy toàn bộ bề mặt nhưng hình ảnh có thể được thu phóng và định vị.

```html hidden
<div class="fancy">Hi! I want to be fancy.</div>
```

Được rồi, hãy vui với backgrounds:

```css
.fancy {
  padding: 1em;
  width: 100%;
  height: 200px;
  box-sizing: border-box;

  /* At the bottom of our background stack,
     let's have a misty grey solid color */
  background-color: #e4e4d9;

  /* We stack linear gradients on top of each
     other to create our color strip effect.
     As you will notice, color gradients are
     considered to be images and can be
     manipulated as such */
  background-image:
    linear-gradient(175deg, transparent 95%, #8da389 95%),
    linear-gradient(85deg, transparent 95%, #8da389 95%),
    linear-gradient(175deg, transparent 90%, #b4b07f 90%),
    linear-gradient(85deg, transparent 92%, #b4b07f 92%),
    linear-gradient(175deg, transparent 85%, #c5a68e 85%),
    linear-gradient(85deg, transparent 89%, #c5a68e 89%),
    linear-gradient(175deg, transparent 80%, #ba9499 80%),
    linear-gradient(85deg, transparent 86%, #ba9499 86%),
    linear-gradient(175deg, transparent 75%, #9f8fa4 75%),
    linear-gradient(85deg, transparent 83%, #9f8fa4 83%),
    linear-gradient(175deg, transparent 70%, #74a6ae 70%),
    linear-gradient(85deg, transparent 80%, #74a6ae 80%);
}
```

{{ EmbedLiveSample('Backgrounds', '100%', '200') }}

> [!NOTE]
> Gradient có thể được sử dụng theo những cách rất sáng tạo. Nếu bạn muốn xem một số ví dụ sáng tạo, hãy xem [Lea Verou's CSS patterns](https://projects.verou.me/css3patterns/). Nếu bạn muốn tìm hiểu thêm về gradient, hãy đọc [bài viết chuyên dụng của chúng tôi](/en-US/docs/Web/CSS/Guides/Images/Using_gradients).

## Pseudo-elements

Khi định kiểu cho một box duy nhất, bạn có thể thấy mình bị giới hạn và muốn có thêm box để tạo ra các kiểu dáng ấn tượng hơn. Hầu hết thời gian, điều đó dẫn đến việc làm ô nhiễm DOM bằng cách thêm các phần tử HTML bổ sung chỉ phục vụ mục đích tạo kiểu. Ngay cả khi điều đó là cần thiết, nó cũng được coi là thực hành không tốt. Một giải pháp để tránh những bẫy như vậy là sử dụng [CSS pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements).

### Đám mây

```html hidden
<div class="fancy">Hi! I want to be fancy.</div>
```

Hãy có một ví dụ bằng cách biến box của chúng ta thành một đám mây:

```css
.fancy {
  text-align: center;

  /* Same trick as previously used to make circles */
  box-sizing: border-box;
  width: 150px;
  height: 150px;
  padding: 80px 1em 0 1em;

  /* We make room for the "ears" of our cloud */
  margin: 0 100px;

  position: relative;

  background-color: #a4c9cf;

  /* Well, actually we are not making a full circle
     as we want the bottom of our cloud to be flat.
     Feel free to tweak this example to make a cloud
     that isn't flat at the bottom ;) */
  border-radius: 100% 100% 0 0;
}

/* Those are common style that apply to both our ::before
   and ::after pseudo elements. */
.fancy::before,
.fancy::after {
  /* This is required to be allowed to display the
     pseudo-elements, event if the value is an empty
     string */
  content: "";

  /* We position our pseudo-elements on the left and
     right sides of the box, but always at the bottom */
  position: absolute;
  bottom: 0;

  /* This makes sure our pseudo-elements will be below
     the box content whatever happens. */
  z-index: -1;

  background-color: #a4c9cf;
  border-radius: 100%;
}

.fancy::before {
  /* This is the size of the clouds left ear */
  width: 125px;
  height: 125px;

  /* We slightly move it to the left */
  left: -80px;

  /* To make sure that the bottom of the cloud
     remains flat, we must make the bottom right
     corner of the left ear square. */
  border-bottom-right-radius: 0;
}

.fancy::after {
  /* This is the size of the clouds left ear */
  width: 100px;
  height: 100px;

  /* We slightly move it to the right */
  right: -60px;

  /* To make sure that the bottom of the cloud
     remains flat, we must make the bottom left
     corner of the right ear square. */
  border-bottom-left-radius: 0;
}
```

{{ EmbedLiveSample('A_cloud', '100%', '160') }}

### Blockquote

Một ví dụ thực tế hơn về việc sử dụng pseudo-elements là xây dựng định dạng đẹp cho các phần tử HTML {{HTMLElement('blockquote')}}. Vì vậy, hãy xem một ví dụ với một đoạn HTML hơi khác (cung cấp cho chúng ta cơ hội xem cách xử lý thiết kế theo địa phương hóa):

```html
<blockquote>
  People who think they know everything are a great annoyance to those of us who
  do. <i>Isaac Asimov</i>
</blockquote>
<blockquote lang="fr">
  L'intelligence, c'est comme les parachutes, quand on n'en a pas, on s'écrase.
  <i>Pierre Desproges</i>
</blockquote>
```

Và đây là kiểu dáng của chúng ta:

```css
blockquote {
  min-height: 5em;
  padding: 1em 4em;
  font: 1em/150% sans-serif;
  position: relative;
  background-color: lightgoldenrodyellow;
}

blockquote::before,
blockquote::after {
  position: absolute;
  height: 3rem;
  font:
    6rem/100% "Georgia",
    serif;
}

blockquote::before {
  content: "" ";
  top: 0.3rem;
  left: 0.9rem;
}

blockquote::after {
  content: " "";
  bottom: 0.3rem;
  right: 0.8rem;
}

blockquote:lang(fr)::before {
  content: "«";
  top: -1.5rem;
  left: 0.5rem;
}

blockquote:lang(fr)::after {
  content: "»";
  bottom: 2.6rem;
  right: 0.5rem;
}

blockquote i {
  display: block;
  font-size: 0.8em;
  margin-top: 1rem;
  text-align: right;
}
```

{{ EmbedLiveSample('Blockquote', '100%', '300') }}

## Kết hợp tất cả lại

Vì vậy, có thể tạo ra hiệu ứng tuyệt vời khi chúng ta kết hợp tất cả những điều này lại với nhau. Ở một thời điểm nào đó, việc hoàn thiện các box như vậy là vấn đề về sự sáng tạo, cả trong thiết kế lẫn việc sử dụng kỹ thuật các thuộc tính CSS. Bằng cách làm như vậy, có thể tạo ra các ảo ảnh quang học có thể làm cho các box của bạn trở nên sống động như trong ví dụ này:

```html hidden
<div class="fancy">Hi! I want to be fancy.</div>
```

Hãy tạo một số hiệu ứng bóng đổ một phần. Thuộc tính {{cssxref("box-shadow")}} cho phép chúng ta tạo ánh sáng bên trong và hiệu ứng bóng đổ phẳng, nhưng với một chút công việc thêm, có thể tạo ra một hình học tự nhiên hơn bằng cách sử dụng pseudo-element và thuộc tính {{cssxref("rotate")}}, một trong ba thuộc tính {{cssxref("transform")}} riêng lẻ.

```css
.fancy {
  position: relative;
  background-color: #ffffcc;
  padding: 2rem;
  text-align: center;
  max-width: 200px;
}

.fancy::before {
  content: "";

  position: absolute;
  z-index: -1;
  bottom: 15px;
  right: 5px;
  width: 50%;
  top: 80%;
  max-width: 200px;

  box-shadow: 0px 13px 10px black;
  rotate: 4deg;
}
```

{{ EmbedLiveSample('All_together_and_more', '100%', '120') }}
