---
title: Sử dụng API Phân đoạn khung nhìn
slug: Web/API/Viewport_segments_API/Using
page-type: guide
---

{{DefaultAPISidebar("Viewport Segments API")}}

Bài viết này giải thích cách sử dụng [API Phân đoạn khung nhìn](/en-US/docs/Web/API/Viewport_segments_API) để tạo ra các thiết kế đáp ứng được tối ưu hóa cho các kích thước và cách bố trí phân đoạn khung nhìn khác nhau.

## Vấn đề với thiết bị gập được

Thiết bị gập được bao gồm điện thoại thông minh, máy tính bảng và laptop. Một số gập vào trong, với màn hình gập vào bên trong thiết bị, và một số gập ra ngoài, với màn hình bao quanh thiết bị. Thiết bị gập được có nhiều hình dạng: một số có màn hình thực sự gập được, trong khi một số có màn hình riêng biệt với bản lề vật lý ở giữa. Chúng có thể được sử dụng ở hướng nằm ngang, với hai màn hình cạnh nhau, và hướng dọc, với màn hình trên và màn hình dưới.

Dù trong trường hợp nào, màn hình thiết bị gập được được thiết kế để hoạt động như các phân đoạn khác nhau của cùng một bề mặt hiển thị. Trong khi thiết bị gập của một người có thể trông liền mạch và được sử dụng hoàn toàn phẳng, tương tự như khung nhìn đơn phân đoạn, thiết bị của người khác có thể có đường nối rõ ràng và được sử dụng ở góc nhỏ hơn màn hình mở hoàn toàn. Điều này đặt ra một số thách thức độc đáo. Bạn có thể tối ưu hóa bố cục cho màn hình như một thực thể duy nhất, nhưng làm thế nào để đảm bảo rằng các phần tử thiết kế khớp gọn gàng trên các phân đoạn khác nhau và không bị cắt làm đôi? Và làm thế nào để ngăn nội dung bị ẩn bởi nếp gấp/nối vật lý?

API Phân đoạn khung nhìn cung cấp các tính năng cho phép bạn phát hiện (trong CSS và JavaScript) liệu màn hình thiết bị của người dùng có nếp gấp hoặc nối hay không, các phân đoạn khác nhau có kích thước bao nhiêu, liệu chúng có cùng kích thước không, và hướng của chúng (cạnh nhau hay trên-dưới). Chúng tôi sẽ giới thiệu các tính năng này trong các phần sau, sau đó trình bày một ví dụ hoàn chỉnh để minh họa.

## Tính năng media phân đoạn khung nhìn

Hai tính năng [truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries) có sẵn để kiểm tra xem thiết bị có số lượng phân đoạn khung nhìn cụ thể được bố trí theo chiều ngang hoặc chiều dọc hay không. Chúng trông như sau:

```css
/* Các phân đoạn được bố trí theo chiều ngang. */
@media (horizontal-viewport-segments: 2) {
  .wrapper {
    flex-direction: row;
  }

  /* ... */
}

/* Các phân đoạn được bố trí theo chiều dọc. */
@media (vertical-viewport-segments: 2) {
  .wrapper {
    flex-direction: column;
  }

  /* ... */
}
```

Tính năng media {{cssxref("@media/horizontal-viewport-segments")}} phát hiện xem thiết bị có số lượng phân đoạn khung nhìn được bố trí theo chiều ngang, trong khi tính năng media {{cssxref("@media/vertical-viewport-segments")}} phát hiện xem thiết bị có số lượng phân đoạn khung nhìn được bố trí theo chiều dọc.

## Biến môi trường phân đoạn khung nhìn

Để khớp bố cục chính xác vào các phân đoạn khung nhìn có sẵn, [biến môi trường phân đoạn khung nhìn](/en-US/docs/Web/CSS/Reference/Values/env#viewport-segment-width) cung cấp quyền truy cập vào kích thước và vị trí của mỗi phân đoạn bên trong khung nhìn tổng thể. Trình duyệt cung cấp [biến môi trường] cho phép truy cập chiều rộng và chiều cao của mỗi phân đoạn và vị trí offset của cạnh trên, phải, dưới và trái:

- `viewport-segment-width`
- `viewport-segment-height`
- `viewport-segment-top`
- `viewport-segment-right`
- `viewport-segment-bottom`
- `viewport-segment-left`

Hàm {{cssxref("env()")}} được dùng để truy cập các biến này, với tên biến và hai số nguyên đại diện cho các chỉ số của phân đoạn cần trả về giá trị. Ví dụ:

```css
/* Trả về chiều rộng của phân đoạn trên/trái */
env(viewport-segment-width 0 0)

/* Trả về chiều rộng của phân đoạn bên phải */
env(viewport-segment-width 1 0)

/* Trả về chiều rộng của phân đoạn bên dưới */
env(viewport-segment-width 0 1)
```

Các chỉ số đều là số nguyên từ `0` trở lên. Giá trị đầu tiên đại diện cho chỉ số ngang của phân đoạn, và giá trị thứ hai đại diện cho chỉ số dọc của phân đoạn:

![Hai bố cục phân đoạn thiết bị; trong bố cục ngang, 0 0 là phân đoạn đầu tiên và 1 0 là phân đoạn thứ hai. Trong bố cục dọc, các chỉ số là 0 0 và 0 1](env-var-indices.png)

- Trong bố cục ngang cạnh nhau, phân đoạn bên trái được đại diện bởi `0 0`, và phân đoạn bên phải được đại diện bởi `1 0`.
- Trong bố cục dọc trên-dưới, phân đoạn trên được đại diện bởi `0 0`, và phân đoạn dưới được đại diện bởi `0 1`.

Trong bố cục, bạn có thể sử dụng các biến này để đặt container khớp gọn gàng vào các phân đoạn có sẵn. Ví dụ:

```css
@media (horizontal-viewport-segments: 2) {
  .wrapper {
    display: grid;
    grid-template: "left fold right";
    grid-column: env(viewport-segment-width 0 0) env(viewport-segment-width 1 0);
  }
  .firstSection {
    grid-area: left;
  }
  .secondSection {
    grid-area: right;
  }
}

@media (vertical-viewport-segments: 2) {
  .wrapper {
    display: grid;
    grid-template:
      "top"
      "bottom";
    grid-row: env(viewport-segment-height 0 1) env(viewport-segment-width 0 0);
  }
  .firstSection {
    grid-area: top;
  }
  .secondSection {
    grid-area: bottom;
  }
}
```

Ở đây, chúng ta đặt wrapper bên ngoài thành bố cục lưới ngang hoặc dọc, dựa trên việc các phân đoạn khung nhìn được bố trí ngang hay dọc. Sau đó chúng ta đặt các ô trái và trên là phân đoạn đầu tiên, và đặt phần thứ hai vào ô lưới phải hoặc dưới.

Chúng ta có thể thêm một ô "fold" trống ở giữa để ngăn nội dung bị che bởi nếp gấp. Chúng ta có thể tính độ dày của nó bằng cách trừ tổng chiều rộng hoặc chiều cao của hai bên khỏi kích thước khung nhìn đầy đủ, hoặc đặt ô giữa thành `1fr`.

```css
@media (horizontal-viewport-segments: 2) {
  .wrapper {
    grid-template: "left fold right";
    grid-column: env(viewport-segment-width 0 0)
      calc(
        100vw -
          (env(viewport-segment-width 0 0) + env(viewport-segment-width 1 0))
      )
      env(viewport-segment-width 1 0);
  }
}

@media (vertical-viewport-segments: 2) {
  .wrapper {
    grid-template:
      "top"
      "fold"
      "bottom";
    grid-row: env(viewport-segment-height 0 1) 1fr
      env(viewport-segment-width 0 0);
  }
}
```

## Truy cập thông tin phân đoạn trong JavaScript

Bạn có thể truy cập thông tin phân đoạn trong JavaScript bằng thuộc tính {{domxref("Viewport.segments", "window.viewport.segments")}}, trả về mảng các đối tượng {{domxref("DOMRect")}} cung cấp quyền truy cập tọa độ `x` và `y` của mỗi phân đoạn bên trong khung nhìn tổng thể, và `width` và `height` của chúng.

Ví dụ, đoạn mã sau sẽ lặp qua từng phân đoạn trong khung nhìn và ghi một chuỗi vào console mô tả số chỉ mục, chiều rộng và chiều cao.

```js
const segments = window.viewport.segments;

segments.forEach((segment) =>
  console.log(
    `Segment ${segments.indexOf(segment)} is ${segment.width}px x ${segment.height}px`,
  ),
);
```

## Ví dụ hoàn chỉnh

Hãy xem các tính năng API Phân đoạn khung nhìn trong một ví dụ thực tế. Bạn có thể xem ví dụ chạy trực tiếp tại [bản demo API Phân đoạn khung nhìn](https://mdn.github.io/dom-examples/viewport-segments-api/) (xem thêm [mã nguồn đầy đủ](https://github.com/mdn/dom-examples/tree/main/viewport-segments-api)). Nếu có thể, hãy xem bản demo trên thiết bị gập được thực tế. Công cụ phát triển trình duyệt cho phép giả lập trực quan nhiều phân đoạn của thiết bị gập được thường không bao gồm giả lập phân đoạn vật lý.

> [!NOTE]
> Ví dụ này được điều chỉnh từ [Origin trial for Foldable APIs](https://developer.chrome.com/blog/foldable-apis-ot) của Alexis Menard và Thomas Steiner, ban đầu được xuất bản trên `developer.chrome.com` năm 2024 theo [Giấy phép Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0/).

Chúng ta sẽ xem qua mã nguồn trong các phần sau.

### Cấu trúc HTML

Đánh dấu có một {{htmlelement("div")}} wrapper chứa hai phần tử {{htmlelement("section")}} đại diện cho chế độ xem danh sách cơ bản và chế độ xem chi tiết, và một `<div>` fold đại diện cho nếp gấp giữa hai phân đoạn trên thiết bị gập được.

```html
<div class="wrapper">
  <section class="list-view">
    <!-- ... -->
  </section>
  <div class="fold"></div>
  <section class="detail-view">
    <!-- ... -->
  </section>
</div>
```

### Áp dụng bố cục có chọn lọc cho các hướng phân đoạn khác nhau

Trong CSS, chúng ta sử dụng kết hợp truy vấn phương tiện và biến môi trường để tạo ra các bố cục đáp ứng phù hợp với các phân đoạn có sẵn.

Trước tiên, chúng ta sử dụng kiểm tra truy vấn phương tiện {{cssxref("@media/orientation", "orientation")}} để đặt bố cục flexbox phù hợp cho các con của wrapper `<div>` trong mỗi trường hợp: `row` cho khung nhìn `landscape`, và `column` cho khung nhìn `portrait`. Lưu ý cách chúng ta cũng đặt fold `<div>` thành một dải mỏng trong các trường hợp này để làm ngăn cách giữa hai container nội dung: rộng `20px` trong bố cục `landscape`, và cao `20px` trong bố cục `portrait`.

```css
.wrapper {
  height: 100%;
  display: flex;
}

@media (orientation: landscape) {
  .wrapper {
    flex-direction: row;
  }

  .list-view,
  .detail-view {
    flex: 1;
  }

  .fold {
    height: 100%;
    width: 20px;
  }
}

@media (orientation: portrait) {
  .wrapper {
    flex-direction: column;
  }

  .list-view,
  .detail-view {
    flex: 1;
  }

  .fold {
    height: 20px;
  }
}
```

Tiếp theo, chúng ta sử dụng truy vấn phương tiện {{cssxref("@media/horizontal-viewport-segments")}} để xử lý trường hợp thiết bị gập được có các phân đoạn cạnh nhau.

Chúng ta đặt wrapper bên ngoài có bố cục flexbox ngang khi các phân đoạn khung nhìn được bố trí theo chiều ngang. Chúng ta đặt container bên trái có chiều rộng bằng chiều rộng phân đoạn trái (`env(viewport-segment-width 0 0)`), và container bên phải có chiều rộng bằng chiều rộng phân đoạn phải (`env(viewport-segment-width 1 0)`). Để tính toán chiều rộng nếp gấp ở giữa hai phân đoạn, chúng ta trừ offset cạnh trái của container bên phải từ offset cạnh phải của container bên trái (`calc(env(viewport-segment-left 1 0) - env(viewport-segment-right 0 0));`).

```css
@media (horizontal-viewport-segments: 2) {
  .wrapper {
    flex-direction: row;
  }

  .list-view {
    width: env(viewport-segment-width 0 0);
  }

  .fold {
    width: calc(
      env(viewport-segment-left 1 0) - env(viewport-segment-right 0 0)
    );
    background-color: black;
    height: 100%;
  }

  .detail-view {
    width: env(viewport-segment-width 1 0);
  }
}
```

Cuối cùng, chúng ta sử dụng truy vấn phương tiện {{cssxref("@media/vertical-viewport-segments")}} để xử lý trường hợp thiết bị gập được có các phân đoạn trên-dưới. Cách này sử dụng cùng cách tiếp cận như đoạn mã trước, ngoại trừ chúng ta đặt chiều cao thay vì chiều rộng, và sử dụng các biến môi trường height/top/bottom để trả về các giá trị cần thiết.

```css
@media (vertical-viewport-segments: 2) {
  .wrapper {
    flex-direction: column;
  }

  .list-view {
    height: env(viewport-segment-height 0 0);
  }

  .fold {
    width: 100%;
    height: calc(
      env(viewport-segment-top 0 1) - env(viewport-segment-bottom 0 0)
    );
    background-color: black;
  }

  .detail-view {
    height: env(viewport-segment-height 0 1);
  }
}
```

### Báo cáo kích thước phân đoạn bằng JavaScript

Chúng ta cũng báo cáo kích thước của mỗi phân đoạn, thay đổi các giá trị khi màn hình được thay đổi kích thước, hoặc khi [tư thế thiết bị](/en-US/docs/Web/API/Device_Posture_API) hoặc hướng thay đổi.

Trước tiên, chúng ta lấy tham chiếu đến wrapper `<div>` và hai con phần tử `<section>` của nó (đây là hai container chúng ta đã đặt bên trong hai phân đoạn với CSS).

```js
const wrapperElem = document.querySelector(".wrapper");
const listViewElem = document.querySelector(".list-view");
const detailViewElem = document.querySelector(".detail-view");
```

Tiếp theo, chúng ta định nghĩa hàm `addSegmentOutput()` nhận mảng `segments`, số chỉ mục và tham chiếu phần tử làm đối số. Hàm này thêm một `<div>` đầu ra phân đoạn vào phần tử được tham chiếu. Đầu ra bao gồm tiêu đề với số chỉ mục phân đoạn khung nhìn và kích thước của phân đoạn đó.

```js
function addSegmentOutput(segments, i, elem) {
  const segment = segments[i];

  const divElem = document.createElement("div");
  divElem.className = "segment-output";

  elem.appendChild(divElem);

  divElem.innerHTML = `<h2>Viewport segment ${i}</h2>
  <p>${segment.width}px x ${segment.height}px</p>`;
}
```

Tiếp theo, chúng ta định nghĩa hàm `reportSegments()` xóa bất kỳ `<div>` đầu ra phân đoạn nào đã được thêm trước đó, xóa sạch `<div>`, sau đó gọi hàm `addSegmentOutput()` đã định nghĩa trước đó dựa trên mảng các phân đoạn thiết bị được lấy bằng {{domxref("Viewport.segments", "window.viewport.segments")}}. Chúng ta kiểm tra số lượng phân đoạn có mặt:

- Nếu chỉ có một phân đoạn, chúng ta chạy `addSegmentOutput()` một lần, thêm một `<div>` đầu ra phân đoạn vào wrapper `<div>`. Điều này sẽ báo cáo kích thước của toàn bộ khung nhìn.
- Nếu có hai phân đoạn, chúng ta chạy `addSegmentOutput()` hai lần, thêm một `<div>` đầu ra phân đoạn vào mỗi phần tử `<section>`. Chúng sẽ báo cáo kích thước của phân đoạn cha của mỗi `<div>` đầu ra phân đoạn.

```js
function reportSegments() {
  // Remove all previous segment output elements before adding more
  document.querySelectorAll(".segment-output").forEach((elem) => elem.remove());

  const segments = window.viewport.segments;

  if (segments.length === 1) {
    addSegmentOutput(segments, 0, wrapperElem);
  } else {
    addSegmentOutput(segments, 0, listViewElem);
    addSegmentOutput(segments, 1, detailViewElem);
  }
}
```

Cuối cùng, chúng ta gọi hàm `reportSegments()` và thêm trình lắng nghe sự kiện để chạy nó trong một vài ngữ cảnh khác nhau:

- Chúng ta chạy nó một lần trong phạm vi toàn cục để báo cáo phân đoạn được thêm vào trang ngay khi trang tải.
- Chúng ta chạy nó dựa trên sự kiện [`resize`](/en-US/docs/Web/API/Window/resize_event) để cập nhật báo cáo phân đoạn khi cửa sổ được thay đổi kích thước (bao gồm cả thay đổi hướng).
  - Chúng ta chạy nó dựa trên sự kiện [`change`](/en-US/docs/Web/API/DevicePosture/change_event) của `DevicePosture`, để cập nhật báo cáo phân đoạn khi tư thế thiết bị thay đổi.

```js
reportSegments();
window.addEventListener("resize", reportSegments);
navigator.devicePosture.addEventListener("change", reportSegments);
```

## Xem thêm

- [API Tư thế thiết bị](/en-US/docs/Web/API/Device_Posture_API)
