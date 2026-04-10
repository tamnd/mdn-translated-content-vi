---
title: "EventTarget: phương thức addEventListener()"
short-title: addEventListener()
slug: Web/API/EventTarget/addEventListener
page-type: web-api-instance-method
browser-compat: api.EventTarget.addEventListener
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`addEventListener()`** của giao diện {{domxref("EventTarget")}}
thiết lập một hàm sẽ được gọi bất cứ khi nào sự kiện được chỉ định được gửi tới đích.

Các đích phổ biến là {{domxref("Element")}}, hoặc các phần tử con của nó, {{domxref("Document")}} và {{domxref("Window")}},
nhưng đích có thể là bất kỳ đối tượng nào hỗ trợ sự kiện, chẳng hạn như {{domxref("IDBRequest")}}.

> [!NOTE]
> Phương thức `addEventListener()` là cách _được khuyến nghị_ để đăng ký một bộ lắng nghe sự kiện. Lợi ích như sau:
>
> - Nó cho phép thêm nhiều hơn một bộ xử lý cho một sự kiện. Điều này đặc biệt hữu ích cho thư viện, mô-đun JavaScript, hoặc bất kỳ loại mã nào khác cần hoạt động tốt với các thư viện hay tiện ích mở rộng khác.
> - Trái với việc dùng thuộc tính `onXYZ`, nó cho bạn khả năng kiểm soát chi tiết hơn về pha khi bộ lắng nghe được kích hoạt (capture so với bubbling).
> - Nó hoạt động trên mọi đích sự kiện, không chỉ phần tử HTML hay SVG.

Phương thức `addEventListener()` hoạt động bằng cách thêm một hàm, hoặc một đối tượng triển khai hàm `handleEvent()`, vào danh sách các bộ lắng nghe sự kiện cho kiểu sự kiện được chỉ định trên {{domxref("EventTarget")}} mà nó được gọi trên đó. Nếu hàm hoặc đối tượng đó đã có trong danh sách bộ lắng nghe của đích này, thì nó sẽ không được thêm lần thứ hai.

> [!NOTE]
> Nếu một hàm ẩn danh cụ thể đã có trong danh sách các bộ lắng nghe được đăng ký cho một đích nhất định, và sau đó ở đoạn mã sau lại truyền vào một hàm ẩn danh giống hệt trong lệnh gọi `addEventListener`, thì hàm thứ hai _cũng_ sẽ được thêm vào danh sách bộ lắng nghe của đích đó.
>
> Thực tế, các hàm ẩn danh không hề giống hệt nhau ngay cả khi được định nghĩa bằng
> cùng một mã nguồn không đổi, **kể cả trong vòng lặp**.
>
> Việc định nghĩa lặp lại cùng một hàm vô danh trong các trường hợp như vậy có thể
> gây ra vấn đề. (Xem [Vấn đề bộ nhớ](#memory_issues) bên dưới.)

Nếu một bộ lắng nghe sự kiện được thêm vào một {{domxref("EventTarget")}} từ bên trong một bộ lắng nghe khác —
tức là trong lúc sự kiện đang được xử lý —
thì sự kiện đó sẽ không kích hoạt bộ lắng nghe mới.
Tuy nhiên, bộ lắng nghe mới có thể được kích hoạt ở một giai đoạn sau của luồng sự kiện,
chẳng hạn trong pha bubbling.

## Cú pháp

```js-nolint
addEventListener(type, listener)
addEventListener(type, listener, options)
addEventListener(type, listener, useCapture)
```

### Tham số

- `type`
  - : Một chuỗi phân biệt hoa thường đại diện cho [kiểu sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events) cần lắng nghe.
- `listener`
  - : Đối tượng nhận thông báo (một đối tượng triển khai giao diện {{domxref("Event")}}) khi một sự kiện thuộc kiểu đã chỉ định xảy ra. Giá trị này phải là `null`, một đối tượng có phương thức `handleEvent()`, hoặc một [hàm JavaScript](/en-US/docs/Web/JavaScript/Guide/Functions). Xem [Callback của bộ lắng nghe sự kiện](#the_event_listener_callback) để biết chi tiết về callback này.
- `options` {{optional_inline}}
  - : Một đối tượng chỉ định các đặc điểm của bộ lắng nghe sự kiện. Các tùy chọn có sẵn là:
    - `capture` {{optional_inline}}
      - : Một giá trị boolean cho biết các sự kiện thuộc kiểu này sẽ được gửi tới `listener` đã đăng ký trước khi được gửi tới bất kỳ `EventTarget` nào nằm bên dưới nó trong cây DOM. Nếu không chỉ định, mặc định là `false`.
    - `once` {{optional_inline}}
      - : Một giá trị boolean cho biết `listener`
        chỉ nên được gọi nhiều nhất một lần sau khi được thêm vào. Nếu là `true`, `listener` sẽ tự động bị xóa khi được gọi. Nếu không chỉ định, mặc định là `false`.
    - `passive` {{optional_inline}}
      - : Một giá trị boolean mà nếu là `true` sẽ cho biết hàm do `listener` chỉ định sẽ không bao giờ gọi {{domxref("Event.preventDefault", "preventDefault()")}}. Nếu một bộ lắng nghe thụ động gọi `preventDefault()`, sẽ không có gì xảy ra và có thể xuất hiện cảnh báo trên bảng điều khiển.

        Nếu tùy chọn này không được chỉ định, nó mặc định là `false` - ngoại trừ trong các trình duyệt không phải Safari, nó mặc định là `true` đối với các sự kiện {{domxref("Element/wheel_event", "wheel")}}, {{domxref("Element/mousewheel_event", "mousewheel")}}, {{domxref("Element/touchstart_event", "touchstart")}} và {{domxref("Element/touchmove_event", "touchmove")}}. Xem [Sử dụng các bộ lắng nghe thụ động](#using_passive_listeners) để tìm hiểu thêm.

    - `signal` {{optional_inline}}
      - : Một {{domxref("AbortSignal")}}. Bộ lắng nghe sẽ bị xóa khi phương thức {{domxref("AbortController/abort()", "abort()")}} của {{domxref("AbortController")}} sở hữu `AbortSignal` được gọi. Nếu không chỉ định, sẽ không có `AbortSignal` nào được liên kết với bộ lắng nghe.

- `useCapture` {{optional_inline}}
  - : Một giá trị boolean cho biết các sự kiện thuộc kiểu này sẽ được gửi tới
    `listener` đã đăng ký _trước khi_ được gửi tới
    bất kỳ `EventTarget` nào nằm bên dưới nó trong cây DOM hay không. Các sự kiện đang bubbling
    đi lên qua cây sẽ không kích hoạt bộ lắng nghe được chỉ định dùng capture. Việc bubbling và capture sự kiện là hai cách truyền sự kiện xảy ra trong một phần tử
    nằm lồng bên trong phần tử khác, khi cả hai phần tử đều đã đăng ký một trình xử lý
    cho sự kiện đó. Chế độ truyền sự kiện quyết định thứ tự mà các phần tử nhận
    sự kiện. Xem [đặc tả DOM](https://dom.spec.whatwg.org/#introduction-to-dom-events) và [thứ tự sự kiện JavaScript](https://www.quirksmode.org/js/events_order.html#link4) để biết giải thích chi tiết.
    Nếu không chỉ định, `useCapture` mặc định là `false`.

    > [!NOTE]
    > Đối với các bộ lắng nghe sự kiện gắn vào đích sự kiện, sự kiện đang ở pha target, thay vì các pha capturing và bubbling.
    > Các bộ lắng nghe trong pha _capturing_ được gọi trước các bộ lắng nghe sự kiện trong pha target và bubbling.

- `wantsUntrusted` {{optional_inline}} {{non-standard_inline}}
  - : Một tham số đặc thù của Firefox (Gecko). Nếu là `true`, bộ lắng nghe sẽ nhận
    các sự kiện tổng hợp được gửi bởi nội dung web (mặc định là `false` đối với
    {{glossary("chrome")}} của trình duyệt và `true` đối với các trang web thông thường). Tham số này hữu ích cho mã trong các tiện ích mở rộng, cũng như chính trình duyệt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ghi chú sử dụng

### Callback của bộ lắng nghe sự kiện

Bộ lắng nghe sự kiện có thể được chỉ định là một hàm callback hoặc
một đối tượng mà phương thức `handleEvent()` của nó đóng vai trò là hàm callback.

Bản thân hàm callback có cùng tham số và giá trị trả về như phương thức
`handleEvent()`; tức là callback nhận một tham số duy nhất:
một đối tượng dựa trên {{domxref("Event")}} mô tả sự kiện đã xảy ra, và
nó không trả về gì.

Ví dụ, một callback xử lý sự kiện có thể dùng cho cả
{{domxref("Element/fullscreenchange_event", "fullscreenchange")}} và
{{domxref("Element/fullscreenerror_event", "fullscreenerror")}} có thể trông như sau:

```js
function handleEvent(event) {
  if (event.type === "fullscreenchange") {
    /* xử lý chuyển đổi chế độ toàn màn hình */
  } else {
    /* xử lý lỗi chuyển đổi chế độ toàn màn hình */
  }
}
```

### Giá trị của "this" trong bộ xử lý

Thường sẽ hữu ích khi tham chiếu đến phần tử mà bộ xử lý sự kiện được kích hoạt trên đó,
chẳng hạn khi dùng một bộ xử lý chung cho một nhóm phần tử tương tự.

Khi gắn một hàm xử lý vào một phần tử bằng `addEventListener()`,
giá trị của {{jsxref("Operators/this","this")}} bên trong bộ xử lý sẽ là một tham chiếu tới
phần tử đó. Nó sẽ giống với giá trị của thuộc tính `currentTarget`
của đối số sự kiện được truyền vào bộ xử lý.

```js
myElement.addEventListener("click", function (e) {
  console.log(this.className); // ghi lại className của myElement
  console.log(e.currentTarget === this); // ghi lại `true`
});
```

Nhắc lại rằng, [hàm mũi tên không có ngữ cảnh `this` riêng](/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#cannot_be_used_as_methods).

```js
myElement.addEventListener("click", (e) => {
  console.log(this.className); // CẢNH BÁO: `this` không phải là `myElement`
  console.log(e.currentTarget === this); // ghi lại `false`
});
```

Nếu một bộ xử lý sự kiện (ví dụ, {{domxref("Element.click_event", "onclick")}}) được chỉ định trên một phần tử trong mã nguồn HTML, mã JavaScript trong giá trị thuộc tính sẽ thực tế được bọc trong một hàm xử lý ràng buộc giá trị của `this` theo cách nhất quán với `addEventListener()`; một lần xuất hiện của `this` bên trong mã đại diện cho một tham chiếu tới phần tử đó.

```html
<table id="my-table" onclick="console.log(this.id);">
  <!-- `this` tham chiếu đến bảng; ghi lại 'my-table' -->
  …
</table>
```

Lưu ý rằng giá trị của `this` bên trong một hàm, _được gọi bởi_ mã
trong giá trị thuộc tính, sẽ hoạt động theo [quy tắc chuẩn](/en-US/docs/Web/JavaScript/Reference/Operators/this). Điều này
được minh họa trong ví dụ sau:

```html
<script>
  function logID() {
    console.log(this.id);
  }
</script>
<table id="my-table" onclick="logID();">
  <!-- khi được gọi, `this` sẽ tham chiếu tới đối tượng toàn cục -->
  …
</table>
```

Giá trị của `this` trong `logID()` là một tham chiếu tới đối tượng toàn cục
{{domxref("Window")}} (hoặc `undefined` trong trường hợp [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode)).

#### Chỉ định "this" bằng `bind()`

Phương thức {{jsxref("Function.prototype.bind()")}} cho phép bạn thiết lập một ngữ cảnh
`this` cố định cho tất cả các lần gọi tiếp theo - giúp tránh các vấn đề khi không rõ `this` sẽ là gì, tùy vào ngữ cảnh từ đó hàm của bạn được gọi. Tuy nhiên, lưu ý rằng bạn sẽ cần giữ lại
một tham chiếu đến bộ lắng nghe để có thể gỡ nó sau này.

Đây là một ví dụ có và không có `bind()`:

```js
class Something {
  name = "Something Good";
  constructor(element) {
    // Lưu ý rằng các bộ lắng nghe trong trường hợp này là `this`, không phải `this.handleEvent`
    element.addEventListener("click", this);
    element.addEventListener("dblclick", this);
  }
  handleEvent(event) {
    console.log(this.name); // 'Something Good', vì this được ràng buộc với đối tượng mới tạo
    switch (event.type) {
      case "click":
        // một số mã ở đây…
        break;
      case "dblclick":
        // một số mã ở đây…
        break;
    }
  }
}

const s = new Something(document.body);
```

Một cách khác để xử lý tham chiếu đến `this` là dùng hàm mũi tên, vì nó không tạo ra ngữ cảnh `this` riêng.

```js
class SomeClass {
  name = "Something Good";

  register() {
    window.addEventListener("keydown", (e) => {
      this.someMethod(e);
    });
  }

  someMethod(e) {
    console.log(this.name);
    switch (e.code) {
      case "ArrowUp":
        // một số mã ở đây…
        break;
      case "ArrowDown":
        // một số mã ở đây…
        break;
    }
  }
}

const myObject = new SomeClass();
myObject.register();
```

### Đưa dữ liệu vào và ra khỏi bộ lắng nghe sự kiện

Bộ lắng nghe sự kiện chỉ nhận một đối số,
một {{domxref("Event")}} hoặc lớp con của `Event`,
được tự động truyền vào bộ lắng nghe, và giá trị trả về sẽ bị bỏ qua.
Vì vậy, để đưa dữ liệu vào và ra khỏi bộ lắng nghe sự kiện, thay vì truyền dữ liệu qua tham số và giá trị trả về, bạn cần tạo [closure](/en-US/docs/Web/JavaScript/Guide/Closures) thay thế.

Các hàm được truyền làm bộ lắng nghe sự kiện có quyền truy cập vào mọi biến được khai báo trong các phạm vi bên ngoài chứa hàm đó.

```js
const myButton = document.getElementById("my-button-id");
let someString = "Data";

myButton.addEventListener("click", () => {
  console.log(someString);
  // 'Data' ở lần nhấp đầu tiên,
  // 'Data Again' ở lần nhấp thứ hai

  someString = "Data Again";
});

console.log(someString); // Giá trị mong đợi: 'Data' (sẽ không bao giờ xuất ra 'Data Again')
```

Đọc [hướng dẫn về hàm](/en-US/docs/Web/JavaScript/Guide/Functions#function_scopes_and_closures) để biết thêm về phạm vi hàm.

### Vấn đề bộ nhớ

```js
const elems = document.getElementsByTagName("*");

// Trường hợp 1
for (const elem of elems) {
  elem.addEventListener("click", (e) => {
    // Thực hiện điều gì đó
  });
}

// Trường hợp 2
function processEvent(e) {
  // Thực hiện điều gì đó
}

for (const elem of elems) {
  elem.addEventListener("click", processEvent);
}
```

Trong trường hợp đầu tiên ở trên, một hàm xử lý (ẩn danh) mới được tạo ra ở mỗi
vòng lặp. Trong trường hợp thứ hai, cùng một hàm đã được khai báo trước đó được dùng
làm bộ xử lý sự kiện, nhờ đó mức tiêu thụ bộ nhớ thấp hơn vì chỉ có
một hàm xử lý được tạo ra. Hơn nữa, trong trường hợp đầu tiên, không thể gọi
{{domxref("EventTarget.removeEventListener", "removeEventListener()")}} vì không có
tham chiếu nào được giữ tới hàm ẩn danh (hoặc ở đây là không giữ tới bất kỳ hàm ẩn danh nào trong số nhiều
hàm ẩn danh mà vòng lặp có thể tạo ra). Trong trường hợp thứ hai, có thể gọi
`myElement.removeEventListener("click", processEvent, false)`
vì `processEvent` là tham chiếu hàm.

Thực ra, xét về tiêu thụ bộ nhớ, việc không giữ tham chiếu hàm không phải
vấn đề thật sự; đúng hơn, vấn đề là không giữ một tham chiếu hàm _tĩnh_.

### Sử dụng bộ lắng nghe thụ động

Nếu một sự kiện có hành động mặc định - ví dụ, sự kiện {{domxref("Element/wheel_event", "wheel")}} mặc định cuộn container - thì về cơ bản trình duyệt không thể bắt đầu hành động mặc định cho tới khi bộ lắng nghe sự kiện kết thúc, vì nó không biết trước liệu bộ lắng nghe có thể hủy hành động mặc định bằng cách gọi {{domxref("Event.preventDefault()")}} hay không. Nếu bộ lắng nghe sự kiện thực thi quá lâu, điều này có thể gây ra độ trễ đáng chú ý, còn được gọi là {{glossary("jank")}}, trước khi hành động mặc định có thể được thực thi.

Bằng cách đặt tùy chọn `passive` thành `true`, bộ lắng nghe sự kiện sẽ tuyên bố rằng nó sẽ không hủy hành động mặc định, vì vậy trình duyệt có thể bắt đầu hành động mặc định ngay lập tức mà không cần đợi bộ lắng nghe hoàn tất. Nếu bộ lắng nghe vẫn gọi {{domxref("Event.preventDefault()")}}, điều đó sẽ không có tác dụng.

Đặc tả của `addEventListener()` xác định giá trị mặc định của tùy chọn `passive` luôn là `false`. Tuy nhiên, để tận dụng lợi ích hiệu năng cuộn của bộ lắng nghe thụ động trong mã cũ, các trình duyệt hiện đại đã thay đổi giá trị mặc định của `passive` thành `true` cho các sự kiện {{domxref("Element/wheel_event", "wheel")}}, {{domxref("Element/mousewheel_event", "mousewheel")}}, {{domxref("Element/touchstart_event", "touchstart")}} và {{domxref("Element/touchmove_event", "touchmove")}} trên các nút cấp tài liệu {{domxref("Window")}}, {{domxref("Document")}}, và {{domxref("Document.body")}}. Điều đó ngăn bộ lắng nghe sự kiện [hủy sự kiện](/en-US/docs/Web/API/Event/preventDefault), nên nó không thể chặn việc hiển thị trang trong khi người dùng đang cuộn.

Vì vậy, khi bạn muốn ghi đè hành vi đó và đảm bảo tùy chọn `passive` là `false`, bạn phải đặt rõ tùy chọn này thành `false` (thay vì dựa vào giá trị mặc định).

Bạn không cần lo lắng về giá trị của `passive` đối với sự kiện {{domxref("Element/scroll_event", "scroll")}} cơ bản.
Vì nó không thể bị hủy, các bộ lắng nghe sự kiện cũng không thể chặn việc hiển thị trang.

Xem [Cải thiện hiệu năng cuộn bằng bộ lắng nghe thụ động](#improving_scroll_performance_using_passive_listeners) để xem ví dụ thể hiện tác động của bộ lắng nghe thụ động.

## Ví dụ

### Thêm một bộ lắng nghe đơn giản

Ví dụ này minh họa cách dùng `addEventListener()` để theo dõi các cú
nhấp chuột trên một phần tử.

#### HTML

```html
<table id="outside">
  <tbody>
    <tr>
      <td id="t1">one</td>
    </tr>
    <tr>
      <td id="t2">two</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

```js
// Hàm thay đổi nội dung của t2
function modifyText() {
  const t2 = document.getElementById("t2");
  const isNodeThree = t2.firstChild.nodeValue === "three";
  t2.firstChild.nodeValue = isNodeThree ? "two" : "three";
}

// Thêm bộ lắng nghe sự kiện vào bảng
const el = document.getElementById("outside");
el.addEventListener("click", modifyText);
```

Trong đoạn mã này, `modifyText()` là bộ lắng nghe cho các sự kiện `click`
được đăng ký bằng `addEventListener()`. Một cú nhấp ở bất kỳ vị trí nào trong bảng đều sẽ bubble
lên tới bộ xử lý và chạy `modifyText()`.

#### Kết quả

{{EmbedLiveSample('Add_a_simple_listener')}}

### Thêm một bộ lắng nghe có thể hủy

Ví dụ này minh họa cách thêm một `addEventListener()` có thể bị hủy bằng {{domxref("AbortSignal")}}.

#### HTML

```html
<table id="outside">
  <tbody>
    <tr>
      <td id="t1">one</td>
    </tr>
    <tr>
      <td id="t2">two</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

```js
// Thêm một bộ lắng nghe sự kiện có thể hủy vào bảng
const controller = new AbortController();
const el = document.getElementById("outside");
el.addEventListener("click", modifyText, { signal: controller.signal });

// Hàm thay đổi nội dung của t2
function modifyText() {
  const t2 = document.getElementById("t2");
  if (t2.firstChild.nodeValue === "three") {
    t2.firstChild.nodeValue = "two";
  } else {
    t2.firstChild.nodeValue = "three";
    controller.abort(); // xóa bộ lắng nghe sau khi giá trị đạt tới "three"
  }
}
```

Trong ví dụ trên, chúng ta sửa đổi đoạn mã ở ví dụ trước để sau khi nội dung của hàng thứ hai đổi thành "three", chúng ta gọi `abort()` từ {{domxref("AbortController")}} đã truyền vào lời gọi `addEventListener()`. Điều đó khiến giá trị ở lại "three" mãi mãi vì chúng ta không còn đoạn mã nào lắng nghe sự kiện click nữa.

#### Kết quả

{{EmbedLiveSample('Add_an_abortable_listener')}}

### Bộ lắng nghe sự kiện với hàm ẩn danh

Ở đây, chúng ta xem cách dùng một hàm ẩn danh để truyền tham số vào bộ
lắng nghe sự kiện.

#### HTML

```html
<table id="outside">
  <tbody>
    <tr>
      <td id="t1">one</td>
    </tr>
    <tr>
      <td id="t2">two</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

```js
// Hàm thay đổi nội dung của t2
function modifyText(newText) {
  const t2 = document.getElementById("t2");
  t2.firstChild.nodeValue = newText;
}

// Hàm thêm bộ lắng nghe sự kiện vào bảng
const el = document.getElementById("outside");
el.addEventListener("click", function () {
  modifyText("four");
});
```

Lưu ý rằng bộ lắng nghe là một hàm ẩn danh bao bọc đoạn mã, rồi từ đó
truyền tham số cho hàm `modifyText()`, hàm chịu trách nhiệm phản hồi sự kiện thực sự.

#### Kết quả

{{EmbedLiveSample('Event_listener_with_anonymous_function')}}

### Bộ lắng nghe sự kiện với hàm mũi tên

Ví dụ này minh họa một bộ lắng nghe sự kiện được triển khai bằng ký pháp
hàm mũi tên.

#### HTML

```html
<table id="outside">
  <tbody>
    <tr>
      <td id="t1">one</td>
    </tr>
    <tr>
      <td id="t2">two</td>
    </tr>
  </tbody>
</table>
```

#### JavaScript

```js
// Hàm thay đổi nội dung của t2
function modifyText(newText) {
  const t2 = document.getElementById("t2");
  t2.firstChild.nodeValue = newText;
}

// Thêm bộ lắng nghe sự kiện vào bảng bằng hàm mũi tên
const el = document.getElementById("outside");
el.addEventListener("click", () => {
  modifyText("four");
});
```

#### Kết quả

{{EmbedLiveSample('Event_listener_with_an_arrow_function')}}

Xin lưu ý rằng mặc dù các hàm ẩn danh và hàm mũi tên có điểm giống nhau, chúng có các ràng buộc `this` khác nhau. Trong khi các hàm ẩn danh (và mọi hàm JavaScript truyền thống)
tạo ra các ràng buộc `this` riêng của chúng, thì các hàm mũi tên kế thừa
ràng buộc `this` của hàm bao quanh.

Điều đó có nghĩa là các biến và hằng số có sẵn cho hàm bao quanh
cũng có sẵn cho bộ xử lý sự kiện khi dùng hàm mũi tên.

### Ví dụ sử dụng các tùy chọn

#### HTML

```html
<div class="outer">
  outer, once & none-once
  <div class="middle" target="_blank">
    middle, capture & none-capture
    <a class="inner1" href="https://www.mozilla.org" target="_blank">
      inner1, passive & preventDefault(which is not allowed)
    </a>
    <a class="inner2" href="https://developer.mozilla.org/" target="_blank">
      inner2, none-passive & preventDefault(not open new page)
    </a>
  </div>
</div>
<hr />
<button class="clear-button">Clear logs</button>
<section class="demo-logs"></section>
```

#### CSS

```css
.outer,
.middle,
.inner1,
.inner2 {
  display: block;
  width: 520px;
  padding: 15px;
  margin: 15px;
  text-decoration: none;
}
.outer {
  border: 1px solid red;
  color: red;
}
.middle {
  border: 1px solid green;
  color: green;
  width: 460px;
}
.inner1,
.inner2 {
  border: 1px solid purple;
  color: purple;
  width: 400px;
}
```

```css hidden
.demo-logs {
  width: 530px;
  height: 16rem;
  background-color: #dddddd;
  overflow-x: auto;
  padding: 1rem;
}
```

#### JavaScript

```js hidden
const clearBtn = document.querySelector(".clear-button");
const demoLogs = document.querySelector(".demo-logs");

function log(msg) {
  demoLogs.innerText += `${msg}\n`;
}

clearBtn.addEventListener("click", () => {
  demoLogs.innerText = "";
});
```

```js
const outer = document.querySelector(".outer");
const middle = document.querySelector(".middle");
const inner1 = document.querySelector(".inner1");
const inner2 = document.querySelector(".inner2");

const capture = {
  capture: true,
};
const noneCapture = {
  capture: false,
};
const once = {
  once: true,
};
const noneOnce = {
  once: false,
};
const passive = {
  passive: true,
};
const nonePassive = {
  passive: false,
};

outer.addEventListener("click", onceHandler, once);
outer.addEventListener("click", noneOnceHandler, noneOnce);
middle.addEventListener("click", captureHandler, capture);
middle.addEventListener("click", noneCaptureHandler, noneCapture);
inner1.addEventListener("click", passiveHandler, passive);
inner2.addEventListener("click", nonePassiveHandler, nonePassive);

function onceHandler(event) {
  log("outer, once");
}
function noneOnceHandler(event) {
  log("outer, none-once, default\n");
}
function captureHandler(event) {
  // event.stopImmediatePropagation();
  log("middle, capture");
}
function noneCaptureHandler(event) {
  log("middle, none-capture, default");
}
function passiveHandler(event) {
  // Không thể gọi preventDefault trong một bộ lắng nghe sự kiện thụ động.
  event.preventDefault();
  log("inner1, passive, open new page");
}
function nonePassiveHandler(event) {
  event.preventDefault();
  // event.stopPropagation();
  log("inner2, none-passive, default, not open new page");
}
```

#### Kết quả

Nhấp vào các vùng chứa outer, middle, inner lần lượt để xem các tùy chọn hoạt động thế nào.

{{ EmbedLiveSample('Example_of_options_usage', 600, 630) }}

### Bộ lắng nghe sự kiện với nhiều tùy chọn

Bạn có thể đặt nhiều hơn một tùy chọn trong tham số `options`. Trong ví dụ sau, chúng ta đặt hai tùy chọn:

- `passive`, để khẳng định rằng bộ xử lý sẽ không gọi {{domxref("Event.preventDefault", "preventDefault()")}}
- `once`, để đảm bảo bộ xử lý sự kiện chỉ được gọi một lần.

#### HTML

```html
<button id="example-button">You have not clicked this button.</button>
<button id="reset-button">Click this button to reset the first button.</button>
```

#### JavaScript

```js
const buttonToBeClicked = document.getElementById("example-button");

const resetButton = document.getElementById("reset-button");

// văn bản mà nút được khởi tạo cùng
const initialText = buttonToBeClicked.textContent;

// văn bản mà nút chứa sau khi được nhấp
const clickedText = "You have clicked this button.";

// chúng ta nâng callback của bộ lắng nghe sự kiện lên phía trên
// để tránh tạo các bộ lắng nghe trùng lặp
function eventListener() {
  buttonToBeClicked.textContent = clickedText;
}

function addListener() {
  buttonToBeClicked.addEventListener("click", eventListener, {
    passive: true,
    once: true,
  });
}

// khi nút reset được nhấp, nút ví dụ được đặt lại,
// và được phép cập nhật trạng thái lần nữa
resetButton.addEventListener("click", () => {
  buttonToBeClicked.textContent = initialText;
  addListener();
});

addListener();
```

#### Kết quả

{{EmbedLiveSample('Event_listener_with_multiple_options')}}

### Cải thiện hiệu năng cuộn bằng bộ lắng nghe thụ động

Ví dụ sau cho thấy tác động của việc đặt `passive`. Nó bao gồm một {{htmlelement("div")}} chứa một đoạn văn bản và một hộp chọn.

#### HTML

```html
<div id="container">
  <p>
    But down there it would be dark now, and not the lovely lighted aquarium she
    imagined it to be during the daylight hours, eddying with schools of tiny,
    delicate animals floating and dancing slowly to their own serene currents
    and creating the look of a living painting. That was wrong, in any case. The
    ocean was different from an aquarium, which was an artificial environment.
    The ocean was a world. And a world is not art. Dorothy thought about the
    living things that moved in that world: large, ruthless and hungry. Like us
    up here.
  </p>
</div>

<div>
  <input type="checkbox" id="passive" name="passive" checked />
  <label for="passive">passive</label>
</div>
```

```css hidden
#container {
  width: 150px;
  height: 200px;
  overflow: scroll;
  margin: 2rem 0;
  padding: 0.4rem;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã này thêm một bộ lắng nghe cho sự kiện {{domxref("Element/wheel_event", "wheel")}} của container, vốn mặc định cuộn container. Bộ lắng nghe thực hiện một thao tác tốn thời gian. Ban đầu bộ lắng nghe được thêm với tùy chọn `passive`, và mỗi khi hộp chọn được bật/tắt, đoạn mã sẽ thay đổi tùy chọn `passive`.

```js
const passive = document.querySelector("#passive");
const container = document.querySelector("#container");

passive.addEventListener("change", (event) => {
  container.removeEventListener("wheel", wheelHandler);
  container.addEventListener("wheel", wheelHandler, {
    passive: passive.checked,
    once: true,
  });
});

container.addEventListener("wheel", wheelHandler, {
  passive: true,
  once: true,
});

function wheelHandler() {
  function isPrime(n) {
    for (let c = 2; c <= Math.sqrt(n); ++c) {
      if (n % c === 0) {
        return false;
      }
    }
    return true;
  }

  const quota = 1000000;
  const primes = [];
  const maximum = 1000000;

  while (primes.length < quota) {
    const candidate = Math.floor(Math.random() * (maximum + 1));
    if (isPrime(candidate)) {
      primes.push(candidate);
    }
  }

  console.log(primes);
}
```

#### Kết quả

Hiệu ứng là:

- Ban đầu, bộ lắng nghe là passive, nên việc cuộn container bằng bánh xe là ngay lập tức.
- Nếu bạn bỏ chọn "passive" rồi thử cuộn container bằng bánh xe, sẽ có độ trễ đáng kể trước khi container cuộn, vì trình duyệt phải đợi bộ lắng nghe tốn thời gian hoàn tất.

{{EmbedLiveSample("Improving scroll performance using passive listeners", 100, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EventTarget.removeEventListener()")}}
- [Tạo và phát các sự kiện tùy chỉnh](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
- [Thêm chi tiết về việc dùng `this` trong bộ xử lý sự kiện](https://www.quirksmode.org/js/this.html)
  constructor(element) {
  // bind khiến một ngữ cảnh `this` cố định được gán cho `onclick2`
  this.onclick2 = this.onclick2.bind(this);
  element.addEventListener("click", this.onclick1);
  element.addEventListener("click", this.onclick2); // Mẹo
  }
  onclick1(event) {
  console.log(this.name); // undefined, vì `this` là phần tử
  }
  onclick2(event) {
  console.log(this.name); // 'Something Good', vì `this` được bind với thể hiện Something
  }
  }

const s = new Something(document.body);

````

Một giải pháp khác là dùng một hàm đặc biệt gọi là `handleEvent()` để bắt
mọi sự kiện:

```js
class Something {
  name = "Something Good";
````
