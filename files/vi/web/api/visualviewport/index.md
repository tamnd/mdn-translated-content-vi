---
title: VisualViewport
slug: Web/API/VisualViewport
page-type: web-api-interface
browser-compat: api.VisualViewport
---

{{APIRef("CSSOM view API")}}

Giao diện **`VisualViewport`** của [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API) đại diện cho khung nhìn trực quan của một cửa sổ nhất định. Đối với một trang chứa iframe, mỗi iframe cũng như trang chứa đó sẽ có một đối tượng cửa sổ riêng. Mỗi cửa sổ trên trang sẽ có một `VisualViewport` riêng đại diện cho các thuộc tính liên quan đến cửa sổ đó.

Web trên thiết bị di động chứa hai khung nhìn: khung nhìn bố cục và khung nhìn trực quan. Khung nhìn bố cục bao phủ tất cả các phần tử trên trang, còn khung nhìn trực quan là những gì thực sự hiển thị trên màn hình. Khi người dùng thu phóng bằng cử chỉ nhéo ngón tay vào trang, khung nhìn trực quan thu nhỏ lại nhưng khung nhìn bố cục không thay đổi. Các tính năng giao diện người dùng như bàn phím hiển thị trên màn hình (OSK) có thể thu nhỏ khung nhìn trực quan mà không ảnh hưởng đến khung nhìn bố cục.

Điều gì xảy ra khi một phần tử trang web cần hiển thị trên màn hình bất kể phần hiển thị của trang web là gì? Ví dụ, nếu bạn cần một bộ điều khiển hình ảnh luôn hiển thị bất kể mức thu phóng nhéo ngón tay của thiết bị là bao nhiêu? Các trình duyệt hiện tại xử lý điều này theo những cách khác nhau. Khung nhìn trực quan cho phép các nhà phát triển web giải quyết vấn đề này bằng cách định vị các phần tử tương đối với những gì đang hiển thị trên màn hình.

Bạn có thể lấy khung nhìn trực quan của cửa sổ bằng {{domxref("Window.visualViewport")}}.

> [!NOTE]
> Chỉ cửa sổ cấp cao nhất mới có khung nhìn trực quan khác biệt với khung nhìn bố cục. Do đó, nhìn chung chỉ đối tượng `VisualViewport` của cửa sổ cấp cao nhất mới hữu ích. Đối với một {{htmlelement("iframe")}}, các thông số khung nhìn trực quan như {{domxref("VisualViewport.width")}} luôn tương ứng với các thông số khung nhìn bố cục như {{domxref("Element.clientWidth", "document.documentElement.clientWidth")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("VisualViewport.offsetLeft")}} {{ReadOnlyInline}}
  - : Trả về độ lệch của cạnh trái khung nhìn trực quan so với cạnh trái khung nhìn bố cục tính bằng pixel CSS.
- {{domxref("VisualViewport.offsetTop")}} {{ReadOnlyInline}}
  - : Trả về độ lệch của cạnh trên khung nhìn trực quan so với cạnh trên khung nhìn bố cục tính bằng pixel CSS.
- {{domxref("VisualViewport.pageLeft")}} {{ReadOnlyInline}}
  - : Trả về tọa độ x của khung nhìn trực quan tương đối với gốc tọa độ của khối chứa ban đầu tính bằng pixel CSS.
- {{domxref("VisualViewport.pageTop")}} {{ReadOnlyInline}}
  - : Trả về tọa độ y của khung nhìn trực quan tương đối với gốc tọa độ của khối chứa ban đầu tính bằng pixel CSS.
- {{domxref("VisualViewport.width")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của khung nhìn trực quan tính bằng pixel CSS.
- {{domxref("VisualViewport.height")}} {{ReadOnlyInline}}
  - : Trả về chiều cao của khung nhìn trực quan tính bằng pixel CSS.
- {{domxref("VisualViewport.scale")}} {{ReadOnlyInline}}
  - : Trả về hệ số thu phóng nhéo ngón tay được áp dụng cho khung nhìn trực quan.

## Phương thức phiên bản

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

## Sự kiện

Lắng nghe các sự kiện này bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình lắng nghe sự kiện vào thuộc tính `oneventname` liên quan của giao diện này.

- {{domxref("VisualViewport/resize_event", "resize")}}
  - : Được kích hoạt khi khung nhìn trực quan bị thay đổi kích thước.
    Cũng có thể truy cập thông qua thuộc tính `onresize`.
- {{domxref("VisualViewport/scroll_event", "scroll")}}
  - : Được kích hoạt khi khung nhìn trực quan bị cuộn.
    Cũng có thể truy cập thông qua thuộc tính `onscroll`.
- {{domxref("VisualViewport/scrollend_event", "scrollend")}}
  - : Được kích hoạt khi thao tác cuộn trên khung nhìn trực quan kết thúc.
    Cũng có thể truy cập thông qua thuộc tính `onscrollend`.

## Ví dụ

## Lấy thông tin khung nhìn trực quan trong khi cuộn và thu phóng

Ví dụ [visual viewport](https://mdn.github.io/dom-examples/visual-viewport-api/) của chúng tôi cung cấp minh họa cơ bản về cách hoạt động của các tính năng khung nhìn trực quan khác nhau, bao gồm cả ba loại sự kiện. Tải trang trên các trình duyệt máy tính và di động hỗ trợ, rồi thử cuộn trang và thu phóng bằng nhéo ngón tay. Khi xảy ra `resize` và `scroll`, hộp thông tin được định vị lại để giữ nguyên vị trí tương đối với khung nhìn trực quan, và thông tin khung nhìn và cuộn được hiển thị cập nhật. Ngoài ra, khi xảy ra `resize` và `scroll`, chúng tôi thay đổi màu hộp để cho thấy có gì đó đang xảy ra, và khôi phục màu khi `scrollend`.

Bạn sẽ thấy rằng trên trình duyệt máy tính, các giá trị {{domxref("Window.scrollX")}} và {{domxref("Window.scrollY")}} được cập nhật khi cửa sổ cuộn, còn vị trí của khung nhìn trực quan không thay đổi. Tuy nhiên, trên trình duyệt di động, các giá trị {{domxref("VisualViewport.offsetLeft")}} và {{domxref("VisualViewport.offsetTop")}} thường được cập nhật, vì thường là khung nhìn trực quan thay đổi chứ không phải vị trí cửa sổ.

Trong ví dụ, hộp thông tin HTML được đại diện bởi một {{htmlelement("div")}} với `id` là `output`, còn CSS được ẩn để ngắn gọn.

```html
<p id="instructions">
  Try scrolling around and pinch-zooming to see how the reported values change.
</p>
<div id="output">
  <p id="visual-info"></p>
  <hr />
  <p id="window-info"></p>
</div>
```

Trong JavaScript, chúng tôi bắt đầu bằng cách lấy tham chiếu đến hộp thông tin sẽ được cập nhật khi trang được thu phóng và cuộn, cũng như hai đoạn văn bên trong nó. Đoạn đầu tiên sẽ chứa các giá trị {{domxref("VisualViewport.offsetLeft")}} và {{domxref("VisualViewport.offsetTop")}} được báo cáo, còn đoạn thứ hai sẽ chứa các giá trị {{domxref("Window.scrollX")}} và {{domxref("Window.scrollY")}} được báo cáo.

```js
const output = document.getElementById("output");
const visualInfo = document.getElementById("visual-info");
const windowInfo = document.getElementById("window-info");
```

Tiếp theo, chúng tôi định nghĩa hai hàm chính sẽ chạy khi các sự kiện được kích hoạt:

- Hàm `scrollUpdater()` sẽ được thực thi khi xảy ra `resize` và `scroll`: hàm này cập nhật vị trí của hộp thông tin tương đối với khung nhìn trực quan bằng cách truy vấn các thuộc tính {{domxref("VisualViewport.offsetTop")}} và {{domxref("VisualViewport.offsetLeft")}} và sử dụng giá trị của chúng để cập nhật các giá trị của {{glossary("inset properties")}} liên quan. Chúng tôi cũng thay đổi màu nền của hộp thông tin để cho thấy có gì đó đang xảy ra, và chạy hàm `updateText()` để cập nhật các giá trị hiển thị trong hộp.
- Hàm `scrollEndUpdater()` sẽ được kích hoạt khi xảy ra `scrollend`: hàm này trả lại màu ban đầu cho hộp thông tin và chạy hàm `updateText()` để đảm bảo các giá trị mới nhất được hiển thị khi `scrollend`.

```js
const scrollUpdater = () => {
  output.style.top = `${visualViewport.offsetTop + 10}px`;
  output.style.left = `${visualViewport.offsetLeft + 10}px`;
  output.style.background = "yellow";
  updateText();
};

const scrollendUpdater = () => {
  output.style.background = "lime";
  updateText();
};
```

Hàm `updateText()` thiết lập {{domxref("HTMLElement.innerText")}} của đoạn đầu tiên để hiển thị các giá trị `VisualViewport.offsetLeft` và `VisualViewport.offsetTop` hiện tại, và `HTMLElement.innerText` của đoạn thứ hai để hiển thị các giá trị `Window.scrollX` và `Window.scrollY` hiện tại. Sau khi định nghĩa `updateText()`, chúng tôi gọi nó ngay lập tức để hộp thông tin hiển thị chính xác khi trang tải.

```js
function updateText() {
  visualInfo.innerText = `Visual viewport left: ${visualViewport.offsetLeft.toFixed(2)}
    top: ${visualViewport.offsetTop.toFixed(2)}`;
  windowInfo.innerText = `Window scrollX: ${window.scrollX.toFixed(2)}
    scrollY: ${window.scrollY.toFixed(2)}`;
}

updateText();
```

Chúng tôi làm tròn tất cả các giá trị đến hai chữ số thập phân bằng phương thức {{jsxref("Number.toFixed()")}} vì một số trình duyệt hiển thị các giá trị dưới pixel với số thập phân lớn.

Bây giờ chúng tôi thiết lập các thuộc tính trình xử lý sự kiện trên cả khung nhìn trực quan và đối tượng {{domxref("Window")}} để chạy các hàm chính vào thời điểm thích hợp trên cả thiết bị di động và máy tính:

- Chúng tôi thiết lập các trình xử lý trên `window` để vị trí và nội dung hộp thông tin sẽ cập nhật khi cuộn cửa sổ thông thường, ví dụ khi bạn cuộn trang trên trình duyệt máy tính.
- Chúng tôi thiết lập các trình xử lý trên `visualViewport` để vị trí và nội dung hộp thông tin sẽ cập nhật khi thực hiện các thao tác cuộn/thu phóng khung nhìn trực quan, ví dụ khi bạn cuộn và thu phóng nhéo ngón tay trang trên trình duyệt di động.

```js
visualViewport.onresize = scrollUpdater;
visualViewport.onscroll = scrollUpdater;
visualViewport.onscrollend = scrollendUpdater;
window.onresize = scrollUpdater;
window.onscroll = scrollUpdater;
window.onscrollend = scrollendUpdater;
```

Hàm `scrollUpdater()` sẽ được kích hoạt khi xảy ra `resize` và `scroll`, còn `scrollEndUpdater()` sẽ được kích hoạt khi xảy ra `scrollend`.

### Ẩn một hộp phủ khi thu phóng

Ví dụ này, được lấy từ [Visual Viewport README](https://github.com/WICG/visual-viewport), cho thấy cách viết một đoạn mã sẽ ẩn một hộp phủ (có thể chứa quảng cáo) khi người dùng thu phóng. Đây là cách hay để cải thiện trải nghiệm người dùng khi thu phóng trên các trang. Cũng có một [bản thử nghiệm trực tiếp](https://wicg.github.io/visual-viewport/examples/hide-on-zoom.html).

```js
const bottomBar = document.getElementById("bottom-bar");
const viewport = window.visualViewport;

function resizeHandler() {
  bottomBar.style.display = viewport.scale > 1.3 ? "none" : "block";
}

window.visualViewport.addEventListener("resize", resizeHandler);
```

### Mô phỏng position: device-fixed

Ví dụ này, cũng được lấy từ [Visual Viewport README](https://github.com/WICG/visual-viewport), cho thấy cách sử dụng API này để mô phỏng `position: device-fixed`, giúp cố định các phần tử vào khung nhìn trực quan. Cũng có một [bản thử nghiệm trực tiếp](https://wicg.github.io/visual-viewport/examples/fixed-to-viewport.html).

```js
const bottomBar = document.getElementById("bottom-bar");
const viewport = window.visualViewport;
function viewportHandler() {
  const layoutViewport = document.getElementById("layoutViewport");

  // Since the bar is position: fixed we need to offset it by the visual
  // viewport's offset from the layout viewport origin.
  const offsetLeft = viewport.offsetLeft;
  const offsetTop =
    viewport.height -
    layoutViewport.getBoundingClientRect().height +
    viewport.offsetTop;

  // You could also do this by setting style.left and style.top if you
  // use width: 100% instead.
  bottomBar.style.transform = `translate(${offsetLeft}px, ${offsetTop}px) scale(${
    1 / viewport.scale
  })`;
}
window.visualViewport.addEventListener("scroll", viewportHandler);
window.visualViewport.addEventListener("resize", viewportHandler);
```

> [!NOTE]
> Kỹ thuật này nên được sử dụng cẩn thận; việc mô phỏng `position: device-fixed` theo cách này có thể khiến phần tử cố định bị nhấp nháy trong khi cuộn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Viewports Explainer](https://github.com/bokand/bokand.github.io/blob/master/web_viewports_explainer.md) — giải thích hữu ích về các khái niệm khung nhìn web, bao gồm sự khác biệt giữa khung nhìn trực quan và khung nhìn bố cục.
