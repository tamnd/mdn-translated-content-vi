---
title: Thực hiện phát hiện tính năng
short-title: Phát hiện tính năng
slug: Learn_web_development/Extensions/Testing/Feature_detection
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/HTML_and_CSS","Learn_web_development/Extensions/Testing/Automated_testing", "Learn_web_development/Extensions/Testing")}}

Phát hiện tính năng liên quan đến việc tìm hiểu xem trình duyệt có hỗ trợ một khối mã nhất định không, và chạy mã khác nhau tùy thuộc vào việc nó có hỗ trợ hay không, để trình duyệt luôn có thể cung cấp trải nghiệm làm việc thay vì gặp lỗi trong một số trình duyệt. Bài viết này chi tiết cách viết bài kiểm thử phát hiện tính năng đơn giản của riêng bạn, cách sử dụng thư viện để tăng tốc triển khai, và các tính năng gốc để phát hiện tính năng như `@supports`.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
        <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>; có ý tưởng về các nguyên tắc cấp cao
        <a
          href="/en-US/docs/Learn_web_development/Extensions/Testing/Introduction"
          >của kiểm thử đa trình duyệt</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu khái niệm phát hiện tính năng là gì, và có khả năng
        triển khai các giải pháp phù hợp trong CSS và JavaScript.
      </td>
    </tr>
  </tbody>
</table>

## Khái niệm phát hiện tính năng

Ý tưởng đằng sau phát hiện tính năng là bạn có thể chạy bài kiểm thử để xác định xem một tính năng có được hỗ trợ trong trình duyệt hiện tại không, và sau đó chạy mã có điều kiện để cung cấp trải nghiệm chấp nhận được trong cả các trình duyệt _hỗ trợ_ tính năng và các trình duyệt _không hỗ trợ_. Nếu bạn không làm điều này, các trình duyệt không hỗ trợ các tính năng bạn đang sử dụng trong mã có thể không hiển thị trang web của bạn đúng cách hoặc thậm chí bị lỗi, tạo ra trải nghiệm người dùng tồi.

Hãy nhìn lại ví dụ chúng ta đã đề cập trong bài viết [Gỡ lỗi và xử lý lỗi JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Debugging_JavaScript#feature_detection) — [Geolocation API](/en-US/docs/Web/API/Geolocation_API) (hiển thị dữ liệu vị trí có sẵn cho thiết bị mà trình duyệt web đang chạy) có điểm truy cập chính để sử dụng nó, thuộc tính `geolocation` có sẵn trên đối tượng [Navigator](/en-US/docs/Web/API/Navigator) toàn cục. Do đó, bạn có thể phát hiện xem trình duyệt có hỗ trợ định vị địa lý hay không bằng cách sử dụng điều gì đó như sau:

```js
if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition((position) => {
    // show the location on a map, such as the Google Maps API
  });
} else {
  // Give the user a choice of static maps
}
```

Trước khi tiếp tục, chúng ta muốn nói một điều ngay từ đầu — đừng nhầm lẫn phát hiện tính năng với **nhận dạng trình duyệt** (phát hiện trình duyệt cụ thể nào đang truy cập trang web) — đây là thực hành tồi tệ nên được ngăn cản bằng mọi giá. Xem [Browser detection using the user agent string (UA sniffing)](/en-US/docs/Web/HTTP/Guides/Browser_detection_using_the_user_agent) để biết thêm chi tiết.

## Viết bài kiểm thử phát hiện tính năng của riêng bạn

Trong phần này, chúng ta sẽ xem xét triển khai các bài kiểm thử phát hiện tính năng của riêng bạn, trong cả CSS và JavaScript.

### CSS

Bạn có thể viết các bài kiểm thử cho các tính năng CSS bằng cách kiểm tra sự tồn tại của _[element.style.property](/en-US/docs/Web/API/HTMLElement/style)_ (ví dụ: `paragraph.style.rotate`) trong JavaScript.

Một ví dụ điển hình có thể là kiểm tra hỗ trợ [Subgrid](/en-US/docs/Web/CSS/Guides/Grid_layout/Subgrid) trong trình duyệt; đối với các trình duyệt hỗ trợ giá trị `subgrid` cho {{cssxref("grid-template-columns")}} và {{cssxref("grid-template-rows")}}, chúng ta có thể sử dụng subgrid trong bố cục của mình. Đối với các trình duyệt không hỗ trợ, chúng ta có thể sử dụng grid thông thường hoạt động tốt nhưng không trông đẹp bằng.

Sử dụng điều này làm ví dụ, chúng ta có thể bao gồm stylesheet subgrid nếu giá trị được hỗ trợ và stylesheet grid thông thường nếu không. Để làm vậy, chúng ta có thể bao gồm hai stylesheets trong phần head của tệp HTML của chúng ta: một cho tất cả kiểu dáng, và một triển khai bố cục mặc định nếu subgrid không được hỗ trợ:

```html
<link href="basic-styling.css" rel="stylesheet" />
<link class="conditional" href="grid-layout.css" rel="stylesheet" />
```

Ở đây, `basic-styling.css` xử lý tất cả kiểu dáng mà chúng ta muốn cung cấp cho mọi trình duyệt. Chúng ta có hai tệp CSS bổ sung, `grid-layout.css` và `subgrid-layout.css`, chứa CSS mà chúng ta muốn áp dụng có chọn lọc cho các trình duyệt tùy thuộc vào mức độ hỗ trợ của chúng.

Chúng ta sử dụng JavaScript để kiểm tra hỗ trợ cho giá trị subgrid, sau đó cập nhật `href` của stylesheet có điều kiện dựa trên hỗ trợ trình duyệt.

Chúng ta có thể thêm `<script></script>` vào tài liệu của mình, điền vào JavaScript sau:

```js
const conditional = document.querySelector(".conditional");
if (CSS.supports("grid-template-columns", "subgrid")) {
  conditional.setAttribute("href", "subgrid-layout.css");
}
```

Trong câu lệnh điều kiện của chúng ta, chúng ta kiểm tra xem thuộc tính {{cssxref("grid-template-columns")}} có hỗ trợ giá trị `subgrid` không bằng cách sử dụng [`CSS.supports()`](/en-US/docs/Web/API/CSS/supports_static).

#### @supports

CSS có cơ chế phát hiện tính năng gốc: quy tắc at {{cssxref("@supports")}}. Điều này hoạt động theo cách tương tự như [media queries](/en-US/docs/Web/CSS/Guides/Media_queries) ngoại trừ thay vì áp dụng CSS có chọn lọc tùy thuộc vào tính năng phương tiện như độ phân giải, chiều rộng màn hình hoặc {{glossary("aspect ratio")}}, nó áp dụng CSS có chọn lọc tùy thuộc vào việc một tính năng CSS có được hỗ trợ hay không, tương tự như `CSS.supports()`.

Ví dụ, chúng ta có thể viết lại ví dụ trước để sử dụng `@supports`:

```css
@supports (grid-template-columns: subgrid) {
  main {
    display: grid;
    grid-template-columns: repeat(9, 1fr);
    grid-template-rows: repeat(4, minmax(100px, auto));
  }

  .item {
    display: grid;
    grid-column: 2 / 7;
    grid-row: 2 / 4;
    grid-template-columns: subgrid;
    grid-template-rows: repeat(3, 80px);
  }

  .subitem {
    grid-column: 3 / 6;
    grid-row: 1 / 3;
  }
}
```

Khối quy tắc at này chỉ áp dụng quy tắc CSS bên trong nếu trình duyệt hiện tại hỗ trợ khai báo `grid-template-columns: subgrid;`. Để điều kiện với một giá trị hoạt động, bạn cần bao gồm khai báo hoàn chỉnh (không chỉ tên thuộc tính) và KHÔNG bao gồm dấu chấm phẩy ở cuối.

`@supports` cũng có logic `AND`, `OR` và `NOT` — khối khác áp dụng bố cục grid thông thường nếu tùy chọn subgrid không có sẵn:

```css
@supports not (grid-template-columns: subgrid) {
  /* rules in here */
}
```

Điều này thuận tiện hơn so với ví dụ trước — chúng ta có thể thực hiện tất cả việc phát hiện tính năng trong CSS, không cần JavaScript, và chúng ta có thể xử lý tất cả logic trong một tệp CSS duy nhất, giảm các yêu cầu HTTP. Vì lý do này, đây là phương pháp ưa thích để xác định hỗ trợ trình duyệt cho các tính năng CSS.

### JavaScript

Chúng ta đã thấy một ví dụ về bài kiểm thử phát hiện tính năng JavaScript trước đó. Nhìn chung, các bài kiểm thử như vậy được thực hiện thông qua một trong một vài mẫu phổ biến.

Các mẫu phổ biến cho các tính năng có thể phát hiện bao gồm:

- Thành viên của một đối tượng
  - : Kiểm tra xem một phương thức hoặc thuộc tính cụ thể (thường là điểm truy cập để sử dụng API hoặc tính năng khác bạn đang phát hiện) có tồn tại trong `Object` cha của nó không.

    Ví dụ trước của chúng ta đã sử dụng mẫu này để phát hiện hỗ trợ [Geolocation](/en-US/docs/Web/API/Geolocation_API) bằng cách kiểm tra đối tượng [`navigator`](/en-US/docs/Web/API/Navigator) để tìm thành viên `geolocation`:

    ```js
    if ("geolocation" in navigator) {
      // Access navigator.geolocation APIs
    }
    ```

- Thuộc tính của một phần tử
  - : Tạo một phần tử trong bộ nhớ bằng {{domxref("Document.createElement()")}} và sau đó kiểm tra xem một thuộc tính có tồn tại trên nó không.

    Ví dụ này cho thấy cách phát hiện hỗ trợ [Canvas API](/en-US/docs/Web/API/Canvas_API):

    ```js
    function supportsCanvas() {
      return !!document.createElement("canvas").getContext;
    }

    if (supportsCanvas()) {
      // Create and draw on canvas elements
    }
    ```

    > [!NOTE]
    > `NOT` kép trong ví dụ trên (`!!`) là cách để buộc giá trị trả về trở thành giá trị boolean "đúng nghĩa", thay vì giá trị {{glossary("Truthy")}}/{{glossary("Falsy")}} có thể làm lệch kết quả.

- Giá trị trả về cụ thể của một phương thức trên một phần tử
  - : Tạo một phần tử trong bộ nhớ bằng {{domxref("Document.createElement()")}} và sau đó kiểm tra xem một phương thức có tồn tại trên nó không. Nếu có, hãy kiểm tra giá trị nó trả về.

- Lưu giữ giá trị thuộc tính được gán bởi một phần tử
  - : Tạo một phần tử trong bộ nhớ bằng {{domxref("Document.createElement()")}}, đặt thuộc tính thành một giá trị cụ thể, sau đó kiểm tra xem giá trị có được giữ lại không.

Hãy nhớ rằng một số tính năng, tuy nhiên, được biết là không thể phát hiện. Trong những trường hợp này, bạn sẽ cần sử dụng cách tiếp cận khác, chẳng hạn như sử dụng {{Glossary("Polyfill", "polyfill")}}.

#### matchMedia

Chúng ta cũng muốn đề cập đến tính năng JavaScript {{domxref("Window.matchMedia")}} tại thời điểm này. Đây là thuộc tính cho phép bạn chạy các bài kiểm thử media query bên trong JavaScript. Nó trông như sau:

```js
if (window.matchMedia("(width <= 480px)").matches) {
  // run JavaScript in here.
}
```

Ví dụ, demo [Snapshot](https://github.com/chrisdavidmills/snapshot) của chúng ta sử dụng nó để áp dụng có chọn lọc thư viện JavaScript Brick và sử dụng nó để xử lý bố cục UI, nhưng chỉ cho bố cục màn hình nhỏ (rộng 480px hoặc ít hơn). Đầu tiên chúng ta sử dụng thuộc tính `media` để chỉ áp dụng CSS Brick cho trang nếu chiều rộng trang là 480px hoặc ít hơn:

```html
<link href="dist/brick.css" rel="stylesheet" media="(width <= 480px)" />
```

Sau đó chúng ta sử dụng `matchMedia()` trong JavaScript nhiều lần, để chỉ chạy các hàm điều hướng Brick nếu chúng ta đang ở bố cục màn hình nhỏ (trong các bố cục màn hình rộng hơn, mọi thứ có thể được nhìn thấy cùng một lúc, vì vậy chúng ta không cần điều hướng giữa các chế độ xem khác nhau).

```js
if (window.matchMedia("(width <= 480px)").matches) {
  deck.shuffleTo(1);
}
```

## Tóm tắt

Bài viết này đã đề cập đến phát hiện tính năng với mức độ chi tiết hợp lý, đi qua các khái niệm chính và chỉ cho bạn cách triển khai các bài kiểm thử phát hiện tính năng của riêng bạn.

Tiếp theo, chúng ta sẽ bắt đầu xem xét kiểm thử tự động.

{{PreviousMenuNext("Learn_web_development/Extensions/Testing/HTML_and_CSS","Learn_web_development/Extensions/Testing/Automated_testing", "Learn_web_development/Extensions/Testing")}}
