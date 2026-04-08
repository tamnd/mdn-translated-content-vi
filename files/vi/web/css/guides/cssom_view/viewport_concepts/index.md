---
title: Viewport concepts
slug: Web/CSS/Guides/CSSOM_view/Viewport_concepts
page-type: guide
sidebar: cssref
---

Bài viết này giải thích khái niệm về {{glossary("viewport")}} — nó là gì và tác động của nó đối với CSS, SVG, và các thiết bị di động. Bài viết này định nghĩa initial viewport và actual viewport, và phân biệt giữa {{glossary("visual viewport")}} và {{glossary("layout viewport")}}.

## Viewport là gì?

Một **viewport** là tính năng user agent được sử dụng để thiết lập initial containing block cho continuous media.

Thuật ngữ _viewport_ chung thường đề cập đến khu vực trong đồ họa máy tính hiện đang được xem. Về mặt trình duyệt web, điều đó thường giống như cửa sổ trình duyệt, không bao gồm UI, menu bar, v.v. Đó là phần của tài liệu bạn đang xem.

Khi một tài liệu tải, viewport trải qua hai giai đoạn:

- **Initial viewport**
  - : _Initial viewport_ đề cập đến cửa sổ hoặc khu vực xem của UA trước khi user agent styles, thẻ HTML {{htmlelement("meta")}}, hoặc CSS styles đã ghi đè kích thước của nó. Kích thước initial viewport dựa trên kích thước của cửa sổ hoặc khu vực xem, không phải nội dung. Kích thước của initial viewport của user agent full-screen sẽ khác nhau giữa các hướng và thiết bị, nhưng sẽ luôn giống nhau cho cùng một thiết bị ở cùng hướng.

- **Actual viewport**
  - : _Actual viewport_ là viewport bạn nhận được sau khi xử lý [viewport `<meta>` tag](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport). Nội dung được thiết kế cho viewport lớn có thể gặp nhiều lỗi khi xem trong viewport nhỏ hơn, bao gồm wrapping không mong muốn, nội dung bị cắt xén, và {{glossary("scroll container", "scroll containers")}} có kích thước không đúng. Viewport meta tag cung cấp gợi ý về kích thước ban đầu của viewport. Actual viewport là kích thước được định nghĩa bởi thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Elements/meta#content) của nó. Nếu thẻ này bị bỏ qua, một số trình duyệt di động render nội dung sử dụng chiều rộng initial containing block cố định, thường là `980px`. Chúng đặt chiều rộng của actual viewport thành giá trị này, sau đó thu nhỏ nội dung để phù hợp, làm cho kích thước CSS pixel nhỏ hơn pixel thực tế.

Các tài liệu, như bài viết này, có thể rất dài. Viewport của bạn là mọi thứ hiện đang hiển thị; đáng chú ý là phần "viewport là gì", và có thể một số menu điều hướng. Kích thước của viewport phụ thuộc vào kích thước màn hình, liệu trình duyệt có ở chế độ fullscreen hay không, và liệu trình duyệt có bị phóng to hay không. Nội dung bên ngoài viewport, chẳng hạn như phần _Xem Thêm_ trong tài liệu này, có thể sẽ không hiển thị trên màn hình cho đến khi được cuộn vào tầm nhìn.

- Trên các màn hình lớn hơn nơi các ứng dụng không nhất thiết phải full screen, viewport là kích thước cửa sổ trình duyệt.
- Trên hầu hết các thiết bị di động và khi trình duyệt ở chế độ fullscreen, viewport là toàn bộ màn hình.
- Ở chế độ fullscreen, viewport là màn hình thiết bị, cửa sổ là cửa sổ trình duyệt, có thể lớn bằng viewport hoặc nhỏ hơn, và tài liệu là trang web, có thể cao hoặc rộng hơn viewport nhiều.

Đối với [paged media](/en-US/docs/Web/CSS/Guides/Paged_media), initial containing block dựa trên vùng trang. Vùng trang có thể được đặt thông qua các quy tắc {{cssxref("@page")}}.

Tóm lại, viewport về cơ bản là phần của tài liệu hiện đang hiển thị.

### Kích thước viewport có thể thay đổi

Chiều rộng của viewport không phải lúc nào cũng là chiều rộng của cửa sổ. Nếu bạn truy vấn chiều rộng hoặc chiều cao của cửa sổ và tài liệu trong Chrome hoặc Firefox, bạn có thể nhận được:

```js
document.documentElement.clientWidth; /* 1200 */
window.innerWidth; /* 1200 */
window.outerWidth; /* 1200 */
```

```js
document.documentElement.clientHeight; /* 800 */
window.innerHeight; /* 800 */
window.outerHeight; /* 900 */
```

Có một số DOM properties có thể giúp bạn truy vấn kích thước viewport, và các độ dài tương tự khác:

- {{DOMxRef("Element.clientWidth")}} của document element là chiều rộng bên trong của tài liệu theo [CSS pixels](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport#screen_density), bao gồm padding (nhưng không bao gồm borders, margins, hoặc vertical scrollbars, nếu có). **Đây là chiều rộng viewport**.
- {{DOMxRef("Window.innerWidth")}} là chiều rộng, theo CSS pixels, của browser window viewport bao gồm, nếu được render, vertical scrollbar.
- {{DOMxRef("Window.outerWidth")}} là chiều rộng của bên ngoài cửa sổ trình duyệt bao gồm tất cả {{glossary("chrome")}} cửa sổ.

Trong một thí nghiệm với những thứ này, `innerWidth` và `outerWidth` được thấy là giống nhau, nhưng `outerHeight` cao hơn `innerHeight` 100px. Điều này là do `outerHeight` bao gồm chrome trình duyệt: các đo lường được thực hiện trên một trình duyệt có thanh địa chỉ và thanh bookmarks tổng cộng 100px chiều cao, nhưng không có chrome ở bên trái hoặc bên phải của cửa sổ.

Khu vực trong `innerHeight` và `innerWidth` thường được coi là **{{glossary("layout viewport")}}**. Chrome trình duyệt không được coi là một phần của viewport.

Khi phóng to, cả Firefox và Chrome đều báo cáo kích thước {{glossary("CSS pixel")}} mới cho `innerWidth` và `clientWidth`. Các giá trị trả về cho `outerWidth` và `outerHeight` phụ thuộc vào trình duyệt: Firefox báo cáo giá trị mới theo CSS pixels, nhưng Chrome trả về độ dài theo kích thước pixel mặc định. Khi phóng to bạn có thể nhận được:

```js
document.documentElement.clientWidth; /* 800 */
window.innerWidth; /* 800 */
window.outerWidth; /* 800 in Firefox, 1200 in chrome */
```

```js
document.documentElement.clientHeight; /* 533 */
window.innerHeight; /* 533 */
window.outerHeight; /* 596 in Firefox, 900 in chrome */
```

Viewport ban đầu là 1200 x 800 pixels. Sau khi phóng to, viewport trở thành 800 x 533 pixels. Đây là _layout viewport_. Sticky headers hoặc footers, với các kiểu dáng sau, sẽ gắn vào trên cùng và dưới cùng của _layout viewport_ tương ứng.

```css
body > header {
  position: fixed;
  top: 0;
}
body > footer {
  position: fixed;
  bottom: 0;
}
```

Chúng ta đã nhận được đo lường 800 x 533 khi chúng ta phóng to bằng bàn phím. Header và footer vẫn gắn chặt vào trên và dưới cùng của cửa sổ. Nhưng nếu chúng ta đã pinch-zoom trên máy tính bảng thì sao? Điều gì xảy ra nếu một bàn phím động xuất hiện trên điện thoại?

### Layout và visual viewports

Web chứa hai viewports, **layout viewport** và **visual viewport**. Visual viewport là phần của trang web hiện đang hiển thị trong trình duyệt và có thể thay đổi. Khi người dùng pinch-zoom trang, mở một bàn phím động, hoặc khi một thanh địa chỉ trước đó bị ẩn trở nên hiển thị, visual viewport thu nhỏ nhưng layout viewport không thay đổi.

Sticky headers hoặc footers [Fixed](/en-US/docs/Web/CSS/Reference/Properties/position#fixed_positioning), như đã thảo luận ở trên, gắn vào trên và dưới cùng của _layout viewport_, và do đó vẫn hiển thị khi chúng ta phóng to bằng bàn phím. Nếu bạn pinch-zoom, layout viewport có thể không hoàn toàn hiển thị. Nếu bạn phóng to từ giữa layout viewport, nội dung sẽ mở rộng theo cả bốn hướng. Nếu bạn có sticky header hoặc footer, chúng vẫn sẽ gắn vào trên hoặc dưới cùng của layout viewport, nhưng chúng có thể không hiển thị ở trên và dưới cùng của màn hình thiết bị — đó là visual viewport. Visual viewport là phần hiện đang hiển thị của layout viewport. Nếu bạn cuộn xuống, bạn đang thay đổi nội dung của visual viewport và đưa phần dưới cùng của layout viewport vào tầm nhìn, hiển thị sticky footer, sau đó sẽ tiếp tục gắn ở dưới cùng.

Visual viewport là phần hiển thị của màn hình không bao gồm bàn phím trên màn hình, các khu vực bên ngoài vùng pinch-zoom, hoặc bất kỳ tính năng nào không co giãn theo kích thước của trang. Visual viewport có cùng kích thước với layout viewport hoặc nhỏ hơn.

Đối với một trang chứa iframes, objects, hoặc SVG bên ngoài, cả trang chứa và mỗi tệp được bao gồm đều có đối tượng window riêng của chúng. Chỉ cửa sổ cấp cao nhất có visual viewport có thể khác với layout viewport. Đối với các tài liệu được bao gồm, visual viewport và layout viewport là giống nhau.

### CSS

Layout viewport và visual viewport được mô tả ở trên không phải là các viewports duy nhất bạn sẽ gặp. Bất kỳ sub-viewport nào được hiển thị đầy đủ hoặc một phần trong layout viewport đều được coi là visual viewport.

Chúng ta thường nghĩ về các media queries [`width`](/en-US/docs/Web/CSS/Reference/At-rules/@media/width) và [`height`](/en-US/docs/Web/CSS/Reference/At-rules/@media/height) là tương đối với chiều rộng và chiều cao của cửa sổ trình duyệt. Chúng thực sự tương đối với viewport, đó là cửa sổ trong tài liệu chính nhưng là kích thước nội tại của phần tử cha trong browsing context lồng nhau như objects, iframes và SVG. Trong CSS, chúng ta cũng có [các đơn vị độ dài dựa trên kích thước viewport](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#viewport_units). Một đơn vị `vh` là 1% chiều cao của layout viewport. Tương tự, đơn vị `vw` là 1% chiều rộng của layout viewport.

#### `<iframe>`

Bên trong một {{htmlelement("iframe")}}, visual viewport là kích thước chiều rộng và chiều cao bên trong của iframe, thay vì tài liệu cha. Bạn có thể đặt bất kỳ chiều cao và chiều rộng nào trên một iframe, nhưng toàn bộ tài liệu có thể không hiển thị.

Nếu bạn sử dụng [các đơn vị độ dài viewport](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#viewport_units) trong CSS của mình trong tài liệu iframe, `1vh` sẽ là 1% chiều cao của iframe, và `1vw` sẽ là 1% chiều rộng của tài liệu.

```css
iframe {
  width: 50vw;
}
```

Nếu iframe được đặt thành 50vw, nó sẽ là 50% chiều rộng của tài liệu cha `1200px` trong ví dụ của chúng ta ở trên, hoặc `600px`, với `1vw` là `6px`. Khi phóng to, iframe thu nhỏ xuống `400px` và `1vw` trở thành `4px`.

Media query dựa trên chiều rộng trong tài liệu iframe là tương đối với viewport của iframe.

```css
@media screen and (width <= 500px) {
  p {
    color: red;
  }
}
```

Nếu CSS trên được bao gồm trong iframe, các đoạn văn sẽ trở nên đỏ khi người dùng đã phóng to, nhưng kiểu dáng này không áp dụng trong trạng thái không phóng to.

#### SVG

Trong tài liệu [SVG](/en-US/docs/Web/SVG), viewport là khu vực hiển thị của hình ảnh SVG. Bạn có thể đặt bất kỳ chiều cao và chiều rộng nào trên một {{SVGElement("svg")}}, nhưng toàn bộ hình ảnh có thể không hiển thị. Khu vực hiển thị được gọi là viewport. Kích thước viewport có thể được xác định bằng cách sử dụng thuộc tính width và height của phần tử `<svg>`.

```html
<svg height="300" width="400"></svg>
```

Trong ví dụ này, viewport có {{glossary("aspect ratio")}} 3:4 và mặc định là 400 x 300 đơn vị, với đơn vị thường là CSS pixel.

SVG cũng có một [hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems) nội bộ được xác định thông qua thuộc tính [viewBox](/en-US/docs/Web/SVG/Reference/Attribute/viewBox), không liên quan đến cuộc thảo luận viewport này.

Nếu bạn bao gồm tệp SVG trong HTML của mình, viewport của SVG là initial containing block, hoặc chiều rộng và chiều cao của SVG container. Sử dụng query {{CSSxRef("@media")}} trong CSS của SVG là tương đối với container đó, không phải trình duyệt.

```css
@media screen and (400px <= width <= 500px) {
  /* CSS goes here */
}
```

Thông thường, khi bạn viết media query ở trên, các kiểu dáng được áp dụng nếu viewport, thường là cửa sổ trình duyệt, nằm giữa 400px và 500px, bao gồm. Media query width trong SVG dựa trên phần tử mà SVG được chứa — {{htmlelement("img")}} nếu nguồn là tệp SVG, chính SVG nếu SVG được bao gồm trực tiếp vào HTML, hoặc phần tử cha nếu phần tử cha có chiều rộng được gán — và không phải chiều rộng của viewport. Với media query ở trên trong tệp SVG của chúng ta, CSS được áp dụng nếu SVG container nằm giữa 400px và 500px.

### JavaScript

Interface [`VisualViewport`](/en-US/docs/Web/API/VisualViewport#examples) cung cấp cơ chế để truy vấn và sửa đổi các thuộc tính của visual viewport.

Interface [`Viewport`](/en-US/docs/Web/API/Viewport) cung cấp cơ chế để truy vấn và sửa đổi các thuộc tính của visual viewport.

## Mobile viewports

Các thiết bị di động có nhiều hình dạng và kích thước, với màn hình có {{glossary("device pixel")}} ratios khác nhau. Viewport của trình duyệt di động là khu vực của cửa sổ mà nội dung web có thể được xem, không nhất thiết là kích thước giống như trang được render. Các trình duyệt di động render trang trong một cửa sổ hoặc viewport ảo, thường là 980px, thường rộng hơn màn hình, sau đó thu nhỏ kết quả được render để có thể nhìn thấy tất cả cùng một lúc. Người dùng sau đó có thể pan và zoom để xem các khu vực khác nhau của trang. Ví dụ, nếu màn hình di động có chiều rộng 320px, một trang web có thể được render với viewport ảo là 980px, sau đó nó sẽ bị thu nhỏ để phù hợp vào không gian 320px, điều này, tùy thuộc vào thiết kế, không thể đọc được với nhiều người nếu không phải tất cả. Để nói với trình duyệt di động sử dụng chiều rộng viewport thay vì 980px mặc định làm chiều rộng màn hình, các nhà phát triển có thể bao gồm một viewport meta tag, như sau:

```html
<meta name="viewport" content="width=device-width" />
```

Thuộc tính `width` kiểm soát kích thước của viewport. Nó nên được đặt thành `device-width`, là chiều rộng của màn hình theo CSS pixels ở tỷ lệ 100%. Có các thuộc tính khác, bao gồm `maximum-scale`, `minimum-scale`, và `user-scalable`, kiểm soát liệu người dùng có thể zoom vào hoặc ra khỏi trang hay không, nhưng các giá trị mặc định là tốt nhất cho khả năng truy cập và trải nghiệm người dùng, vì vậy những thứ này có thể bị bỏ qua.

## Xem thêm

- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view)
- [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API)
- {{HTMLElement("meta")}}, cụ thể là [`<meta name="viewport">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport)
- Module [CSS viewport](/en-US/docs/Web/CSS/Guides/Viewport)
- Module [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view)
