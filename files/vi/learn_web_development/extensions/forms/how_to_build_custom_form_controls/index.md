---
title: Cách xây dựng điều khiển biểu mẫu tùy chỉnh
short-title: Custom form controls
slug: Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls
page-type: learn-module-chapter
sidebar: learnsidebar
---

Có một số trường hợp mà các điều khiển biểu mẫu HTML gốc có thể có vẻ không đủ. Ví dụ, nếu bạn cần [thực hiện kiểu dáng nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling) trên một số điều khiển như phần tử {{HTMLElement("select")}}, hoặc nếu bạn muốn cung cấp các hành vi tùy chỉnh, bạn có thể xem xét việc xây dựng điều khiển của riêng mình.

Trong bài viết này, chúng ta sẽ thảo luận về cách xây dựng một điều khiển tùy chỉnh. Để đạt được điều đó, chúng ta sẽ làm việc với một ví dụ: xây dựng lại phần tử {{HTMLElement("select")}}. Chúng ta cũng sẽ thảo luận về cách, khi nào, và liệu việc xây dựng điều khiển của riêng bạn có hợp lý không, cũng như những gì cần xem xét khi việc xây dựng một điều khiển là một yêu cầu.

> [!NOTE]
> Chúng ta sẽ tập trung vào việc xây dựng điều khiển, không phải vào cách làm cho mã chung và có thể tái sử dụng; điều đó sẽ liên quan đến một số mã JavaScript không tầm thường và thao tác DOM trong một ngữ cảnh không xác định, và điều đó nằm ngoài phạm vi của bài viết này.

## Thiết kế, cấu trúc và ngữ nghĩa

Trước khi xây dựng một điều khiển tùy chỉnh, bạn nên bắt đầu bằng cách xác định chính xác những gì bạn muốn. Điều này sẽ giúp bạn tiết kiệm thời gian quý báu. Đặc biệt, điều quan trọng là phải xác định rõ ràng tất cả các trạng thái của điều khiển của bạn. Để làm điều này, tốt nhất là bắt đầu với một điều khiển hiện có mà các trạng thái và hành vi của nó đã được biết đến tốt, để bạn có thể mô phỏng chúng càng nhiều càng tốt.

Trong ví dụ của chúng ta, chúng ta sẽ xây dựng lại phần tử {{HTMLElement("select")}}. Đây là kết quả chúng ta muốn đạt được:

![The three states of a select box](custom-select.png)

Ảnh chụp màn hình này hiển thị ba trạng thái chính của điều khiển của chúng ta: trạng thái bình thường (bên trái); trạng thái hoạt động (ở giữa) và trạng thái mở (bên phải).

Về mặt hành vi, chúng ta đang tái tạo một phần tử HTML gốc. Do đó, nó nên có cùng hành vi và ngữ nghĩa như phần tử HTML gốc. Chúng ta yêu cầu điều khiển của mình có thể sử dụng được với chuột cũng như bàn phím, và dễ hiểu cho trình đọc màn hình, giống như bất kỳ điều khiển gốc nào. Hãy bắt đầu bằng cách xác định cách điều khiển đạt được mỗi trạng thái:

**Điều khiển ở trạng thái bình thường khi:**

- trang tải.
- điều khiển đang hoạt động và người dùng nhấp vào bất cứ đâu bên ngoài nó.
- điều khiển đang hoạt động và người dùng di chuyển tiêu điểm đến một điều khiển khác bằng bàn phím (ví dụ: phím <kbd>Tab</kbd>).

**Điều khiển ở trạng thái hoạt động khi:**

- người dùng nhấp vào nó hoặc chạm vào nó trên màn hình cảm ứng.
- người dùng nhấn phím tab và nó được tập trung.
- điều khiển ở trạng thái mở và người dùng nhấp vào nó.

**Điều khiển ở trạng thái mở khi:**

- điều khiển ở bất kỳ trạng thái nào khác ngoài trạng thái mở và người dùng nhấp vào nó.

Khi chúng ta biết cách thay đổi trạng thái, điều quan trọng là phải xác định cách thay đổi giá trị của điều khiển:

**Giá trị thay đổi khi:**

- người dùng nhấp vào một tùy chọn khi điều khiển ở trạng thái mở.
- người dùng nhấn phím mũi tên lên hoặc xuống khi điều khiển ở trạng thái hoạt động.

**Giá trị không thay đổi khi:**

- người dùng nhấn phím mũi tên lên khi tùy chọn đầu tiên được chọn.
- người dùng nhấn phím mũi tên xuống khi tùy chọn cuối cùng được chọn.

Cuối cùng, hãy xác định cách các tùy chọn của điều khiển sẽ hoạt động:

- Khi điều khiển được mở, tùy chọn đã chọn được làm nổi bật
- Khi chuột ở trên một tùy chọn, tùy chọn đó được làm nổi bật và tùy chọn đã được nổi bật trước đó trở về trạng thái bình thường

Cho mục đích của ví dụ của chúng ta, chúng ta sẽ dừng ở đây; tuy nhiên, nếu bạn là một người đọc cẩn thận, bạn sẽ nhận thấy rằng một số hành vi còn thiếu. Ví dụ, bạn nghĩ điều gì sẽ xảy ra nếu người dùng nhấn phím tab trong khi điều khiển ở trạng thái mở? Câu trả lời là _không có gì_. OK, hành vi đúng có vẻ rõ ràng nhưng thực tế là vì nó không được định nghĩa trong thông số kỹ thuật của chúng ta, rất dễ bỏ qua hành vi này. Điều này đặc biệt đúng trong môi trường nhóm khi những người thiết kế hành vi của điều khiển khác với những người triển khai nó.

Một ví dụ thú vị khác: điều gì sẽ xảy ra nếu người dùng nhấn phím mũi tên lên hoặc xuống trong khi điều khiển ở trạng thái mở? Cái này phức tạp hơn một chút. Nếu bạn cho rằng trạng thái hoạt động và trạng thái mở hoàn toàn khác nhau, câu trả lời sẽ là "không có gì sẽ xảy ra" vì chúng ta không xác định bất kỳ tương tác bàn phím nào cho trạng thái đang mở. Mặt khác, nếu bạn cho rằng trạng thái hoạt động và trạng thái mở có một chút chồng chéo nhau, giá trị có thể thay đổi nhưng tùy chọn chắc chắn sẽ không được nổi bật tương ứng, một lần nữa vì chúng ta không xác định bất kỳ tương tác bàn phím nào trên các tùy chọn khi điều khiển ở trạng thái mở (chúng ta chỉ xác định điều gì sẽ xảy ra khi điều khiển được mở, nhưng không có gì sau đó).

Chúng ta phải suy nghĩ thêm: điều gì về phím escape? Nhấn phím <kbd>Esc</kbd> đóng một select đang mở. Hãy nhớ rằng, nếu bạn muốn cung cấp cùng chức năng như {{htmlelement('select')}} gốc hiện có, nó nên hoạt động giống hệt như select cho tất cả người dùng, từ bàn phím đến chuột đến chạm đến trình đọc màn hình, và bất kỳ thiết bị đầu vào nào khác.

Trong ví dụ của chúng ta, các thông số kỹ thuật còn thiếu là rõ ràng nên chúng ta sẽ xử lý chúng, nhưng có thể là một vấn đề thực sự đối với các điều khiển mới kỳ lạ. Khi nói đến các phần tử tiêu chuẩn hóa, mà {{htmlelement('select')}} là một trong số đó, các tác giả thông số kỹ thuật đã dành một lượng thời gian khổng lồ để chỉ định tất cả các tương tác cho mọi trường hợp sử dụng cho mọi thiết bị đầu vào. Tạo điều khiển mới không dễ dàng như vậy, đặc biệt nếu bạn đang tạo ra thứ gì đó chưa được thực hiện trước đây, và do đó không ai có ý tưởng nhỏ nhất về hành vi và tương tác dự kiến là gì. Ít nhất select đã được thực hiện trước đây, vì vậy chúng ta biết nó nên hoạt động như thế nào!

Thiết kế các tương tác mới thường chỉ là một lựa chọn cho những người chơi lớn trong ngành có đủ tầm ảnh hưởng để một tương tác họ tạo ra có thể trở thành tiêu chuẩn. Ví dụ, Apple đã giới thiệu cuộn bánh xe với iPod vào năm 2001. Họ có đủ thị phần để thành công giới thiệu một cách hoàn toàn mới để tương tác với thiết bị, điều mà hầu hết các công ty thiết bị không thể làm.

Tốt nhất là không nên phát minh các tương tác người dùng mới. Đối với bất kỳ tương tác nào bạn thêm vào, điều quan trọng là phải dành thời gian trong giai đoạn thiết kế; nếu bạn xác định hành vi kém, hoặc quên xác định một hành vi, sẽ rất khó để xác định lại nó một khi người dùng đã quen với nó. Nếu bạn có nghi ngờ, hãy hỏi ý kiến của người khác, và nếu bạn có ngân sách cho nó, đừng ngần ngại [thực hiện kiểm tra người dùng](https://en.wikipedia.org/wiki/Usability_testing). Quá trình này được gọi là Thiết kế UX. Nếu bạn muốn tìm hiểu thêm về chủ đề này, bạn nên kiểm tra các tài nguyên hữu ích sau:

- [UXMatters.com](https://www.uxmatters.com/)
- [Phần Thiết kế UX của SmashingMagazine](https://www.smashingmagazine.com/)

> [!NOTE]
> Ngoài ra, trong hầu hết các hệ thống có một cách để mở phần tử {{HTMLElement("select")}} bằng bàn phím để xem tất cả các tùy chọn có sẵn (điều này giống như nhấp vào phần tử {{HTMLElement("select")}} bằng chuột). Điều này được thực hiện bằng <kbd>Alt</kbd> + <kbd>Down</kbd> trên Windows. Chúng ta đã không triển khai điều này trong ví dụ của mình, nhưng sẽ dễ dàng thực hiện, vì cơ chế đã được triển khai cho sự kiện `click`.

## Xác định cấu trúc HTML và (một số) ngữ nghĩa

Bây giờ chức năng cơ bản của điều khiển đã được quyết định, đã đến lúc bắt đầu xây dựng nó. Bước đầu tiên là xác định cấu trúc HTML của nó và cho nó một số ngữ nghĩa cơ bản. Đây là những gì chúng ta cần để xây dựng lại một phần tử {{HTMLElement("select")}}:

```html
<!-- This is our main container for our control.
     The tabindex attribute is what allows the user to focus on the control.
     We'll see later that it's better to set it through JavaScript. -->
<div class="select" tabindex="0">
  <!-- This container will be used to display the current value of the control -->
  <span class="value">Cherry</span>

  <!-- This container will contain all the options available for our control.
       Because it's a list, it makes sense to use the ul element. -->
  <ul class="optList">
    <!-- Each option only contains the value to be displayed, we'll see later
         how to handle the real value that will be sent with the form data -->
    <li class="option">Cherry</li>
    <li class="option">Lemon</li>
    <li class="option">Banana</li>
    <li class="option">Strawberry</li>
    <li class="option">Apple</li>
  </ul>
</div>
```

Lưu ý việc sử dụng tên lớp; chúng xác định từng phần liên quan bất kể các phần tử HTML cơ bản thực sự được sử dụng. Điều này quan trọng để đảm bảo rằng chúng ta không ràng buộc CSS và JavaScript của mình với một cấu trúc HTML mạnh mẽ, để chúng ta có thể thực hiện các thay đổi triển khai sau này mà không cần phá vỡ mã sử dụng điều khiển. Ví dụ, nếu sau này bạn muốn triển khai tương đương của phần tử {{HTMLElement("optgroup")}}?

Tuy nhiên, tên lớp không cung cấp giá trị ngữ nghĩa. Ở trạng thái hiện tại này, người dùng trình đọc màn hình chỉ "nhìn thấy" một danh sách không có thứ tự. Chúng ta sẽ thêm ngữ nghĩa ARIA sau.

## Tạo giao diện bằng CSS

Bây giờ chúng ta có cấu trúc, chúng ta có thể bắt đầu thiết kế điều khiển của mình. Toàn bộ mục đích của việc xây dựng điều khiển tùy chỉnh này là có thể tạo kiểu cho nó theo cách chúng ta muốn. Vì vậy, chúng ta sẽ chia công việc CSS của mình thành hai phần: phần đầu tiên sẽ là các quy tắc CSS hoàn toàn cần thiết để làm cho điều khiển của chúng ta hoạt động như một phần tử {{HTMLElement("select")}}, và phần thứ hai sẽ bao gồm các kiểu đẹp được sử dụng để làm cho nó trông theo cách chúng ta muốn.

### Kiểu bắt buộc

Các kiểu bắt buộc là những kiểu cần thiết để xử lý ba trạng thái của điều khiển của chúng ta.

```css
.select {
  /* This will create a positioning context for the list of options;
     adding this to `.select:focus-within` will be a better option when fully supported
  */
  position: relative;

  /* This will make our control become part of the text flow and sizable at the same time */
  display: inline-block;
}
```

Chúng ta cần một lớp bổ sung `active` để xác định giao diện và cảm giác của điều khiển khi nó ở trạng thái hoạt động. Vì điều khiển của chúng ta có thể được tập trung, chúng ta kết đôi kiểu tùy chỉnh này với lớp giả {{cssxref(":focus")}} để đảm bảo chúng sẽ hoạt động giống nhau.

```css
.select.active,
.select:focus {
  outline-color: transparent;

  /* This box-shadow property is not exactly required, however it's imperative to ensure
     active state is visible, especially to keyboard users, that we use it as a default value. */
  box-shadow: 0 0 3px 1px #227755;
}
```

Bây giờ, hãy xử lý danh sách các tùy chọn:

```css
/* The .select selector here helps to make sure we only select
   element inside our control. */
.select .optList {
  /* This will make sure our list of options will be displayed below the value
     and out of the HTML flow */
  position: absolute;
  top: 100%;
  left: 0;
}
```

Chúng ta cần một lớp bổ sung để xử lý khi danh sách tùy chọn bị ẩn. Điều này cần thiết để quản lý sự khác biệt giữa trạng thái hoạt động và trạng thái mở không khớp chính xác.

```css
.select .optList.hidden {
  /* This is a simple way to hide the list in an accessible way;
     we will talk more about accessibility in the end */
  max-height: 0;
  visibility: hidden;
}
```

> [!NOTE]
> Chúng ta cũng có thể đã sử dụng `transform: scale(1, 0)` để cho danh sách tùy chọn không có chiều cao và đầy đủ chiều rộng.

### Trang trí

Bây giờ chúng ta có chức năng cơ bản, sự vui thú có thể bắt đầu. Sau đây chỉ là một ví dụ về những gì có thể, và sẽ khớp với ảnh chụp màn hình ở đầu bài viết này. Tuy nhiên, bạn nên tự do thử nghiệm và xem những gì bạn có thể nghĩ ra.

```css
.select {
  /* The computations are made assuming 1em equals 16px which is the default value in most browsers.
     If you are lost with px to em conversion, try https://nekocalc.com/px-to-em-converter */
  font-size: 0.625em; /* this (10px) is the new font size context for em value in this context */
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  /* We need extra room for the down arrow we will add */
  padding: 0.1em 2.5em 0.2em 0.5em;
  width: 10em; /* 100px */

  border: 0.2em solid black;
  border-radius: 0.4em;
  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  /* Because the value can be wider than our control, we have to make sure it will not
     change the control's width. If the content overflows, we display an ellipsis */
  display: inline-block;
  width: 100%;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}
```

Chúng ta không cần phần tử bổ sung để thiết kế mũi tên xuống; thay vào đó, chúng ta sử dụng phần tử giả {{cssxref("::after")}}. Nó cũng có thể được triển khai bằng cách sử dụng hình nền đơn giản trên lớp `select`.

```css
.select::after {
  content: "▼"; /* We use the unicode character U+25BC; make sure to set a charset meta tag */
  position: absolute;
  z-index: 1; /* This will be important to keep the arrow from overlapping the list of options */
  top: 0;
  right: 0;

  box-sizing: border-box;

  height: 100%;
  width: 2em;
  padding-top: 0.1em;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
  text-align: center;
}
```

Tiếp theo, hãy tạo kiểu cho danh sách tùy chọn:

```css
.select .optList {
  z-index: 2; /* We explicitly said the list of options will always be on top of the down arrow */

  /* this will reset the default style of the ul element */
  list-style: none;
  margin: 0;
  padding: 0;

  box-sizing: border-box;

  /* If the values are smaller than the control, the list of options
     will be as wide as the control itself */
  min-width: 100%;

  /* In case the list is too long, its content will overflow vertically
     (which will add a vertical scrollbar automatically) but never horizontally
     (because we haven't set a width, the list will adjust its width automatically.
     If it can't, the content will be truncated) */
  max-height: 10em; /* 100px */
  overflow-y: auto;
  overflow-x: hidden;

  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);
  background: #f0f0f0;
}
```

Đối với các tùy chọn, chúng ta cần thêm lớp `highlight` để có thể xác định giá trị mà người dùng sẽ chọn (hoặc đã chọn).

```css
.select .option {
  padding: 0.2em 0.3em; /* 2px 3px */
}

.select .highlight {
  background: black;
  color: white;
}
```

Vậy đây là kết quả với ba trạng thái của chúng ta ([kiểm tra mã nguồn tại đây](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_1)):

#### Trạng thái cơ bản

```html hidden
<div class="select">
  <span class="value">Cherry</span>
  <ul class="optList hidden">
    <li class="option">Cherry</li>
    <li class="option">Lemon</li>
    <li class="option">Banana</li>
    <li class="option">Strawberry</li>
    <li class="option">Apple</li>
  </ul>
</div>
```

```css hidden
.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em; /* 10px */
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em; /* 1px 25px 2px 5px */
  width: 10em; /* 100px */

  border: 0.2em solid black; /* 2px */
  border-radius: 0.4em; /* 4px */

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%); /* 0 1px 2px */

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em; /* 20px */
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em; /* 100px */
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

{{EmbedLiveSample("Basic_state",120,130)}}

#### Trạng thái hoạt động

```html hidden
<div class="select active">
  <span class="value">Cherry</span>
  <ul class="optList hidden">
    <li class="option">Cherry</li>
    <li class="option">Lemon</li>
    <li class="option">Banana</li>
    <li class="option">Strawberry</li>
    <li class="option">Apple</li>
  </ul>
</div>
```

```css hidden
.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em; /* 10px */
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em; /* 1px 25px 2px 5px */
  width: 10em; /* 100px */

  border: 0.2em solid black; /* 2px */
  border-radius: 0.4em; /* 4px */

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%); /* 0 1px 2px */

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em; /* 20px */
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em; /* 100px */
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

{{EmbedLiveSample("Active_state",120,130)}}

#### Trạng thái mở

```html hidden
<div class="select active">
  <span class="value">Cherry</span>
  <ul class="optList">
    <li class="option highlight">Cherry</li>
    <li class="option">Lemon</li>
    <li class="option">Banana</li>
    <li class="option">Strawberry</li>
    <li class="option">Apple</li>
  </ul>
</div>
```

```css hidden
.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em; /* 10px */
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em; /* 1px 25px 2px 5px */
  width: 10em; /* 100px */

  border: 0.2em solid black; /* 2px */
  border-radius: 0.4em; /* 4px */

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%); /* 0 1px 2px */

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em; /* 20px */
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em; /* 100px */
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

{{EmbedLiveSample("Open_state",120,130)}}

## Đưa điều khiển vào hoạt động với JavaScript

Bây giờ thiết kế và cấu trúc của chúng ta đã sẵn sàng, chúng ta có thể viết mã JavaScript để làm cho điều khiển thực sự hoạt động.

> [!WARNING]
> Sau đây là mã giáo dục, không phải mã sản xuất, và không nên sử dụng nguyên xi. Nó không ổn định trong tương lai và sẽ không hoạt động trên trình duyệt cũ. Nó cũng có các phần dư thừa nên được tối ưu hóa trong mã sản xuất.

### Tại sao nó không hoạt động?

Trước khi bắt đầu, điều quan trọng cần nhớ là **JavaScript trong trình duyệt là một công nghệ không đáng tin cậy**. Các điều khiển tùy chỉnh dựa vào JavaScript để kết hợp mọi thứ lại với nhau. Tuy nhiên, có những trường hợp mà JavaScript không thể chạy trong trình duyệt:

- Người dùng đã tắt JavaScript: Điều này bất thường; rất ít người tắt JavaScript ngày nay.
- Script không tải được: Đây là một trong những trường hợp phổ biến nhất, đặc biệt trong thế giới di động nơi mạng không đáng tin cậy.
- Script có lỗi: Bạn nên luôn xem xét khả năng này.
- Script xung đột với script của bên thứ ba: Điều này có thể xảy ra với các script theo dõi hoặc bất kỳ bookmarklet nào người dùng sử dụng.
- Script xung đột với, hoặc bị ảnh hưởng bởi, tiện ích mở rộng trình duyệt (chẳng hạn như tiện ích mở rộng [NoScript](https://addons.mozilla.org/fr/firefox/addon/noscript/) của Firefox hoặc [ScriptBlock](https://chromewebstore.google.com/detail/scriptblock/hcdjknjpbnhdoabbngpmfekaecnpajba) của Chrome).
- Người dùng đang sử dụng trình duyệt cũ, và một trong những tính năng bạn yêu cầu không được hỗ trợ: Điều này sẽ xảy ra thường xuyên khi bạn sử dụng các API tiên tiến.
- Người dùng đang tương tác với nội dung trước khi JavaScript được tải xuống, phân tích và thực thi đầy đủ.

Vì những rủi ro này, điều thực sự quan trọng là phải xem xét nghiêm túc điều gì sẽ xảy ra nếu JavaScript của bạn không hoạt động. Chúng ta sẽ thảo luận về các lựa chọn để xem xét và đề cập đến các kiến thức cơ bản trong ví dụ của chúng ta (một cuộc thảo luận đầy đủ về việc giải quyết vấn đề này cho tất cả các tình huống sẽ cần một cuốn sách). Hãy nhớ rằng, điều quan trọng là làm cho script của bạn chung và có thể tái sử dụng.

Trong ví dụ của chúng ta, nếu mã JavaScript của chúng ta không chạy, chúng ta sẽ dự phòng để hiển thị một phần tử {{HTMLElement("select")}} tiêu chuẩn. Chúng ta bao gồm điều khiển của mình và {{HTMLElement("select")}}; cái nào được hiển thị phụ thuộc vào lớp của phần tử body, với lớp của phần tử body được cập nhật bởi script làm cho điều khiển hoạt động, khi nó tải thành công.

Để đạt được điều này, chúng ta cần hai điều:

Đầu tiên, chúng ta cần thêm một phần tử {{HTMLElement("select")}} thông thường trước mỗi phiên bản của điều khiển tùy chỉnh của chúng ta. Có một lợi ích khi có "thêm" select này ngay cả khi JavaScript của chúng ta hoạt động như mong đợi: chúng ta sẽ sử dụng select này để gửi dữ liệu từ điều khiển tùy chỉnh của chúng ta cùng với phần còn lại của dữ liệu biểu mẫu của chúng ta. Chúng ta sẽ thảo luận điều này chi tiết hơn sau.

```html
<body class="no-widget">
  <form>
    <select name="myFruit">
      <option>Cherry</option>
      <option>Lemon</option>
      <option>Banana</option>
      <option>Strawberry</option>
      <option>Apple</option>
    </select>

    <div class="select">
      <span class="value">Cherry</span>
      <ul class="optList hidden">
        <li class="option">Cherry</li>
        <li class="option">Lemon</li>
        <li class="option">Banana</li>
        <li class="option">Strawberry</li>
        <li class="option">Apple</li>
      </ul>
    </div>
  </form>
</body>
```

Thứ hai, chúng ta cần hai lớp mới để cho phép chúng ta ẩn phần tử không cần thiết: chúng ta ẩn về mặt thị giác điều khiển tùy chỉnh nếu script của chúng ta không chạy, hoặc phần tử {{HTMLElement("select")}} "thực" nếu nó đang chạy. Lưu ý rằng, theo mặc định, mã HTML của chúng ta ẩn điều khiển tùy chỉnh.

```css
.widget select,
.no-widget .select {
  /* This CSS selector basically says:
     - either we have set the body class to "widget" and thus we hide the actual <select> element
     - or we have not changed the body class, therefore the body class is still "no-widget",
       so the elements whose class is "select" must be hidden */
  position: absolute;
  left: -5000em;
  height: 0;
  overflow: hidden;
}
```

CSS này ẩn một trong các phần tử về mặt thị giác, nhưng nó vẫn có sẵn cho trình đọc màn hình.

Bây giờ chúng ta cần một JavaScript switch để xác định xem script có đang chạy hay không. Switch này gồm một vài dòng: nếu vào thời điểm tải trang script của chúng ta đang chạy, nó sẽ xóa lớp `no-widget` và thêm lớp `widget`, do đó hoán đổi khả năng hiển thị của phần tử {{HTMLElement("select")}} và điều khiển tùy chỉnh.

```js
document.body.classList.remove("no-widget");
document.body.classList.add("widget");
```

#### Không có JS

Hãy xem [mã nguồn đầy đủ](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_2#no_js).

```html hidden
<form class="no-widget">
  <select name="myFruit">
    <option>Cherry</option>
    <option>Lemon</option>
    <option>Banana</option>
    <option>Strawberry</option>
    <option>Apple</option>
  </select>

  <div class="select">
    <span class="value">Cherry</span>
    <ul class="optList hidden">
      <li class="option">Cherry</li>
      <li class="option">Lemon</li>
      <li class="option">Banana</li>
      <li class="option">Strawberry</li>
      <li class="option">Apple</li>
    </ul>
  </div>
</form>
```

```css hidden
.widget select,
.no-widget .select {
  position: absolute;
  left: -5000em;
  height: 0;
  overflow: hidden;
}
```

{{EmbedLiveSample("Without_JS",120,130)}}

#### Có JS

Hãy xem [mã nguồn đầy đủ](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_2#js).

```html hidden
<form class="no-widget">
  <select name="myFruit">
    <option>Cherry</option>
    <option>Lemon</option>
    <option>Banana</option>
    <option>Strawberry</option>
    <option>Apple</option>
  </select>

  <div class="select">
    <span class="value">Cherry</span>
    <ul class="optList hidden">
      <li class="option">Cherry</li>
      <li class="option">Lemon</li>
      <li class="option">Banana</li>
      <li class="option">Strawberry</li>
      <li class="option">Apple</li>
    </ul>
  </div>
</form>
```

```css hidden
.widget select,
.no-widget .select {
  position: absolute;
  left: -5000em;
  height: 0;
  overflow: hidden;
}

.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em;
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em;
  width: 10em;

  border: 0.2em solid black;
  border-radius: 0.4em;

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em;
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em;
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

```js hidden
const form = document.querySelector("form");

form.classList.remove("no-widget");
form.classList.add("widget");
```

{{EmbedLiveSample("With_JS",120,130)}}

> [!NOTE]
> Nếu bạn thực sự muốn làm cho mã của mình chung và có thể tái sử dụng, thay vì thực hiện chuyển đổi lớp, tốt hơn nhiều là chỉ thêm lớp widget để ẩn các phần tử {{HTMLElement("select")}}, và động thêm cây DOM đại diện cho điều khiển tùy chỉnh sau mỗi phần tử {{HTMLElement("select")}} trong trang.

### Làm cho công việc dễ dàng hơn

Trong mã chúng ta sắp xây dựng, chúng ta sẽ sử dụng các API JavaScript và DOM tiêu chuẩn để thực hiện tất cả công việc chúng ta cần. Các tính năng chúng ta dự định sử dụng như sau:

1. {{domxref("element.classList","classList")}}
2. {{domxref("EventTarget.addEventListener","addEventListener()")}}
3. {{domxref("NodeList.forEach()")}}
4. {{domxref("element.querySelector","querySelector()")}} và {{domxref("element.querySelectorAll","querySelectorAll()")}}

### Xây dựng callback sự kiện

Công việc cơ bản đã xong. Bây giờ chúng ta có thể bắt đầu xác định tất cả các hàm sẽ được sử dụng mỗi khi người dùng tương tác với điều khiển của chúng ta.

```js
// This function will be used each time we want to deactivate a custom control
// It takes one parameter
// select : the DOM node with the `select` class to deactivate
function deactivateSelect(select) {
  // If the control is not active there is nothing to do
  if (!select.classList.contains("active")) return;

  // We need to get the list of options for the custom control
  const optList = select.querySelector(".optList");

  // We close the list of option
  optList.classList.add("hidden");

  // and we deactivate the custom control itself
  select.classList.remove("active");
}

// This function will be used each time the user wants to activate the control
// (which, in turn, will deactivate other select controls)
// It takes two parameters:
// select : the DOM node with the `select` class to activate
// selectList : the list of all the DOM nodes with the `select` class
function activeSelect(select, selectList) {
  // If the control is already active there is nothing to do
  if (select.classList.contains("active")) return;

  // We have to turn off the active state on all custom controls
  // Because the deactivateSelect function fulfills all the requirements of the
  // forEach callback function, we use it directly without using an intermediate
  // anonymous function.
  selectList.forEach(deactivateSelect);

  // And we turn on the active state for this specific control
  select.classList.add("active");
}

// This function will be used each time the user wants to open/closed the list of options
// It takes one parameter:
// select : the DOM node with the list to toggle
function toggleOptList(select) {
  // The list is kept from the control
  const optList = select.querySelector(".optList");

  // We change the class of the list to show/hide it
  optList.classList.toggle("hidden");
}

// This function will be used each time we need to highlight an option
// It takes two parameters:
// select : the DOM node with the `select` class containing the option to highlight
// option : the DOM node with the `option` class to highlight
function highlightOption(select, option) {
  // We get the list of all option available for our custom select element
  const optionList = select.querySelectorAll(".option");

  // We remove the highlight from all options
  optionList.forEach((other) => {
    other.classList.remove("highlight");
  });

  // We highlight the right option
  option.classList.add("highlight");
}
```

Bạn cần những thứ này để xử lý các trạng thái khác nhau của điều khiển tùy chỉnh.

Tiếp theo, chúng ta liên kết các hàm này với các sự kiện thích hợp:

```js
// We handle the event binding when the document is loaded.
document.addEventListener("DOMContentLoaded", () => {
  const selectList = document.querySelectorAll(".select");

  // Each custom control needs to be initialized
  selectList.forEach((select) => {
    // as well as all its `option` elements
    const optionList = select.querySelectorAll(".option");

    // Each time a user hovers their mouse over an option, we highlight the given option
    optionList.forEach((option) => {
      option.addEventListener("mouseover", () => {
        // Note: the `select` and `option` variable are closures
        // available in the scope of our function call.
        highlightOption(select, option);
      });
    });

    // Each times the user clicks on or taps a custom select element
    select.addEventListener("click", (event) => {
      // Note: the `select` variable is a closure
      // available in the scope of our function call.

      // We toggle the visibility of the list of options
      toggleOptList(select);
    });

    // In case the control gains focus
    // The control gains the focus each time the user clicks on it or each time
    // they use the keyboard to access the control
    select.addEventListener("focus", (event) => {
      // Note: the `select` and `selectList` variable are closures
      // available in the scope of our function call.

      // We activate the control
      activeSelect(select, selectList);
    });

    // In case the control loses focus
    select.addEventListener("blur", (event) => {
      // Note: the `select` variable is a closure
      // available in the scope of our function call.

      // We deactivate the control
      deactivateSelect(select);
    });

    // Loose focus if the user hits `Escape`
    select.addEventListener("keyup", (event) => {
      // deactivate on keyup of `Escape`
      if (event.key === "Escape") {
        deactivateSelect(select);
      }
    });
  });
});
```

Tại thời điểm này, điều khiển của chúng ta sẽ thay đổi trạng thái theo thiết kế của chúng ta, nhưng giá trị của nó vẫn chưa được cập nhật. Chúng ta sẽ xử lý điều đó tiếp theo.

Hãy xem [mã nguồn đầy đủ](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_3).

```html hidden
<form class="no-widget">
  <select name="myFruit" tabindex="-1">
    <option>Cherry</option>
    <option>Lemon</option>
    <option>Banana</option>
    <option>Strawberry</option>
    <option>Apple</option>
  </select>

  <div class="select" tabindex="0">
    <span class="value">Cherry</span>
    <ul class="optList hidden">
      <li class="option">Cherry</li>
      <li class="option">Lemon</li>
      <li class="option">Banana</li>
      <li class="option">Strawberry</li>
      <li class="option">Apple</li>
    </ul>
  </div>
</form>
```

```css hidden
.widget select,
.no-widget .select {
  position: absolute;
  left: -5000em;
  height: 0;
  overflow: hidden;
}

.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em;
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em;
  width: 10em;

  border: 0.2em solid black;
  border-radius: 0.4em;

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em;
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em;
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

```js hidden
function deactivateSelect(select) {
  if (!select.classList.contains("active")) return;

  const optList = select.querySelector(".optList");

  optList.classList.add("hidden");
  select.classList.remove("active");
}

function activeSelect(select, selectList) {
  if (select.classList.contains("active")) return;

  selectList.forEach(deactivateSelect);
  select.classList.add("active");
}

function toggleOptList(select, show) {
  const optList = select.querySelector(".optList");

  optList.classList.toggle("hidden");
}

function highlightOption(select, option) {
  const optionList = select.querySelectorAll(".option");

  optionList.forEach((other) => {
    other.classList.remove("highlight");
  });

  option.classList.add("highlight");
}

const form = document.querySelector("form");

form.classList.remove("no-widget");
form.classList.add("widget");

const selectList = document.querySelectorAll(".select");

selectList.forEach((select) => {
  const optionList = select.querySelectorAll(".option");

  optionList.forEach((option) => {
    option.addEventListener("mouseover", () => {
      highlightOption(select, option);
    });
  });

  select.addEventListener("click", (event) => {
    toggleOptList(select);
  });

  select.addEventListener("focus", (event) => {
    activeSelect(select, selectList);
  });

  select.addEventListener("blur", (event) => {
    deactivateSelect(select);
  });

  select.addEventListener("keyup", (event) => {
    if (event.key === "Escape") {
      deactivateSelect(select);
    }
  });
});
```

{{EmbedLiveSample("Change_states")}}

### Xử lý giá trị điều khiển

Bây giờ điều khiển của chúng ta đang hoạt động, chúng ta phải thêm mã để cập nhật giá trị của nó theo lựa chọn của người dùng và gửi giá trị đó cùng với dữ liệu biểu mẫu.

Để làm điều này, chúng ta sẽ dựa vào phần tử {{HTMLElement("select")}} gốc (nơi giá trị sẽ được gửi đi cùng dữ liệu biểu mẫu). Chúng ta cần hai hàm mới:

```js
// This function updates the displayed value and synchronizes it with the native control.
// It takes two parameters:
// select : the DOM node with the `select` class to update
// index  : the index of the value to be selected
function updateValue(select, index) {
  // We need to get the native control for the given custom control
  // In our example, that native control is a sibling of the custom control
  const nativeWidget = select.previousElementSibling;

  // We also need to get the value placeholder of our custom control
  const value = select.querySelector(".value");

  // And we need the whole list of options
  const optionList = select.querySelectorAll(".option");

  // We set the selected index to our chosen option
  nativeWidget.selectedIndex = index;

  // We update the value placeholder accordingly
  value.textContent = optionList[index].textContent;

  // And we highlight the corresponding option of our custom control
  highlightOption(select, optionList[index]);
}

// This function returns the current selected index in the native control
// It takes one parameter:
// select : the DOM node with the `select` class related to the native control
function getIndex(select) {
  // We need to access the native control for the given custom control
  // In our example, that native control is a sibling of the custom control
  const nativeWidget = select.previousElementSibling;

  return nativeWidget.selectedIndex;
}
```

Với hai hàm này, chúng ta có thể ràng buộc các điều khiển gốc với các điều khiển tùy chỉnh:

```js
// We handle event binding when the document is loaded.
document.addEventListener("DOMContentLoaded", () => {
  const selectList = document.querySelectorAll(".select");

  // Each custom control needs to be initialized
  selectList.forEach((select) => {
    const optionList = select.querySelectorAll(".option");
    const selectedIndex = getIndex(select);

    // We make the custom control focusable
    select.tabIndex = 0;

    // We make the native control no longer focusable
    select.previousElementSibling.tabIndex = -1;

    // We make sure that the default selected value is correctly displayed
    updateValue(select, selectedIndex);

    // Each time a user clicks on an option, we update the value accordingly
    optionList.forEach((option, index) => {
      option.addEventListener("click", (event) => {
        updateValue(select, index);
      });
    });

    // Each time a user uses their keyboard on a focused control, we update the value accordingly
    select.addEventListener("keyup", (event) => {
      let index = getIndex(select);

      // When the user hits the Escape key, deactivate the custom control
      if (event.key === "Escape") {
        deactivateSelect(select);
      }

      // When the user hits the down arrow, we jump to the next option
      if (event.key === "ArrowDown" && index < optionList.length - 1) {
        index++;
        event.preventDefault();
      }

      // When the user hits the up arrow, we jump to the previous option
      if (event.key === "ArrowUp" && index > 0) {
        index--;
        event.preventDefault();
      }

      if (event.key === "Enter" || event.key === " ") {
        toggleOptList(select);
      }

      updateValue(select, index);
    });
  });
});
```

Trong đoạn mã trên, đáng chú ý là việc sử dụng thuộc tính [`tabIndex`](/en-US/docs/Web/API/HTMLElement/tabIndex). Sử dụng thuộc tính này là cần thiết để đảm bảo rằng điều khiển gốc sẽ không bao giờ được tập trung, và để đảm bảo rằng điều khiển tùy chỉnh của chúng ta sẽ được tập trung khi người dùng sử dụng bàn phím hoặc chuột của họ.

Hãy xem [mã nguồn đầy đủ](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_4).

{{EmbedLiveSample("Change_states")}}

### Làm cho nó có thể truy cập được

Chúng ta đã xây dựng một thứ gì đó hoạt động, và mặc dù nó còn xa so với hộp chọn có đầy đủ tính năng, nó hoạt động tốt. Nhưng những gì chúng ta đã làm không hơn gì là nghịch với DOM. Nó không có ngữ nghĩa thực sự, và ngay cả khi nó trông giống như một hộp chọn, từ quan điểm của trình duyệt thì không phải, vì vậy các công nghệ hỗ trợ sẽ không thể hiểu đó là hộp chọn. Nói cách khác, hộp chọn đẹp mới này không thể truy cập được!

May mắn thay, có một giải pháp và nó được gọi là [ARIA](/en-US/docs/Web/Accessibility/ARIA). ARIA là viết tắt của "Ứng dụng Internet Phong phú có thể Truy cập", và đó là [một đặc tả W3C](https://www.w3.org/TR/wai-aria/) được thiết kế đặc biệt cho những gì chúng ta đang làm ở đây: làm cho ứng dụng web và điều khiển tùy chỉnh có thể truy cập được. Về cơ bản, đó là một tập hợp các thuộc tính mở rộng HTML để chúng ta có thể mô tả tốt hơn vai trò, trạng thái và thuộc tính mà chúng ta vừa thiết kế hoặc triển khai. Sử dụng các thuộc tính này rất đơn giản, vì vậy hãy thực hiện.

### Thuộc tính `role`

Thuộc tính chính được sử dụng bởi [ARIA](/en-US/docs/Web/Accessibility/ARIA) là thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques). Thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques) chấp nhận một giá trị xác định mục đích sử dụng của một phần tử. Mỗi role xác định các hành vi và thuộc tính của riêng nó. Trong ví dụ của chúng ta, chúng ta sẽ sử dụng role [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role). Đó là một "role composite", có nghĩa là các phần tử có role đó mong đợi có phần tử con với role cụ thể (trong trường hợp này, ít nhất một phần tử có role `option`).

Cũng đáng chú ý là ARIA xác định các role được áp dụng mặc định cho HTML tiêu chuẩn. Ví dụ: phần tử {{HTMLElement("table")}} khớp với role `grid`, và phần tử {{HTMLElement("ul")}} khớp với role `list`. Vì chúng ta sử dụng phần tử {{HTMLElement("ul")}}, chúng ta muốn đảm bảo role `listbox` của điều khiển của chúng ta sẽ ghi đè role `list` của phần tử {{HTMLElement("ul")}}. Vì vậy, chúng ta sẽ sử dụng role `presentation`. Role này được thiết kế để cho phép chúng ta chỉ ra rằng một phần tử không có ý nghĩa đặc biệt, và chỉ được sử dụng để trình bày thông tin. Chúng ta sẽ áp dụng nó vào phần tử {{HTMLElement("ul")}} của chúng ta.

Để hỗ trợ role `listbox`, chúng ta chỉ cần cập nhật HTML của mình như sau:

```html
<!-- We add the role="listbox" attribute to our top element -->
<div class="select" role="listbox">
  <span class="value">Cherry</span>
  <!-- We also add the role="presentation" to the ul element -->
  <ul class="optList" role="presentation">
    <!-- And we add the role="option" attribute to all the li elements -->
    <li role="option" class="option">Cherry</li>
    <li role="option" class="option">Lemon</li>
    <li role="option" class="option">Banana</li>
    <li role="option" class="option">Strawberry</li>
    <li role="option" class="option">Apple</li>
  </ul>
</div>
```

> [!NOTE]
> Bao gồm cả thuộc tính `role` và thuộc tính `class` là không cần thiết. Thay vì sử dụng `.option`, hãy sử dụng bộ chọn [thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[role="option"]` trong CSS của bạn.

### Thuộc tính `aria-selected`

Sử dụng thuộc tính [`role`](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques) là không đủ. [ARIA](/en-US/docs/Web/Accessibility/ARIA) cũng cung cấp nhiều thuộc tính trạng thái và thuộc tính. Bạn sử dụng chúng càng nhiều và càng tốt, điều khiển của bạn sẽ được hiểu bởi các công nghệ hỗ trợ càng tốt. Trong trường hợp của chúng ta, chúng ta sẽ giới hạn việc sử dụng của mình vào một thuộc tính: `aria-selected`.

Thuộc tính `aria-selected` được sử dụng để đánh dấu tùy chọn nào đang được chọn; điều này cho phép các công nghệ hỗ trợ thông báo cho người dùng biết lựa chọn hiện tại là gì. Chúng ta sẽ sử dụng nó một cách động với JavaScript để đánh dấu tùy chọn được chọn mỗi khi người dùng chọn một. Vì vậy, chúng ta cần sửa lại hàm `updateValue()`:

```js
function updateValue(select, index) {
  const nativeWidget = select.previousElementSibling;
  const value = select.querySelector(".value");
  const optionList = select.querySelectorAll('[role="option"]');

  // We make sure that all the options are not selected
  optionList.forEach((other) => {
    other.setAttribute("aria-selected", "false");
  });

  // We make sure the chosen option is selected
  optionList[index].setAttribute("aria-selected", "true");

  nativeWidget.selectedIndex = index;
  value.textContent = optionList[index].textContent;
  highlightOption(select, optionList[index]);
}
```

Có vẻ đơn giản hơn khi để trình đọc màn hình tập trung vào select ngoài màn hình và bỏ qua select được định kiểu của chúng ta, nhưng đây không phải là giải pháp có thể truy cập. Trình đọc màn hình không giới hạn cho người mù; người có thị lực thấp và thậm chí người có thị lực hoàn hảo cũng sử dụng chúng. Vì lý do này, bạn không thể để trình đọc màn hình tập trung vào một phần tử ngoài màn hình.

Dưới đây là kết quả cuối cùng của tất cả những thay đổi này (bạn sẽ có cảm giác tốt hơn về điều này bằng cách thử với công nghệ hỗ trợ như [NVDA](https://www.nvaccess.org/) hoặc [VoiceOver](https://www.apple.com/accessibility/features/?vision)).

#### Ví dụ trực tiếp

Hãy xem [mã nguồn đầy đủ tại đây](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls/Example_5).

```html hidden
<form class="no-widget">
  <select name="myFruit">
    <option>Cherry</option>
    <option>Lemon</option>
    <option>Banana</option>
    <option>Strawberry</option>
    <option>Apple</option>
  </select>

  <div class="select" role="listbox">
    <span class="value">Cherry</span>
    <ul class="optList hidden" role="presentation">
      <li class="option" role="option" aria-selected="true">Cherry</li>
      <li class="option" role="option">Lemon</li>
      <li class="option" role="option">Banana</li>
      <li class="option" role="option">Strawberry</li>
      <li class="option" role="option">Apple</li>
    </ul>
  </div>
</form>
```

```css hidden
.widget select,
.no-widget .select {
  position: absolute;
  left: -5000em;
  height: 0;
  overflow: hidden;
}

.select {
  position: relative;
  display: inline-block;
}

.select.active,
.select:focus {
  box-shadow: 0 0 3px 1px #227755;
  outline-color: transparent;
}

.select .optList {
  position: absolute;
  top: 100%;
  left: 0;
}

.select .optList.hidden {
  max-height: 0;
  visibility: hidden;
}

.select {
  font-size: 0.625em;
  font-family: "Verdana", "Arial", sans-serif;

  box-sizing: border-box;

  padding: 0.1em 2.5em 0.2em 0.5em;
  width: 10em;

  border: 0.2em solid black;
  border-radius: 0.4em;

  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);

  background: linear-gradient(0deg, #e3e3e3, #fcfcfc 50%, #f0f0f0);
}

.select .value {
  display: inline-block;
  width: 100%;
  overflow: hidden;

  white-space: nowrap;
  text-overflow: ellipsis;
  vertical-align: top;
}

.select::after {
  content: "▼";
  position: absolute;
  z-index: 1;
  height: 100%;
  width: 2em;
  top: 0;
  right: 0;

  padding-top: 0.1em;

  box-sizing: border-box;

  text-align: center;

  border-left: 0.2em solid black;
  border-radius: 0 0.1em 0.1em 0;

  background-color: black;
  color: white;
}

.select .optList {
  z-index: 2;

  list-style: none;
  margin: 0;
  padding: 0;

  background: #f0f0f0;
  border: 0.2em solid black;
  border-top-width: 0.1em;
  border-radius: 0 0 0.4em 0.4em;

  box-shadow: 0 0.2em 0.4em rgb(0 0 0 / 40%);

  box-sizing: border-box;

  min-width: 100%;
  max-height: 10em;
  overflow-y: auto;
  overflow-x: hidden;
}

.select .option {
  padding: 0.2em 0.3em;
}

.select .highlight {
  background: black;
  color: white;
}
```

```js hidden
function deactivateSelect(select) {
  if (!select.classList.contains("active")) return;

  const optList = select.querySelector(".optList");

  optList.classList.add("hidden");
  select.classList.remove("active");
}

function activeSelect(select, selectList) {
  if (select.classList.contains("active")) return;

  selectList.forEach(deactivateSelect);
  select.classList.add("active");
}

function toggleOptList(select, show) {
  const optList = select.querySelector(".optList");

  optList.classList.toggle("hidden");
}

function highlightOption(select, option) {
  const optionList = select.querySelectorAll(".option");

  optionList.forEach((other) => {
    other.classList.remove("highlight");
  });

  option.classList.add("highlight");
}

function updateValue(select, index) {
  const nativeWidget = select.previousElementSibling;
  const value = select.querySelector(".value");
  const optionList = select.querySelectorAll('[role="option"]');

  optionList.forEach((other) => {
    other.setAttribute("aria-selected", "false");
  });

  optionList[index].setAttribute("aria-selected", "true");

  nativeWidget.selectedIndex = index;
  value.textContent = optionList[index].textContent;
  highlightOption(select, optionList[index]);
}

function getIndex(select) {
  const nativeWidget = select.previousElementSibling;

  return nativeWidget.selectedIndex;
}

const form = document.querySelector("form");

form.classList.remove("no-widget");
form.classList.add("widget");

const selectList = document.querySelectorAll(".select");

selectList.forEach((select) => {
  const optionList = select.querySelectorAll(".option");
  const selectedIndex = getIndex(select);

  select.tabIndex = 0;
  select.previousElementSibling.tabIndex = -1;

  updateValue(select, selectedIndex);

  optionList.forEach((option, index) => {
    option.addEventListener("mouseover", () => {
      highlightOption(select, option);
    });

    option.addEventListener("click", (event) => {
      updateValue(select, index);
    });
  });

  select.addEventListener("click", (event) => {
    toggleOptList(select);
  });

  select.addEventListener("focus", (event) => {
    activeSelect(select, selectList);
  });

  select.addEventListener("blur", (event) => {
    deactivateSelect(select);
  });

  select.addEventListener("keyup", (event) => {
    let index = getIndex(select);

    if (event.key === "Escape") {
      deactivateSelect(select);
    }
    if (event.key === "ArrowDown" && index < optionList.length - 1) {
      index++;
    }
    if (event.key === "ArrowUp" && index > 0) {
      index--;
    }

    updateValue(select, index);
  });
});
```

{{EmbedLiveSample("live_example_3",120,130)}}

Nếu bạn muốn tiến lên, mã trong ví dụ này cần được cải thiện một số trước khi nó trở nên chung và có thể tái sử dụng. Đây là bài tập bạn có thể cố gắng thực hiện. Hai gợi ý để giúp bạn: đối số đầu tiên cho tất cả các hàm của chúng ta là giống nhau, có nghĩa là các hàm đó cần cùng ngữ cảnh. Xây dựng một đối tượng để chia sẻ ngữ cảnh đó sẽ là khôn ngoan.

## Phương pháp thay thế: Sử dụng nút radio

Trong ví dụ trên, chúng ta đã tái tạo một phần tử {{htmlelement('select')}} sử dụng HTML không có ngữ nghĩa, CSS và JavaScript. Select này đang chọn một tùy chọn từ một số lượng tùy chọn hạn chế, đây là chức năng tương tự của một nhóm nút {{htmlelement('input/radio', 'radio')}} cùng tên.

Do đó chúng ta có thể tái tạo điều này bằng cách sử dụng nút radio thay thế; hãy xem xét tùy chọn này.

Chúng ta có thể bắt đầu với một danh sách không có thứ tự hoàn toàn có ngữ nghĩa, có thể truy cập với các nút {{htmlelement('input/radio','radio')}} với {{htmlelement('label')}} liên quan, gán nhãn toàn bộ nhóm với cặp {{htmlelement('fieldset')}} và {{htmlelement('legend')}} thích hợp về mặt ngữ nghĩa.

```html
<fieldset>
  <legend>Pick a fruit</legend>
  <ul class="styledSelect">
    <li>
      <input
        type="radio"
        name="fruit"
        value="Cherry"
        id="fruitCherry"
        checked />
      <label for="fruitCherry">Cherry</label>
    </li>
    <li>
      <input type="radio" name="fruit" value="Lemon" id="fruitLemon" />
      <label for="fruitLemon">Lemon</label>
    </li>
    <li>
      <input type="radio" name="fruit" value="Banana" id="fruitBanana" />
      <label for="fruitBanana">Banana</label>
    </li>
    <li>
      <input
        type="radio"
        name="fruit"
        value="Strawberry"
        id="fruitStrawberry" />
      <label for="fruitStrawberry">Strawberry</label>
    </li>
    <li>
      <input type="radio" name="fruit" value="Apple" id="fruitApple" />
      <label for="fruitApple">Apple</label>
    </li>
  </ul>
</fieldset>
```

Chúng ta sẽ tạo một chút kiểu cho danh sách nút radio (không phải legend/fieldset) để làm cho nó trông giống như ví dụ trước, chỉ để cho thấy nó có thể được thực hiện:

```css
.styledSelect {
  display: inline-block;
  padding: 0;
}
.styledSelect li {
  list-style-type: none;
  padding: 0;
  display: flex;
}
.styledSelect [type="radio"] {
  position: absolute;
  left: -100vw;
  top: -100vh;
}
.styledSelect label {
  margin: 0;
  line-height: 2;
  padding-left: 4px;
}
.styledSelect:not(:focus-within) input:not(:checked) + label {
  height: 0;
  outline-color: transparent;
  overflow: hidden;
}
.styledSelect:not(:focus-within) input:checked + label {
  border: 0.2em solid black;
  border-radius: 0.4em;
  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);
}
.styledSelect:not(:focus-within) input:checked + label::after {
  content: "▼";
  background: black;
  float: right;
  color: white;
  padding: 0 4px;
  margin: 0 -4px 0 4px;
}
.styledSelect:focus-within {
  border: 0.2em solid black;
  border-radius: 0.4em;
  box-shadow: 0 0.1em 0.2em rgb(0 0 0 / 45%);
}
.styledSelect:focus-within input:checked + label {
  background-color: #333333;
  color: white;
  width: 100%;
}
```

Không cần JavaScript, và chỉ với một chút CSS, chúng ta có thể tạo kiểu cho danh sách nút radio để chỉ hiển thị mục được chọn. Khi tiêu điểm ở trong `<ul>` trong `<fieldset>`, danh sách mở ra, và các mũi tên lên và xuống (và trái và phải) hoạt động để chọn mục trước và tiếp theo. Hãy thử:

{{EmbedLiveSample("An_alternative_approach_Using_radio_buttons",200,240)}}

Điều này hoạt động, ở một mức độ nào đó, mà không cần JavaScript. Chúng ta đã tạo ra một điều khiển tương tự như điều khiển tùy chỉnh của chúng ta, hoạt động ngay cả khi JavaScript thất bại. Trông có vẻ là một giải pháp tuyệt vời, phải không? Vâng, không phải 100%. Nó hoạt động với bàn phím, nhưng không như mong đợi với nhấp chuột. Có vẻ như hợp lý hơn khi sử dụng tiêu chuẩn web làm cơ sở cho các điều khiển tùy chỉnh thay vì dựa vào các framework để tạo các phần tử không có ngữ nghĩa gốc. Tuy nhiên, điều khiển của chúng ta không có cùng chức năng mà `<select>` có theo mặc định.

Về mặt tích cực, điều khiển này hoàn toàn có thể truy cập bởi trình đọc màn hình và hoàn toàn có thể điều hướng qua bàn phím. Tuy nhiên, điều khiển này không phải là sự thay thế {{htmlelement('select')}}. Có chức năng khác biệt và/hoặc còn thiếu. Ví dụ: tất cả bốn mũi tên điều hướng qua các tùy chọn, nhưng nhấp vào mũi tên xuống khi người dùng đang ở nút cuối cùng sẽ đưa họ đến nút đầu tiên; nó không dừng ở đầu và cuối của danh sách tùy chọn như `<select>` làm.

Chúng ta sẽ để việc thêm chức năng còn thiếu này như một bài tập cho người đọc.

## Kết luận

Chúng ta đã xem tất cả các kiến thức cơ bản về xây dựng một điều khiển biểu mẫu tùy chỉnh, nhưng như bạn có thể thấy, việc thực hiện điều này không đơn giản. Trước khi tạo điều khiển tùy chỉnh của riêng bạn, hãy xem xét liệu HTML có cung cấp các phần tử thay thế có thể được sử dụng để hỗ trợ đầy đủ các yêu cầu của bạn hay không. Nếu bạn thực sự cần tạo một điều khiển tùy chỉnh, thường dễ dàng hơn là dựa vào các thư viện bên thứ ba thay vì tự xây dựng. Nhưng, nếu bạn tạo điều khiển của riêng mình, sửa đổi các phần tử hiện có, hoặc sử dụng một framework để triển khai một điều khiển được lấy sẵn, hãy nhớ rằng việc tạo một điều khiển biểu mẫu có thể sử dụng và có thể truy cập được phức tạp hơn vẻ ngoài của nó.

Đây là một số thư viện bạn nên xem xét trước khi viết mã của riêng bạn:

- [jQuery UI](https://jqueryui.com/)
- [AXE accessible custom select dropdowns](https://www.webaxe.org/accessible-custom-select-dropdowns/)
- [msDropDown](https://github.com/marghoobsuleman/ms-Dropdown)

Nếu bạn tạo các điều khiển thay thế thông qua nút radio, JavaScript của riêng bạn, hoặc với một thư viện bên thứ ba, hãy đảm bảo nó có thể truy cập và ổn định về tính năng; đó là, nó cần có thể hoạt động tốt hơn với nhiều trình duyệt khác nhau mà khả năng tương thích với các tiêu chuẩn Web họ sử dụng khác nhau. Chúc vui vẻ!
