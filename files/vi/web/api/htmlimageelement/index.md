---
title: HTMLImageElement
slug: Web/API/HTMLImageElement
page-type: web-api-interface
browser-compat: api.HTMLImageElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLImageElement`** đại diện cho phần tử HTML {{HTMLElement("img")}}, cung cấp các thuộc tính và phương thức được sử dụng để thao tác các phần tử hình ảnh.

{{InheritanceDiagram}}

## Người xây dựng

- {{domxref("HTMLImageElement.Image()", "Image()")}}
  - : Hàm tạo `Image()` tạo và trả về một đối tượng `HTMLImageElement` mới đại diện cho phần tử HTML {{HTMLElement("img")}} không được gắn vào bất kỳ cây DOM nào. Nó chấp nhận các tham số chiều rộng và chiều cao tùy chọn. Khi được gọi không có tham số, `new Image()` tương đương với việc gọi {{DOMxRef("Document.createElement()", "document.createElement('img')")}}.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha mẹ của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLImageElement.alt")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt), do đó cho biết nội dung dự phòng thay thế sẽ được hiển thị nếu hình ảnh chưa được tải.
- {{domxref("HTMLImageElement.attributionSrc")}} {{securecontext_inline}} {{deprecated_inline}}
  - : Lấy và đặt thuộc tính [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/img#attributionsrc) trên phần tử {{htmlelement("img")}} theo chương trình, phản ánh giá trị của thuộc tính đó. `attributionsrc` chỉ định rằng bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu hình ảnh. Ở phía máy chủ, điều này được sử dụng để kích hoạt gửi tiêu đề {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi, để đăng ký [nguồn phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#html-based_event_sources) hoặc [trình kích hoạt phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#html-based_attribution_triggers) dựa trên hình ảnh.
- {{domxref("HTMLImageElement.complete")}} {{ReadOnlyInline}}
  - : Trả về giá trị boolean là `true` nếu trình duyệt đã tìm nạp xong hình ảnh, cho dù thành công hay không. Điều đó có nghĩa là giá trị này cũng là `true` nếu hình ảnh không có giá trị {{domxref("HTMLImageElement.src", "src")}} biểu thị hình ảnh cần tải.
- {{domxref("HTMLImageElement.crossOrigin")}}
  - : Một chuỗi chỉ định cài đặt CORS cho thành phần hình ảnh này. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết thêm chi tiết. Đây có thể là `null` nếu CORS không được sử dụng.
- {{domxref("HTMLImageElement.currentSrc")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho URL mà hình ảnh hiện đang hiển thị đã được tải từ đó. Điều này có thể thay đổi khi hình ảnh được điều chỉnh do các điều kiện thay đổi, theo chỉ dẫn của bất kỳ [truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries) nào hiện có.
- {{domxref("HTMLImageElement.decoding")}}
  - : Một chuỗi tùy chọn thể hiện gợi ý được cung cấp cho trình duyệt về cách giải mã hình ảnh. Nếu giá trị này được cung cấp thì nó phải là một trong các giá trị được phép có thể có: `sync` để giải mã hình ảnh một cách đồng bộ, `async` để giải mã nó một cách không đồng bộ hoặc `auto` để biểu thị không có ưu tiên nào (là mặc định). Đọc trang {{domxref("HTMLImageElement.decoding", "decoding")}} để biết chi tiết về ý nghĩa của các giá trị thuộc tính này.
- {{domxref("HTMLImageElement.fetchPriority")}}
  - : Một chuỗi tùy chọn thể hiện gợi ý được cung cấp cho trình duyệt về cách ưu tiên tìm nạp hình ảnh so với các hình ảnh khác. Nếu giá trị này được cung cấp thì nó phải là một trong các giá trị được phép có thể có: `high` để tìm nạp ở mức ưu tiên cao, `low` để tìm nạp ở mức ưu tiên thấp hoặc `auto` để biểu thị không có tùy chọn nào (là mặc định).
- {{domxref("HTMLImageElement.height")}}
  - : Một giá trị số nguyên phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/img#height), cho biết chiều cao được hiển thị của hình ảnh bằng pixel CSS.
- {{domxref("HTMLImageElement.isMap")}}
  - : Giá trị boolean phản ánh thuộc tính HTML [`ismap`](/en-US/docs/Web/HTML/Reference/Elements/img#ismap), cho biết hình ảnh là một phần của bản đồ hình ảnh phía máy chủ. Điều này khác với bản đồ hình ảnh phía máy khách, được chỉ định bằng phần tử `<img>` và {{HTMLElement("map")}} tương ứng chứa các phần tử {{HTMLElement("area")}} biểu thị các khu vực có thể nhấp vào trong hình ảnh. Hình ảnh _phải_ được chứa trong phần tử {{HTMLElement("a")}}; xem trang `ismap` để biết chi tiết.
- {{domxref("HTMLImageElement.loading")}}
  - : Một chuỗi cho biết trình duyệt nên tải hình ảnh ngay lập tức (`eager`) hay khi cần thiết (`lazy`).
- {{domxref("HTMLImageElement.naturalHeight")}} {{ReadOnlyInline}}
  - : Trả về một giá trị số nguyên biểu thị chiều cao nội tại của hình ảnh bằng pixel CSS, nếu có; nếu không, nó hiển thị `0`. Đây là chiều cao của hình ảnh nếu nó được hiển thị ở kích thước đầy đủ tự nhiên.
- {{domxref("HTMLImageElement.naturalWidth")}} {{ReadOnlyInline}}
  - : Một giá trị số nguyên biểu thị chiều rộng nội tại của hình ảnh tính bằng pixel CSS, nếu có; nếu không nó sẽ hiển thị `0`. Đây là chiều rộng của hình ảnh nếu nó được hiển thị ở kích thước đầy đủ tự nhiên.
- {{domxref("HTMLImageElement.referrerPolicy")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/img#referrerpolicy), cho {{Glossary("user agent")}} biết cách quyết định sử dụng liên kết giới thiệu nào để tìm nạp hình ảnh. Đọc bài viết này để biết chi tiết về các giá trị có thể có của chuỗi này.
- {{domxref("HTMLImageElement.sizes")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`sizes`](/en-US/docs/Web/HTML/Reference/Elements/img#sizes). Chuỗi này chỉ định danh sách các kích thước có điều kiện được phân tách bằng dấu phẩy cho hình ảnh; nghĩa là, đối với kích thước khung nhìn nhất định, kích thước hình ảnh cụ thể sẽ được sử dụng. Đọc tài liệu trên trang {{domxref("HTMLImageElement.sizes", "sizes")}} để biết chi tiết về định dạng của chuỗi này.
- {{domxref("HTMLImageElement.src")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src), chứa URL đầy đủ của hình ảnh bao gồm URI cơ sở. Bạn có thể tải một hình ảnh khác vào thành phần bằng cách thay đổi URL trong thuộc tính `src`.
- {{domxref("HTMLImageElement.srcset")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset). Điều này chỉ định danh sách các hình ảnh đề xuất, được phân tách bằng dấu phẩy (`',', U+002C COMMA`). Mỗi hình ảnh ứng cử viên là một URL, theo sau là khoảng trắng, theo sau là một chuỗi được định dạng đặc biệt cho biết kích thước của hình ảnh. Kích thước có thể được chỉ định theo chiều rộng hoặc bội số kích thước. Đọc trang {{domxref("HTMLImageElement.srcset", "srcset")}} để biết thông tin cụ thể về định dạng của chuỗi con kích thước.
- {{domxref("HTMLImageElement.useMap")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/img#usemap), chứa URL trang cục bộ của phần tử {{HTMLElement("map")}} mô tả bản đồ hình ảnh sẽ sử dụng. URL trang cục bộ là ký hiệu pound (băm) (`#`) theo sau là `name` của phần tử `<map>`, chẳng hạn như `#my-map-element`. Lần lượt `<map>` chứa các phần tử {{HTMLElement("area")}} biểu thị các vùng có thể nhấp vào trong hình ảnh.
- {{domxref("HTMLImageElement.width")}}
  - : Một giá trị số nguyên phản ánh thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/img#width), cho biết chiều rộng được hiển thị của hình ảnh bằng pixel CSS.
- {{domxref("HTMLImageElement.x")}} {{ReadOnlyInline}}
  - : Một số nguyên biểu thị độ lệch ngang của cạnh viền trái của hộp bố cục CSS của hình ảnh so với điểm gốc của khối chứa phần tử {{HTMLElement("html")}}.
- {{domxref("HTMLImageElement.y")}} {{ReadOnlyInline}}
  - : Độ lệch dọc của số nguyên của cạnh viền trên cùng của hộp bố cục CSS của hình ảnh so với điểm gốc của khối chứa phần tử {{HTMLElement("html")}}.

## Thuộc tính lỗi thời

- {{domxref("HTMLImageElement.align")}} {{deprecated_inline}}
  - : Một chuỗi biểu thị sự căn chỉnh của hình ảnh so với bối cảnh xung quanh. Các giá trị có thể là `"left"`, `"right"`, `"justify"` và `"center"`. Điều này đã lỗi thời; thay vào đó bạn nên sử dụng CSS (chẳng hạn như {{cssxref("text-align")}}, CSS này hoạt động với hình ảnh bất kể tên của nó) để chỉ định căn chỉnh.
- {{domxref("HTMLImageElement.border")}} {{deprecated_inline}}
  - : Một chuỗi xác định độ rộng của đường viền xung quanh hình ảnh. Điều này không được dùng nữa; thay vào đó hãy sử dụng thuộc tính CSS {{cssxref("border")}}.
- {{domxref("HTMLImageElement.hspace")}} {{deprecated_inline}}
  - : Một giá trị số nguyên chỉ định lượng không gian (tính bằng pixel) được để trống ở bên trái và bên phải của hình ảnh.
- {{domxref("HTMLImageElement.longDesc")}} {{deprecated_inline}}
  - : Một chuỗi chỉ định URL nơi có thể tìm thấy mô tả dài về nội dung của hình ảnh. Điều này được sử dụng để tự động biến hình ảnh thành siêu liên kết. Thay vào đó, HTML hiện đại nên đặt `<img>` bên trong phần tử {{HTMLElement("a")}} xác định siêu liên kết.
- {{domxref("HTMLImageElement.name")}} {{deprecated_inline}}
  - : Một chuỗi đại diện cho tên của phần tử.
- {{domxref("HTMLImageElement.vspace")}} {{deprecated_inline}}
  - : Một giá trị số nguyên xác định lượng không gian trống, tính bằng pixel, để lại phía trên và phía dưới hình ảnh.

## Phương thức sơ thẩm

_Kế thừa các phương thức từ cha của nó, {{domxref("HTMLElement")}}._

- {{domxref("HTMLImageElement.decode()")}}
  - : Trả về {{jsxref("Promise")}} sẽ giải quyết khi hình ảnh được giải mã và việc thêm hình ảnh vào DOM là an toàn. Điều này ngăn việc hiển thị khung tiếp theo phải tạm dừng để giải mã hình ảnh, điều này sẽ xảy ra nếu một hình ảnh chưa được mã hóa được thêm vào DOM.

## Lỗi

Nếu xảy ra lỗi khi cố tải hoặc hiển thị hình ảnh và trình xử lý sự kiện `onerror` đã được định cấu hình để xử lý sự kiện {{domxref("HTMLElement/error_event", "error")}} thì trình xử lý sự kiện đó sẽ được gọi. Điều này có thể xảy ra trong một số tình huống, bao gồm:

- Thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/img#src) trống hoặc `null`.
- URL `src` được chỉ định giống với URL của trang mà người dùng hiện đang truy cập.
- Hình ảnh được chỉ định bị hỏng theo một cách nào đó khiến nó không thể tải được.
- Siêu dữ liệu của hình ảnh được chỉ định bị hỏng đến mức không thể truy xuất kích thước của nó và không có kích thước nào được chỉ định trong thuộc tính của phần tử `<img>`.
- Hình ảnh được chỉ định có định dạng không được {{Glossary("user agent")}} hỗ trợ.

## Ví dụ

### Tạo và chèn một phần tử hình ảnh

```js
const img1 = new Image(); // Image constructor
img1.src = "image1.png";
img1.alt = "alt";
document.body.appendChild(img1);

const img2 = document.createElement("img"); // Use DOM HTMLImageElement
img2.src = "image2.jpg";
img2.alt = "alt text";
document.body.appendChild(img2);

// using first image in the document
alert(document.images[0].src);
```

### Lấy chiều rộng và chiều cao

Ví dụ sau đây cho thấy việc sử dụng thuộc tính `height` và `width` cùng với các hình ảnh có kích thước khác nhau:

```html
<p>
  Image 1: no height, width, or style
  <img id="image1" src="https://www.mozilla.org/images/mozilla-banner.gif" />
</p>

<p>
  Image 2: height="50", width="500", but no style
  <img
    id="image2"
    src="https://www.mozilla.org/images/mozilla-banner.gif"
    height="50"
    width="500" />
</p>

<p>
  Image 3: no height, width, but style="height: 50px; width: 500px;"
  <img
    id="image3"
    src="https://www.mozilla.org/images/mozilla-banner.gif"
    style="height: 50px; width: 500px;" />
</p>

<div id="output"></div>
```

```js
const arrImages = [
  document.getElementById("image1"),
  document.getElementById("image2"),
  document.getElementById("image3"),
];

const objOutput = document.getElementById("output");
let strHtml = "<ul>";

for (let i = 0; i < arrImages.length; i++) {
  const img = arrImages[i];
  strHtml += `<li>image${i + 1}: height=${img.height}, width=${img.width}, style.height=${img.style.height}, style.width=${img.style.width}</li>`;
}

strHtml += "</ul>";

objOutput.innerHTML = strHtml;
```

{{EmbedLiveSample("getting width and height", "", "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{HTMLElement("img")}}
