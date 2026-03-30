---
title: Giới thiệu về sự kiện
short-title: Events
slug: Learn_web_development/Core/Scripting/Events
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Functions","Learn_web_development/Core/Scripting/Event_bubbling", "Learn_web_development/Core/Scripting")}}

Sự kiện là những thứ xảy ra trong hệ thống bạn đang lập trình, mà hệ thống thông báo cho bạn để mã của bạn có thể phản ứng với chúng.
Ví dụ, nếu người dùng nhấp vào một nút trên trang web, bạn có thể muốn phản ứng với hành động đó bằng cách hiển thị một hộp thông tin.
Trong bài viết này, chúng ta thảo luận về một số khái niệm quan trọng xung quanh sự kiện và xem xét các nguyên tắc cơ bản về cách chúng hoạt động trong trình duyệt.

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
          <li>Sự kiện là gì — một tín hiệu được trình duyệt kích hoạt khi có điều gì đó quan trọng xảy ra, mà nhà phát triển có thể chạy một số mã để phản hồi.</li>
          <li>Thiết lập trình xử lý sự kiện bằng <code>addEventListener()</code> (và <code>removeEventListener()</code>) và thuộc tính trình xử lý sự kiện.</li>
          <li>Thuộc tính trình xử lý sự kiện nội tuyến, và tại sao bạn không nên sử dụng chúng.</li>
          <li>Đối tượng sự kiện.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Sự kiện là gì?

Sự kiện là những thứ xảy ra trong hệ thống bạn đang lập trình — hệ thống tạo ra (hoặc "kích hoạt") một tín hiệu nào đó khi sự kiện xảy ra, và cung cấp một cơ chế mà theo đó một hành động có thể được thực hiện tự động (tức là một số mã chạy) khi sự kiện xảy ra.
Các sự kiện được kích hoạt bên trong cửa sổ trình duyệt và có xu hướng được gắn với một mục cụ thể nằm trong đó. Đây có thể là một phần tử đơn lẻ, một tập hợp các phần tử, tài liệu HTML được tải trong tab hiện tại, hoặc toàn bộ cửa sổ trình duyệt.
Có nhiều loại sự kiện khác nhau có thể xảy ra.

Ví dụ:

- Người dùng chọn, nhấp hoặc di chuột qua một phần tử nhất định.
- Người dùng nhấn một phím trên bàn phím.
- Người dùng thay đổi kích thước hoặc đóng cửa sổ trình duyệt.
- Một trang web tải xong.
- Một biểu mẫu được gửi.
- Một video được phát, tạm dừng hoặc kết thúc.
- Một lỗi xảy ra.

Bạn có thể suy ra từ điều này (và từ cái nhìn qua [chỉ số sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#event_index)) rằng có **rất nhiều** sự kiện có thể được kích hoạt.

Để phản ứng với một sự kiện, bạn gắn một **trình nghe sự kiện** vào nó. Đây là một tính năng mã lắng nghe sự kiện kích hoạt. Khi sự kiện kích hoạt, một hàm **trình xử lý sự kiện** (được tham chiếu bởi, hoặc chứa bên trong trình nghe sự kiện) được gọi để phản hồi với sự kiện kích hoạt. Khi một khối mã như vậy được thiết lập để chạy để phản hồi với một sự kiện, chúng ta nói rằng chúng ta đang **đăng ký một trình xử lý sự kiện**.

### Một ví dụ: xử lý sự kiện nhấp

Trong ví dụ sau, chúng ta có một {{htmlelement("button")}} duy nhất trong trang:

```html
<button>Change color</button>
```

```css hidden
button {
  margin: 10px;
}
```

Sau đó chúng ta có một số JavaScript. Chúng ta sẽ xem xét điều này chi tiết hơn trong phần tiếp theo, nhưng bây giờ chúng ta có thể nói: nó thêm một trình nghe sự kiện vào sự kiện `"click"` của nút, và hàm xử lý chứa trong đó phản ứng với sự kiện bằng cách đặt nền trang thành màu ngẫu nhiên:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

btn.addEventListener("click", () => {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
});
```

Đầu ra ví dụ như sau. Hãy thử nhấp vào nút:

{{ EmbedLiveSample('An example: handling a click event', '100%', 200, "", "") }}

## Sử dụng addEventListener()

Như chúng ta thấy trong ví dụ cuối, các đối tượng có thể kích hoạt sự kiện có phương thức {{domxref("EventTarget/addEventListener", "addEventListener()")}}, và đây là cơ chế được khuyến nghị để thêm trình nghe sự kiện.

Hãy xem kỹ hơn mã từ ví dụ cuối:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

btn.addEventListener("click", () => {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
});
```

Phần tử HTML {{HTMLElement("button")}} sẽ kích hoạt sự kiện `click` khi người dùng nhấp vào nó. Chúng ta gọi phương thức `addEventListener()` trên nó để thêm một trình nghe sự kiện; điều này nhận hai tham số:

- chuỗi `"click"`, để chỉ ra rằng chúng ta muốn lắng nghe sự kiện `click`. Các nút có thể kích hoạt nhiều sự kiện khác, chẳng hạn như [`"mouseover"`](/en-US/docs/Web/API/Element/mouseover_event) khi người dùng di chuyển chuột qua nút, hoặc [`"keydown"`](/en-US/docs/Web/API/Element/keydown_event) khi người dùng nhấn một phím và nút đang được focus.
- một hàm để gọi khi sự kiện xảy ra. Trong trường hợp của chúng ta, hàm vô danh được định nghĩa tạo ra màu RGB ngẫu nhiên và đặt {{cssxref("background-color")}} của trang [`<body>`](/en-US/docs/Web/HTML/Reference/Elements/body) thành màu đó.

Bạn cũng có thể tạo một hàm được đặt tên riêng biệt và tham chiếu đó trong tham số thứ hai của `addEventListener()`, như thế này:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

function changeBackground() {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
}

btn.addEventListener("click", changeBackground);
```

### Lắng nghe các sự kiện khác

Có nhiều sự kiện khác nhau có thể được kích hoạt bởi phần tử nút. Hãy thử nghiệm.

Đầu tiên, tạo một bản sao local của [random-color-addeventlistener.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/events/random-color-addeventlistener.html), và mở nó trong trình duyệt của bạn.
Đó chỉ là bản sao của ví dụ màu ngẫu nhiên đơn giản mà chúng ta đã chơi. Bây giờ hãy thử thay đổi `click` thành các giá trị khác nhau sau đây lần lượt và quan sát kết quả trong ví dụ:

- [`focus`](/en-US/docs/Web/API/Element/focus_event) và [`blur`](/en-US/docs/Web/API/Element/blur_event) — Màu thay đổi khi nút được focus và mất focus; hãy thử nhấn tab để focus vào nút và nhấn tab lần nữa để focus ra khỏi nút.
  Chúng thường được sử dụng để hiển thị thông tin về việc điền vào các trường biểu mẫu khi chúng được focus, hoặc để hiển thị thông báo lỗi nếu một trường biểu mẫu được điền với giá trị không chính xác.
- [`dblclick`](/en-US/docs/Web/API/Element/dblclick_event) — Màu chỉ thay đổi khi nút được nhấp đúp.
- [`mouseover`](/en-US/docs/Web/API/Element/mouseover_event) và [`mouseout`](/en-US/docs/Web/API/Element/mouseout_event) — Màu thay đổi khi con trỏ chuột di chuột qua nút, hoặc khi con trỏ di chuyển ra khỏi nút tương ứng.

Một số sự kiện, chẳng hạn như `click`, có sẵn trên gần như bất kỳ phần tử nào. Những sự kiện khác cụ thể hơn và chỉ hữu ích trong một số tình huống nhất định: ví dụ, sự kiện [`play`](/en-US/docs/Web/API/HTMLMediaElement/play_event) chỉ có sẵn trên các phần tử có chức năng phát, chẳng hạn như {{htmlelement("video")}}.

### Xóa trình nghe

Nếu bạn đã thêm một trình nghe sự kiện sử dụng `addEventListener()`, bạn có thể xóa nó nếu muốn. Cách phổ biến nhất để làm điều này là sử dụng phương thức [`removeEventListener()`](/en-US/docs/Web/API/EventTarget/removeEventListener). Ví dụ, dòng sau sẽ xóa trình xử lý sự kiện `click` mà chúng ta đã thấy trước đó:

```js
btn.removeEventListener("click", changeBackground);
```

Đối với các chương trình đơn giản, nhỏ, việc dọn dẹp các trình xử lý sự kiện cũ, không sử dụng không phải là cần thiết, nhưng đối với các chương trình lớn hơn, phức tạp hơn, nó có thể cải thiện hiệu quả.
Ngoài ra, khả năng xóa trình xử lý sự kiện cho phép bạn có cùng nút thực hiện các hành động khác nhau trong các tình huống khác nhau: tất cả những gì bạn phải làm là thêm hoặc xóa trình xử lý.

### Thêm nhiều trình nghe cho một sự kiện duy nhất

Bằng cách thực hiện nhiều hơn một lời gọi đến {{domxref("EventTarget/addEventListener()", "addEventListener()")}}, cung cấp các trình xử lý khác nhau, bạn có thể có nhiều hàm trình xử lý chạy để phản hồi với một sự kiện duy nhất:

```js
myElement.addEventListener("click", functionA);
myElement.addEventListener("click", functionB);
```

Cả hai hàm bây giờ sẽ chạy khi phần tử được nhấp.

## Các cơ chế trình nghe sự kiện khác

Chúng ta khuyến nghị bạn sử dụng `addEventListener()` để đăng ký trình xử lý sự kiện. Đây là phương thức mạnh mẽ nhất và mở rộng tốt nhất với các chương trình phức tạp hơn. Tuy nhiên, có hai cách khác để đăng ký trình xử lý sự kiện mà bạn có thể thấy: _thuộc tính trình xử lý sự kiện_ và _trình xử lý sự kiện nội tuyến_.

### Thuộc tính trình xử lý sự kiện

Các đối tượng (chẳng hạn như nút) có thể kích hoạt sự kiện cũng thường có các thuộc tính có tên là `on` theo sau là tên của sự kiện. Ví dụ, các phần tử có thuộc tính `onclick`.
Đây được gọi là **thuộc tính trình xử lý sự kiện**. Để lắng nghe sự kiện, bạn có thể gán hàm xử lý cho thuộc tính.

Ví dụ, chúng ta có thể viết lại ví dụ màu ngẫu nhiên như thế này:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

btn.onclick = () => {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
};
```

Bạn cũng có thể đặt thuộc tính trình xử lý thành một hàm được đặt tên:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

function bgChange() {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
}

btn.onclick = bgChange;
```

Các thuộc tính trình xử lý sự kiện có nhược điểm so với `addEventListener()`. Một trong những nhược điểm đáng kể nhất là bạn không thể [thêm nhiều hơn một trình nghe cho một sự kiện duy nhất](#adding_multiple_listeners_for_a_single_event). Mẫu sau không hoạt động, vì bất kỳ lần thử tiếp theo nào để đặt giá trị thuộc tính sẽ ghi đè những lần trước:

```js
element.onclick = function1;
element.onclick = function2;
```

### Trình xử lý sự kiện nội tuyến — đừng sử dụng những cái này

Bạn cũng có thể thấy một mẫu như thế này trong mã của mình:

```html example-bad
<button onclick="bgChange()">Press me</button>
```

```js
function bgChange() {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  document.body.style.backgroundColor = rndCol;
}
```

Phương thức sớm nhất để đăng ký trình xử lý sự kiện được tìm thấy trên Web liên quan đến [_thuộc tính HTML trình xử lý sự kiện_](/en-US/docs/Web/HTML/Reference/Attributes#event_handler_attributes) (hoặc _trình xử lý sự kiện nội tuyến_) như đã hiển thị ở trên — giá trị thuộc tính chứa mã JavaScript bạn muốn chạy khi sự kiện xảy ra.
Ví dụ trên gọi một hàm được định nghĩa bên trong phần tử {{htmlelement("script")}} trên cùng trang, nhưng bạn cũng có thể chèn JavaScript trực tiếp bên trong thuộc tính, ví dụ:

```html example-bad
<button onclick="alert('Hello, this is my old-fashioned event handler!');">
  Press me
</button>
```

Bạn có thể tìm thấy các tương đương thuộc tính HTML cho nhiều thuộc tính trình xử lý sự kiện; tuy nhiên, bạn không nên sử dụng những cái này — chúng được coi là thực hành xấu.
Có thể có vẻ dễ sử dụng thuộc tính trình xử lý sự kiện nếu bạn đang làm gì đó thực sự nhanh, nhưng chúng nhanh chóng trở nên khó quản lý và kém hiệu quả.

Đầu tiên, không phải ý tưởng tốt để trộn HTML và JavaScript của bạn, vì nó trở nên khó đọc. Giữ JavaScript riêng biệt là thực hành tốt, và nếu nó nằm trong một tệp riêng biệt, bạn có thể áp dụng nó cho nhiều tài liệu HTML.

Ngay cả trong một tệp duy nhất, trình xử lý sự kiện nội tuyến không phải là ý tưởng tốt.
Một nút là OK, nhưng nếu bạn có 100 nút thì sao? Bạn sẽ phải thêm 100 thuộc tính vào tệp; nó sẽ nhanh chóng trở thành cơn ác mộng bảo trì.
Với JavaScript, bạn có thể dễ dàng thêm hàm xử lý sự kiện vào tất cả các nút trên trang bất kể có bao nhiêu nút, sử dụng thứ gì đó như thế này:

```js
const buttons = document.querySelectorAll("button");

for (const button of buttons) {
  button.addEventListener("click", bgChange);
}
```

Cuối cùng, nhiều cấu hình máy chủ phổ biến sẽ không cho phép JavaScript nội tuyến, như một biện pháp bảo mật.

**Bạn không bao giờ nên sử dụng các thuộc tính trình xử lý sự kiện HTML** — những cái đó đã lỗi thời và sử dụng chúng là thực hành xấu.

## Đối tượng sự kiện

Đôi khi, bên trong một hàm trình xử lý sự kiện, bạn sẽ thấy một tham số được chỉ định với tên như `event`, `evt`, hoặc `e`.
Đây được gọi là **đối tượng sự kiện**, và nó được tự động truyền cho các trình xử lý sự kiện để cung cấp các tính năng và thông tin bổ sung.
Ví dụ, hãy viết lại ví dụ màu ngẫu nhiên của chúng ta để bao gồm đối tượng sự kiện:

```js
const btn = document.querySelector("button");

function random(number) {
  return Math.floor(Math.random() * (number + 1));
}

function bgChange(e) {
  const rndCol = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  e.target.style.backgroundColor = rndCol;
  console.log(e);
}

btn.addEventListener("click", bgChange);
```

> [!NOTE]
> Bạn có thể tìm [mã nguồn đầy đủ](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/events/random-color-eventobject.html) cho ví dụ này trên GitHub (cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/events/random-color-eventobject.html)).

Ở đây bạn có thể thấy chúng ta đang bao gồm đối tượng sự kiện **e** trong hàm, và trong hàm đặt kiểu màu nền trên `e.target` — là bản thân nút.
Thuộc tính `target` của đối tượng sự kiện luôn là tham chiếu đến phần tử mà sự kiện xảy ra trên đó.
Vì vậy, trong ví dụ này, chúng ta đang đặt màu nền ngẫu nhiên trên nút, không phải trang.

> [!NOTE]
> Bạn có thể sử dụng bất kỳ tên nào bạn muốn cho đối tượng sự kiện — bạn chỉ cần chọn một tên mà bạn có thể tham chiếu bên trong hàm trình xử lý sự kiện.
> `e`, `evt`, và `event` thường được sử dụng bởi các nhà phát triển vì chúng ngắn và dễ nhớ.
> Luôn tốt khi nhất quán — với bản thân, và với người khác nếu có thể.

### Các thuộc tính bổ sung của đối tượng sự kiện

Hầu hết các đối tượng sự kiện có một bộ thuộc tính và phương thức tiêu chuẩn có sẵn trên đối tượng sự kiện; xem tham chiếu đối tượng {{domxref("Event")}} để biết danh sách đầy đủ.

Một số đối tượng sự kiện thêm các thuộc tính bổ sung liên quan đến loại sự kiện cụ thể đó. Ví dụ, sự kiện {{domxref("Element/keydown_event", "keydown")}} kích hoạt khi người dùng nhấn một phím. Đối tượng sự kiện của nó là {{domxref("KeyboardEvent")}}, là đối tượng `Event` chuyên biệt với thuộc tính `key` cho bạn biết phím nào đã được nhấn:

```html
<input id="textBox" type="text" />
<div id="output"></div>
```

```js
const textBox = document.querySelector("#textBox");
const output = document.querySelector("#output");
textBox.addEventListener("keydown", (event) => {
  output.textContent = `You pressed "${event.key}".`;
});
```

```css hidden
div {
  margin: 0.5rem 0;
}
```

Hãy thử gõ vào ô nhập văn bản và xem đầu ra:

{{EmbedLiveSample("Extra_properties_of_event_objects", 100, 100)}}

## Ngăn chặn hành vi mặc định

Đôi khi, bạn sẽ gặp tình huống muốn ngăn sự kiện thực hiện những gì nó mặc định.
Ví dụ phổ biến nhất là của một biểu mẫu web, ví dụ như biểu mẫu đăng ký tùy chỉnh.
Khi bạn điền thông tin và nhấp vào nút gửi, hành vi tự nhiên là dữ liệu được gửi đến một trang cụ thể trên máy chủ để xử lý, và trình duyệt được chuyển hướng đến một trang "thông báo thành công" nào đó (hoặc cùng trang đó, nếu không có trang khác được chỉ định).

Vấn đề xảy ra khi người dùng chưa gửi dữ liệu đúng — với tư cách là nhà phát triển, bạn muốn ngăn việc gửi đến máy chủ và đưa ra thông báo lỗi cho biết điều gì sai và cần làm gì để sửa.
Một số trình duyệt hỗ trợ các tính năng xác thực dữ liệu biểu mẫu tự động, nhưng vì nhiều trình duyệt không, bạn được khuyến nghị không dựa vào những tính năng đó và triển khai kiểm tra xác thực của riêng bạn.
Hãy xem một ví dụ.

Đầu tiên, một biểu mẫu HTML đơn giản yêu cầu bạn nhập tên và họ:

```html
<form action="#">
  <div>
    <label for="fname">First name: </label>
    <input id="fname" type="text" />
  </div>
  <div>
    <label for="lname">Last name: </label>
    <input id="lname" type="text" />
  </div>
  <div>
    <input id="submit" type="submit" />
  </div>
</form>
<p></p>
```

```css hidden
div {
  margin-bottom: 10px;
}
```

Bây giờ một số JavaScript — ở đây chúng ta triển khai một kiểm tra cơ bản bên trong trình xử lý cho sự kiện [`submit`](/en-US/docs/Web/API/HTMLFormElement/submit_event) (sự kiện submit được kích hoạt trên biểu mẫu khi nó được gửi) kiểm tra xem các trường văn bản có trống không.
Nếu có, chúng ta gọi hàm [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault) trên đối tượng sự kiện — ngăn việc gửi biểu mẫu — và sau đó hiển thị thông báo lỗi trong đoạn văn bên dưới biểu mẫu để cho người dùng biết điều gì sai:

```js
const form = document.querySelector("form");
const fname = document.getElementById("fname");
const lname = document.getElementById("lname");
const para = document.querySelector("p");

form.addEventListener("submit", (e) => {
  if (fname.value === "" || lname.value === "") {
    e.preventDefault();
    para.textContent = "You need to fill in both names!";
  }
});
```

Rõ ràng, đây là xác thực biểu mẫu khá yếu — nó sẽ không ngăn người dùng xác thực biểu mẫu với khoảng trắng hoặc số được nhập vào các trường, ví dụ — nhưng nó OK cho mục đích ví dụ.

Bạn có thể xem ví dụ đầy đủ [chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/events/preventdefault-validation.html) — hãy thử nó ở đó. Để xem mã nguồn đầy đủ, hãy xem [preventdefault-validation.html](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/events/preventdefault-validation.html).

## Không chỉ trang web

Sự kiện không duy nhất đối với JavaScript — hầu hết các ngôn ngữ lập trình đều có một loại mô hình sự kiện nào đó, và cách mô hình hoạt động thường khác với cách của JavaScript.
Thực ra, mô hình sự kiện trong JavaScript cho trang web khác với mô hình sự kiện cho JavaScript khi được sử dụng trong các môi trường khác.

Ví dụ, [Node.js](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) là một JavaScript runtime rất phổ biến cho phép các nhà phát triển sử dụng JavaScript để xây dựng các ứng dụng mạng và phía máy chủ.
[Mô hình sự kiện Node.js](https://nodejs.org/api/events.html) dựa vào các trình nghe để lắng nghe sự kiện và các phát ra để phát ra sự kiện định kỳ — nó nghe không khác nhau lắm, nhưng mã khá khác nhau, sử dụng các hàm như `on()` để đăng ký trình nghe sự kiện, và `once()` để đăng ký trình nghe sự kiện tự hủy đăng ký sau khi đã chạy một lần.
[Tài liệu sự kiện kết nối HTTP của Node.js](https://nodejs.org/api/http.html#event-connect) cung cấp một ví dụ tốt.

Bạn cũng có thể sử dụng JavaScript để xây dựng các tiện ích mở rộng trình duyệt đa trình duyệt — cải tiến chức năng trình duyệt — sử dụng công nghệ gọi là [WebExtensions](/en-US/docs/Mozilla/Add-ons/WebExtensions).
Mô hình sự kiện tương tự như mô hình sự kiện web, nhưng hơi khác — các thuộc tính trình nghe sự kiện được viết bằng {{Glossary("camel_case", "camel case")}} (chẳng hạn như `onMessage` thay vì `onmessage`), và cần được kết hợp với hàm `addListener`.
Xem trang [`runtime.onMessage`](/en-US/docs/Mozilla/Add-ons/WebExtensions/API/runtime/onMessage#examples) để biết ví dụ.

Bạn không cần hiểu bất cứ điều gì về các môi trường như vậy ở giai đoạn học tập này; chúng ta chỉ muốn làm rõ rằng sự kiện có thể khác nhau trong các môi trường lập trình khác nhau.

## Tóm tắt

Trong chương này chúng ta đã học sự kiện là gì, cách lắng nghe sự kiện và cách phản hồi với chúng.

Bạn đã thấy rằng các phần tử trong trang web có thể được lồng vào bên trong các phần tử khác. Ví dụ, trong ví dụ [Ngăn chặn hành vi mặc định](#preventing_default_behavior), chúng ta có một số ô nhập văn bản, được đặt bên trong các phần tử {{htmlelement("div")}}, lần lượt được đặt bên trong phần tử {{htmlelement("form")}}. Điều gì xảy ra khi trình nghe sự kiện nhấp được gắn vào phần tử `<form>`, và người dùng nhấp vào bên trong một trong các ô nhập văn bản? Hàm trình xử lý sự kiện liên quan vẫn được kích hoạt thông qua một quá trình gọi là _event bubbling_, được đề cập trong bài học tiếp theo.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Functions","Learn_web_development/Core/Scripting/Event_bubbling", "Learn_web_development/Core/Scripting")}}
