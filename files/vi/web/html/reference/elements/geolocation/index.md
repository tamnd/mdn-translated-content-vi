---
title: "<geolocation>: Phần tử định vị địa lý"
slug: Web/HTML/Reference/Elements/geolocation
page-type: html-element
status:
  - experimental
browser-compat: html.elements.geolocation
sidebar: htmlsidebar
---

{{SeeCompatTable}}

Phần tử **`<geolocation>`** trong [HTML](/vi/docs/Web/HTML) tạo ra một điều khiển tương tác để người dùng chia sẻ dữ liệu vị trí của họ với trang.

Nó cung cấp:

- Giao diện người dùng trực quan được định nghĩa bởi trình duyệt.
- Quy trình xử lý các quyền cần thiết cho tính năng `geolocation`.
- Các tính năng API để truy cập dữ liệu vị trí và phản hồi dữ liệu vị trí đã nhận và các thay đổi quyền.

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `autolocate` {{experimental_inline}}
  - : Thuộc tính boolean mà khi được đặt thành `true`, chỉ định rằng trình duyệt nên lấy dữ liệu vị trí ngay khi phần tử `<geolocation>` được hiển thị, với điều kiện là quyền đã được cấp trước đó. Nếu đặt thành `false`, dữ liệu vị trí sẽ không được lấy cho đến khi người dùng kích hoạt điều khiển. Mặc định là `false`.

    Nếu quyền chưa được cấp trước đó, thuộc tính này không có hiệu lực.

- `watch` {{experimental_inline}}
  - : Thuộc tính boolean mà khi được đặt thành `true`, chỉ định rằng trình duyệt nên lấy dữ liệu vị trí bất cứ khi nào vị trí thiết bị của người dùng thay đổi. Nếu đặt thành `false`, dữ liệu vị trí chỉ được lấy một lần. Mặc định là `false`.

## Mô tả

Phần tử `<geolocation>` cung cấp điều khiển do trình duyệt định nghĩa theo cách khai báo để chia sẻ dữ liệu vị trí. Ví dụ, trong Chrome, nút có biểu tượng "đinh ghim bản đồ" và văn bản trực quan ("Use location" trong nội dung tiếng Anh).

Nó cũng cho phép quản lý quyền người dùng một cách trực quan.
Ví dụ, trong Chrome, nếu người dùng trước đó đã từ chối quyền truy cập dữ liệu vị trí, hoặc đã bỏ qua hộp thoại quyền mà không đưa ra lựa chọn, họ có thể nhấn lại nút để cập nhật lựa chọn của mình.
Trong các trường hợp họ trước đó đã từ chối quyền, các hộp thoại tiếp theo sẽ thông báo cho họ rằng trước đây họ không cho phép chia sẻ dữ liệu vị trí, và hỏi liệu họ có muốn tiếp tục không cho phép, hay cho phép.

Một khía cạnh quan trọng của phần tử `<geolocation>` là nó phản ánh sự lựa chọn có ý thức của người dùng, và ngăn chặn việc sử dụng có thể lừa người dùng vô tình cung cấp dữ liệu vị trí của họ (xem [`<geolocation>` blocking](#geolocation_blocking) để biết thêm thông tin).

Giao diện API DOM của phần tử, {{domxref("HTMLGeolocationElement")}}, cung cấp các tính năng để truy cập dữ liệu vị trí trả về, trạng thái quyền hiện tại và lỗi nếu việc lấy dữ liệu không thành công, giảm lượng logic JavaScript cần viết. Nó cũng có các sự kiện để chạy mã để phản hồi dữ liệu vị trí được nhận, thay đổi trạng thái quyền và tương tác người dùng với hộp thoại quyền.

> [!NOTE]
> Vì lý do hiệu suất, tối đa ba phần tử `<geolocation>` được phép trên bất kỳ trang nào. Nếu hạn mức này vượt quá, tất cả các phần tử `<geolocation>` sẽ bị vô hiệu hóa chức năng.

### Mối quan hệ với Geolocation API

[Geolocation API](/vi/docs/Web/API/Geolocation_API) cung cấp một phương án thay thế cũ hơn để xử lý dữ liệu vị trí. API này có một số hạn chế mà phần tử `<geolocation>` hướng đến giải quyết, đáng chú ý nhất là UI và logic cơ bản để yêu cầu dữ liệu cần được thực hiện từ đầu mỗi lần, và việc xử lý quyền có thể không trực quan.

Phần tử `<geolocation>` sử dụng các tính năng của Geolocation API ở phía sau. Theo mặc định, trình duyệt yêu cầu dữ liệu vị trí một lần, như thể phương thức {{domxref("Geolocation.getCurrentPosition()")}} đã được gọi. Tuy nhiên, nếu thuộc tính `watch` được đặt thành `true`, trình duyệt cập nhật dữ liệu bất cứ khi nào vị trí thiết bị thay đổi, như thể {{domxref("Geolocation.watchPosition()")}} đã được gọi.

Nếu dữ liệu được lấy thành công, nó có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.position")}}, chứa đối tượng {{domxref("GeolocationPosition")}}. Nếu việc lấy dữ liệu không thành công, thông tin lỗi có sẵn trong thuộc tính {{domxref("HTMLGeolocationElement.error")}}, chứa đối tượng {{domxref("GeolocationPositionError")}}.

### Đặt ngôn ngữ nút

Thuộc tính toàn cục [`lang`](/vi/docs/Web/HTML/Reference/Global_attributes/lang) được phần tử `<geolocation>` sử dụng để chọn ngôn ngữ cho văn bản được hiển thị. Điều này có nghĩa là bạn có thể đặt thuộc tính `lang` trực tiếp trên phần tử `<geolocation>` hoặc trên một trong các phần tử tổ tiên của nó để thông báo cho trình duyệt biết ngôn ngữ nào sẽ sử dụng cho nhãn nút.

Nếu không có thuộc tính `lang` phù hợp nào được đặt, cài đặt ngôn ngữ ưa thích của trình duyệt sẽ được sử dụng.

### Bao gồm nội dung dự phòng

Bạn có thể bao gồm nội dung dự phòng giữa các thẻ mở và đóng của phần tử `<geolocation>` sẽ được hiển thị nếu nó không được hỗ trợ. Ví dụ, bạn có thể bao gồm thông báo "Không được hỗ trợ":

```html
<geolocation>
  <p>Your browser doesn't support the Geolocation element.</p>
</geolocation>
```

Tuy nhiên, giải pháp thực tế tốt hơn có thể là bao gồm phần tử {{htmlelement("button")}} thông thường sử dụng Geolocation API để lấy dữ liệu vị trí:

```html
<geolocation>
  <button id="fallback">Use location</button>
</geolocation>
```

### Chặn `<geolocation>`

Một ý tưởng chính đằng sau thiết kế của phần tử `<geolocation>` là nó nên phản ánh sự lựa chọn có ý thức của người dùng để tiết lộ thông tin vị trí, và ngăn chặn các tác nhân xấu lừa người dùng kích hoạt nó, ví dụ qua [clickjacking](/vi/docs/Web/Security/Attacks/Clickjacking). Vì điều này, trình duyệt lưu trữ một bản ghi gọi là **lý do chặn** cho mỗi phần tử được hiển thị.

Khi một bộ chặn hoạt động trên phần tử `<geolocation>`, nó bị ngăn không cho hoạt động (bị chặn), tạm thời hoặc vĩnh viễn, tùy thuộc vào lý do. Khi phần tử `<geolocation>` bị chặn, nó được cho là không hợp lệ. Bạn có thể kiểm tra xem nó có không hợp lệ không bằng cách truy vấn thuộc tính {{domxref("HTMLGeolocationElement.isValid")}}. Bạn cũng có thể trả về lý do tại sao nó không hợp lệ thông qua thuộc tính {{domxref("HTMLGeolocationElement.invalidReason")}} — xem trang đó để biết danh sách đầy đủ các lý do có thể.

### Hạn chế về tạo kiểu

Phần tử `<geolocation>` có một số ràng buộc đối với các kiểu CSS có thể áp dụng cho nó. Một số ràng buộc này được thiết kế để đảm bảo khả năng tiếp cận cơ bản, và sẽ khiến nút bị vô hiệu hóa nếu chúng không được tuân thủ. Một số áp đặt các giá trị hoặc phạm vi giá trị nhất định cho các thuộc tính khác nhau.

Bất kỳ thuộc tính nào không được liệt kê trong các tiểu mục sau, hoặc tương đương về mặt logic với thuộc tính vật lý được liệt kê trong các tiểu mục sau, đều bị bỏ qua khi được đặt trên phần tử `<geolocation>`.

#### Hạn chế về khả năng tiếp cận

Nút `<geolocation>` được hiển thị sẽ bị vô hiệu hóa (có nghĩa là nhấn vào nó sẽ không có hiệu lực) nếu các ràng buộc sau không được tuân thủ:

- Tỷ lệ [tương phản màu sắc](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) giữa {{cssxref("color")}} và {{cssxref("background-color")}} phải ít nhất 3:1.
- {{cssxref("font-size")}} không được nhỏ hơn giá trị `small` (trong trường hợp giá trị từ khóa), hoặc giá trị tính toán của nó (trong trường hợp các loại giá trị khác).

#### Ràng buộc giá trị

Các ràng buộc giá trị thuộc tính CSS sau được áp dụng cho phần tử `<geolocation>`. Nếu cố gắng đặt các thuộc tính này thành các giá trị nằm ngoài các ràng buộc được liệt kê trên phần tử `<geolocation>`, giá trị sẽ được điều chỉnh để bằng ràng buộc (trong trường hợp ràng buộc giá trị chính xác) hoặc bằng giới hạn trên hoặc dưới gần nhất được tính toán (trong trường hợp ràng buộc phạm vi).

- {{cssxref("opacity")}}
  - : `1.0`
- {{cssxref("line-height")}}
  - : `normal`
- {{cssxref("white-space")}}
  - : `nowrap`
- {{cssxref("user-select")}}
  - : `none`
- {{cssxref("appearance")}}
  - : `auto`
- {{cssxref("box-sizing")}}
  - : `content-box`
- {{cssxref("vertical-align")}}
  - : `middle`
- {{cssxref("text-emphasis")}}
  - : `initial`
- {{cssxref("text-shadow")}}
  - : `initial`
- {{cssxref("outline-offset")}}
  - : `0` hoặc lớn hơn.
- {{cssxref("font-weight")}}
  - : `200` hoặc lớn hơn.
- {{cssxref("word-spacing")}}
  - : Từ `0` đến `0.5em`, bao gồm cả hai đầu.
- {{cssxref("letter-spacing")}}
  - : Từ `-0.05em` đến `0.2em`, bao gồm cả hai đầu.
- {{cssxref("letter-spacing")}}
  - : Từ `-0.05em` đến `0.2em`, bao gồm cả hai đầu.
- {{cssxref("min-height")}}
  - : `1em` hoặc lớn hơn.
- {{cssxref("max-height")}}
  - : `3em` hoặc ít hơn. `none` là một giá trị được chấp nhận.
- {{cssxref("min-width")}}
  - : Giá trị tính toán của `fit-content` hoặc ít hơn.
- {{cssxref("border-width")}}
  - : `1em` hoặc ít hơn.

#### Ràng buộc phức tạp

Các ràng buộc sau phức tạp hơn so với ràng buộc giá trị đơn giản:

- Đệm theo hướng khối
  - : Nếu {{cssxref("block-size")}} được đặt thành `auto`, {{cssxref("padding-block-start")}} và {{cssxref("padding-block-end")}} (và các thuộc tính vật lý tương đương cho [chế độ viết](/vi/docs/Web/CSS/Reference/Properties/writing-mode) hiện tại) bị giới hạn tối đa `1em` và phải bằng nhau.
- Đệm theo hướng nội tuyến
  - : Nếu {{cssxref("inline-size")}} được đặt thành `auto`, {{cssxref("padding-inline-start")}} và {{cssxref("padding-inline-end")}} (và các thuộc tính vật lý tương đương cho [chế độ viết](/vi/docs/Web/CSS/Reference/Properties/writing-mode) hiện tại) bị giới hạn tối đa `5em` và phải bằng nhau.

#### Các thuộc tính có thể đặt bình thường

Các thuộc tính CSS sau có thể được sử dụng bình thường:

- {{cssxref("font-kerning")}}
- {{cssxref("font-optical-sizing")}}
- {{cssxref("font-stretch")}}
- {{cssxref("font-synthesis-weight")}}
- {{cssxref("font-synthesis-style")}}
- {{cssxref("font-synthesis-small-caps")}}
- {{cssxref("font-feature-settings")}}
- {{cssxref("forced-color-adjust")}}
- {{cssxref("text-rendering")}}
- {{cssxref("align-self")}}
- {{cssxref("anchor-name")}}
- {{cssxref("aspect-ratio")}}
- {{cssxref("border")}}, {{cssxref("border-top")}}, {{cssxref("border-right")}}, {{cssxref("border-bottom")}}, và {{cssxref("border-left")}}
- {{cssxref("clear")}}
- {{cssxref("color-scheme")}}
- {{cssxref("contain-intrinsic-width")}}
- {{cssxref("contain-intrinsic-height")}}
- {{cssxref("container-name")}}
- {{cssxref("container-type")}}
- {{cssxref("counter-reset")}}, {{cssxref("counter-increment")}}, và {{cssxref("counter-set")}}
- {{cssxref("flex")}}, {{cssxref("flex-grow")}}, {{cssxref("flex-shrink")}}, và {{cssxref("flex-basis")}}
- {{cssxref("float")}}
- {{cssxref("height")}}
- {{cssxref("isolation")}}
- {{cssxref("justify-self")}}
- {{cssxref("left")}}
- {{cssxref("order")}}
- {{cssxref("orphans")}}
- {{cssxref("outline")}}, {{cssxref("outline-color")}}, và {{cssxref("outline-style")}}
- {{cssxref("overflow-anchor")}}
- {{cssxref("overscroll-behavior")}}, {{cssxref("overscroll-behavior-inline")}}, {{cssxref("overscroll-behavior-block")}}, {{cssxref("overscroll-behavior-x")}}, và {{cssxref("overscroll-behavior-y")}}
- {{cssxref("page")}}
- {{cssxref("position")}}
- {{cssxref("position-anchor")}}
- {{cssxref("right")}}
- {{cssxref("scroll-margin")}}, {{cssxref("scroll-margin-top")}}, {{cssxref("scroll-margin-right")}}, {{cssxref("scroll-margin-bottom")}}, và {{cssxref("scroll-margin-left")}}
- {{cssxref("scroll-padding")}}, {{cssxref("scroll-padding-top")}}, {{cssxref("scroll-padding-right")}}, {{cssxref("scroll-padding-bottom")}}, {{cssxref("scroll-padding-left")}}, {{cssxref("scroll-padding-inline-start")}}, {{cssxref("scroll-padding-block-start")}}, {{cssxref("scroll-padding-block-start")}}, {{cssxref("scroll-padding-inline-end")}}, và {{cssxref("scroll-padding-block-end")}}
- {{cssxref("text-spacing-trim")}}
- {{cssxref("text-transform")}}
- {{cssxref("top")}}
- {{cssxref("visibility")}}
- {{cssxref("x")}}
- {{cssxref("y")}}
- {{cssxref("ruby-position")}}
- {{cssxref("user-select")}}
- {{cssxref("width")}}
- {{cssxref("will-change")}}
- {{cssxref("z-index")}}

## Khả năng tiếp cận

Phần tử `<geolocation>` có tên có thể truy cập được viết bằng [ngôn ngữ được đặt cho nó](#setting_the_button_language). Nó cũng có một [`role`](/vi/docs/Web/Accessibility/ARIA/Reference/Roles) là [`button`](/vi/docs/Web/Accessibility/ARIA/Reference/Roles/button_role) để đọc màn hình nhận ra nó như một nút.

Ngoài ra, phần tử `<geolocation>` có giá trị [`tabindex`](/vi/docs/Web/HTML/Reference/Global_attributes/tabindex) mặc định là `0`, vì vậy nó hoạt động như một `<button>` thực sự về mặt focus bàn phím.

Cuối cùng, hãy tham khảo lại phần [Hạn chế về khả năng tiếp cận](#accessibility_restrictions) để biết thông tin về các ràng buộc tạo kiểu được áp dụng cho phần tử `<geolocation>` nhằm đảm bảo các yêu cầu khả năng tiếp cận cơ bản.

## Ví dụ

### Ví dụ sử dụng cơ bản

Ví dụ này sử dụng phần tử `<geolocation>` để lấy vị trí hiện tại của bạn, được in ra dưới nút trong phần tử {{htmlelement("p")}}. Ví dụ cũng sử dụng `<button>` dự phòng thông thường để lấy dữ liệu vị trí trong các trình duyệt không hỗ trợ.

#### HTML

Chúng ta bao gồm một phần tử `<geolocation>` với dự phòng `<button>` lồng bên trong nó, sẽ được hiển thị trong các trình duyệt không hỗ trợ `<geolocation>`. Chúng ta cũng bao gồm một `<p>` để xuất dữ liệu vị trí và lỗi vào.

```html
<geolocation>
  <button id="fallback">Use location</button>
</geolocation>
<p id="output"></p>
```

#### JavaScript

Trong script của chúng ta, trước tiên chúng ta lấy tham chiếu đến phần tử `<p>` xuất. Sau đó chúng ta phát hiện xem phần tử `<geolocation>` có được hỗ trợ không bằng cách kiểm tra `typeof HTMLGeolocationElement === "function"`:

- Nếu được hỗ trợ, trước tiên chúng ta lấy tham chiếu đến phần tử `<geolocation>` và sau đó thêm trình nghe sự kiện {{domxref("HTMLGeolocationElement.location_event", "location")}}.
  Khi nút được nhấn và dữ liệu được lấy, trình nghe in các tọa độ (vĩ độ, kinh độ) vào `<p>` xuất (được lấy qua thuộc tính {{domxref("HTMLGeolocationElement.position", "position")}}), hoặc thông báo lỗi nếu việc lấy dữ liệu không thành công (được lấy qua thuộc tính {{domxref("HTMLGeolocationElement.error", "error")}}).
- Nếu không được hỗ trợ, chúng ta lấy tham chiếu đến phần tử `<button>` dự phòng và lấy và in cùng dữ liệu, ngoại trừ lần này chúng ta sử dụng trình nghe sự kiện `click` trên nút, và lệnh gọi {{domxref("Geolocation.getCurrentPosition()")}} để lấy dữ liệu.

```js
const outputElem = document.querySelector("#output");

if (typeof HTMLGeolocationElement === "function") {
  const geo = document.querySelector("geolocation");
  geo.addEventListener("location", () => {
    if (geo.position) {
      outputElem.textContent += `(${geo.position.coords.latitude},${geo.position.coords.longitude}), `;
    } else if (geo.error) {
      outputElem.textContent += `${geo.error.message}, `;
    }
  });
} else {
  const fallback = document.querySelector("#fallback");
  fallback.addEventListener("click", () => {
    navigator.geolocation.getCurrentPosition(
      (position) => {
        outputElem.textContent += `(${position.coords.latitude}, ${position.coords.longitude}), `;
      },
      (error) => {
        outputElem.textContent += `${error.message}, `;
      },
    );
  });
}
```

#### Kết quả

Xem mã này [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/basic-example/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/basic-example)). Bạn cũng có thể tìm phiên bản của ví dụ này bao gồm thuộc tính `watch` trên phần tử `<geolocation>` và do đó lấy dữ liệu vị trí mỗi khi vị trí thiết bị của người dùng thay đổi (xem nó [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/basic-watch-example/), và [mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/basic-watch-example)).

Hãy thử xem các demo trong trình duyệt được hỗ trợ và trình duyệt không được hỗ trợ nếu có thể, và lưu ý sự khác biệt trong luồng hộp thoại quyền khi bạn chọn cho phép hoặc từ chối quyền sử dụng `geolocation`.

Để xem hướng dẫn về ví dụ đầy đủ hơn sử dụng dữ liệu vị trí để tạo bản đồ khu vực địa phương của bạn, hãy xem trang tham chiếu {{domxref("HTMLGeolocationElement")}}.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung tương tác, nội dung rõ ràng.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Bất kỳ nội dung dự phòng trong suốt phù hợp nào.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung cụm từ.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"><code>button</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLGeolocationElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLGeolocationElement")}}
- Chính sách quyền {{httpheader("Permissions-Policy/geolocation", "geolocation")}} [Permissions Policy](/vi/docs/Web/HTTP/Guides/Permissions_Policy)
- [Geolocation API](/vi/docs/Web/API/Geolocation_API)
- [Permissions API](/vi/docs/Web/API/Permissions_API)
- [Introducing the `<geolocation>` HTML element](https://developer.chrome.com/blog/geolocation-html-element) trên developer.chrome.com (2026)
