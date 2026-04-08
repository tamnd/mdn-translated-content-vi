---
title: -moz-image-rect
slug: Web/CSS/Reference/Values/-moz-image-rect
page-type: css-function
status:
  - deprecated
  - non-standard
browser-compat: css.types.-moz-image-rect
sidebar: cssref
---

{{Non-standard_Header}}{{Deprecated_Header}}

Giá trị **`-moz-image-rect`** cho {{CSSxRef("background-image")}} trong [CSS](/vi/docs/Web/CSS) cho phép bạn sử dụng một phần của hình ảnh lớn hơn làm hình nền.

## Cú pháp

```css
-moz-image-rect(url("my-url"), top, right, bottom, left);
```

### Giá trị

- {{CSSxRef("url_value", "&lt;url&gt;")}}
  - : URI của hình ảnh mà từ đó lấy hình ảnh con.
- `top`
  - : Cạnh trên, được chỉ định bằng {{CSSxRef("&lt;integer&gt;")}} hoặc {{CSSxRef("&lt;percentage&gt;")}}, của hình ảnh con trong hình ảnh đã chỉ định.
- `right`
  - : Cạnh phải, được chỉ định bằng {{CSSxRef("&lt;integer&gt;")}} hoặc {{CSSxRef("&lt;percentage&gt;")}}, của hình ảnh con trong hình ảnh đã chỉ định.
- `bottom`
  - : Cạnh dưới, được chỉ định bằng {{CSSxRef("&lt;integer&gt;")}} hoặc {{CSSxRef("&lt;percentage&gt;")}}, của hình ảnh con trong hình ảnh đã chỉ định.
- `left`
  - : Cạnh trái, được chỉ định bằng {{CSSxRef("&lt;integer&gt;")}} hoặc {{CSSxRef("&lt;percentage&gt;")}}, của hình ảnh con trong hình ảnh đã chỉ định.

## Mô tả

Thuộc tính này cho phép bạn, ví dụ, sử dụng các phần khác nhau của một hình ảnh lớn hơn làm nền cho các phần khác nhau trong nội dung của bạn.

Cú pháp cho hình chữ nhật tương tự như hàm [`rect()`](/vi/docs/Web/CSS/Reference/Values/shape#syntax) tạo ra kiểu CSS {{CSSxRef("&lt;shape&gt;")}}. Cả bốn giá trị đều tương đối so với góc trên bên trái của hình ảnh.

## Ví dụ

Ví dụ này tải một hình ảnh và sử dụng nó trong bốn đoạn để vẽ logo Firefox trong bốn khối {{HTMLElement("div")}}. Khi nhấp vào vùng chứa của chúng, bốn đoạn sẽ xoay bằng cách hoán đổi các giá trị thuộc tính {{CSSxRef("background-image")}} giữa bốn khối {{HTMLElement("div")}}.

### CSS

CSS định nghĩa một kiểu vùng chứa, sau đó là các kiểu cho bốn hộp tạo thành hình ảnh hoàn chỉnh.

Vùng chứa trông như thế này:

```css
#container {
  width: 267px;
  height: 272px;
  top: 100px;
  left: 100px;
  position: absolute;
  font-size: 16px;
  text-shadow: white 0px 0px 6px;
  text-align: center;
}
```

Sau đó bốn hộp định nghĩa các đoạn của hình ảnh được xác định. Hãy xem từng cái một.

```css
#box1 {
  background-image: -moz-image-rect(url("firefox.png"), 0%, 50%, 50%, 0%);
  width: 133px;
  height: 136px;
  left: 0px;
  top: 0px;
  position: absolute;
}
```

Đây là góc trên bên trái của hình ảnh. Nó định nghĩa một hình chữ nhật chứa góc phần tư trên bên trái của hình ảnh trong tệp `firefox.jpg`.

```css
#box2 {
  background-image: -moz-image-rect(url("firefox.png"), 0%, 100%, 50%, 50%);
  width: 133px;
  height: 136px;
  left: 133px;
  top: 0px;
  position: absolute;
}
```

Đây định nghĩa góc trên bên phải của hình ảnh.

Các góc còn lại theo một mẫu tương tự:

```css
#box3 {
  background-image: -moz-image-rect(url("firefox.png"), 50%, 50%, 100%, 0%);
  width: 133px;
  height: 136px;
  left: 0px;
  top: 136px;
  position: absolute;
}
#box4 {
  background-image: -moz-image-rect(url("firefox.png"), 50%, 100%, 100%, 50%);
  width: 133px;
  height: 136px;
  left: 133px;
  top: 136px;
  position: absolute;
}
```

### HTML

Chúng ta bao gồm một vùng chứa với bốn hộp:

```html
<div id="container">
  <div id="box1">Top left</div>
  <div id="box2">Top right</div>
  <div id="box3">Bottom left</div>
  <div id="box4">Bottom right</div>
</div>
```

Điều này đặt bốn đoạn của hình ảnh trong một lưới hộp hai nhân hai. Bốn đoạn này đều được chứa trong một khối {{HTMLElement("div")}} lớn hơn với mục đích chính là nhận các sự kiện nhấp và gửi chúng đến mã JavaScript của chúng ta.

### JavaScript

Mã này xử lý sự kiện nhấp khi vùng chứa nhận được cú nhấp chuột.

```js
function rotate() {
  let prevStyle = window
    .getComputedStyle(document.getElementById("box4"), null)
    .getPropertyValue("background-image");

  // Now that we've saved the last one, start rotating
  for (let i = 1; i <= 4; i++) {
    const curId = `box${i}`;

    // Shift the background images
    const curStyle = window
      .getComputedStyle(document.getElementById(curId), null)
      .getPropertyValue("background-image");
    document.getElementById(curId).style.backgroundImage = prevStyle;
    prevStyle = curStyle;
  }
}

document.getElementById("container").addEventListener("click", rotate);
```

Mã này sử dụng {{DOMxRef("window.getComputedStyle()")}} để lấy kiểu của mỗi phần tử, dịch chuyển nó sang phần tử tiếp theo. Lưu ý rằng trước khi bắt đầu làm điều đó, nó lưu một bản sao của kiểu hộp cuối cùng vì nó sẽ bị ghi đè bởi kiểu của phần tử thứ ba. Bằng cách sao chép các giá trị của thuộc tính {{CSSxRef("background-image")}} từ phần tử này sang phần tử khác với mỗi cú nhấp chuột, chúng ta đạt được hiệu ứng mong muốn.

### Kết quả

{{EmbedLiveSample("Examples","400","400")}}

## Thông số kỹ thuật

Không phải là một phần của bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tiện ích mở rộng Mozilla CSS](/vi/docs/Web/CSS/Reference/Mozilla_extensions)
- [Mô-đun Nền và Đường viền CSS](/vi/docs/Web/CSS/Guides/Backgrounds_and_borders)
