---
title: "MouseEvent: pageX property"
short-title: pageX
slug: Web/API/MouseEvent/pageX
page-type: web-api-instance-property
browser-compat: api.MouseEvent.pageX
---

{{APIRef("Pointer Events")}}

Thuộc tính **`pageX`** chỉ đọc của giao diện {{domxref("MouseEvent")}} trả về tọa độ X (ngang) (tính bằng pixel) tại đó chuột được nhấp vào, so với cạnh trái của toàn bộ tài liệu.
Điều này bao gồm bất kỳ phần nào của tài liệu hiện không hiển thị.

Dựa trên cạnh của tài liệu, thuộc tính này sẽ tính đến bất kỳ thao tác cuộn ngang nào của trang.
Ví dụ: nếu trang được cuộn sao cho 200 pixel ở phía bên trái của tài liệu bị cuộn ra khỏi chế độ xem và nhấp chuột vào trong 100 pixel từ cạnh trái của chế độ xem, giá trị được trả về bởi `pageX` sẽ là 300.

Ban đầu, thuộc tính này được xác định là số nguyên `long`. [Mô-đun xem CSSOM](/en-US/docs/Web/CSS/Guides/CSSOM_view) đã định nghĩa lại nó là
`double` nổi. Xem phần [Khả năng tương thích với trình duyệt](#browser_compatibility) để biết
chi tiết.

Xem [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#page) để biết thêm thông tin về tọa độ được chỉ định theo cách này.

## Giá trị

`double` số điểm ảnh có dấu phẩy động tính từ cạnh trái của _document_ nơi chuột được nhấp vào, bất kể bất kỳ vị trí cuộn hoặc khung nhìn nào có thể có hiệu lực.

Thuộc tính này ban đầu được chỉ định trong đặc tả Sự kiện chạm dưới dạng số nguyên dài nhưng đã được xác định lại trong Mô-đun xem CSSOM thành số có độ chính xác kép
số dấu phẩy động để cho phép độ chính xác của pixel phụ.
Mặc dù cả hai loại số đều được biểu thị bằng `Number` trong JavaScript, chúng có thể được xử lý nội bộ khác nhau trong mã của trình duyệt, dẫn đến những khác biệt về hành vi tiềm ẩn.

Xem [Khả năng tương thích của trình duyệt](#browser_compatibility) để biết trình duyệt nào đã được cập nhật để sử dụng loại dữ liệu đã sửa đổi.

## Ví dụ

### Hiển thị vị trí chuột liên quan đến nguồn gốc trang

Chúng ta hãy xem một ví dụ cho bạn thấy vị trí của chuột so với nguồn gốc của trang.
Vì ví dụ này được trình bày trong {{HTMLElement("iframe")}} nên góc trên cùng bên trái đó là góc trên cùng bên trái của khung chứ không phải cửa sổ trình duyệt.

#### HTML

```html
<div class="box">
  <p>Move the mouse around in this box to watch its coordinates change.</p>
  <p><code>pageX</code>: <span id="x">n/a</span></p>
  <p><code>pageY</code>: <span id="y">n/a</span></p>
</div>
```

HTML rất đơn giản; hộp mà chúng ta sẽ theo dõi các sự kiện chuột được gán cho lớp `"box"`.
Nó có hai phần tử `<span>`, một phần tử có ID `"x"` và một phần tử có ID `"y"`.
Chúng sẽ được cập nhật mỗi khi một sự kiện xảy ra để chứa tọa độ chuột mới nhất liên quan đến trang.

#### CSS

CSS được sử dụng cho ví dụ này được hiển thị bên dưới.

```css
.box {
  width: 400px;
  height: 250px;
  border: 2px solid darkblue;
  background-color: blue;
  color: white;
  font:
    16px "Zilla",
    "Open Sans",
    "Helvetica",
    "Arial",
    sans-serif;
}
```

#### JavaScript

```js
const box = document.querySelector(".box");
const pageX = document.getElementById("x");
const pageY = document.getElementById("y");

function updateDisplay(event) {
  pageX.innerText = event.pageX;
  pageY.innerText = event.pageY;
}

box.addEventListener("mousemove", updateDisplay);
box.addEventListener("mouseenter", updateDisplay);
box.addEventListener("mouseleave", updateDisplay);
```

Mã JavaScript sử dụng {{domxref("EventTarget.addEventListener", "addEventListener()")}} để đăng ký hàm `updateDisplay()` làm trình xử lý sự kiện cho các sự kiện {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/mouseenter_event", "mouseenter")}} và {{domxref("Element/mouseleave_event", "mouseleave")}}.

`updateDisplay()` thay thế nội dung của các phần tử {{HTMLElement("span")}} chứa tọa độ X và Y bằng các giá trị của `pageX`
và {{domxref("MouseEvent.pageY", "pageY")}}.

#### Kết quả

Hãy thử điều này ở đây:

{{EmbedLiveSample("Showing_the_mouse_position_relative_to_page_origin", 500, 300)}}

### Thêm ví dụ

Bạn cũng có thể xem ví dụ minh họa thông tin [cách truy cập vị trí chuột](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#example) trong mọi hệ tọa độ có sẵn.

## Thông số kỹ thuật

{{Specifications}}

Trước khi được thêm vào đặc tả CSSOM View, `pageX` và `pageY` đã có sẵn trên giao diện {{domxref("UIEvent")}} trong một tập hợp con giới hạn các trình duyệt trong một thời gian ngắn.

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent.pageY")}}
- [Hệ tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
