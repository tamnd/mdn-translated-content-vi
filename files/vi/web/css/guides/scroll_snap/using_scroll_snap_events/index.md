---
title: Using scroll snap events
slug: Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events
page-type: guide
sidebar: cssref
---

Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) định nghĩa hai **scroll snap event**: {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} và {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}. Chúng cho phép chạy JavaScript để phản hồi khi trình duyệt xác định rằng các [scroll snap target](/en-US/docs/Web/CSS/Guides/Scroll_snap/Basic_concepts) mới đang chờ xử lý và đã được chọn, tương ứng.

Hướng dẫn này cung cấp tổng quan về các sự kiện này cùng với các ví dụ hoàn chỉnh.

## Tổng quan về sự kiện

Các scroll snap event được đặt trên một [scrolling container](/en-US/docs/Glossary/Scroll_container) chứa các scroll snap target tiềm năng:

- Sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} được kích hoạt khi trình duyệt xác định rằng một scroll snap target mới sẽ được chọn khi thao tác cuộn hiện tại kết thúc. Đây là scroll snap target _đang chờ xử lý_. Cụ thể, sự kiện này kích hoạt trong quá trình cuộn, mỗi khi người dùng di chuyển qua các snap target tiềm năng mới. Mặc dù sự kiện `scrollsnapchanging` có thể kích hoạt nhiều lần cho mỗi thao tác cuộn, nhưng nó không kích hoạt trên tất cả các snap target tiềm năng cho một thao tác cuộn di chuyển qua nhiều snap target. Thay vào đó, nó chỉ kích hoạt cho target cuối cùng mà snapping có thể dừng lại.

- Sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} được kích hoạt vào cuối thao tác cuộn khi một scroll snap target mới được chọn. Cụ thể, sự kiện này kích hoạt khi thao tác cuộn hoàn tất, nhưng chỉ khi một snap target mới được chọn. Sự kiện này kích hoạt ngay trước khi sự kiện {{domxref("Element/scrollend_event", "scrollend")}} kích hoạt.

Hãy xem ví dụ minh họa hai sự kiện hoạt động (bạn sẽ thấy cách xây dựng điều này ở phần sau của bài viết):

{{ EmbedLiveSample("One-dimensional scroller example", "100%", "500") }}

Hãy thử cuộn lên và xuống danh sách các ô:

- Thử cuộn chậm container lên và xuống mà không thả thao tác cuộn. Ví dụ, kéo ngón tay qua vùng cuộn trên thiết bị cảm ứng hoặc trackpad, hoặc giữ nút chuột trên thanh cuộn và di chuyển chuột. Các ô bạn di chuyển qua sẽ chuyển sang màu xám đậm hơn khi bạn đi qua chúng, rồi trở lại bình thường khi bạn rời đi. Đây là sự kiện `scrollsnapchanging` hoạt động.
- Bây giờ thử thả thao tác cuộn; ô gần nhất với vị trí cuộn của bạn sẽ animate sang màu tím với chữ trắng. Animation xảy ra khi sự kiện `scrollsnapchange` kích hoạt.
- Cuối cùng, thử cuộn nhanh. Ví dụ, vuốt mạnh ngón tay trên màn hình, để cuộn qua nhiều target tiềm năng trước khi bắt đầu dừng lại gần target xa hơn trong scroll container. Bạn chỉ nên thấy một sự kiện `scrollsnapchanging` kích hoạt khi cuộn bắt đầu chậm lại, trước khi sự kiện `scrollsnapchange` kích hoạt và snap target đã chọn chuyển sang màu tím.

## Đối tượng sự kiện `SnapEvent`

Cả hai sự kiện trên đều chia sẻ đối tượng sự kiện {{domxref("SnapEvent")}}. Đối tượng này có hai thuộc tính quan trọng cho cách các scroll snap event hoạt động:

- {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}} trả về tham chiếu đến phần tử được snap trong [chiều block](/en-US/docs/Glossary/Flow_relative_values#block_direction) khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo chiều inline nên không có phần tử nào được snap trong chiều block.
- {{domxref("SnapEvent.snapTargetInline", "snapTargetInline")}} trả về tham chiếu đến phần tử được snap trong [chiều inline](/en-US/docs/Glossary/Flow_relative_values#inline_direction) khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo chiều block nên không có phần tử nào được snap trong chiều inline.

Các thuộc tính này cho phép hàm xử lý sự kiện báo cáo phần tử đã được snap (trong trường hợp `scrollsnapchange`) hoặc phần tử _sẽ được snap_ nếu thao tác cuộn kết thúc ngay bây giờ (trong trường hợp `scrollsnapchanging`) — trong một và hai chiều. Bạn có thể thao tác các phần tử này theo bất kỳ cách nào muốn, ví dụ bằng cách trực tiếp đặt style trên chúng thông qua thuộc tính {{domxref("HTMLElement.style", "style")}} của chúng, đặt class trên chúng có style được định nghĩa trong stylesheet, v.v.

### Mối quan hệ với `scroll-snap-type` trong CSS

Các giá trị thuộc tính có sẵn trên `SnapEvent` tương ứng trực tiếp với giá trị của thuộc tính CSS {{cssxref("scroll-snap-type")}} được đặt trên scroll container:

- Nếu snap axis được chỉ định là `block` (hoặc giá trị trục vật lý tương đương với `block` trong writing mode hiện tại), chỉ `snapTargetBlock` trả về tham chiếu phần tử.
- Nếu snap axis được chỉ định là `inline` (hoặc giá trị trục vật lý tương đương với `inline` trong writing mode hiện tại), chỉ `snapTargetInline` trả về tham chiếu phần tử.
- Nếu snap axis được chỉ định là `both`, cả `snapTargetBlock` và `snapTargetInline` đều trả về tham chiếu phần tử.

### Xử lý scroller một chiều

Nếu bạn đang xử lý một scroller nằm ngang, chỉ thuộc tính `snapTargetInline` của đối tượng sự kiện sẽ thay đổi khi phần tử được snap thay đổi nếu nội dung có {{cssxref("writing-mode")}} nằm ngang, hoặc thuộc tính `snapTargetBlock` nếu nội dung có `writing-mode` dọc.

Ngược lại, nếu bạn đang xử lý một scroller dọc, chỉ thuộc tính `snapTargetBlock` sẽ thay đổi khi phần tử được snap thay đổi nếu nội dung có `writing-mode` nằm ngang, hoặc thuộc tính `snapTargetInline` nếu nội dung có `writing-mode` dọc.

Trong cả hai trường hợp, thuộc tính không thay đổi trong hai thuộc tính sẽ trả về `null`.

Hãy xem một đoạn code ví dụ để minh họa hàm xử lý sự kiện scroll snap một chiều điển hình:

```js
scrollingElem.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.className = "select-section";
});
```

Trong đoạn code này, một hàm xử lý `scrollsnapchange` được đặt trên một phần tử container cuộn theo chiều block mà các snap target xuất hiện bên trong. Khi sự kiện kích hoạt, chúng ta đặt class `select-section` trên phần tử `snapTargetBlock`, có thể được dùng để style snap target vừa được chọn trông như đã được chọn (ví dụ với một animation).

### Xử lý scroller hai chiều

Nếu bạn đang xử lý một scroller theo cả chiều ngang _và_ dọc, code trở nên phức tạp hơn. Điều này vì cả giá trị thuộc tính `snapTargetBlock` _và_ `snapTargetInline` đều trả về tham chiếu phần tử (không có cái nào trả về `null`), và cái này hay cái kia sẽ thay đổi giá trị tùy thuộc vào hướng bạn cuộn và `writing-mode` của nội dung:

- Nếu scroller cuộn theo chiều ngang, thuộc tính `snapTargetInline` sẽ thay đổi khi phần tử được snap thay đổi nếu nội dung có {{cssxref("writing-mode")}} nằm ngang, hoặc thuộc tính `snapTargetBlock` nếu nội dung có `writing-mode` dọc.
- Nếu scroller cuộn theo chiều dọc, thuộc tính `snapTargetBlock` sẽ thay đổi khi phần tử được snap thay đổi nếu nội dung có `writing-mode` nằm ngang, hoặc thuộc tính `snapTargetInline` nếu nội dung có `writing-mode` dọc.

Để xử lý điều này, bạn có thể cần theo dõi liệu là phần tử `snapTargetBlock` hay `snapTargetInline` đã thay đổi. Hãy xem ví dụ:

```js
const prevState = {
  snapTargetInline: "s1",
  snapTargetBlock: "s1",
};

scrollingElem.addEventListener("scrollsnapchange", (event) => {
  if (!(prevState.snapTargetBlock === event.snapTargetBlock.id)) {
    console.log(
      `The container was scrolled in the block direction to element ${event.snapTargetBlock.id}`,
    );
  }

  if (!(prevState.snapTargetInline === event.snapTargetInline.id)) {
    console.log(
      `The container was scrolled in the block direction to element ${event.snapTargetBlock.id}`,
    );
  }

  prevState.snapTargetBlock = event.snapTargetBlock.id;
  prevState.snapTargetInline = event.snapTargetInline.id;
});
```

Trong đoạn code này, trước tiên chúng ta định nghĩa một đối tượng (`prevState`) lưu trữ ID của các phần tử `snapTargetBlock` và `snapTargetInline` trước đó.

Trong hàm xử lý sự kiện, chúng ta dùng câu lệnh `if` để kiểm tra liệu:

- ID `prevState.snapTargetBlock` có bằng ID của phần tử `event.snapTargetBlock` hiện tại không.
- ID `prevState.snapTargetInline` có bằng ID của phần tử `event.snapTargetInline` hiện tại không.

Nếu các giá trị khác nhau, điều đó có nghĩa là scroller đã cuộn theo hướng đó (block hoặc inline), và chúng ta ghi lại một thông báo ra console để chỉ ra điều này. Trong ví dụ thực tế, bạn có thể muốn style phần tử được snap theo cách nào đó để chỉ ra rằng nó đã được snap vào.

Sau đó chúng ta cập nhật các giá trị của `prevState.snapTargetBlock` và `prevState.snapTargetInline` để chuẩn bị cho lần tiếp theo hàm xử lý sự kiện chạy.

Trong phần còn lại của bài viết này, chúng ta sẽ xem xét một vài ví dụ scroll snap event hoàn chỉnh, mà bạn có thể tương tác trong các phiên bản render trực tiếp ở cuối mỗi phần.

## Ví dụ scroller một chiều

Ví dụ này có một phần tử {{htmlelement("main")}} cuộn dọc chứa nhiều phần tử {{htmlelement("section")}} màu xám nhạt, tất cả đều là snap target. Khi một snap target mới đang chờ xử lý, nó sẽ chuyển sang màu xám đậm hơn. Khi một snap target mới được chọn, nó sẽ animate mượt mà sang màu tím với chữ trắng. Nếu một snap target khác đã được chọn trước đó, nó sẽ animate mượt mà trở lại màu xám với chữ đen.

### HTML

HTML cho ví dụ là một phần tử `<main>` đơn. Chúng ta sẽ thêm các phần tử `<section>` động bằng JavaScript sau, để tiết kiệm không gian trang.

```html
<main></main>
```

### CSS

```css hidden
* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: inherit;
}

h2 {
  font-size: 1rem;
  letter-spacing: 1px;
}

section {
  font-family: "Helvetica", "Arial", sans-serif;
  border-radius: 5px;
  background: #eeeeee;
  box-shadow:
    inset 1px 1px 4px rgb(255 255 255 / 0.5),
    inset -1px -1px 4px rgb(0 0 0 / 0.5);
  width: 150px;
  height: 150px;

  display: flex;
  align-items: center;
  justify-content: center;
}
```

Trong CSS, chúng ta bắt đầu bằng cách đặt cho phần tử `<main>` một {{cssxref("border")}} đen dày và {{cssxref("width")}} và {{cssxref("height")}} cố định. Chúng ta đặt giá trị {{cssxref("overflow")}} thành `scroll` để nội dung tràn sẽ bị ẩn và có thể cuộn đến, và đặt {{cssxref("scroll-snap-type")}} thành `block mandatory` để các snap target chỉ theo chiều block sẽ luôn được snap vào.

```css
main {
  border: 3px solid black;
  width: 250px;
  height: 450px;
  overflow: scroll;
  scroll-snap-type: block mandatory;
}
```

Mỗi phần tử `<section>` được đặt {{cssxref("margin")}} là `50px` để phân tách các phần tử `<section>` và làm cho hành vi scroll snapping rõ ràng hơn. Sau đó chúng ta đặt {{cssxref("scroll-snap-align")}} thành `center`, để chỉ định rằng chúng ta muốn snap vào giữa mỗi snap target. Cuối cùng, chúng ta áp dụng một {{cssxref("transition")}} để animate mượt mà các thay đổi style được áp dụng khi snap target được chọn hoặc đang chờ xử lý.

```css
section {
  margin: 50px auto;
  scroll-snap-align: center;
  transition: 0.5s ease;
}
```

Các thay đổi style đã đề cập ở trên sẽ được áp dụng thông qua các class được áp dụng cho các phần tử `<section>` thông qua JavaScript. Class `select-section` sẽ được áp dụng để biểu thị lựa chọn — nó đặt nền tím và màu chữ trắng. Class `pending` sẽ được áp dụng để biểu thị snap target đang chờ xử lý — nó tô màu nền của target đang chờ sang màu xám đậm hơn.

```css
.pending {
  background-color: #cccccc;
}

.select-section {
  background: purple;
  color: white;
}
```

### JavaScript

Trong JavaScript, chúng ta bắt đầu bằng cách lấy tham chiếu đến phần tử `<main>` và xác định số lượng phần tử `<section>` sẽ tạo (trong trường hợp này là 21) và một biến để bắt đầu đếm. Sau đó chúng ta dùng vòng lặp [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while) để tạo các phần tử `<section>`, đặt cho mỗi phần tử một phần tử con [`h2`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) với văn bản `Section` cộng với giá trị hiện tại của `n`.

```js
const mainElem = document.querySelector("main");
const sectionCount = 21;
let n = 1;

while (n <= sectionCount) {
  mainElem.innerHTML += `
    <section>
      <h2>Section ${n}</h2>
    </section>
  `;
  n++;
}
```

Bây giờ đến hàm xử lý sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}. Khi một phần tử con của `<main>` (tức là bất kỳ phần tử `<section>` nào) trở thành snap target đang chờ xử lý, chúng ta:

1. Kiểm tra xem một phần tử nào trước đó có class `pending` được áp dụng không và nếu có, xóa nó. Điều này để chỉ target đang chờ xử lý hiện tại được đặt class `pending` và tô màu xám đậm hơn. Chúng ta không muốn các target đã từng chờ xử lý mà không còn chờ xử lý nữa vẫn giữ styling.
2. Đặt class `pending` cho phần tử được tham chiếu bởi thuộc tính {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}} (sẽ là một trong các phần tử `<section>`) để nó chuyển sang màu xám đậm hơn.

```js
mainElem.addEventListener("scrollsnapchanging", (event) => {
  const previousPending = document.querySelector(".pending");
  if (previousPending) {
    previousPending.classList.remove("pending");
  }

  event.snapTargetBlock.classList.add("pending");
});
```

> [!NOTE]
> Chúng ta không cần lo lắng về thuộc tính `snapTargetInline` của đối tượng sự kiện cho demo này — chúng ta chỉ cuộn dọc và demo đang sử dụng writing mode nằm ngang, do đó chỉ giá trị `snapTargetBlock` sẽ thay đổi. Trong trường hợp này, `snapTargetInline` sẽ luôn trả về `null`.

Khi thao tác cuộn kết thúc và một phần tử `<section>` thực sự được chọn làm snap target, hàm xử lý sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} sẽ kích hoạt. Hàm này:

1. Kiểm tra xem một snap target có được chọn trước đó không — tức là liệu class `select-section` có được áp dụng cho một phần tử không. Nếu có, chúng ta xóa nó.
2. Áp dụng class `select-section` cho phần tử `<section>` được tham chiếu trong thuộc tính `snapTargetBlock` để snap target vừa được chọn sẽ có animation lựa chọn được áp dụng cho nó.

```js
mainElem.addEventListener("scrollsnapchange", (event) => {
  const currentlySnapped = document.querySelector(".select-section");
  if (currentlySnapped) {
    currentlySnapped.classList.remove("select-section");
  }

  event.snapTargetBlock.classList.add("select-section");
});
```

### Kết quả

Hãy thử cuộn lên và xuống scroll container và quan sát hành vi đã mô tả ở trên:

{{ EmbedLiveSample("One-dimensional scroller example", "100%", "500") }}

## Ví dụ scroller hai chiều

Ví dụ này tương tự ví dụ trước, ngoại trừ nó có một phần tử {{htmlelement("main")}} cuộn theo cả chiều ngang _và_ dọc chứa nhiều phần tử {{htmlelement("section")}} màu xám nhạt, tất cả đều là snap target.

HTML cho ví dụ giống như ví dụ trước — một phần tử `<main>` đơn.

```html hidden
<main></main>
```

### CSS

```css hidden
* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  height: inherit;
}

section {
  font-family: "Helvetica", "Arial", sans-serif;
  border-radius: 5px;
  background: #eeeeee;
  box-shadow:
    inset 1px 1px 4px rgb(255 255 255 / 0.5),
    inset -1px -1px 4px rgb(0 0 0 / 0.5);
  width: 150px;
  height: 150px;

  display: flex;
  align-items: center;
  justify-content: center;

  scroll-snap-align: center;
}

h2 {
  font-size: 1rem;
  letter-spacing: 1px;
}
```

CSS cho ví dụ này tương tự CSS trong ví dụ trước. Những điểm khác biệt đáng kể nhất như sau.

Trước tiên hãy xem styling của phần tử `<main>`. Chúng ta muốn các phần tử `<section>` được bố trí dạng grid, nên chúng ta dùng [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) để chỉ định rằng chúng ta muốn chúng hiển thị trong bảy cột, sử dụng giá trị {{cssxref("grid-template-columns")}} là `repeat(7, 1fr)`. Chúng ta cũng chỉ định khoảng cách xung quanh các phần tử `<section>` bằng cách đặt `padding` và {{cssxref("gap")}} trên phần tử `<main>` thay vì `margin` trên các phần tử `<section>`.

Cuối cùng, vì chúng ta cuộn theo cả hai hướng trong ví dụ này, chúng ta đặt {{cssxref("scroll-snap-type")}} thành `both mandatory` để các snap target theo cả chiều block _và_ inline luôn được snap vào.

```css
main {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  padding: 100px;
  gap: 50px;
  overflow: scroll;
  border: 3px solid black;
  width: 350px;
  height: 350px;

  scroll-snap-type: both mandatory;
}
```

Tiếp theo, chúng ta sẽ dùng CSS animation trong ví dụ này thay vì transition. Điều này dẫn đến code phức tạp hơn, nhưng cho phép kiểm soát chi tiết hơn các animation được áp dụng.

Trước tiên chúng ta định nghĩa các class sẽ được áp dụng để báo hiệu rằng snap target đã được chọn hoặc đang chờ xử lý. Các class `select-section` và `deselect-section` sẽ áp dụng animation keyframe để báo hiệu lựa chọn hoặc hủy lựa chọn. Class `pending` sẽ được áp dụng để báo hiệu snap target đang chờ xử lý (nó áp dụng nền xám đậm hơn cho lựa chọn, như trong ví dụ trước).

Các {{cssxref("@keyframes")}} animate từ nền xám và màu chữ đen (mặc định) sang nền tím và màu chữ trắng, và ngược lại, tương ứng. Animation sau hơi khác animation đầu — nó cũng dùng {{cssxref("opacity")}} để tạo hiệu ứng fade out/fade in.

```css
.select-section {
  animation: select 0.8s ease forwards;
}

.deselect-section {
  animation: deselect 0.8s ease forwards;
}

.pending {
  background-color: #cccccc;
}

@keyframes select {
  from {
    background: #eeeeee;
    color: black;
  }

  to {
    background: purple;
    color: white;
  }
}

@keyframes deselect {
  0% {
    background: purple;
    color: white;
    opacity: 1;
  }

  80% {
    background: #eeeeee;
    color: black;
    opacity: 0.1;
  }

  100% {
    background: #eeeeee;
    color: black;
    opacity: 1;
  }
}
```

### JavaScript

Trong JavaScript, chúng ta bắt đầu giống như ví dụ trước, ngoại trừ lần này chúng ta tạo 49 phần tử `<section>` và đặt cho mỗi phần tử một ID là `s` cộng với giá trị hiện tại của `n` để giúp theo dõi chúng sau này. Với CSS grid layout chúng ta đã chỉ định ở trên, chúng ta có bảy cột gồm bảy phần tử `<section>`.

```js
const mainElem = document.querySelector("main");
const sectionCount = 49;
let n = 1;

while (n <= sectionCount) {
  mainElem.innerHTML += `
    <section id="s${n}">
      <h2>Section ${n}</h2>
    </section>
  `;
  n++;
}
```

Tiếp theo chúng ta chỉ định một đối tượng gọi là `prevState`, cho phép chúng ta theo dõi snap target đã được chọn trước đó tại bất kỳ thời điểm nào — các thuộc tính của nó lưu trữ ID của các snap target inline và block trước đó. Điều này quan trọng để xác định liệu chúng ta cần style block target mới hay inline target mới mỗi khi hàm xử lý sự kiện kích hoạt.

```js
const prevState = {
  snapTargetInline: "s1",
  snapTargetBlock: "s1",
};
```

Ví dụ, giả sử scroll container được cuộn để ID của phần tử {{domxref("SnapEvent.snapTargetBlock")}} mới đã thay đổi (nó không bằng ID được lưu trong `prevState.snapTargetBlock`), nhưng ID của phần tử {{domxref("SnapEvent.snapTargetInline")}} mới vẫn giống như ID được lưu trong `prevState.snapTargetInline`. Điều này có nghĩa là chúng ta đã di chuyển đến snap target mới theo chiều block, vì vậy chúng ta nên style `SnapEvent.snapTargetBlock`, nhưng chúng ta chưa di chuyển đến snap target mới theo chiều inline, vì vậy chúng ta không nên style `SnapEvent.snapTargetInline`.

Lần này, chúng ta sẽ giải thích hàm xử lý sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}} trước. Trong hàm này, chúng ta:

1. Bắt đầu bằng cách đảm bảo rằng một phần tử `<section>` snap target đã được chọn trước đó (được biểu thị bởi sự hiện diện của class `select-section`) có class `deselect-section` được áp dụng để nó hiển thị animation hủy lựa chọn. Nếu không có snap target nào được chọn trước đó, chúng ta áp dụng class `select-section` cho phần tử `<section>` đầu tiên trong DOM để nó hiển thị là đã được chọn khi trang tải lần đầu.
2. So sánh ID snap target đã chọn trước đó với ID snap target mới được chọn, cho cả lựa chọn block _và_ inline. Nếu chúng khác nhau, điều đó chỉ ra rằng lựa chọn đã thay đổi, vì vậy chúng ta áp dụng class `select-section` cho snap target phù hợp để trực quan hóa điều này.
3. Cập nhật `prevState.snapTargetBlock` và `prevState.snapTargetInline` bằng ID của các scroll snap target vừa được chọn, để khi sự kiện kích hoạt tiếp theo, chúng sẽ là các lựa chọn trước đó.

```js
mainElem.addEventListener("scrollsnapchange", (event) => {
  if (document.querySelector(".select-section")) {
    document.querySelector(".select-section").className = "deselect-section";
  } else {
    document.querySelector("section").className = "select-section";
  }

  if (!(prevState.snapTargetBlock === event.snapTargetBlock.id)) {
    event.snapTargetBlock.className = "select-section";
  }

  if (!(prevState.snapTargetInline === event.snapTargetInline.id)) {
    event.snapTargetInline.className = "select-section";
  }

  prevState.snapTargetBlock = event.snapTargetBlock.id;
  prevState.snapTargetInline = event.snapTargetInline.id;
});
```

Khi hàm xử lý sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} kích hoạt, chúng ta:

1. Xóa class `pending` khỏi phần tử trước đó có nó được áp dụng để chỉ target đang chờ xử lý hiện tại được đặt class `pending` và tô màu xám đậm hơn.
2. Đặt class `pending` cho phần tử đang chờ xử lý hiện tại để nó chuyển sang màu xám đậm hơn, nhưng chỉ khi nó chưa có class `select-section` được áp dụng — chúng ta muốn target đã được chọn trước đó giữ styling màu tím cho đến khi target mới thực sự được chọn. Chúng ta cũng bao gồm kiểm tra bổ sung trong câu lệnh `if` để đảm bảo chúng ta chỉ style inline hoặc block snap target đang chờ xử lý, tùy thuộc vào cái nào đã thay đổi. Một lần nữa, chúng ta so sánh snap target trước đó với snap target hiện tại trong mỗi trường hợp.

```js
mainElem.addEventListener("scrollsnapchanging", (event) => {
  const previousPending = document.querySelector(".pending");
  if (previousPending) {
    previousPending.className = "";
  }

  if (
    !(event.snapTargetBlock.className === "select-section") &&
    !(prevState.snapTargetBlock === event.snapTargetBlock.id)
  ) {
    event.snapTargetBlock.className = "pending";
  }

  if (
    !(event.snapTargetInline.className === "select-section") &&
    !(prevState.snapTargetInline === event.snapTargetInline.id)
  ) {
    event.snapTargetInline.className = "pending";
  }
});
```

### Kết quả

Hãy thử cuộn theo cả chiều ngang và dọc trong scroll container và quan sát hành vi đã mô tả ở trên:

{{ EmbedLiveSample("Two-dimensional scroller example", "100%", "500") }}

## Scroll snap event trên `Document` và `Window`

Trong bài viết này, chúng ta đã đề cập đến các scroll snap event kích hoạt trên interface {{domxref("Element")}}, nhưng các sự kiện tương tự cũng kích hoạt trên các đối tượng {{domxref("Document")}} và {{domxref("Window")}}. Xem:

- `Document` {{domxref("Document/scrollsnapchange_event", "scrollsnapchange")}} và {{domxref("Document/scrollsnapchanging_event", "scrollsnapchanging")}} event reference.
- `Window` {{domxref("Window/scrollsnapchange_event", "scrollsnapchange")}} và {{domxref("Window/scrollsnapchanging_event", "scrollsnapchanging")}} event reference.

Chúng hoạt động tương tự như các phiên bản `Element`, ngoại trừ rằng toàn bộ tài liệu HTML phải được đặt làm scroll snap container (tức là {{cssxref("scroll-snap-type")}} được đặt trên phần tử {{htmlelement("html")}}).

Ví dụ, nếu chúng ta lấy ví dụ tương tự như những gì chúng ta đã xem xét ở trên, nơi chúng ta có một phần tử `<main>` chứa nội dung đáng kể:

```html
<main>
  <!-- Nội dung đáng kể -->
</main>
```

Phần tử `<main>` có thể được chuyển thành scroll container bằng cách kết hợp các thuộc tính CSS, ví dụ:

```css
main {
  width: 250px;
  height: 450px;
  overflow: scroll;
}
```

Sau đó bạn có thể triển khai hành vi scroll snapping trên nội dung cuộn bằng cách chỉ định thuộc tính {{cssxref("scroll-snap-type")}} trên phần tử {{htmlelement("html")}}:

```css
html {
  scroll-snap-type: block mandatory;
}
```

Đoạn JavaScript sau sẽ làm cho sự kiện `scrollsnapchange` kích hoạt trên tài liệu HTML khi một phần tử con của `<main>` trở thành snap target mới được chọn. Trong hàm xử lý, chúng ta đặt class `selected` trên phần tử con được tham chiếu bởi {{domxref("SnapEvent.snapTargetBlock")}}, có thể được dùng để style nó trông như đã được chọn (ví dụ với animation) khi sự kiện kích hoạt.

```js
document.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.classList.add("selected");
});
```

Chúng ta cũng có thể kích hoạt sự kiện trên `Window` thay thế, để đạt được chức năng tương tự:

```js
window.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.classList.add("selected");
});
```

## Xem thêm

- Sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}
- Sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}
- {{domxref("SnapEvent")}}
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
