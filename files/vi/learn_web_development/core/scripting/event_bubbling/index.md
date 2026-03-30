---
title: Sự kiện nổi bong bóng
slug: Learn_web_development/Core/Scripting/Event_bubbling
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Events","Learn_web_development/Core/Scripting/Test_your_skills/Events", "Learn_web_development/Core/Scripting")}}

Chúng ta đã thấy rằng một trang web được tạo thành từ các _phần tử_ — tiêu đề, đoạn văn bản, hình ảnh, nút, v.v. — và bạn có thể lắng nghe các sự kiện xảy ra với các phần tử này. Ví dụ, bạn có thể thêm trình nghe vào nút và nó sẽ chạy khi người dùng nhấp vào nút.

Chúng ta cũng đã thấy rằng các phần tử này có thể được _lồng_ vào nhau: ví dụ, một {{htmlelement("button")}} có thể được đặt bên trong phần tử {{htmlelement("div")}}. Trong trường hợp này chúng ta gọi phần tử `<div>` là phần tử _cha_, và `<button>` là phần tử _con_.

Trong chương này chúng ta sẽ xem xét **sự kiện nổi bong bóng** — đây là những gì xảy ra khi bạn thêm trình nghe sự kiện vào phần tử cha, và người dùng nhấp vào phần tử con.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">nền tảng CSS</a>, quen thuộc với các kiến thức cơ bản về JavaScript như đã học trong các bài trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Ủy quyền sự kiện, đạt được thông qua sự kiện nổi bong bóng hoặc bắt sự kiện.</li>
          <li>Dừng ủy quyền sự kiện với <code>stopPropagation()</code>.</li>
          <li>Truy cập mục tiêu sự kiện từ đối tượng sự kiện.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Giới thiệu sự kiện nổi bong bóng

Hãy giới thiệu và định nghĩa sự kiện nổi bong bóng thông qua một ví dụ.

### Đặt trình nghe trên phần tử cha

Xem xét một trang web như thế này:

```html
<div id="container">
  <button>Click me!</button>
</div>
<pre id="output"></pre>
```

Ở đây nút nằm bên trong một phần tử khác, phần tử {{HTMLElement("div")}}. Chúng ta nói rằng phần tử `<div>` ở đây là **cha** của phần tử nó chứa. Điều gì xảy ra nếu chúng ta thêm trình xử lý sự kiện nhấp vào cha, rồi nhấp vào nút?

```js
const output = document.querySelector("#output");
function handleClick(e) {
  output.textContent += `You clicked on a ${e.currentTarget.tagName} element\n`;
}

const container = document.querySelector("#container");
container.addEventListener("click", handleClick);
```

{{ EmbedLiveSample('Setting a listener on a parent element', '100%', 200, "", "") }}

Bạn sẽ thấy rằng cha kích hoạt sự kiện nhấp khi người dùng nhấp vào nút:

```plain
You clicked on a DIV element
```

Điều này có ý nghĩa: nút nằm bên trong `<div>`, vì vậy khi bạn nhấp vào nút, bạn cũng đang nhấp ngầm vào phần tử nó nằm trong.

### Ví dụ nổi bong bóng

Điều gì xảy ra nếu chúng ta thêm trình nghe sự kiện vào cả nút _và_ phần tử cha?

```html
<body>
  <div id="container">
    <button>Click me!</button>
  </div>
  <pre id="output"></pre>
</body>
```

Hãy thử thêm các trình xử lý sự kiện nhấp vào nút, phần tử cha của nó (`<div>`), và phần tử {{HTMLElement("body")}} chứa cả hai:

```js
const output = document.querySelector("#output");
function handleClick(e) {
  output.textContent += `You clicked on a ${e.currentTarget.tagName} element\n`;
}

const container = document.querySelector("#container");
const button = document.querySelector("button");

document.body.addEventListener("click", handleClick);
container.addEventListener("click", handleClick);
button.addEventListener("click", handleClick);
```

{{ EmbedLiveSample('Bubbling example', '100%', 200, "", "") }}

Bạn sẽ thấy rằng cả ba phần tử đều kích hoạt sự kiện nhấp khi người dùng nhấp vào nút:

```plain
You clicked on a BUTTON element
You clicked on a DIV element
You clicked on a BODY element
```

Trong trường hợp này:

- lần nhấp trên nút kích hoạt trước.
- theo sau là lần nhấp trên phần tử cha của nó (phần tử `<div>`).
- theo sau là lần nhấp trên phần tử cha của phần tử `<div>` (phần tử `<body>`).

Chúng ta mô tả điều này bằng cách nói rằng sự kiện **nổi lên** từ phần tử trong cùng đã được nhấp.

Hành vi này có thể hữu ích và cũng có thể gây ra các vấn đề không mong đợi. Trong các phần tiếp theo, chúng ta sẽ thấy một vấn đề nó gây ra và tìm giải pháp.

### Ví dụ trình phát video

Trong ví dụ này trang của chúng ta chứa một video, ban đầu bị ẩn, và một nút có nhãn "Display video". Chúng ta muốn tương tác sau:

- Khi người dùng nhấp vào nút "Display video", hiển thị hộp chứa video, nhưng chưa bắt đầu phát video.
- Khi người dùng nhấp vào video, bắt đầu phát video.
- Khi người dùng nhấp vào bất kỳ đâu trong hộp bên ngoài video, ẩn hộp.

HTML trông như thế này:

```html
<button>Display video</button>

<div class="hidden">
  <video>
    <source src="/shared-assets/videos/flower.webm" type="video/webm" />
    <p>
      Your browser doesn't support HTML video. Here is a
      <a href="rabbit320.mp4">link to the video</a> instead.
    </p>
  </video>
</div>
```

Nó bao gồm:

- một phần tử `<button>`.
- một phần tử `<div>` ban đầu có thuộc tính `class="hidden"`.
- một phần tử `<video>` được lồng bên trong phần tử `<div>`.

Chúng ta đang sử dụng CSS để ẩn các phần tử với lớp `"hidden"` được đặt.

```css hidden
div {
  width: 100%;
  height: 100%;
  background-color: #eeeeee;
}

.hidden {
  display: none;
}

div video {
  padding: 40px;
  display: block;
  width: 400px;
  margin: 40px auto;
}
```

JavaScript trông như thế này:

```js
const btn = document.querySelector("button");
const box = document.querySelector("div");
const video = document.querySelector("video");

btn.addEventListener("click", () => box.classList.remove("hidden"));
video.addEventListener("click", () => video.play());
box.addEventListener("click", () => box.classList.add("hidden"));
```

Điều này thêm ba trình nghe sự kiện `'click'`:

- một trên `<button>`, hiển thị `<div>` chứa `<video>`.
- một trên `<video>`, bắt đầu phát video.
- một trên `<div>`, ẩn video.

Hãy xem cách này hoạt động:

{{ EmbedLiveSample('Video_player_example', '100%', 500) }}

Bạn sẽ thấy rằng khi bạn nhấp vào nút, hộp và video nó chứa được hiển thị. Nhưng sau đó khi bạn nhấp vào video, video bắt đầu phát, nhưng hộp bị ẩn lại!

Video nằm bên trong `<div>` — nó là một phần của nó — vì vậy nhấp vào video chạy _cả hai_ trình xử lý sự kiện, gây ra hành vi này.

### Sửa vấn đề với `stopPropagation()`

Như chúng ta đã thấy trong phần cuối, sự kiện nổi bong bóng đôi khi có thể tạo ra vấn đề, nhưng có cách để ngăn chặn nó.
Đối tượng [`Event`](/en-US/docs/Web/API/Event) có sẵn một hàm gọi là [`stopPropagation()`](/en-US/docs/Web/API/Event/stopPropagation) mà khi được gọi bên trong trình xử lý sự kiện, ngăn sự kiện nổi lên bất kỳ phần tử nào khác.

Chúng ta có thể sửa vấn đề hiện tại bằng cách thay đổi JavaScript thành:

```js
const btn = document.querySelector("button");
const box = document.querySelector("div");
const video = document.querySelector("video");

btn.addEventListener("click", () => box.classList.remove("hidden"));

video.addEventListener("click", (event) => {
  event.stopPropagation();
  video.play();
});

box.addEventListener("click", () => box.classList.add("hidden"));
```

Tất cả những gì chúng ta đang làm ở đây là gọi `stopPropagation()` trên đối tượng sự kiện trong trình xử lý cho sự kiện `'click'` của phần tử `<video>`. Điều này sẽ ngăn sự kiện đó nổi lên hộp. Bây giờ hãy thử nhấp vào nút và sau đó video:

{{EmbedLiveSample("Fixing the problem with stopPropagation()", '100%', 500)}}

```html hidden
<button>Display video</button>

<div class="hidden">
  <video>
    <source src="/shared-assets/videos/flower.webm" type="video/webm" />
    <p>
      Your browser doesn't support HTML video. Here is a
      <a href="rabbit320.mp4">link to the video</a> instead.
    </p>
  </video>
</div>
```

```css hidden
div {
  width: 100%;
  height: 100%;
  background-color: #eeeeee;
}

.hidden {
  display: none;
}

div video {
  padding: 40px;
  display: block;
  width: 400px;
  margin: 40px auto;
}
```

## Bắt sự kiện

Một hình thức thay thế của lan truyền sự kiện là _bắt sự kiện_. Điều này giống như sự kiện nổi bong bóng nhưng thứ tự bị đảo ngược: thay vì sự kiện kích hoạt trước tiên trên phần tử trong cùng được nhắm mục tiêu, và sau đó trên các phần tử lồng nhau ít hơn liên tiếp, sự kiện kích hoạt trước tiên trên phần tử _ít lồng nhau nhất_, và sau đó trên các phần tử lồng nhau nhiều hơn liên tiếp, cho đến khi đạt đến mục tiêu.

Bắt sự kiện bị vô hiệu hóa theo mặc định. Để kích hoạt nó, bạn phải truyền tùy chọn `capture` trong `addEventListener()`.

Ví dụ này giống như [ví dụ nổi bong bóng](#bubbling_example) chúng ta đã thấy trước đó, ngoại trừ chúng ta đã sử dụng tùy chọn `capture`:

```html
<body>
  <div id="container">
    <button>Click me!</button>
  </div>
  <pre id="output"></pre>
</body>
```

```js
const output = document.querySelector("#output");
function handleClick(e) {
  output.textContent += `You clicked on a ${e.currentTarget.tagName} element\n`;
}

const container = document.querySelector("#container");
const button = document.querySelector("button");

document.body.addEventListener("click", handleClick, { capture: true });
container.addEventListener("click", handleClick, { capture: true });
button.addEventListener("click", handleClick);
```

{{ EmbedLiveSample('Event capture', '100%', 200, "", "") }}

Trong trường hợp này, thứ tự thông báo bị đảo ngược: trình xử lý sự kiện `<body>` kích hoạt trước, theo sau là trình xử lý sự kiện `<div>`, theo sau là trình xử lý sự kiện `<button>`:

```plain
You clicked on a BODY element
You clicked on a DIV element
You clicked on a BUTTON element
```

Tại sao lại phải lo lắng với cả bắt và nổi bong bóng? Trong những ngày xấu xa ngày xưa, khi các trình duyệt kém tương thích chéo hơn bây giờ, Netscape chỉ sử dụng bắt sự kiện, và Internet Explorer chỉ sử dụng nổi bong bóng sự kiện. Khi W3C quyết định cố gắng chuẩn hóa hành vi và đạt được sự đồng thuận, họ kết thúc với hệ thống bao gồm cả hai, là những gì các trình duyệt hiện đại triển khai.

Theo mặc định hầu hết tất cả trình xử lý sự kiện được đăng ký trong giai đoạn nổi bong bóng, và điều này có ý nghĩa hơn hầu hết thời gian.

## Ủy quyền sự kiện

Trong phần cuối, chúng ta đã xem xét một vấn đề do nổi bong bóng sự kiện gây ra và cách sửa nó. Nổi bong bóng sự kiện không chỉ gây phiền, mà còn rất hữu ích. Đặc biệt, nó cho phép **ủy quyền sự kiện**. Trong thực hành này, khi chúng ta muốn một số mã chạy khi người dùng tương tác với bất kỳ phần tử con nào trong số nhiều phần tử con, chúng ta đặt trình nghe sự kiện trên phần tử cha và để các sự kiện xảy ra trên chúng nổi lên cha thay vì phải đặt trình nghe sự kiện trên mỗi phần tử con riêng lẻ.

Hãy quay lại [ví dụ đầu tiên](/en-US/docs/Learn_web_development/Core/Scripting/Events#an_example_handling_a_click_event) của chúng ta,
nơi chúng ta đặt màu nền của toàn bộ trang khi người dùng nhấp vào nút. Giả sử thay vào đó, trang được chia thành 16 ô và chúng ta muốn đặt mỗi ô thành màu ngẫu nhiên khi người dùng nhấp vào ô đó.

Đây là HTML:

```html
<div id="container">
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
  <div class="tile"></div>
</div>
```

Chúng ta có một chút CSS để đặt kích thước và vị trí của các ô:

```css
#container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 100px;
}
```

Bây giờ trong JavaScript, chúng ta có thể thêm trình xử lý sự kiện nhấp cho mỗi ô. Nhưng một tùy chọn đơn giản hơn và hiệu quả hơn nhiều là đặt trình xử lý sự kiện nhấp trên phần tử cha, và dựa vào nổi bong bóng sự kiện để đảm bảo rằng trình xử lý được thực thi khi người dùng nhấp vào một ô:

```js
function random(number) {
  return Math.floor(Math.random() * number);
}

function bgChange() {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  return rndCol;
}

const container = document.querySelector("#container");

container.addEventListener("click", (event) => {
  event.target.style.backgroundColor = bgChange();
});
```

Đầu ra như sau (hãy thử nhấp xung quanh nó):

{{ EmbedLiveSample('Event delegation', '100%', 430, "", "") }}

> [!NOTE]
> Trong ví dụ này, chúng ta đang sử dụng `event.target` để lấy phần tử là mục tiêu của sự kiện (tức là phần tử trong cùng). Nếu chúng ta muốn truy cập phần tử xử lý sự kiện này (trong trường hợp này là container), chúng ta có thể sử dụng `event.currentTarget`.

> [!NOTE]
> Xem [useful-eventtarget.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/events/useful-eventtarget.html) để biết mã nguồn đầy đủ; cũng xem nó [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/events/useful-eventtarget.html) ở đây.

## `target` và `currentTarget`

Nếu bạn nhìn kỹ vào các ví dụ chúng ta đã giới thiệu trong trang này, bạn sẽ thấy rằng chúng ta đang sử dụng hai thuộc tính khác nhau của đối tượng sự kiện để truy cập phần tử đã được nhấp. Trong [Đặt trình nghe trên phần tử cha](#setting_a_listener_on_a_parent_element) chúng ta đang sử dụng {{domxref("Event.currentTarget", "event.currentTarget")}}. Tuy nhiên, trong [Ủy quyền sự kiện](#event_delegation), chúng ta đang sử dụng {{domxref("Event.target", "event.target")}}.

Sự khác biệt là `target` tham chiếu đến phần tử mà sự kiện ban đầu được kích hoạt, trong khi `currentTarget` tham chiếu đến phần tử mà trình xử lý sự kiện này đã được gắn vào.

Trong khi `target` giữ nguyên khi sự kiện nổi lên, `currentTarget` sẽ khác nhau đối với các trình xử lý sự kiện được gắn vào các phần tử khác nhau trong hệ thống phân cấp.

Chúng ta có thể thấy điều này nếu chúng ta thích nghi nhẹ [ví dụ nổi bong bóng](#bubbling_example) ở trên. Chúng ta đang sử dụng HTML giống như trước:

```html
<body>
  <div id="container">
    <button>Click me!</button>
  </div>
  <pre id="output"></pre>
</body>
```

JavaScript gần như giống nhau, ngoại trừ chúng ta đang ghi lại cả `target` và `currentTarget`:

```js
const output = document.querySelector("#output");
function handleClick(e) {
  const logTarget = `Target: ${e.target.tagName}`;
  const logCurrentTarget = `Current target: ${e.currentTarget.tagName}`;
  output.textContent += `${logTarget}, ${logCurrentTarget}\n`;
}

const container = document.querySelector("#container");
const button = document.querySelector("button");

document.body.addEventListener("click", handleClick);
container.addEventListener("click", handleClick);
button.addEventListener("click", handleClick);
```

Lưu ý rằng khi chúng ta nhấp vào nút, `target` là phần tử nút mỗi lần, cho dù trình xử lý sự kiện được gắn vào chính nút, vào `<div>`, hay vào `<body>`. Tuy nhiên `currentTarget` xác định phần tử mà trình xử lý sự kiện của chúng ta hiện đang chạy:

{{embedlivesample("target and currentTarget")}}

Thuộc tính `target` thường được sử dụng trong ủy quyền sự kiện, như đã thấy trong ví dụ [Ủy quyền sự kiện](#event_delegation) ở trên.

## Tóm tắt

Bây giờ bạn nên biết tất cả những gì bạn cần biết về sự kiện web ở giai đoạn đầu này. Như đã đề cập, sự kiện không thực sự là một phần của ngôn ngữ JavaScript cốt lõi — chúng được định nghĩa trong Web API trình duyệt.

Trong bài tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ tất cả thông tin chúng ta đã cung cấp cho bạn về sự kiện.

## Xem thêm

- [domevents.dev](https://domevents.dev/)
  - : Một ứng dụng sân chơi tương tác hữu ích cho phép học về hành vi của hệ thống DOM Event thông qua khám phá.
- [Sự kiện DOM](/en-US/docs/Web/API/Document_Object_Model/Events)
  - : Hướng dẫn toàn diện để hiểu và xử lý sự kiện.
- [Thứ tự sự kiện](https://www.quirksmode.org/js/events_order.html)
  - : Một cuộc thảo luận chi tiết xuất sắc về bắt và nổi bong bóng bởi Peter-Paul Koch.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Events","Learn_web_development/Core/Scripting/Test_your_skills/Events", "Learn_web_development/Core/Scripting")}}
