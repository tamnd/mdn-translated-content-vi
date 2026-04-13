---
title: "HTMLGeolocationElement: thuộc tính invalidReason"
short-title: invalidReason
slug: Web/API/HTMLGeolocationElement/invalidReason
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.invalidReason
---

{{APIRef("Navigation API")}}{{SeeCompatTable}}

Thuộc tính **`invalidReason`** chỉ đọc của giao diện {{domxref("HTMLGeolocationElement")}} trả về một giá trị liệt kê đại diện cho lý do tại sao phần tử {{htmlelement("geolocation")}} liên quan không hợp lệ (bị chặn), nếu đó là trường hợp.

Khi một [bộ chặn](/en-US/docs/Web/HTML/Reference/Elements/geolocation#geolocation_blocking) đang hoạt động trên phần tử `<geolocation>`, nó không hợp lệ: Điều này có nghĩa là nó bị ngăn không hoạt động, tạm thời hoặc vĩnh viễn, tùy thuộc vào lý do.

Bạn có thể truy vấn thuộc tính {{domxref("HTMLGeolocationElement.isValid")}} để kiểm tra xem phần tử `<geolocation>` có hợp lệ hay không.

## Giá trị

Chuỗi rỗng (`""`) nếu phần tử không có bộ chặn nào đang hoạt động, hoặc một trong các giá trị sau (theo thứ tự ưu tiên):

- `illegal_subframe`
  - : Phần tử `<geolocation>` được lồng bên trong một phần tử {{htmlelement("fencedframe")}}.

    Bộ chặn vĩnh viễn.

- `unsuccessful_registration`
  - : Hơn ba phần tử `<geolocation>` đã được chèn vào cùng một tài liệu.

    Bộ chặn tạm thời.

- `recently_attached`
  - : Phần tử `<geolocation>` mới được gắn vào DOM gần đây.

    Bộ chặn hết hạn.

- `intersection_changed`
  - : Phần tử `<geolocation>` đang được di chuyển.

    Bộ chặn hết hạn.

- `intersection_out_of_viewport_or_clipped`
  - : Phần tử `<geolocation>` được hiển thị bên ngoài hoặc một phần bên trong khung nhìn.

    Bộ chặn tạm thời.

- `intersection_occluded_or_distorted`
  - : Phần tử `<geolocation>` được hiển thị hoàn toàn bên trong khung nhìn, nhưng bị che khuất theo một cách nào đó, ví dụ được hiển thị phía sau nội dung khác.

    Bộ chặn tạm thời.

- `style_invalid`
  - : Phần tử `<geolocation>` có một số kiểu bị hạn chế được áp dụng cho nó (xem [Hạn chế kiểu](/en-US/docs/Web/HTML/Reference/Elements/geolocation#styling_restrictions)).

    Bộ chặn tạm thời.

Các lý do không hợp lệ này được liệt kê theo thứ tự ưu tiên, từ cao nhất đến thấp nhất. Nếu nhiều bộ chặn đang hoạt động, giá trị `invalidReason` được trả về sẽ là giá trị đại diện cho bộ chặn có mức ưu tiên cao nhất đang hoạt động.

Cũng lưu ý rằng các mô tả trên bao gồm "loại bộ chặn" cho mỗi lý do không hợp lệ, là một trong các loại sau:

- Vĩnh viễn
  - : Phần tử `<geolocation>` bị vĩnh viễn không hợp lệ cho đến khi nhà phát triển cập nhật mã để ngăn bộ chặn xảy ra.
- Tạm thời
  - : Phần tử `<geolocation>` không hợp lệ cho đến khi điều kiện chặn không còn xảy ra. Sau đó, bộ chặn tạm thời sẽ chuyển thành bộ chặn hết hạn.
- Hết hạn
  - : Phần tử `<geolocation>` không hợp lệ trong một khoảng thời gian ngắn, sau đó nó trở lại hợp lệ.

## Ví dụ

### Sử dụng cơ bản

```html
<geolocation></geolocation>
```

```js
const geo = document.querySelector("geolocation");
console.log(geo.invalidReason);
// "", provided the `<geolocation>` element is not blocked in some way
```

### Khám phá lý do không hợp lệ

Trong ví dụ này, chúng tôi cung cấp một điều khiển biểu mẫu để áp dụng các kiểu khác nhau cho phần tử `<geolocation>` khiến nó không hợp lệ. Khi mỗi tập hợp kiểu được áp dụng, chúng tôi báo cáo `invalidReason` được cung cấp bởi trình duyệt.

#### HTML

Chúng tôi bắt đầu bằng cách bao gồm một phần tử `<geolocation>` và một phần tử `<div>` mà sau này chúng tôi sẽ cho phép hiển thị trên phần tử `<geolocation>`.

```html
<geolocation>
  Your browser doesn't support the <code>&lt;geolocation&gt;</code> element.
</geolocation>
<div id="cover">Cover element</div>
```

Tiếp theo, chúng tôi cung cấp một phần tử `<p>` mà chúng tôi sẽ in `invalidReason` được tạo bởi mỗi tập hợp kiểu.

```html
<p id="reason"></p>
```

Cuối cùng, chúng tôi cung cấp một phần tử `<select>` để cho phép người dùng chọn các hiệu ứng kiểu khác nhau làm cho phần tử `<geolocation>` không hợp lệ.

```html
<form>
  <label for="invalidate"
    >Choose a way to invalidate the
    <code>&lt;geolocation&gt;</code> element:</label
  >
  <select id="invalidate">
    <option value="">None</option>
    <option value="move-behind">Move behind element</option>
    <option value="move-out">Move outside viewport</option>
    <option value="bad-contrast">Bad contrast</option>
  </select>
</form>
```

#### CSS

Trong các kiểu của chúng tôi, trước tiên chúng tôi cung cấp cho phần tử `<geolocation>` giá trị {{cssxref("position")}} là `relative` để nó có thể được định vị, và giá trị {{cssxref("z-index")}} là `1`.

```css hidden
* {
  box-sizing: border-box;
}

html {
  font-family: sans-serif;
}

body {
  margin-left: 50px;
}

geolocation {
  font-size: small;
}

#cover {
  width: 200px;
  height: 50px;
  color: white;
  background-color: darkblue;
  padding: 10px;
}
```

```css
geolocation {
  position: relative;
  z-index: 1;
}
```

Tiếp theo, chúng tôi tạo kiểu cho `<div>` `#cover` với `position: absolute` và sử dụng {{glossary("inset properties")}} để đặt nó bên phải phần tử `<geolocation>`. Chúng tôi cũng cho nó giá trị `z-index` là `2` để, nếu `<div>` của chúng tôi được đặt trong cùng vùng với phần tử `<geolocation>`, `<div>` sẽ được đặt phía trên.

```css
#cover {
  position: absolute;
  top: 72px;
  left: 250px;
  z-index: 2;
}
```

Bây giờ chúng tôi định nghĩa ba kiểu lớp sẽ được áp dụng cho phần tử `<geolocation>` khi các lựa chọn `<select>` khác nhau được người dùng chọn. `.move-behind` di chuyển nó phía sau `<div>` `#cover`, `.move-out` di chuyển nó ra khỏi màn hình, và `.bad-contrast` cung cấp [độ tương phản màu sắc](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast) xấu. Cả ba kiểu này đều khiến phần tử `<geolocation>` trở nên không hợp lệ.

```css
.move-behind {
  left: 150px;
}

.move-out {
  right: 250px;
}

.bad-contrast {
  background-color: red;
  color: orange;
}
```

#### JavaScript

Trong tập lệnh của chúng tôi, chúng tôi bắt đầu bằng cách lấy tham chiếu đến các phần tử `<geolocation>`, `<div>`, `<p>`, và `<select>`.

```js
const geo = document.querySelector("geolocation");
const coverElem = document.querySelector("#cover");
const reasonElem = document.querySelector("#reason");
const selectElem = document.querySelector("select");
```

Tiếp theo, chúng tôi thêm trình lắng nghe sự kiện `input` vào phần tử `<select>`. Khi một giá trị chọn mới được chọn, chúng tôi đặt thuộc tính `class` trên phần tử `<geolocation>` bằng giá trị chọn đã chọn, áp dụng một trong các kiểu làm cho nó không hợp lệ. Sau thời gian chờ 4 giây, chúng tôi đặt `class` trở lại `""`, để trả phần tử `<geolocation>` về trạng thái hợp lệ.

```js
selectElem.addEventListener("input", () => {
  geo.className = selectElem.value;
  setTimeout(() => {
    geo.className = "";
  }, 4000);
});
```

Cuối cùng, chúng tôi bao gồm mã để báo cáo các thay đổi trạng thái xác thực xảy ra khi các giá trị chọn khác nhau được chọn. Chúng tôi bắt đầu bằng cách đặt nội dung văn bản `<p>` để bao gồm `invalidReason` đang hoạt động khi trang tải lần đầu. Sau đó chúng tôi thêm trình lắng nghe sự kiện {{domxref("HTMLGeolocationElement.validationstatuschange_event", "validationstatuschange")}} vào phần tử `<geolocation>`. Mỗi khi trạng thái xác thực thay đổi, chúng tôi kiểm tra xem phần tử `<geolocation>` có hợp lệ không bằng cách sử dụng {{domxref("HTMLGeolocationElement.isValid")}}, và nếu có, in thông báo xác nhận điều này vào nội dung văn bản phần tử `<p>`. Nếu phần tử `<geolocation>` không hợp lệ, chúng tôi in `invalidReason` vào nội dung văn bản phần tử `<p>`.

```js
reasonElem.textContent = `Invalid reason: ${geo.invalidReason}`;

geo.addEventListener("validationstatuschange", () => {
  if (geo.isValid) {
    reasonElem.textContent = `<geolocation> is valid`;
  } else {
    reasonElem.textContent = `Invalid reason: ${geo.invalidReason}`;
  }
});
```

#### Kết quả

Xem mã này [chạy trực tiếp](https://mdn.github.io/dom-examples/geolocation-element/exploring-invalid-reasons/) (cũng xem [mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/exploring-invalid-reasons) đầy đủ). Hãy thử chọn các tùy chọn làm không hợp lệ khác nhau để xem lý do làm không hợp lệ nào được báo cáo trong mỗi trường hợp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{htmlelement("geolocation")}}
